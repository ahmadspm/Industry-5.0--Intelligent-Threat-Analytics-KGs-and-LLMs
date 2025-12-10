MATCH (n)
WHERE n.community is NOT NULL
WITH n.community AS cid, collect(n) AS nodes, count(*) AS sz, $topKAssets AS k

// --- Key Assets: top-K Product names by PageRank (fallback chain) ---
CALL {
  WITH nodes, k
  UNWIND nodes AS x
  WITH x, k
  WHERE x:Product
  WITH x, k, coalesce(x.pr_after_attackable, x.pr_attackable, x.pr_after, x.pr_before, 0.0) AS prScore
  ORDER BY prScore DESC
  WITH collect(coalesce(x.name, x.product_id, x.id)) AS names, k
  RETURN names[0..k] AS keyAssets
}

// --- Sum Risk: sum of DISTINCT CVE.exploitabilityScore for Products in this community ---
CALL {
  WITH nodes
  UNWIND nodes AS p
  WITH p
  WHERE p:Product
  OPTIONAL MATCH (p)-[:HAS_VULNERABILITY]->(v:CVE)
  WITH collect(DISTINCT v) AS vulns
  RETURN round(10 * reduce(t = 0.0, v IN vulns | t + coalesce(toFloat(v.exploitabilityScore), 0.0))) / 10.0 AS sumRisk
}

RETURN
  'C' + toString(cid)                        AS `Community ID`,
  sz                                        AS `Size_of_node`,
  keyAssets                                  AS `Key Assets`,
  coalesce(sumRisk, 0.0)                     AS `Sum(Risk_exposed)`,
  CASE WHEN coalesce(sumRisk,0) > 0 AND sz > 15 THEN 'Y' ELSE 'N' END
                                            AS `Cascade Vulnerability (Y/N)`
ORDER BY `Size_of_node` DESC LIMIT 10;
CALL gds.graph.drop('threat', false);

CALL gds.graph.project(
  'threat',
  // no node properties here
  'Product',
  {
    ATTACKABLE: {
      type: 'ATTACKABLE',
      orientation: 'UNDIRECTED',
      properties: {
        riskWeight: { property: 'riskWeight', defaultValue: 1.0 }
      }
    }
  }
);

CALL gds.betweenness.write('threat', {
  relationshipWeightProperty: 'riskWeight',   // uses weighted shortest paths
  writeProperty: 'btw_before_attackable'
});

CALL gds.pageRank.write('threat2', {
  relationshipWeightProperty: 'riskWeight',
  writeProperty: 'pr_after_attackable'
});


MATCH (n:Product)
SET n.pr_delta  = round(100 * (coalesce(n.pr_after_attackable, 0)  - coalesce(n.pr_before_attackable, 0))) / 100.0,
    n.btw_delta = round(100 * (coalesce(n.btw_after_attackable, 0) - coalesce(n.btw_before_attackable, 0))) / 100.0;


// Top-N with directed betweenness normalization, filtering out zeros
CALL {
  MATCH (p:Product) 
  RETURN count(p) AS totalN
}

MATCH (n:Product)
WHERE coalesce(n.btw_after_attackable, 0)  <> 0
  AND coalesce(n.btw_before_attackable, 0) <> 0
WITH n, labels(n) AS lbl, totalN,
     coalesce(n.btw_before_attackable, 0) AS btw_before_raw,
     coalesce(n.btw_after_attackable, 0)  AS btw_after_raw,
     coalesce(n.btw_delta, 0)             AS btw_delta_raw,
     n.pr_before_attackable               AS pr_before,
     n.pr_after_attackable                AS pr_after,
     n.pr_delta                           AS pr_delta,
     CASE WHEN totalN > 2 
          THEN (totalN - 1.0) * (totalN - 2.0) 
          ELSE 1.0 
     END AS denom

WITH n, lbl, pr_before, pr_after, pr_delta,
     btw_before_raw / denom AS btw_before_norm,
     btw_after_raw  / denom AS btw_after_norm,
     btw_delta_raw  / denom AS btw_delta_norm

RETURN
  coalesce(n.name, n.product_id) AS node,
  lbl                             AS labels,
  pr_before, pr_after, pr_delta,
  btw_before_norm, btw_after_norm, btw_delta_norm
ORDER BY btw_after_norm DESC, btw_before_norm DESC
LIMIT 50;
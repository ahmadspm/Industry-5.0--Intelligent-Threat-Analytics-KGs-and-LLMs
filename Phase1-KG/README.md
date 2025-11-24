# Phase 1

## How to Run
1. Download the cleaned file from [here](https://edithcowanuni.sharepoint.com/:u:/r/teams/ssci-am-industry-5-0-project/Shared%20Documents/General/Deliverables/KG/clean_data.zip?csf=1&web=1&e=lXp5aJ) and put it in your neo4j folder(e.g., `<neo4j-root>/import/`).
2. Execute all Cypher scripts in the `cypher/` directory (order as indicated by file prefixes, if any).

> **Note:** Nodes are merged from both a small local (dummy) dataset and a synthetic dataset.

---

## What is "COMMUNICATES_WITH"?
Using **dataflow** information and **logs**, we compute three metrics for threat analysis:

- **pExploit** — estimated likelihood an attacker can exploit the path.
- **controlStrength** — residual risk from controls on the path (lower is better).
- **attackCost** — effort/resources required for an attacker to exploit the path.

The synthetic logs and the generated **ATTACKABLE** or COMMUNICATES_WITH edges are in `Synthetic_data/`. There three kind of files for simulation purposes which are original, Enriched and Controlled one.

---

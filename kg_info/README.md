# Knowledge Graph Dataset Structure

## Overview

This repository describes the structure of a cybersecurity knowledge graph that integrates multiple threat intelligence sources and infrastructure entities. The graph connects vulnerability intelligence (such as CVE, CWE, CAPEC, and MITRE ATT&CK) with industrial and network assets to model relationships between vulnerabilities, attack techniques, and real-world systems.

The knowledge graph organizes entities into several categories and defines relationships that capture how vulnerabilities, attack patterns, adversaries, and infrastructure components interact.
---

# Node Categories

The knowledge graph nodes are grouped into several conceptual categories.

| Category | Nodes |
|--------|--------|
| Vulnerability Intelligence | CVE, CWE, CAPEC, CPE |
| Vulnerability Details | Entity, DetailAct, Target |
| CWE Information | CWEConsequences, CWEModeOfIntroduction, CWEMitigation, CWEDetection |
| CAPEC Information | Attack, CAPECConsequences |
| MITRE ATT&CK | Technique, Tactic, Mitigation, Malware, Group, Campaign |
| Industrial / Industry 5 Assets | Product, Software, Protocol, ProcessVariable, Observation |
| Infrastructure / Network | Zone, Host, Account |
| Asset Layer | Asset, I5_Asset |

---

# Relationship Summary

The following table summarizes the relationships between nodes in the knowledge graph.

| Source Node | Relationship | Target Node |
|-------------|-------------|-------------|
| CVE | HAS_CWE | CWE |
| CWE | HAS_CAPEC | CAPEC |
| CVE | HAS_CPE | CPE |
| CVE | HAS_ENTITY | Entity |
| Entity | HAS_DETAIL | DetailAct |
| CVE | HAS_TARGET | Target |
| CWE | HAS_CONSEQUENCE | CWEConsequences |
| CWE | HAS_MODEOFINTRODUCTION | CWEModeOfIntroduction |
| CWE | HAS_CWE_MITIGATION | CWEMitigation |
| CWE | HAS_DETECTION | CWEDetection |
| CAPEC | HAS_ATTACK | Attack |
| CAPEC | HAS_CAPEC_CONSEQUENCE | CAPECConsequences |
| CAPEC | HAS_TECHNIQUE | Technique |
| Technique | BELONG_TO | Tactic |
| Mitigation | MITIGATES | Technique |
| Group | USE_TECHNIQUE | Technique |
| Group | USE_MALWARE | Malware |
| Group | HAS_CAMPAIGN | Campaign |
| Technique | ATTACK | Asset |
| Product | RUNS | Software |
| Product | MEASURES | ProcessVariable |
| ProcessVariable | OBSERVED_AT | Observation |
| Host | HOSTED_AT | Product |
| Host | AUTHENTICATES | Account |
| Account | AUTHENTICATES | Protocol |
| Zone | LOCATED_IN | Product |
| I5_Asset | HAS_I5_ASSET | Product |
| Asset | IS_RELATED | I5_Asset |

---

# Dataset Purpose

This knowledge graph enables modeling of relationships between:

- **Vulnerabilities (CVE, CWE)**
- **Attack patterns (CAPEC)**
- **Adversarial behaviors (MITRE ATT&CK)**
- **Industrial assets and infrastructure components**

By combining these domains, the dataset allows analysis of how **cyber threats can propagate from vulnerabilities to real-world systems and assets**.
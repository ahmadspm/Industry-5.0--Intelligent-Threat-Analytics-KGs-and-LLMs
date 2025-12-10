# Citation Note
If you use BRIDG-ICS datasets, KG schemas, enrichment pipelines, or threat reasoning modules, please cite:

Nandiya, P., Mohsin, A., Janicke, H., Ibrahim, A., & Sarker, I. H. (2025). BRIDG-ICS: An AI-grounded, Knowledge-Graph-driven framework for context-aware threat reasoning and cyber-resilience in Industry 5.0 systems
<img width="786" height="323" alt="image" src="https://github.com/user-attachments/assets/a18fe0ae-df5a-4228-92f4-4d620fd9b624" />

# BRIDG-ICS Knowledge Graph Overview
BRIDG-ICS integrates industrial assets, vulnerability taxonomies, adversarial behaviours, and operational dependencies into a unified Industrial Security Knowledge Graph.
<p align="center"> <img src="image/kg_complete.png" width="450"> </p>

## Intelligent Context Awware Knowledge Graph Structure
The BRIDG-ICS knowledge graph is constructed by combining three interconnected sub-graphs:

1. Vulnerability and Attack Taxonomies
This sub-graph connects standardized cybersecurity resources including CVE, CWE, CAPEC, and the MITRE ATT&CK framework.

<p align="center"> <img src="image/kg1.png" width="250"> </p>

2. ICS + Industry 5.0 Testbed Integration
The second sub-graph merges ICSA content with a local Industry 5.0 testbed, creating a more detailed representation of industrial assets and processes.

<p align="center"> <img src="image/kg2.png" width="250"> </p>

3. Enhanced Semantic Links
Finally, additional semantic relationships are added to enrich node connectivity and improve reasoning capabilities across the graph.

<p align="center"> <img src="image/kg3.png" width="250"> </p>


## Dataset 
1. MITRE ATT&CK: [Link](https://attack.mitre.org/resources/attack-data-and-tools/#excel-attack). Download all the XLSX files from both ICS and Enterprise.
2. CAPEC: [Link](https://capec.mitre.org/data/archive/capec_latest.zip)
3. CWE: [Link](https://cwe.mitre.org/data/xml/cwec_latest.xml.zip)
4. CVE: [Link](https://nvd.nist.gov/vuln/data-feeds). Download all zip from 2002-2025
5. ICSA: [Link](https://raw.githubusercontent.com/icsadvprj/ICS-Advisory-Project/main/ICS-CERT_ADV/CISA_ICS_ADV_Master.csv)
6. Local Dataset (Unpublished). Attribute: Dataflow, Product, zone, vulnerability.
7. Synthetic Dataset. The dataset can be seen in `Phase1/ Synthetic data` along with the explanations.


## How To Run
### Preprocessing
1. Put all the dataset from MITRE ATT&CK, NVD, CWE, CAPEC and ICSA in folder Uncleaned_data
2. Run The code in PreProcessing/Code to extract all the information needed into CSV files.

Notes: If you don't want to do the preprocessing, you can just go to Phase 1.

### Phase 1 - BRIDG-ICS KG
1. Open Neo4j and create instance
2. Put all the cleaned dataset into your import file in neo4j.
3. Run each query in Phase1/query to create the links.
4. Threat Analysis example can be done by running Threat-Analysis/cypher-example.txt on Neo4j.

All Cypher scripts for constructing and enriching the BRIDG-ICS Knowledge Graph are located in: Phase1-KG/cypher/
These scripts are intended to be executed on a Neo4j instance (with Graph Data Science (GDS) installed) to build the Industry 5.0 threat-analytics KG from the cleaned CSV datasets.

# BRIDG-ICS Knowledge Graph (KG) Setup

All Cypher scripts required to build the BRIDG-ICS Industry 5.0 Knowledge Graph are located in: https://github.com/ahmadspm/Industry-5.0--Intelligent-Threat-Analytics-KGs-and-LLMs/tree/main/Phase1-KG/cypher
These scripts define the KG schema, load cybersecurity datasets (CVE, CWE, CAPEC, ATT&CK), integrate Industry 5.0 testbed assets, and generate enriched semantic relations used for intelligent threat analytics.

## Pre-requisites 

- Install Neo4j 5.x and the Graph Data Science (GDS) plugin.
- install all other dependencies, select Neo4j stack and infrastrucure to run locally or Cloud 
- Copy all CSV files from Phase1-KG/ into your Neo4j import/ directory.
- Open Neo4j Browser (http://localhost:7474).
- Run the Cypher scripts from Phase1-KG/cypher/ in the following order:

## Schema & Constraints

- Node Loaders (Products, CVE, CWE, CAPEC, ATT&CK, ICSA, testbed assets)
- Relationship Loaders
- Semantic Enrichment Scripts (LLM/GDS-based inferred links) (install required LLMs See our article details for LLMs driven KG Enrichment pipeline)

## Threat Analytics Queries (centrality, PageRank, attack-path reasoning)

## Intelligent Scenarios simulations and Threats Analytics
- Verify KG Construction
- MATCH (n) RETURN labels(n), count(*) ORDER BY count(*) DESC LIMIT 10;
- MATCH ()-[r]->() RETURN type(r), count(*) ORDER BY count(*) DESC LIMIT 10;


Once loaded, the BRIDG-ICS KG supports enrichment-driven threat reasoning, multi-hop attack-path analysis, and resilience assessment for Industry 5.0 cyber–physical systems.NAME_05_threat_analysis_examples.cypher
Contains example queries for multi-hop reasoning, attack-path exploration, centrality analysis, and risk-ranking over the constructed KG.
You can adapt/expand this list as needed (e.g., separate files for ATT&CK, ICS testbed, or synthetic data).


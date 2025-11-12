# I5_Threat_Analysis_System
This is the repository for A Resilience System that empower Knowledge Grgaph and LLM to provide threat analysis in industry 5.

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


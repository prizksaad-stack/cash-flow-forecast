## Vue d’ensemble du dossier `cours`

### Ressources textuelles (greenwashing / communication)
- `company_A.txt` : discours très généraliste et inspirant, aucune donnée chiffrée. À utiliser comme exemple possible de greenwashing narratif.
- `company_B.txt` : description riche en preuves (réduction CO₂, investissements, couverture fournisseurs, normes GRI, objectifs net-zéro). Cas d’entreprise réellement structurée.
- `company_C.txt` : ton engagé mais informations limitées, reconnaît explicitement que les outils de mesure carbone sont “en développement”. Position intermédiaire (bonne intention mais manque de preuves).

**Ce qu’on peut nous demander**  
- Classer ces trois textes selon le risque de greenwashing.  
- Extraire les arguments factuels vs déclarations vagues.  
- Rédiger un mémo comparant communication marketing vs engagement mesurable.

### Jeux de données
- `esg_companies.csv` : ~50 entreprises multi-secteurs avec scores E/S/G, intensité carbone et performance 1Y. Sert pour analyses de portefeuille ESG ou scoring comparatif.

**Analyses prêtes à être demandées**  
- Identifier les entreprises avec meilleur compromis haut score ESG / faible intensité carbone.  
- Construire un ranking sectoriel (ex. top 3 Finance).  
- Relier scores à la performance boursière 1 an (corrélations simples).  
- Détecter outliers (score élevé mais forte intensité carbone, ex. majors pétrolières).

### Notebooks
- `Detect_Greenwashing.ipynb` : probablement TP de NLP (classification basée sur textes).  
- `ESG_Portfolio_Workshop.ipynb` : probable atelier d’optimisation ou construction de portefeuille responsable.

**Possible attentes**  
- Exécuter ou adapter ces notebooks (ex. ajouter métriques, visualisations).  
- Exporter résultats (graphiques, tableaux récapitulatifs) pour inclusion dans un rapport.

### Documents PDF / briefs
- `ESG_Fintech_Design_Project_Brief.pdf`, `ESG_Portfolio_Workshop.ipynb`, `Lecture*.pdf`, `Tutorial*.pdf`, `CapstoneEdhec.pdf`.  

**Utilisations typiques**  
- Extraire les livrables attendus (ex. cahier des charges fintech ESG).  
- Résumer les exigences métiers (KPIs, attentes clients, jalons) pour structurer un plan de projet.

### Idées d’actions immédiates déjà prêtes
1. **Diagnostic greenwashing** : utiliser `company_*.txt` comme dataset labellisé (A = suspect, B = crédible, C = à surveiller) pour entraîner un modèle simple ou produire un guide d’évaluation.  
2. **Profil ESG** : créer un notebook/pandas script qui calcule stats descriptives de `esg_companies.csv` (moyennes sectorielles, top/bottom 5).  
3. **Alignement briefs → données** : faire une note reliant exigences des PDF aux données disponibles (banques, factures, ESG), afin de prioriser les analyses à livrer.

---

## Liens avec les fichiers à la racine

### Brief principal
- `CapstoneEdhec.pdf` : décrit les objectifs business (fintech ESG, détection de greenwashing, automatisation du reporting). Sert de cahier des charges global; chaque livrable du dossier `cours/` devrait se rattacher à une section de ce PDF (ex. “analytics financiers”, “narratifs ESG”).

### Données financières
- `bank_transactions.csv` : journal complet des flux bancaires 2024 (comptes opérationnels / payroll). Utilisable pour cash-flow, détection d’anomalies, rapprochement factures.
- `purchase_invoices.csv`, `sales_invoices.csv` : factures fournisseurs et clients. Croisés avec les transactions pour mesurer délais de paiement, exposition par devise, etc.

### Comment relier cours ↔ racine
- Les briefs/notebooks ESG donnent la méthodologie; les CSV racine fournissent la matière financière pour produire des KPIs (DSO, dépenses fournisseurs, allocation CAPEX vert, etc.).
- On peut nous demander un plan d’analyse intégrant **ESG narratif** (company_*.txt), **scores externes** (`esg_companies.csv`) et **finances internes** (CSV racine) afin de livrer un dossier Capstone complet.

### Prochaines étapes possibles
1. Cartographier les exigences de `CapstoneEdhec.pdf` et pointer les jeux de données disponibles (table de correspondance).  
2. Construire un script Python unique qui ingère les trois CSV financiers + `esg_companies.csv` pour générer un rapport synthétique (tables + graphes).  
3. Concevoir une storyboard de présentation finale: slide ESG (données `cours/`), slide finances (CSV racine), slide solution (brief Capstone).

Dis-moi quelles pistes tu veux approfondir et je prends le relais (analyses, scripts, présentations, etc.).


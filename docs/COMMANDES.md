# 📋 Commandes Terminal - Cash Forecasting

## 1️⃣ Navigation vers le projet
```bash
cd /Users/saadrizk/Desktop/capstone
```

## 2️⃣ Exécuter le script (méthode recommandée)
```bash
deliverables/.venv/bin/python deliverables/Python/cash_forecast_analysis.py
```

**OU depuis le dossier Python :**
```bash
cd deliverables/Python
../.venv/bin/python cash_forecast_analysis.py
```

## 3️⃣ Activer l'environnement virtuel (optionnel)
```bash
source deliverables/.venv/bin/activate
python deliverables/Python/cash_forecast_analysis.py
deactivate  # pour quitter l'environnement
```

## 4️⃣ Installer les dépendances (si nécessaire)
```bash
deliverables/.venv/bin/pip install pandas matplotlib openpyxl numpy requests
```

**OU utiliser le script d'installation :**
```bash
bash deliverables/Python/install_dependencies.sh
```

## 5️⃣ Vérifier les fichiers générés

**CSV dans bdd/[date]/ :**
```bash
ls -la bdd/2025-01-01/
```

**Rapport et graphique :**
```bash
ls -la deliverables/Python/*.txt deliverables/Python/*.png
```

## 6️⃣ Exemple complet d'exécution
```bash
cd /Users/saadrizk/Desktop/capstone
deliverables/.venv/bin/python deliverables/Python/cash_forecast_analysis.py
# Le script demandera la date (format: YYYY-MM-DD, ex: 2025-01-01)
```

## 📁 Structure des fichiers générés

```
capstone/
├── bdd/
│   └── 2025-01-01/          # Dossier avec la date
│       ├── forecast_daily_90days.csv
│       └── forecast_monthly_3months.csv
└── deliverables/
    └── Python/
        ├── forecast_report.txt
        └── forecast_analysis.png
```

## 💡 Notes importantes

- **Format de date** : YYYY-MM-DD (ex: 2025-01-01)
- **Taux de change** : Récupérés automatiquement via API
- **CSV** : Sauvegardés dans `bdd/[date]/`
- **Rapport/Graphique** : Sauvegardés dans `deliverables/Python/`


# 🚀 Guide de Déploiement Streamlit

Ce guide explique comment déployer le dashboard Cash Flow Forecasting sur Streamlit Cloud.

## 📋 Prérequis

1. **Compte Streamlit Cloud** : Créez un compte gratuit sur [streamlit.io/cloud](https://streamlit.io/cloud)
2. **Repository GitHub** : Le code doit être dans un repository GitHub public ou privé
3. **Fichiers de données** : Les fichiers CSV doivent être dans le repository

## 📁 Structure des Fichiers Requise

```
capstone/
├── deliverables/
│   ├── Python/
│   │   ├── cash_forecast_complete.py    # Script principal
│   │   ├── requirements.txt              # Dépendances Python
│   │   └── .streamlit/
│   │       └── config.toml               # Configuration Streamlit (optionnel)
│   ├── bank_transactions.csv             # Données bancaires
│   ├── sales_invoices.csv                # Factures clients
│   └── purchase_invoices.csv             # Factures fournisseurs
└── README.md
```

## 🔧 Configuration

### 1. Fichier `requirements.txt`

Créez un fichier `requirements.txt` dans le dossier `deliverables/Python/` avec :

```
pandas>=2.0.0
numpy>=1.24.0
streamlit>=1.28.0
plotly>=5.17.0
matplotlib>=3.7.0
requests>=2.31.0
```

### 2. Fichier `.streamlit/config.toml` (Optionnel)

Créez un dossier `.streamlit` dans `deliverables/Python/` et ajoutez `config.toml` :

```toml
[theme]
primaryColor = "#1f77b4"
backgroundColor = "#ffffff"
secondaryBackgroundColor = "#f0f2f6"
textColor = "#262730"
font = "sans serif"

[server]
headless = true
port = 8501
enableCORS = false
enableXsrfProtection = true
```

### 3. Fichier `packages.txt` (Optionnel - pour système)

Si vous avez besoin de packages système, créez `packages.txt` :

```
# Packages système (exemple)
# libgomp1
```

## 📤 Déploiement sur Streamlit Cloud

### Méthode 1 : Via l'Interface Web

1. **Connectez-vous** à [share.streamlit.io](https://share.streamlit.io)
2. **Cliquez sur "New app"**
3. **Remplissez les informations** :
   - **Repository** : Sélectionnez votre repository GitHub
   - **Branch** : `main` ou `master`
   - **Main file path** : `deliverables/Python/cash_forecast_complete.py`
4. **Cliquez sur "Deploy"**

### Méthode 2 : Via GitHub Actions (Avancé)

Créez un fichier `.github/workflows/streamlit.yml` :

```yaml
name: Deploy to Streamlit Cloud

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.10'
      - name: Install dependencies
        run: |
          pip install -r deliverables/Python/requirements.txt
      - name: Deploy to Streamlit
        uses: streamlit/streamlit-cloud-action@v1
        with:
          app-path: deliverables/Python/cash_forecast_complete.py
```

## 🔍 Vérification du Déploiement

Après le déploiement, vérifiez que :

1. ✅ L'application se charge sans erreur
2. ✅ Les données CSV sont bien chargées
3. ✅ Les graphiques s'affichent correctement
4. ✅ Le forecast fonctionne

## 🐛 Résolution de Problèmes

### Erreur : "Module not found"

**Solution** : Vérifiez que toutes les dépendances sont dans `requirements.txt`

### Erreur : "File not found" (CSV)

**Solution** : Vérifiez que les fichiers CSV sont dans le repository et que les chemins sont corrects

### Erreur : "Port already in use"

**Solution** : Streamlit Cloud gère automatiquement les ports, cette erreur ne devrait pas apparaître

## 📝 Notes Importantes

1. **Chemins de fichiers** : Le code utilise des chemins relatifs, assurez-vous que la structure de dossiers est correcte
2. **Données sensibles** : Ne commitez jamais de données sensibles dans le repository
3. **Limites Streamlit Cloud** : 
   - Applications gratuites : 1 app publique par compte
   - Limite de mémoire : ~1GB
   - Timeout : 30 secondes par requête

## 🔐 Sécurité

- Utilisez des secrets Streamlit pour les clés API si nécessaire
- Ne commitez jamais de tokens ou clés API dans le code
- Utilisez des repositories privés pour les données sensibles

## 📚 Ressources

- [Documentation Streamlit Cloud](https://docs.streamlit.io/streamlit-community-cloud)
- [Guide de déploiement](https://docs.streamlit.io/streamlit-community-cloud/deploy-your-app)
- [Forum Streamlit](https://discuss.streamlit.io/)


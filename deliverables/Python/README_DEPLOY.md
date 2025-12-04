# 📦 Package de Déploiement Streamlit

## 🚀 Déploiement Rapide

### Option 1 : Déploiement Local

```bash
# 1. Installer les dépendances
pip install -r requirements.txt

# 2. Lancer Streamlit
streamlit run cash_forecast_complete.py
```

### Option 2 : Déploiement sur Streamlit Cloud

1. **Pousser le code sur GitHub**
   ```bash
   git add .
   git commit -m "Add Streamlit dashboard"
   git push origin main
   ```

2. **Aller sur [share.streamlit.io](https://share.streamlit.io)**

3. **Créer une nouvelle app** :
   - Repository : Votre repo GitHub
   - Branch : `main`
   - Main file path : `deliverables/Python/cash_forecast_complete.py`

4. **Cliquer sur "Deploy"**

## 📁 Fichiers Requis

### Fichiers Python
- ✅ `cash_forecast_complete.py` - Script principal
- ✅ `requirements.txt` - Dépendances Python

### Fichiers de Données (dans `deliverables/`)
- ✅ `bank_transactions.csv`
- ✅ `sales_invoices.csv`
- ✅ `purchase_invoices.csv`

### Configuration (Optionnel)
- ✅ `.streamlit/config.toml` - Configuration Streamlit

## 🔧 Structure Recommandée pour GitHub

```
your-repo/
├── deliverables/
│   ├── Python/
│   │   ├── cash_forecast_complete.py
│   │   ├── requirements.txt
│   │   └── .streamlit/
│   │       └── config.toml
│   ├── bank_transactions.csv
│   ├── sales_invoices.csv
│   └── purchase_invoices.csv
└── README.md
```

## ⚙️ Configuration Streamlit Cloud

Dans l'interface Streamlit Cloud, configurez :

- **Main file path** : `deliverables/Python/cash_forecast_complete.py`
- **Python version** : 3.10+ (automatique)
- **Secrets** : Si vous avez des clés API (optionnel)

## 📋 Checklist de Déploiement

- [ ] Tous les fichiers CSV sont dans le repository
- [ ] `requirements.txt` contient toutes les dépendances
- [ ] Le chemin du fichier principal est correct
- [ ] Les chemins relatifs dans le code sont corrects
- [ ] L'application fonctionne en local avant le déploiement

## 🐛 Dépannage

### Erreur : Module not found
→ Vérifiez `requirements.txt`

### Erreur : File not found
→ Vérifiez que les CSV sont dans le repository

### Erreur : Port already in use (local seulement)
→ Utilisez : `streamlit run cash_forecast_complete.py --server.port 8502`

## 📞 Support

Pour plus d'aide, consultez :
- [Documentation Streamlit](https://docs.streamlit.io/)
- [Streamlit Community](https://discuss.streamlit.io/)


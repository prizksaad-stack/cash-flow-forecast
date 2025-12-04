# 🚀 Instructions de Déploiement - Guide Rapide

## ⚡ Déploiement en 5 Minutes

### Étape 1 : Préparer GitHub (2 min)

1. **Créer un compte GitHub** (si vous n'en avez pas)
   - Allez sur [github.com](https://github.com)
   - Créez un compte gratuit

2. **Créer un nouveau repository**
   - Allez sur [github.com/new](https://github.com/new)
   - Nom : `cash-flow-forecast` (ou autre nom)
   - Visibilité : **Public** (gratuit) ou **Private**
   - **NE PAS** cocher "Initialize with README"
   - Cliquez sur **"Create repository"**

3. **Copier l'URL du repository**
   - Exemple : `https://github.com/VOTRE_USERNAME/cash-flow-forecast.git`

### Étape 2 : Préparer le Code Local (1 min)

Ouvrez un terminal dans le dossier `capstone` et exécutez :

```bash
# Si Git n'est pas encore initialisé
git init
git add .
git commit -m "Initial commit - Cash Flow Forecasting Dashboard"

# Connecter à GitHub (remplacez par VOTRE URL)
git remote add origin https://github.com/VOTRE_USERNAME/cash-flow-forecast.git
git branch -M main
git push -u origin main
```

**OU utilisez le script automatique :**

```bash
./DEPLOY.sh
```

Puis suivez les instructions affichées.

### Étape 3 : Déployer sur Streamlit Cloud (2 min)

1. **Se connecter à Streamlit Cloud**
   - Allez sur [share.streamlit.io](https://share.streamlit.io)
   - Cliquez sur **"Sign in"**
   - Connectez-vous avec votre compte **GitHub**

2. **Créer une nouvelle application**
   - Cliquez sur **"New app"**
   - Remplissez :
     - **Repository** : Sélectionnez `VOTRE_USERNAME/cash-flow-forecast`
     - **Branch** : `main`
     - **Main file path** : `deliverables/Python/cash_forecast_complete.py`
   - Cliquez sur **"Deploy"**

3. **Attendre le déploiement**
   - ⏱️ 1-3 minutes
   - Vous recevrez une URL publique : `https://VOTRE-APP.streamlit.app`

## ✅ Vérification

Une fois déployé, vérifiez que :
- ✅ L'application se charge
- ✅ Les données CSV sont chargées
- ✅ Le forecast fonctionne

## 🔄 Mises à Jour Futures

Pour mettre à jour l'application :

```bash
git add .
git commit -m "Description des modifications"
git push origin main
```

Streamlit Cloud redéploiera automatiquement.

## 🆘 Problèmes Courants

**"Module not found"**
→ Vérifiez `deliverables/Python/requirements.txt`

**"File not found" (CSV)**
→ Vérifiez que les CSV sont dans `deliverables/`

**"Repository not found"**
→ Vérifiez que le repository GitHub est bien créé et que vous y avez accès

## 📚 Documentation Complète

Voir `DEPLOY_GUIDE.md` pour plus de détails.


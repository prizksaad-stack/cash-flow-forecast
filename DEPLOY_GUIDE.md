# 🚀 Guide de Déploiement Streamlit Cloud - Étape par Étape

## 📋 Prérequis

1. ✅ Compte GitHub (gratuit) : [github.com](https://github.com)
2. ✅ Compte Streamlit Cloud (gratuit) : [share.streamlit.io](https://share.streamlit.io)
3. ✅ Tous les fichiers dans le repository

## 🔧 Étape 1 : Préparer le Repository GitHub

### 1.1 Vérifier les fichiers nécessaires

Assurez-vous d'avoir ces fichiers dans votre projet :

```
capstone/
├── deliverables/
│   ├── Python/
│   │   ├── cash_forecast_complete.py    ✅
│   │   ├── requirements.txt              ✅
│   │   └── .streamlit/
│   │       └── config.toml               ✅
│   ├── bank_transactions.csv            ✅
│   ├── sales_invoices.csv               ✅
│   └── purchase_invoices.csv            ✅
└── README.md                             ✅
```

### 1.2 Initialiser Git (si pas déjà fait)

```bash
cd /Users/saadrizk/Desktop/capstone
git init
git add .
git commit -m "Initial commit - Cash Flow Forecasting Dashboard"
```

### 1.3 Créer le repository sur GitHub

1. Allez sur [github.com/new](https://github.com/new)
2. Nom du repository : `cash-flow-forecast` (ou autre nom)
3. Description : "Dashboard interactif de prévision de flux de trésorerie"
4. Visibilité : **Public** (gratuit) ou **Private** (payant)
5. Ne cochez PAS "Initialize with README" (vous avez déjà un README)
6. Cliquez sur **"Create repository"**

### 1.4 Connecter le repository local à GitHub

```bash
# Remplacez USERNAME et REPO_NAME par vos valeurs
git remote add origin https://github.com/USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main
```

**Exemple :**
```bash
git remote add origin https://github.com/saadrizk/cash-flow-forecast.git
git branch -M main
git push -u origin main
```

## 🌐 Étape 2 : Déployer sur Streamlit Cloud

### 2.1 Se connecter à Streamlit Cloud

1. Allez sur [share.streamlit.io](https://share.streamlit.io)
2. Cliquez sur **"Sign in"** ou **"Get started"**
3. Connectez-vous avec votre compte GitHub

### 2.2 Créer une nouvelle application

1. Cliquez sur **"New app"**
2. Remplissez le formulaire :

   **Repository** : Sélectionnez votre repository GitHub
   
   **Branch** : `main` (ou `master` si vous utilisez master)
   
   **Main file path** : `deliverables/Python/cash_forecast_complete.py`
   
   **App URL** : (optionnel) Choisissez un nom personnalisé
   
   Exemple : `cash-flow-forecast` → URL sera `https://cash-flow-forecast.streamlit.app`

3. Cliquez sur **"Deploy"**

### 2.3 Attendre le déploiement

- Streamlit va automatiquement :
  - Installer les dépendances depuis `requirements.txt`
  - Lancer l'application
  - Vous donner une URL publique

⏱️ **Temps estimé** : 1-3 minutes

## ✅ Étape 3 : Vérifier le Déploiement

### 3.1 Vérifications

Une fois déployé, vérifiez que :

- ✅ L'application se charge sans erreur
- ✅ Les données CSV sont bien chargées
- ✅ Le forecast fonctionne
- ✅ Les graphiques s'affichent

### 3.2 Résolution de problèmes

**Erreur : "Module not found"**
→ Vérifiez que `requirements.txt` contient toutes les dépendances

**Erreur : "File not found" (CSV)**
→ Vérifiez que les fichiers CSV sont dans le repository (dans `deliverables/`)

**Erreur : "Port already in use"**
→ Cette erreur ne devrait pas apparaître sur Streamlit Cloud

## 🔄 Étape 4 : Mises à Jour

Pour mettre à jour l'application après des modifications :

```bash
git add .
git commit -m "Description des modifications"
git push origin main
```

Streamlit Cloud redéploiera automatiquement l'application.

## 📝 Checklist Finale

Avant de déployer, vérifiez :

- [ ] Tous les fichiers CSV sont dans le repository
- [ ] `requirements.txt` est à jour
- [ ] Le chemin du fichier principal est correct : `deliverables/Python/cash_forecast_complete.py`
- [ ] Les chemins relatifs dans le code sont corrects
- [ ] L'application fonctionne en local

## 🆘 Support

- [Documentation Streamlit Cloud](https://docs.streamlit.io/streamlit-community-cloud)
- [Forum Streamlit](https://discuss.streamlit.io/)


#!/bin/bash

# Script d'aide au déploiement sur Streamlit Cloud
# Usage: ./DEPLOY.sh

echo "🚀 Script de Déploiement Streamlit Cloud"
echo "=========================================="
echo ""

# Vérifier que Git est installé
if ! command -v git &> /dev/null; then
    echo "❌ Git n'est pas installé. Installez Git d'abord."
    exit 1
fi

# Vérifier les fichiers nécessaires
echo "📋 Vérification des fichiers nécessaires..."
MISSING_FILES=0

if [ ! -f "deliverables/Python/cash_forecast_complete.py" ]; then
    echo "❌ cash_forecast_complete.py manquant"
    MISSING_FILES=1
fi

if [ ! -f "deliverables/Python/requirements.txt" ]; then
    echo "❌ requirements.txt manquant"
    MISSING_FILES=1
fi

if [ ! -f "deliverables/bank_transactions.csv" ]; then
    echo "❌ bank_transactions.csv manquant"
    MISSING_FILES=1
fi

if [ ! -f "deliverables/sales_invoices.csv" ]; then
    echo "❌ sales_invoices.csv manquant"
    MISSING_FILES=1
fi

if [ ! -f "deliverables/purchase_invoices.csv" ]; then
    echo "❌ purchase_invoices.csv manquant"
    MISSING_FILES=1
fi

if [ $MISSING_FILES -eq 1 ]; then
    echo ""
    echo "❌ Certains fichiers sont manquants. Vérifiez la structure du projet."
    exit 1
fi

echo "✅ Tous les fichiers nécessaires sont présents"
echo ""

# Vérifier si Git est déjà initialisé
if [ -d ".git" ]; then
    echo "✅ Git est déjà initialisé"
    echo ""
    echo "📝 Prochaines étapes:"
    echo "1. Créez un repository sur GitHub: https://github.com/new"
    echo "2. Connectez-le avec: git remote add origin https://github.com/VOTRE_USERNAME/VOTRE_REPO.git"
    echo "3. Poussez le code: git push -u origin main"
    echo "4. Déployez sur Streamlit Cloud: https://share.streamlit.io"
    echo ""
    echo "💡 Voir DEPLOY_GUIDE.md pour les instructions détaillées"
else
    echo "📦 Initialisation de Git..."
    git init
    git add .
    git commit -m "Initial commit - Cash Flow Forecasting Dashboard"
    echo ""
    echo "✅ Git initialisé avec succès"
    echo ""
    echo "📝 Prochaines étapes:"
    echo "1. Créez un repository sur GitHub: https://github.com/new"
    echo "2. Connectez-le avec: git remote add origin https://github.com/VOTRE_USERNAME/VOTRE_REPO.git"
    echo "3. Poussez le code: git push -u origin main"
    echo "4. Déployez sur Streamlit Cloud: https://share.streamlit.io"
    echo ""
    echo "💡 Voir DEPLOY_GUIDE.md pour les instructions détaillées"
fi


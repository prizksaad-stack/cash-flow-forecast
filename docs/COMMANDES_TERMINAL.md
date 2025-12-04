# 📋 COMMANDES TERMINAL - CAPSTONE TREASURY FORECAST

## 🚀 Commandes principales

### **1. Exécuter le script Python**

```bash
# Depuis la racine du projet
cd /Users/saadrizk/Desktop/capstone

# Exécuter le script (avec date en entrée)
deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py

# Ou avec date pré-remplie (pour tests)
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py
```

### **2. Activer l'environnement virtuel (optionnel)**

```bash
# Activer l'environnement virtuel
source deliverables/.venv/bin/activate

# Puis exécuter le script
python deliverables/Python/cash_forecast_complete.py

# Désactiver l'environnement
deactivate
```

### **3. Installer les dépendances**

```bash
# Via le script d'installation
cd deliverables/Python
bash install_dependencies.sh

# Ou manuellement
pip install pandas matplotlib openpyxl numpy requests python-docx

# Ou avec l'environnement virtuel
deliverables/.venv/bin/pip install pandas matplotlib openpyxl numpy requests python-docx
```

---

## 📁 Navigation et exploration

### **4. Voir la structure du projet**

```bash
# Structure complète
tree -L 3

# Ou avec find
find deliverables -type f -name "*.py" -o -name "*.csv" -o -name "*.xlsx" | head -20

# Lister les fichiers dans deliverables
ls -la deliverables/

# Lister les résultats par date
ls -la deliverables/bdd/
```

### **5. Voir les résultats générés**

```bash
# Lister tous les dossiers de résultats (par date)
ls -la deliverables/bdd/

# Voir les fichiers d'une date spécifique
ls -la deliverables/bdd/2025-01-01/

# Voir le contenu d'un CSV
head -20 deliverables/bdd/2025-01-01/forecast_daily_90days.csv

# Compter les lignes
wc -l deliverables/bdd/2025-01-01/forecast_daily_90days.csv
```

### **6. Vérifier les données sources**

```bash
# Voir les premières lignes des CSV
head -5 deliverables/bank_transactions.csv
head -5 deliverables/sales_invoices.csv
head -5 deliverables/purchase_invoices.csv

# Compter les lignes
wc -l deliverables/*.csv

# Voir les colonnes
head -1 deliverables/bank_transactions.csv
```

---

## 🔍 Vérifications et tests

### **7. Vérifier que le script fonctionne**

```bash
# Test rapide avec date
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | head -50

# Vérifier les erreurs
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | grep -i error

# Voir seulement les résultats finaux
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | tail -30
```

### **8. Vérifier les valeurs calculées**

```bash
# Voir les facteurs d'impact
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | grep -A 20 "FACTEURS D'IMPACT"

# Voir les paiements récurrents
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | grep -A 10 "PAIEMENTS RÉCURRENTS"

# Voir la vérification de cohérence
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | grep -A 5 "VÉRIFICATION COHÉRENCE"
```

### **9. Analyser les résultats CSV**

```bash
# Voir les jours avec cash flow négatif
grep -E "^-|Cash Flow Net" deliverables/bdd/2025-01-01/forecast_daily_90days.csv | head -10

# Compter les jours négatifs
awk -F',' 'NR>1 && $5<0 {count++} END {print count}' deliverables/bdd/2025-01-01/forecast_daily_90days.csv

# Voir le solde final
tail -1 deliverables/bdd/2025-01-01/forecast_daily_90days.csv | cut -d',' -f6
```

---

## 📊 Visualisation rapide

### **10. Voir les graphiques générés**

```bash
# Ouvrir l'image PNG générée (Mac)
open deliverables/bdd/2025-01-01/forecast_analysis.png

# Voir le rapport texte
cat deliverables/bdd/2025-01-01/forecast_report.txt

# Voir le forecast mensuel
cat deliverables/bdd/2025-01-01/forecast_monthly_3months.csv
```

---

## 🧹 Nettoyage

### **11. Supprimer les anciens résultats**

```bash
# Supprimer un dossier de résultats spécifique
rm -rf deliverables/bdd/2025-01-01/

# Supprimer tous les résultats
rm -rf deliverables/bdd/*/

# Garder seulement la structure
mkdir -p deliverables/bdd
```

### **12. Vérifier l'espace disque**

```bash
# Taille des résultats
du -sh deliverables/bdd/*/

# Taille totale du projet
du -sh deliverables/
```

---

## 🔧 Débogage

### **13. Voir les erreurs Python**

```bash
# Exécuter avec affichage complet des erreurs
deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | tee output.log

# Voir les warnings
deliverables/.venv/bin/python -W all deliverables/Python/cash_forecast_complete.py 2>&1 | grep -i warn
```

### **14. Vérifier les dépendances**

```bash
# Lister les packages installés
deliverables/.venv/bin/pip list

# Vérifier une dépendance spécifique
deliverables/.venv/bin/pip show pandas

# Vérifier la version Python
deliverables/.venv/bin/python --version
```

---

## 📊 Dashboard Interactif

### **14. Installer les dépendances du dashboard**

```bash
# Installer Streamlit et Plotly
cd deliverables/Python
../.venv/bin/pip install -r requirements_dashboard.txt

# Ou manuellement
../.venv/bin/pip install streamlit pandas numpy plotly
```

### **15. Lancer le dashboard**

```bash
# Depuis le dossier Python
cd deliverables/Python
streamlit run cash_forecast_complete.py

# Le dashboard s'ouvrira automatiquement dans votre navigateur
# URL: http://localhost:8501
```

**OU** avec l'environnement virtuel activé:

```bash
source deliverables/.venv/bin/activate
cd deliverables/Python
streamlit run cash_forecast_complete.py
```

### **16. Arrêter le dashboard**

```bash
# Dans le terminal où le dashboard tourne, appuyer sur:
Ctrl + C
```

### **17. Accéder au dashboard depuis un autre appareil**

```bash
# Lancer avec l'adresse réseau
streamlit run cash_forecast_complete.py --server.address 0.0.0.0

# Puis accéder depuis un autre appareil via:
# http://[IP_DE_LA_MACHINE]:8501
```

---

## 📝 Commandes utiles pour Excel

### **15. Ouvrir le fichier Excel**

```bash
# Ouvrir avec l'application par défaut (Mac)
open deliverables/Excel/cash_forecast_model.xlsx

# Vérifier que le fichier existe
ls -lh deliverables/Excel/cash_forecast_model.xlsx
```

---

## 🎯 Commandes rapides (copier-coller)

### **Exécution complète avec affichage des résultats**

```bash
cd /Users/saadrizk/Desktop/capstone && \
echo "2025-01-01" | \
deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | \
tail -50
```

### **Vérification rapide des facteurs d'impact**

```bash
cd /Users/saadrizk/Desktop/capstone && \
echo "2025-01-01" | \
deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py 2>&1 | \
grep -A 30 "FACTEURS D'IMPACT"
```

### **Voir les jours avec cash flow négatif**

```bash
cd /Users/saadrizk/Desktop/capstone && \
awk -F',' 'NR>1 && $5<0 {print $1, $5}' \
deliverables/bdd/2025-01-01/forecast_daily_90days.csv | \
head -10
```

---

## 📚 Documentation

### **16. Voir la documentation**

```bash
# Voir le README
cat deliverables/README.md

# Voir les documents Word (nécessite un viewer)
ls -la deliverables/Documentation/*.docx

# Voir les fichiers Markdown
find deliverables/Documentation -name "*.md" -exec cat {} \;
```

---

## ✅ Checklist avant soumission

```bash
# 1. Vérifier que tous les fichiers existent
ls deliverables/Excel/cash_forecast_model.xlsx
ls deliverables/Python/cash_forecast_complete.py
ls deliverables/*.csv

# 2. Tester l'exécution
echo "2025-01-01" | deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py > /dev/null 2>&1 && echo "✅ Script OK" || echo "❌ Erreur"

# 3. Vérifier les résultats générés
ls deliverables/bdd/2025-01-01/ && echo "✅ Résultats OK" || echo "❌ Résultats manquants"

# 4. Vérifier la taille des fichiers
du -sh deliverables/
```

---

**💡 Astuce** : Créez un alias pour exécuter rapidement le script :

```bash
# Ajouter à ~/.zshrc ou ~/.bashrc
alias forecast='cd /Users/saadrizk/Desktop/capstone && deliverables/.venv/bin/python deliverables/Python/cash_forecast_complete.py'

# Puis utiliser simplement :
forecast
```


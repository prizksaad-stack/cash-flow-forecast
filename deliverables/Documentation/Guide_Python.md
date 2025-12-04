# Guide du Script Python - Cash Forecasting

## 📋 Vue d'ensemble

Le script `cash_forecast_analysis.py` analyse les flux de trésorerie historiques et génère un forecast quotidien sur 90 jours (3 mois) pour prévoir la position de cash de l'entreprise.

---

## 🎯 Tâches principales

### 1. **Chargement et nettoyage des données**
- Lit 3 fichiers CSV : transactions bancaires, factures clients, factures fournisseurs
- Détecte les anomalies (doublons, montants négatifs, valeurs manquantes)
- Calcule les KPIs : DSO (Days Sales Outstanding) et DPO (Days Payable Outstanding)

### 2. **Classification des transactions**
- Identifie les transactions **récurrentes** (salaires, intérêts, frais bancaires)
- Identifie les transactions **non-récurrentes** (paiements exceptionnels)
- Cette classification permet de mieux prévoir les flux futurs

### 3. **Détection de saisonnalité**
- Analyse les patterns hebdomadaires (lundi vs vendredi)
- Identifie les cycles mensuels (paiements récurrents)
- Détecte les variations saisonnières dans les encaissements/décaissements

### 4. **Calcul des facteurs d'impact**
Le script calcule automatiquement plusieurs facteurs qui influencent le forecast :

- **Inflation** : Calculée depuis l'évolution des coûts récurrents historiques
- **Volatilité des volumes** : Mesure la variation des montants quotidiens
- **Taux d'impayés** : Basé sur les factures très en retard (>90 jours) ou très anciennes (>180 jours)
- **Taux de change** : Récupère les taux réels via API (USD, JPY) avec fallback si échec
- **Retards de paiement** : Basé sur l'historique des factures en retard

### 5. **Forecast quotidien (90 jours)**
Pour chaque jour des 90 prochains jours, le script calcule :

- **Encaissements** : Moyenne historique + factures ouvertes + ajustements (inflation, volatilité, retards, impayés)
- **Décaissements** : Moyenne historique + factures ouvertes + paiements récurrents + ajustements
- **Cash flow net** : Encaissements - Décaissements
- **Cumul** : Solde cumulé jour après jour

**Calculs par devise** :
- EUR, USD, JPY séparément
- Total en EUR équivalent (après conversion)

### 6. **Détection de risques**
- Identifie les jours avec cash flow négatif
- Identifie les jours avec cumul négatif (liquidity stress)
- Classe les jours en zones de risque :
  - **Safe** : Cumul ≥ 500k EUR
  - **Caution** : Cumul entre 100k et 500k EUR
  - **Warning** : Cumul entre 0 et 100k EUR
  - **Critical** : Cumul < 0 EUR

### 7. **Analyse multi-devises**
- Calcule l'exposition par devise (EUR, USD, JPY)
- Simule les gains/pertes selon variations de taux de change
- Affiche les positions nettes par devise

### 8. **Analyse des risques**
- **Risque de taux d'intérêt** : Simule l'impact d'une hausse des taux sur la dette (€20M variable)
- **Risque FX** : Calcule les gains/pertes potentiels selon scénarios de variation de change
- **Recommandations** : Génère des recommandations selon la situation de trésorerie

---

## 📊 Résultats générés

Le script crée un dossier `deliverables/bdd/[DATE]/` avec :

### 1. **forecast_daily_90days.csv**
Tableau détaillé jour par jour avec :
- Date, Jour de la semaine
- Encaissements/Décaissements par devise (EUR, USD, JPY)
- Cash flow net par devise
- Cumul par devise
- Total en EUR équivalent
- Paiements récurrents

### 2. **forecast_monthly_3months.csv**
Résumé mensuel avec :
- Encaissements totaux par mois
- Décaissements totaux par mois
- Cash flow net par mois
- Cumul mensuel

### 3. **forecast_report.txt**
Rapport textuel complet avec :
- Solde initial et final
- Variation sur 90 jours
- Classification récurrent/non-récurrent
- Statistiques sur les jours négatifs
- Zones de risque

### 4. **forecast_analysis.png**
Graphiques visuels :
- Cash flow net quotidien (90 jours)
- Cumul avec zones de risque colorées
- Pattern hebdomadaire (encaissements/décaissements)
- Forecast mensuel (3 mois)

---

## 🚀 Comment utiliser le script

1. **Lancer le script** :
   ```bash
   cd deliverables/Python
   python3 cash_forecast_analysis.py
   ```

2. **Entrer la date de départ** :
   - Format : `YYYY-MM-DD` (ex: `2025-01-01`)
   - Le script demande cette date au démarrage

3. **Attendre les résultats** :
   - Le script affiche les calculs en temps réel
   - Les fichiers sont sauvegardés dans `deliverables/bdd/[DATE]/`

---

## 💡 Points importants

### Méthode utilisée : **Direct Method**
- Forecast transaction par transaction
- Basé sur les factures ouvertes et les moyennes historiques
- Idéal pour le court terme (0-13 semaines)

### Calculs automatiques
- Tous les facteurs d'impact sont calculés depuis les données historiques
- Pas de valeurs fixes arbitraires (sauf volatilité FX si pas d'historique)

### Multi-devises
- Gère EUR, USD, JPY séparément
- Conversion automatique en EUR équivalent
- Utilise les taux de change réels (API) avec fallback

### Cohérence des calculs
- Les cumuls sont vérifiés et corrigés pour éviter les dérives d'arrondi
- Les paiements récurrents sont explicitement ajoutés (évite double comptage)
- Les zones de risque utilisent le cumul total en EUR

---

## ⚠️ Notes importantes

- Le script nécessite une connexion internet pour récupérer les taux de change (avec fallback si échec)
- Les calculs sont reproductibles (seeds fixes pour les variations aléatoires)
- Les flux négatifs sont **normaux** : les encaissements/décaissements ne sont pas synchronisés
- L'important est que le **cumul reste positif** sur la période

---

## 📈 Exemple de sortie console

```
📅 Entrez la date de départ pour le forecast (format: YYYY-MM-DD, ex: 2025-01-01): 2025-01-01
✅ Date sélectionnée: 2025-01-01

1. CHARGEMENT ET NETTOYAGE DES TRANSACTIONS BANCAIRES
   ✓ Transactions bancaires: 708 lignes
   ✓ DSO moyen: 45.2 jours
   ✓ DPO moyen: 32.1 jours

2. CLASSIFICATION RÉCURRENT vs NON-RÉCURRENT
   ✓ Récurrent: 156 transactions
   ✓ Non-récurrent: 552 transactions

3. DÉTECTION DE SAISONNALITÉ
   ✓ Pattern hebdomadaire détecté
   ✓ Cycles mensuels identifiés

4. FORECAST BASELINE - 3 MOIS (QUOTIDIEN)
   📊 SOLDE INITIAL PAR DEVISE:
      EUR: 7,400,000.00 EUR
      USD: 50,000.00 USD
      JPY: 1,200,000.00 JPY
      Total (en EUR): 7,456,000.00 EUR

5. DÉTECTION DE LIQUIDITY DIPS ET ZONES DE RISQUE
   ⚠️  Jours avec cash flow négatif: 12 sur 90
   🚨 Jours avec cumul négatif (liquidity stress): 0
   📊 Répartition des zones de risque:
      Safe: 90 jours (100.0%)

6. SAUVEGARDE DES RÉSULTATS
   ✓ forecast_daily_90days.csv → deliverables/bdd/2025-01-01/
   ✓ forecast_monthly_3months.csv → deliverables/bdd/2025-01-01/
   ✓ forecast_report.txt → deliverables/bdd/2025-01-01/
   ✓ forecast_analysis.png → deliverables/bdd/2025-01-01/

7. ANALYSE FINALE - REMARQUES ET EXPOSITION MULTI-DEVISES
   💱 EXPOSITION PAR DEVISE
   📊 ANALYSE DE RISQUE FX
   📝 REMARQUES ET RECOMMANDATIONS
```

---

## 🔧 Dépendances

Le script nécessite les packages Python suivants :
- `pandas` : Manipulation de données
- `numpy` : Calculs numériques
- `matplotlib` : Graphiques
- `requests` : Appels API pour taux de change

Installation :
```bash
pip install pandas numpy matplotlib requests
```

---

## 📝 Conclusion

Le script Python fournit une analyse complète et automatisée de la trésorerie avec :
- ✅ Forecast quotidien sur 90 jours
- ✅ Calculs par devise (EUR, USD, JPY)
- ✅ Détection automatique des risques
- ✅ Facteurs d'impact calculés depuis données historiques
- ✅ Rapports et graphiques générés automatiquement

Tous les résultats sont sauvegardés dans `deliverables/bdd/[DATE]/` pour analyse ultérieure.


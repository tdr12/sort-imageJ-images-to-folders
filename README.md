# Images sorting with  R
Script R pour répartir des images générées par ImageJ 

## Fonctionnalités clés :
**Gestion des ID numériques :**

 - Extraction automatique du numéro séquentiel (ex: 0494)
 - Calcul de la position dans la série via modulo 8

**Vérification temporelle :**

- Contrôle des intervalles entre prises de vue (1h ± 5 min)
- Détection des séries mal calibrées

Gestion du changement de jour :

Utilisation de véritables timestamps datetime

Compatible avec les séries chevauchant minuit

Robustesse :

Vérification de la continuité des ID

Gestion des noms de fichiers atypiques

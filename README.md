# Script R pour répartir des images générées par DigiCam Control dans des sous-repertoires

## Contexte et objectif
Nous disposons d'une banque d'images prises à partir de DigiCam Control et nommées selon la nomenclature suivante: **DSC_0494_D5200_Black_Back_2025-04-25-02-14-27.jpg** où: 
- **DSC_0494_D5200_Black_Back** est l'ID de l'image,
- **2025-04-25** la date de prise de vue en **année/mois/jour** et
- **02-14-27** le moment de prise de vue en **heure/minutes/secondes**.

A chaque une heure, une série de 8 images a été prise, les minutes et secondes pouvant varier. Certaines séries pouvaient également chevaucher minuit puisque les prises de vues ont été éffectuées sur plusieurs jours .

L'objectif de créer automatiquement 8 répertoires (dossiers) différents de sorte à y répartir les images de chaque série contenu dans le répertoire initial à partir de leur nom. La particularité est que les premières images de chaque série doivent êtres stockées dans un même dossier, les deuxièmes images de chaque série dans un même dossier et ainsi de suite j'usqu'à répartir toutes les 8 images de chaque série.

## Fonctionnalités clés :
**Gestion des ID numériques :**
 - Extraction automatique du numéro séquentiel (ex: 0494)
 - Calcul de la position dans la série via modulo 8

**Vérification temporelle :**
- Contrôle des intervalles entre prises de vue (1h ± 5 min)
- Détection des séries mal calibrées

**Gestion du changement de jour :**
- Utilisation de véritables timestamps datetime
- Compatible avec les séries chevauchant minuit
----
## Remerciement
Nous remercions **[Hubert Ekpinsou](hubert.ekpinsou8@etu.univ-lorraine.fr)** étudiant en *Biologie des interactions plante environnement*, 
 à *l'Université de Lorraine* pour avoir fourni l'echantillon de données ayant servi à tester le code.

----
❗A adapter à vos besoin ❗

---
title: Navigation sans souris
---

# Chapitre 3 — Navigation sans souris (devenir efficace rapidement)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- naviguer dans un projet sans utiliser la souris
- ouvrir n’importe quel fichier en quelques secondes
- comprendre les notions de fichier, buffer et fenêtre
- remplacer définitivement Ctrl+P, Ctrl+Tab et l’arborescence cliquable
- adopter un modèle de navigation plus fiable que celui d’IntelliJ

---

## 3.1 — Le vrai problème de la navigation dans les IDE classiques

Dans IntelliJ, la navigation repose sur :

- l’arborescence du projet
- Ctrl+P pour ouvrir un fichier
- Ctrl+Tab pour naviguer entre fichiers

Cela fonctionne tant que :

- le projet est petit
- peu de fichiers sont ouverts
- le contexte est simple

Dans des projets réels (monorepos, gros frontends, backend legacy), cela devient :

- lent
- visuel
- imprécis
- fatigant mentalement

Le problème n’est pas l’outil, mais le modèle mental.

---

## 3.2 — Le modèle de navigation de Neovim

Neovim repose sur trois concepts fondamentaux :

### Fichier
- un fichier sur le disque
- pas forcément ouvert

### Buffer
- un fichier chargé en mémoire
- peut être visible ou non

### Fenêtre (window)
- une vue sur un buffer

Un buffer n’est pas un onglet.  
Une fenêtre n’est pas un fichier.

Ce découplage est essentiel pour comprendre Neovim.

---

## 3.3 — Pourquoi ce modèle est supérieur

Avantages :

- aucun risque de “perdre” un fichier
- navigation instantanée
- multitâche naturel
- moins de charge cognitive

Inconvénient :

- nécessite un petit temps d’adaptation

Une fois compris, ce modèle devient plus fiable que celui des onglets.

---

## 3.4 — Ouvrir un fichier (remplacer Ctrl+P)

Commande principale :

```bash
\<leader\>ff
```

Cette commande :

- lance une recherche floue
- parcourt le projet
- ouvre un fichier immédiatement

Tu ne dois pas :

- scroller dans la liste
- chercher visuellement
- taper le chemin complet

Tu dois :

- taper quelques lettres
- faire confiance à la recherche

---

## 3.5 — Rechercher dans tout le projet (Ctrl+Shift+F)

Commande :

```bash
\<leader\>fg
```

Cette recherche :

- utilise ripgrep
- est extrêmement rapide
- affiche le contexte

Elle est idéale pour :

- retrouver une fonction
- comprendre un flux
- localiser une logique métier

---

## 3.6 — Naviguer entre fichiers ouverts (buffers)

Commandes essentielles :

```bash
]b buffer suivant
[b buffer précédent
```

C’est l’équivalent conceptuel de Ctrl+Tab, mais sans interface visuelle.

Fermer un buffer :

```bash
\<leader\>bd
```

Fermer tous les autres :

```bash
\<leader\>bo
```

Fermer un buffer ne supprime jamais le fichier sur le disque.

---

## 3.7 — Explorateur de fichiers (usage ponctuel)

Commande :

```bash
\<leader\>e
```

L’explorateur sert à :

- comprendre la structure
- créer / supprimer des fichiers

Il ne doit pas devenir ton outil principal de navigation.

---

## 3.8 — Navigation par symboles

Commande :

```bash
\<leader\>fw
```

Elle permet de :

- naviguer entre fonctions
- trouver des composants
- explorer un fichier complexe

Très utile en React / TypeScript.

---

## 3.9 — Aller / retour dans l’historique

Commandes fondamentales :

- Ctrl+o revenir en arrière
- Ctrl+i avancer

Ces commandes fonctionnent comme l’historique d’un navigateur.

---

## 3.10 — Exercice pratique

- ouvre un projet réel
- utilise uniquement \<leader\>ff pour ouvrir des fichiers
- navigue avec ]b et [b
- ferme des buffers inutilement
- n’utilise pas la souris

---

## 3.11 — Checklist de fin de chapitre

- [ ] Je comprends fichiers / buffers / fenêtres
- [ ] J’utilise \<leader\>ff automatiquement
- [ ] Je n’ai plus besoin de l’arborescence
- [ ] Ma navigation est plus fluide

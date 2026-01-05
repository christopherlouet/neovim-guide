---
title: Mental model Vim
---

# Chapitre 2 — Le mental model Vim (sans douleur)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- comprendre pourquoi Vim fonctionne par modes
- arrêter de lutter contre ce modèle
- penser en intentions, pas en touches
- éviter les frustrations classiques

---

## 2.1 — Le problème des éditeurs classiques

Dans les éditeurs classiques :

- le clavier sert à tout
- les raccourcis s’accumulent
- la souris reste nécessaire
- la charge cognitive augmente

---

## 2.2 — Le postulat fondamental de Vim

Pourquoi utiliser le même mode pour écrire et agir ?

Vim répond :

- un mode = une intention
- aucune ambiguïté
- aucun conflit

---

## 2.3 — Les modes essentiels

### Mode Normal
- mode par défaut
- navigation
- commandes
- 80 à 90 % du temps

### Mode Insertion
- saisie de texte
- à quitter dès que possible

### Mode Visuel
- sélection explicite
- outil ponctuel

### Mode Commande
- actions globales

---

## 2.4 — Le réflexe le plus important

Si tu n’es pas sûr :

> `Esc`

C’est ton bouton reset mental.

---

## 2.5 — Vim n’est pas une liste de raccourcis

Vim fonctionne par grammaire :

> [action] + [objet]

Tu décris ce que tu veux faire.  
Vim s’occupe du reste.

---

## 2.6 — Pourquoi ça devient naturel

Au début :

- lenteur
- hésitation
- retours fréquents en Normal

Puis :

- gestes automatiques
- intentions claires
- fluidité

---

## 2.7 — Erreurs fréquentes

- rester en insertion
- vouloir tout apprendre
- comparer chaque geste à IntelliJ

---

## 2.8 — Which-key comme filet de sécurité

Règle d’or :

> si tu hésites → `\<leader\>` → observe

Tu n’as pas besoin de tout mémoriser.

---

## 2.9 — Exercice guidé

- ouvre un fichier
- reste en mode Normal
- appuie sur `\<leader\>`
- observe
- `Esc`
- répète

---

## 2.10 — Checklist de fin de chapitre

- [ ] Je sais toujours dans quel mode je suis
- [ ] J’utilise `Esc` automatiquement
- [ ] Je n’ai plus peur du mode Normal

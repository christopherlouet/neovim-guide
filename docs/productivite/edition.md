---
title: Édition efficace
---

# Chapitre 4 — Édition efficace (écrire moins, faire plus)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- éditer du code sans sélectionner à la souris
- modifier du texte précisément
- réduire le nombre de frappes inutiles
- comprendre pourquoi Vim est plus précis que les éditeurs classiques

---

## 4.1 — Le problème de la sélection visuelle

Dans les IDE classiques :

- on sélectionne
- on agit
- on corrige la sélection

Ce modèle est :

- imprécis
- lent
- source d’erreurs

Vim part du principe inverse :

> décrire ce que l’on veut modifier

---

## 4.2 — Commandes d’édition essentielles

Supprimer :

```bash
x supprimer un caractère
dd supprimer une ligne
```

Copier / coller :

```bash
yy copier une ligne
p coller après
P coller avant
```

Dupliquer une ligne :

```bash
yyp
```

---

## 4.3 — Insertion intelligente

```bash
i insérer avant
a insérer après
o nouvelle ligne en dessous
O nouvelle ligne au-dessus
```

Les commandes o et O accélèrent énormément l’édition.

---

## 4.4 — Le réflexe fondamental

Dès que tu as fini d’écrire :

```bash
Esc
```

Le mode Normal est le mode de contrôle.

---

## 4.5 — Commenter du code

Ligne courante :

```bash
gcc
```

Sélection :

```bash
v
gc
```

---

## 4.6 — Annuler et refaire

```bash
u annuler
Ctrl+r refaire
```

Tu peux expérimenter sans crainte.

---

## 4.7 — Exercice pratique

- supprime une ligne
- annule
- duplique une ligne
- commente / décommente
- ajoute une ligne avec o / O

---

## 4.8 — Checklist de fin de chapitre

- [ ] J’utilise dd, yyp, gcc naturellement
- [ ] Je reviens toujours en mode Normal
- [ ] Je sélectionne moins
- [ ] Mon édition est plus précise

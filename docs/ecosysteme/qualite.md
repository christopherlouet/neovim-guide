---
title: Qualité de code
---

# Chapitre 6 — Qualité de code & refactor (sans douleur)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- maintenir un code propre automatiquement
- comprendre le rôle de chaque outil (LSP, formatter, linter)
- refactoriser sans casser
- arrêter de perdre du temps sur le style
- atteindre un confort équivalent à IntelliJ sur la qualité de code

---

## 6.1 — Le faux problème de la qualité de code

Dans beaucoup d’équipes, la qualité de code devient :

- subjective
- source de débats
- chronophage

Avec Neovim, la qualité doit devenir :

- automatique
- explicite
- non émotionnelle

---

## 6.2 — Séparation claire des responsabilités

Dans un workflow sain :

### LSP
- compréhension du code
- types
- symboles
- refactorings sûrs

### Formatter
- indentation
- retours à la ligne
- style

### Linter
- règles métier
- conventions d’équipe
- détection de bugs potentiels

IntelliJ mélange ces rôles.  
Neovim les sépare volontairement.

---

## 6.3 — Le formatage automatique (format on save)

Le formatage doit :

- s’exécuter à la sauvegarde
- être prévisible
- ne jamais te bloquer

Résultat :

- plus de discussions sur le style
- commits propres
- charge mentale réduite

Tu écris.  
Neovim corrige.

---

## 6.4 — ESLint et diagnostics intelligents

Les messages ESLint apparaissent comme diagnostics.

Bon réflexe :
1. naviguer à l’erreur
2. lire le message
3. essayer une action
4. corriger manuellement si nécessaire

---

## 6.5 — Refactor propre : quand utiliser quoi

Renommer :

```bash
\<leader\>rn
```

À utiliser pour :

- variables
- fonctions
- props React
- types

Toujours préférer cela à une recherche texte.

---

## 6.6 — Exercice pratique

- introduis une violation ESLint
- corrige-la avec \<leader\>ca
- renomme une variable avec \<leader\>rn
- sauvegarde et observe le formatage

---

## 6.7 — Checklist de fin de chapitre

- [ ] Le formatage ne me préoccupe plus
- [ ] Je comprends LSP / formatter / linter
- [ ] Je refactorise sans peur
- [ ] Mon code est plus propre sans effort

---
title: Diagnostics & debugging
---

# Chapitre 7 — Diagnostics & debugging mental

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- lire une erreur calmement
- identifier la cause racine
- corriger méthodiquement
- réduire le stress lié aux bugs

---

## 7.1 — Le debugging est un problème cognitif

Les erreurs provoquent :

- stress
- précipitation
- corrections hasardeuses

Un bon développeur :

- ralentit
- lit
- comprend
- agit

---

## 7.2 — Ce qu’est un diagnostic

Un diagnostic est :

- une information
- localisée
- contextualisée

Ce n’est ni une attaque, ni une urgence.

---

## 7.3 — Navigation entre diagnostics

Diagnostic suivant :

```bash
]d
```

Diagnostic précédent :

```bash
[d
```

Vue globale des diagnostics :
```bash
\<leader\>xx
```

---

## 7.4 — Processus de correction recommandé

1. aller à l’erreur
2. lire le message entièrement
3. comprendre le pourquoi
4. essayer une action automatique si disponible
5. corriger manuellement
6. sauvegarder
7. observer

---

## 7.5 — Erreurs en cascade

Ne corrige jamais les symptômes.  
Corrige la première erreur logique.

Une seule erreur peut en masquer dix autres.

---

## 7.6 — Exercice pratique

- crée une erreur TypeScript volontairement
- observe les diagnostics
- navigue avec ]d et [d
- corrige uniquement la cause racine
- sauvegarde et observe la disparition des erreurs

---

## 7.7 — Checklist de fin de chapitre

- [ ] Je lis les erreurs calmement
- [ ] Je ne panique plus
- [ ] Je corrige méthodiquement
- [ ] Je fais confiance aux diagnostics

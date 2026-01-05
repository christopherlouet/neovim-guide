---
title: Git dans Neovim
---

# Chapitre 8 — Git sans quitter Neovim

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- utiliser Git sans sortir de Neovim
- comprendre chaque action Git
- produire des commits propres
- remplacer le Git tool window d’IntelliJ

---

## 8.1 — Le problème des workflows Git trop visuels

Les interfaces graphiques :

- masquent les intentions
- encouragent les commits larges
- réduisent la compréhension

Neovim favorise :

- l’intention
- la précision
- la lisibilité de l’historique

---

## 8.2 — Gitsigns : voir les changements dans le code

Navigation entre les changements :

```bash
]c    hunk suivant
[c    hunk précédent
```

Actions sur les changements :

```bash
\<leader\>hs    stage hunk
\<leader\>hr    reset hunk
\<leader\>hp    preview hunk
\<leader\>hb    blame ligne
```

---

## 8.3 — Pourquoi le staging par hunk est essentiel

Un commit correspond à une intention claire.

Ne mélange jamais :

- refactor
- feature
- correction de bug

Un historique propre est un outil de communication.

---

## 8.4 — Neogit : interface Git complète

Ouvrir Neogit :

```bash
\<leader\>gg
```

Dans Neogit :

```bash
s    stage
u    unstage
c    commit
P    push
F    pull
?    aide
```

Tout se fait sans quitter le clavier.

---

## 8.5 — Exercice pratique

- modifie plusieurs lignes dans un fichier
- observe les hunks avec Gitsigns
- stage un seul hunk
- crée un commit clair
- consulte l’historique

---

## 8.6 — Checklist de fin de chapitre

- [ ] Je stage par intention
- [ ] Mes commits sont lisibles
- [ ] Je ne quitte plus Neovim pour Git
- [ ] Je comprends ce que je versionne

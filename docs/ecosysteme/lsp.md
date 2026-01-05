---
title: LSP
---

# Chapitre 5 — LSP : le cerveau de ton IDE

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- comprendre ce qu’est réellement un LSP
- savoir ce qu’il fournit
- faire confiance aux refactorings
- utiliser Neovim comme un IDE intelligent

---

## 5.1 — Pourquoi l’intelligence du code a été externalisée

Historiquement, les IDE faisaient tout eux-mêmes.

Le LSP a introduit :

- un protocole standard
- une séparation éditeur / intelligence
- une meilleure interopérabilité

Neovim s’appuie sur ce modèle.

---

## 5.2 — Qu’est-ce qu’un LSP

Un LSP est :

- un processus externe
- spécialisé par langage
- capable d’analyser ton projet

Neovim :

- affiche
- déclenche
- orchestre

Le LSP :

- comprend
- analyse
- décide

---

## 5.3 — Fonctionnalités fournies par le LSP

- aller à la définition
- trouver les références
- rename
- diagnostics
- documentation
- code actions

---

## 5.4 — Commandes essentielles

Aller à la définition :

```bash
gd
```

Trouver les références :

```bash
gr
```

Documentation :

```bash
K
```

Renommer :

```bash
\<leader\>rn
```

Code actions :

```bash
\<leader\>ca
```

---

## 5.5 — Pourquoi les refactorings sont sûrs

Le LSP :

- connaît le scope
- comprend les types
- respecte les imports

Ce n’est pas une recherche texte.

---

## 5.6 — Diagnostics et navigation

Naviguer :

```bash
]d
[d
```

Liste globale :

```bash
\<leader\>xx
```

---

## 5.7 — Mason et la gestion des serveurs

Commande :

```bash
:Mason
```

Mason permet :

- d’installer les LSP
- de gérer les versions
- d’éviter la pollution système

---

## 5.8 — Exercice pratique

- ouvre un fichier TypeScript
- utilise gd et gr
- renomme une variable avec \<leader\>rn
- corrige une erreur avec \<leader\>ca

---

## 5.9 — Checklist de fin de chapitre

- [ ] J’utilise gd et gr
- [ ] Je fais confiance au rename
- [ ] Je lis les diagnostics calmement
- [ ] Je comprends le rôle du LSP

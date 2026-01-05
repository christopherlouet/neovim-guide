---
title: Introduction
slug: /
---

# Neovim comme IDE
## Guide complet de migration depuis IntelliJ

Temps recommandé : 1 heure par jour  
Public : développeur utilisant déjà Vim, débutant Neovim IDE

---

# Chapitre 1 — Pourquoi Neovim peut remplacer IntelliJ
*(et quand il ne faut pas)*

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- comprendre ce qu’est réellement un IDE
- comprendre ce que Neovim fait différemment d’IntelliJ
- savoir pourquoi Neovim peut le remplacer
- connaître les limites réelles
- adopter le bon mental model avant d’aller plus loin

---

## 1.1 — IntelliJ : ce que tu utilises vraiment (sans t’en rendre compte)

Quand tu utilises IntelliJ, tu n’utilises pas simplement un éditeur de texte.

Tu utilises en réalité :

- un moteur d’analyse de code
- une base d’index globale du projet
- des actions contextuelles intelligentes
- un moteur de refactorisation
- un orchestrateur d’outils (Git, tests, debug, Docker…)

L’éditeur n’est qu’une petite partie de l’ensemble.

### Ce qu’IntelliJ fait très bien
- indexation profonde du code
- refactorings fiables
- navigation précise
- UX guidée
- configuration quasi invisible

### Le coût caché
- lourdeur (RAM / CPU)
- lenteur au démarrage
- faible scriptabilité
- fonctionnement interne opaque
- personnalisation limitée en profondeur

Tu es productif, mais dépendant.

---

## 1.2 — Mythe à déconstruire : “Neovim est juste un éditeur”

C’est faux.

Neovim moderne est une **plateforme IDE composable**.

Il fournit :

- un moteur d’édition extrêmement performant
- une API Lua complète
- une intégration native du LSP
- une architecture modulaire
- un chargement paresseux des fonctionnalités

Neovim ne fait pas moins.  
Il fait différemment.

---

## 1.3 — IDE monolithique vs IDE composable

### IntelliJ
- tout est intégré
- tout est lié
- beaucoup d’abstraction
- peu de visibilité interne

### Neovim
- chaque brique est explicite :

    - LSP
    - formatter
    - linter
    - Git
    - debug
- chaque brique est :

    - observable
    - remplaçable
    - configurable

Avec Neovim, tu sais ce qui se passe.

---

## 1.4 — Pourquoi des développeurs expérimentés migrent

Les développeurs qui passent à Neovim ne le font pas par snobisme.

Ils le font parce qu’ils veulent :

- comprendre leurs outils
- les maîtriser
- travailler de la même façon en local et en SSH
- avoir un workflow cohérent partout

Cas typiques :

- backend
- fullstack
- DevOps
- monorepos
- projets long terme

---

## 1.5 — Ce que Neovim fait aussi bien qu’IntelliJ

- navigation
- rename
- code actions
- diagnostics
- Git
- debug
- tests

Fonctionnellement, Neovim peut remplacer IntelliJ dans la majorité des cas modernes.

---

## 1.6 — Ce que Neovim fait mieux

- démarrage quasi instantané
- faible consommation de ressources
- scriptabilité totale
- portabilité parfaite
- automatisation naturelle
- contrôle fin du workflow

Neovim devient ton IDE, pas “un IDE”.

---

## 1.7 — Limites honnêtes de Neovim

Neovim n’est pas magique.

IntelliJ reste supérieur pour :

- Java / Kotlin très lourds
- debug JVM complexe
- analyse statique propriétaire
- onboarding de profils très juniors

Pour JS / TS / React / backend / DevOps :  
Neovim est parfaitement adapté.

---

## 1.8 — Le piège principal : vouloir utiliser Neovim comme IntelliJ

Mauvaise approche :

- chercher les menus
- chercher la souris
- vouloir tout voir
- vouloir tout mémoriser

Bonne approche :

- accepter le mode Normal
- utiliser Which-key
- apprendre par couches
- pratiquer régulièrement

---

## 1.9 — Le nouveau mental model

IntelliJ :

> “Je cherche une action dans l’interface”

Neovim :

> “Je compose une action avec le clavier”

Les actions sont des verbes, pas des boutons.

---

## 1.10 — Exercice de réflexion

Questions à te poser :

- qu’est-ce que j’utilise vraiment dans IntelliJ ?
- qu’est-ce que je n’utilise jamais ?
- quelles actions je fais 100 fois par jour ?

Tu verras que 80 % de ton usage repose sur :

- navigation
- recherche
- rename
- Git

---

## 1.11 — Checklist de fin de chapitre

- [ ] Je comprends le modèle composable
- [ ] Je ne cherche plus à imiter IntelliJ
- [ ] J’accepte la phase d’apprentissage
- [ ] Je garde IntelliJ comme filet temporaire

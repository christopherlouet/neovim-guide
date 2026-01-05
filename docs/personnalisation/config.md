---
title: Comprendre sa configuration
---

# Chapitre 13 — Comprendre et maîtriser sa configuration Neovim

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- comprendre la structure de ta configuration
- savoir où modifier quoi
- diagnostiquer un problème
- ne plus avoir peur de toucher à ta config

---

## 13.1 — Pourquoi comprendre sa config est essentiel

Copier une configuration sans la comprendre mène à :

- la peur de modifier
- des bugs incompris
- une dépendance à long terme

L’objectif de ce chapitre est l’autonomie.

---

## 13.2 — Démarrage de Neovim

Au lancement, Neovim :
1. charge le core
2. lit le fichier init.lua
3. initialise le gestionnaire de plugins
4. charge les plugins
5. attache les LSP

Rien n’est magique.  
Tout est traçable.

---

## 13.3 — Structure typique d’une configuration moderne

Structure courante :

    ~/.config/nvim/
    ├── init.lua
    ├── lua/
    │   ├── config/
    │   └── plugins/

Le dossier config définit le comportement.  
Le dossier plugins définit les outils.

---

## 13.4 — Le rôle du gestionnaire de plugins

Un gestionnaire moderne gère :

- l’installation
- le chargement différé
- les dépendances
- les performances

Il ne doit jamais être invisible.

---

## 13.5 — Mason et la gestion des outils externes

Mason permet de gérer :

- serveurs LSP
- formatters
- linters
- debuggers

Sans polluer le système global.

---

## 13.6 — Diagnostiquer un problème

Outils essentiels :

- vérifier l’état des plugins
- inspecter les LSP actifs
- consulter les messages d’erreur

La majorité des problèmes sont visibles
sans ajouter de logs.

---

## 13.7 — Checklist de fin de chapitre

- [ ] Je comprends la structure de ma config
- [ ] Je sais où modifier quoi
- [ ] Je sais diagnostiquer un problème
- [ ] Je ne crains plus ma configuration

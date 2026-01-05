---
title: Terminal, tests et debug
---

# Chapitre 9 — Terminal, tests et debug

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- lancer des commandes sans quitter Neovim
- exécuter des tests efficacement
- utiliser le debug quand nécessaire
- conserver le contexte du projet

---

## 9.1 — Pourquoi le contexte est crucial

Chaque alt-tab :

- casse le flux
- augmente la fatigue mentale
- fragmente la concentration

Neovim vise la continuité du contexte.

---

## 9.2 — Terminal intégré

Ouvrir un terminal :
```bash
\<leader\>tf
```

Afficher ou masquer le terminal :
```bash
Ctrl+\
```

Le terminal est utilisé pour :

- lancer des tests
- exécuter des scripts
- démarrer un serveur de développement
- inspecter rapidement une sortie

---

## 9.3 — Tests avec Neovim

Commandes typiques pour les tests :
```bash
\<leader\>tt    lancer le test le plus proche
\<leader\>tf    lancer les tests du fichier
\<leader\>ta    lancer tous les tests
```

L’objectif n’est pas de mémoriser les touches,
mais de comprendre le flux.

---

## 9.4 — Debug avec nvim-dap

Commandes clés du debugger :
```bash
\<leader\>db    ajouter ou retirer un breakpoint
\<leader\>dc    continuer l’exécution
\<leader\>do    step over
\<leader\>di    step into
\<leader\>du    afficher ou masquer l’interface debug
```

Le debugger est un outil ponctuel,
pas un mode de travail permanent.

---

## 9.5 — Exercice pratique

- ouvre un projet avec des tests
- lance un test depuis Neovim
- fais volontairement échouer un test
- corrige le code
- relance le test
- ajoute un breakpoint
- observe l’exécution

---

## 9.6 — Checklist de fin de chapitre

- [ ] Je garde le contexte dans Neovim
- [ ] Je lance les tests sans friction
- [ ] Je sais quand utiliser le debugger
- [ ] Mon workflow est fluide

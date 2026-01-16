---
title: Migration IntelliJ
sidebar_position: 3
---

# Migration IntelliJ

Ce guide t'aide à migrer progressivement d'IntelliJ vers Neovim en conservant des raccourcis familiers.

---

## Script de migration

Le projet neovim-intellij-ide fournit un script **`intellij-migrate.sh`** qui configure des keymaps proches d'IntelliJ.

### Installation

```bash
cd ~/neovim-intellij-ide
./intellij-migrate.sh
```

### Ce que fait le script

1. Active un layer de keymaps IntelliJ-like
2. Génère un cheatsheet dans `~/.config/nvim/INTELLIJ_MIGRATION.md`
3. Configure les raccourcis familiers

### Désactivation

```bash
./intellij-migrate.sh --remove
```

---

## Correspondance des raccourcis

### Navigation

| IntelliJ | Neovim (standard) | Neovim (migration) |
|----------|-------------------|-------------------|
| `Ctrl+N` | `<leader>ff` | `Ctrl+P` |
| `Ctrl+Shift+N` | `<leader>ff` | `Ctrl+Shift+N` |
| `Ctrl+Shift+F` | `<leader>fg` | `Ctrl+Shift+F` |
| `Ctrl+E` | `<leader>fb` | `Ctrl+E` |
| `Ctrl+B` | `gd` | `Ctrl+B` |
| `Alt+F7` | `gr` | `Alt+F7` |
| `Ctrl+F12` | `<leader>fs` | `Ctrl+F12` |

### Édition

| IntelliJ | Neovim (standard) | Neovim (migration) |
|----------|-------------------|-------------------|
| `Alt+Enter` | `<leader>ca` | `Alt+Enter` |
| `Shift+F6` | `<leader>rn` | `Shift+F6` |
| `Ctrl+/` | `gcc` | `Ctrl+/` |
| `Ctrl+D` | `yyp` | `Ctrl+D` |
| `Ctrl+Y` | `dd` | `Ctrl+Y` |
| `Ctrl+Shift+U` | `gU` / `gu` | `Ctrl+Shift+U` |

### Debug

| IntelliJ | Neovim (standard) | Neovim (migration) |
|----------|-------------------|-------------------|
| `F5` | `<F5>` | `F5` |
| `F7` | `<F11>` | `F7` |
| `F8` | `<F10>` | `F8` |
| `Shift+F8` | `<F12>` | `Shift+F8` |
| `Ctrl+F8` | `<leader>db` | `Ctrl+F8` |

### Git

| IntelliJ | Neovim (standard) | Neovim (migration) |
|----------|-------------------|-------------------|
| `Alt+9` | `<leader>gg` | `Alt+9` |
| `Ctrl+K` | `:Git commit` | `Ctrl+K` |
| `Ctrl+Shift+K` | `:Git push` | `Ctrl+Shift+K` |

---

## Stratégie de migration recommandée

### Phase 1 : Semaine 1-2

Garde les raccourcis IntelliJ avec le script de migration.

**Objectifs :**
- [ ] Ouvrir des fichiers (`Ctrl+P`)
- [ ] Rechercher du texte (`Ctrl+Shift+F`)
- [ ] Navigation basique (`Ctrl+B`, `Alt+F7`)
- [ ] Sauvegarder (`:w`)

### Phase 2 : Semaine 3-4

Commence à apprendre les raccourcis Neovim.

**Objectifs :**
- [ ] Utiliser `<leader>ff` au lieu de `Ctrl+P`
- [ ] Utiliser `gd` au lieu de `Ctrl+B`
- [ ] Maîtriser les mouvements Vim (`hjkl`, `w`, `b`)
- [ ] Utiliser les text-objects (`ciw`, `di"`)

### Phase 3 : Mois 2+

Désactive le layer IntelliJ et utilise les raccourcis natifs.

```bash
./intellij-migrate.sh --remove
```

**Objectifs :**
- [ ] Workflow 100% Neovim
- [ ] Personnaliser tes propres keymaps
- [ ] Créer des configs par projet

---

## Fonctionnalités équivalentes

### Structure du projet

| IntelliJ | Neovim |
|----------|--------|
| Project View (Alt+1) | `<leader>e` (NvimTree) |
| Structure View (Alt+7) | `<leader>fs` (Telescope symbols) |
| Recent Files (Ctrl+E) | `<leader>fb` (buffers) |
| Recent Locations | `<leader>fh` (recent files) |

### Refactoring

| IntelliJ | Neovim |
|----------|--------|
| Rename (Shift+F6) | `<leader>rn` |
| Extract Variable | LSP code action |
| Extract Method | LSP code action |
| Inline | LSP code action |

### Code Intelligence

| IntelliJ | Neovim |
|----------|--------|
| Quick Documentation (Ctrl+Q) | `K` |
| Parameter Info (Ctrl+P) | `gK` |
| Go to Definition (Ctrl+B) | `gd` |
| Go to Implementation (Ctrl+Alt+B) | `gi` |
| Find Usages (Alt+F7) | `gr` |

### Debug

| IntelliJ | Neovim |
|----------|--------|
| Debug Panel | `<leader>du` (DAP UI) |
| Breakpoint | `<leader>db` |
| Step Over | `<F10>` ou `<leader>do` |
| Step Into | `<F11>` ou `<leader>di` |
| Step Out | `<F12>` ou `<leader>dO` |
| Resume | `<F5>` ou `<leader>dc` |

### Git

| IntelliJ | Neovim |
|----------|--------|
| Git Panel (Alt+9) | `<leader>gg` (Neogit) |
| Commit (Ctrl+K) | `<leader>gg` → c |
| Push (Ctrl+Shift+K) | `<leader>gg` → P |
| Diff | `<leader>gd` (Diffview) |
| Blame | `<leader>hb` |
| File History | `<leader>gH` |

---

## Ce qui est différent

### Pas de projet au sens IntelliJ

IntelliJ a un concept de "projet" avec des fichiers `.idea/`.

Neovim utilise :
- Le répertoire courant comme racine
- `project.nvim` pour la détection automatique
- `.nvim.lua` pour la config par projet

### Pas de fenêtres d'outils fixes

IntelliJ a des panneaux fixes (Project, Terminal, Git).

Neovim utilise :
- Des buffers et fenêtres dynamiques
- Des plugins qui s'ouvrent à la demande
- `<leader>e` pour l'explorateur
- `<C-\>` pour le terminal

### Pas d'indexation globale

IntelliJ indexe tout le projet au démarrage.

Neovim utilise :
- Le LSP pour l'intelligence de code
- Ripgrep pour la recherche (instantanée)
- Treesitter pour le parsing

**Avantage** : démarrage instantané, même sur gros projets.

---

## Astuces pour la transition

### 1. Garde IntelliJ installé

Pendant la transition, tu peux basculer si nécessaire.

### 2. Commence par un petit projet

Ne migre pas ton projet principal immédiatement.

### 3. Apprends une chose à la fois

Semaine 1 : Navigation
Semaine 2 : Édition
Semaine 3 : LSP
Semaine 4 : Git

### 4. Utilise Which-key

`<leader>` + attendre = menu d'aide

### 5. Pratique avec vimtutor

```bash
vimtutor
```

30 minutes pour les bases Vim.

---

## Checklist de migration

### Niveau 1 : Survie
- [ ] Ouvrir/fermer des fichiers
- [ ] Chercher des fichiers et du texte
- [ ] Naviguer dans le code (définition, références)
- [ ] Sauvegarder et quitter

### Niveau 2 : Productivité
- [ ] Édition avec mouvements Vim
- [ ] Utiliser le LSP (rename, code actions)
- [ ] Git basique (status, commit, push)
- [ ] Debug avec breakpoints

### Niveau 3 : Maîtrise
- [ ] Keymaps personnalisés
- [ ] Config par projet
- [ ] Workflow sans souris
- [ ] Macros et automatisation

---

## Pour aller plus loin

- [Quick Start](/fondations/quick-start) — Les bases pour démarrer
- [Mental Model](/fondations/mental-model) — Comprendre la philosophie Vim
- [Cheatsheet](/annexes/cheatsheet) — Tous les raccourcis

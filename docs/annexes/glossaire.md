---
title: Glossaire
sidebar_position: 2
---

# Glossaire

Définitions des termes techniques utilisés dans ce guide et dans l'écosystème Neovim.

---

## A

### AST (Abstract Syntax Tree)
Arbre syntaxique abstrait. Représentation structurée du code source sous forme d'arbre. Treesitter génère un AST pour comprendre la structure du code, permettant une coloration syntaxique précise et des text-objects intelligents.

### Autocmd (Autocommand)
Commande exécutée automatiquement en réponse à un événement. Par exemple, formater le code à la sauvegarde (`BufWritePre`) ou configurer les options par type de fichier (`FileType`).

---

## B

### Buffer
Un fichier chargé en mémoire dans Neovim. Un buffer peut être visible (affiché dans une fenêtre) ou caché. Contrairement aux onglets d'IntelliJ, fermer une fenêtre ne ferme pas le buffer — il reste accessible.

**Commandes utiles :**
- `:ls` — Liste des buffers
- `:bnext` / `:bprev` — Buffer suivant/précédent
- `:bdelete` — Fermer un buffer

### Built-in
Fonctionnalité native de Neovim, disponible sans plugin. Exemples : LSP client, terminal intégré, Treesitter support.

---

## C

### Code Action
Action contextuelle suggérée par le LSP pour améliorer ou corriger le code. Exemples : ajouter un import manquant, extraire une variable, corriger une erreur de syntaxe.

**Raccourci :** `<leader>ca`

### Completion
Autocomplétion. Dans Neovim, généralement fournie par nvim-cmp qui agrège plusieurs sources (LSP, buffer, snippets, paths).

---

## D

### DAP (Debug Adapter Protocol)
Protocole standard pour la communication entre un éditeur et un debugger. Équivalent du LSP mais pour le debugging. nvim-dap implémente ce protocole dans Neovim.

### Diagnostic
Message d'erreur, warning ou information généré par le LSP ou un linter. Affiché dans la gouttière et/ou en virtual text.

**Navigation :** `]d` / `[d`

### Dotfiles
Fichiers de configuration dont le nom commence par un point (`.bashrc`, `.gitconfig`). La configuration Neovim (`~/.config/nvim`) fait partie des dotfiles.

---

## E

### Ex Command
Commande Neovim préfixée par `:`. Exemples : `:w` (sauvegarder), `:q` (quitter), `:e fichier` (ouvrir).

---

## F

### Filetype
Type de fichier détecté par Neovim (typescript, python, lua, etc.). Détermine la coloration syntaxique, le LSP à utiliser, et les options spécifiques.

**Vérifier :** `:set filetype?`

### Float / Floating Window
Fenêtre flottante superposée au contenu principal. Utilisée pour la documentation hover, les menus de complétion, les terminaux flottants.

### Fold
Repli de code permettant de masquer des sections. Treesitter peut créer des folds automatiquement basés sur la syntaxe.

**Commandes :** `za` (toggle), `zR` (ouvrir tout), `zM` (fermer tout)

### Fuzzy Finding
Recherche approximative permettant de trouver des résultats même avec des fautes de frappe ou des caractères manquants. Telescope utilise le fuzzy finding.

---

## G

### Gutter (Gouttière)
Zone à gauche du texte affichant les numéros de ligne, les signes Git, les icônes de diagnostic, et les marqueurs de fold.

---

## H

### Hover
Information contextuelle affichée au survol (ou avec `K`). Généralement la documentation de la fonction ou variable sous le curseur, fournie par le LSP.

### Hunk
Bloc de modifications Git consécutives dans un fichier. Gitsigns permet de naviguer entre hunks et de les stage/reset individuellement.

---

## I

### Init.lua
Fichier principal de configuration Neovim en Lua (remplace `init.vim`). Point d'entrée de la configuration.

---

## K

### Keymap
Association entre une combinaison de touches et une action. Peut être global ou spécifique à un mode (Normal, Insert, Visual).

---

## L

### Lazy Loading
Chargement différé des plugins. Un plugin est chargé uniquement quand il est nécessaire (ouverture d'un type de fichier, appel d'une commande). Améliore le temps de démarrage.

### Leader Key
Touche préfixe pour les raccourcis personnalisés. Par défaut `\`, souvent remappée sur `Espace` (comme dans neovim-intellij-ide).

### LSP (Language Server Protocol)
Protocole standard de communication entre un éditeur et un serveur de langage. Le serveur fournit : autocomplétion, diagnostics, go to definition, rename, etc.

**Commandes :**
- `:LspInfo` — État des LSP
- `:LspRestart` — Redémarrer les LSP

### Lua
Langage de script utilisé pour configurer Neovim moderne. Remplace progressivement Vimscript pour sa simplicité et ses performances.

---

## M

### Mark
Point de repère dans un fichier ou entre fichiers. Permet de revenir rapidement à une position.

- `ma` — Créer une mark 'a'
- `'a` — Revenir à la mark 'a'
- Marks majuscules (A-Z) sont globales (entre fichiers)

### Mason
Gestionnaire d'installation pour les LSP, linters, formatters et DAP adapters. Interface unifiée pour installer et mettre à jour ces outils.

**Commande :** `:Mason`

### Mode
État de l'éditeur déterminant le comportement des touches. Modes principaux : Normal, Insert, Visual, Command-line.

### Motion
Mouvement du curseur dans Neovim. Exemples : `w` (mot suivant), `}` (paragraphe suivant), `gg` (début du fichier). Les motions peuvent être combinées avec des opérateurs.

---

## N

### Namespace
Espace de noms pour isoler des configurations ou des highlights. Utilisé par les plugins pour éviter les conflits.

### Normal Mode
Mode par défaut de Neovim. Les touches sont interprétées comme des commandes, pas comme du texte. On y passe 80% du temps.

---

## O

### Operator
Commande d'action dans Neovim. Se combine avec un motion ou text-object. Exemples : `d` (delete), `y` (yank/copy), `c` (change).

- `dw` — Delete word
- `ci"` — Change inside quotes
- `yap` — Yank a paragraph

---

## P

### Picker
Interface de sélection dans Telescope. Chaque type de recherche (files, grep, buffers) est un picker différent.

### Plugin
Extension ajoutant des fonctionnalités à Neovim. Géré par un plugin manager (Lazy.nvim dans neovim-intellij-ide).

---

## Q

### Quickfix List
Liste de résultats navigable (erreurs de compilation, résultats de recherche). Partagée entre les plugins.

**Commandes :**
- `:copen` — Ouvrir la quickfix
- `:cnext` / `:cprev` — Naviguer

---

## R

### Register
Presse-papier Neovim. Plusieurs registres existent (nommés a-z, système `+`, etc.).

- `"ay` — Yank dans le registre 'a'
- `"ap` — Paste depuis le registre 'a'
- `"+y` — Yank vers le presse-papier système

### REPL (Read-Eval-Print Loop)
Console interactive pour exécuter du code. Dans nvim-dap, permet d'évaluer des expressions pendant le debug.

---

## S

### Session
État de travail sauvegardé : buffers ouverts, disposition des fenêtres, position du curseur. auto-session gère les sessions automatiquement.

### Snippet
Template de code réutilisable avec des placeholders. LuaSnip et friendly-snippets fournissent des snippets dans neovim-intellij-ide.

### Split
Division de la fenêtre en plusieurs zones. Horizontal (`:split`) ou vertical (`:vsplit`).

### Statusline
Barre d'état en bas de la fenêtre affichant des informations (mode, fichier, position, Git, diagnostics). Fournie par lualine dans neovim-intellij-ide.

---

## T

### Tab (Tabpage)
Page d'onglet contenant une disposition de fenêtres. Différent des onglets d'IntelliJ — c'est plutôt un workspace séparé.

### Text-object
Unité de texte sémantique pour les opérations Vim. Exemples :
- `iw` — Inner word (mot sans espaces)
- `a"` — Around quotes (avec les guillemets)
- `af` — A function (Treesitter)

### Treesitter
Parser incrémental générant un AST du code. Fournit une coloration syntaxique précise, des text-objects intelligents, et du folding basé sur la syntaxe.

---

## V

### Virtual Text
Texte affiché dans l'éditeur mais ne faisant pas partie du fichier. Utilisé pour les diagnostics inline, les valeurs de debug, les hints.

### Visual Mode
Mode de sélection de texte. `v` pour caractère par caractère, `V` pour ligne par ligne, `Ctrl+v` pour bloc.

---

## W

### Which-key
Plugin affichant les raccourcis disponibles après un préfixe. Aide à découvrir et mémoriser les keymaps.

### Window
Vue sur un buffer. Un buffer peut être affiché dans plusieurs fenêtres. Fermer une fenêtre ne ferme pas le buffer.

### Workspace
Dans le contexte LSP, le dossier racine du projet. Détermine la portée de la recherche de références et des diagnostics.

---

## Y

### Yank
Copier du texte dans Neovim. Équivalent de "copier" mais avec la terminologie Vim.

- `yy` — Yank la ligne
- `yw` — Yank le mot
- `y$` — Yank jusqu'à la fin de ligne

---

## Symboles et conventions

| Notation | Signification |
|----------|---------------|
| `<leader>` | Touche leader (Espace par défaut) |
| `<C-x>` | Ctrl + x |
| `<M-x>` ou `<A-x>` | Alt/Meta + x |
| `<S-x>` | Shift + x |
| `<CR>` | Enter/Return |
| `<Esc>` | Échap |
| `<Tab>` | Tabulation |
| `<BS>` | Backspace |

---

## Voir aussi

- [Quick Start](/docs/fondations/quick-start) — Les bases pour démarrer
- [Cheatsheet](/docs/annexes/cheatsheet) — Tous les raccourcis
- [Troubleshooting](/docs/workflow/troubleshooting) — Résoudre les problèmes


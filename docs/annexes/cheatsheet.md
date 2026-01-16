---
title: Cheatsheet IntelliJ → Neovim
sidebar_position: 1
---

# Annexes — Références, muscle memory et checklists

Ces annexes sont conçues pour :

- consultation rapide
- impression
- révision quotidienne
- sécurisation du workflow long terme

---

# Annexe A — Cheatsheet IntelliJ → Neovim

## Navigation et recherche

| IntelliJ | Action | Neovim |
|----------|--------|--------|
| `Ctrl+P` | Ouvrir un fichier | `<leader>ff` |
| `Ctrl+Shift+F` | Rechercher dans le projet | `<leader>fg` |
| `Ctrl+B` | Aller à la définition | `gd` |
| `Alt+F7` | Trouver les usages | `gr` |
| `Ctrl+F12` | Structure du fichier | `<leader>so` |
| `Ctrl+E` | Fichiers récents | `<leader>fh` |
| `Ctrl+Tab` | Buffer suivant | `]b` ou `<S-l>` |
| `Ctrl+Shift+Tab` | Buffer précédent | `[b` ou `<S-h>` |
| — | Historique arrière | `Ctrl+o` |
| — | Historique avant | `Ctrl+i` |
| — | Symboles du fichier | `<leader>fs` |
| — | Symboles du workspace | `<leader>fS` |
| — | Projets récents | `<leader>fp` |

---

## Navigation avancée

| Action | Neovim |
|--------|--------|
| Ajouter fichier à Harpoon | `<leader>ha` |
| Menu Harpoon | `<leader>hh` |
| Fichier Harpoon 1-4 | `<leader>1` à `<leader>4` |
| Leap forward | `s` |
| Leap backward | `S` |
| Leap cross-window | `gs` |
| Toggle outline (Aerial) | `<leader>so` |
| TODO suivant | `]t` |
| TODO précédent | `[t` |
| Rechercher TODOs | `<leader>st` |

---

## Édition

| IntelliJ | Action | Neovim |
|----------|--------|--------|
| `Ctrl+D` | Dupliquer une ligne | `yyp` |
| `Ctrl+Y` | Supprimer une ligne | `dd` |
| `Ctrl+/` | Commenter une ligne | `gcc` |
| `Alt+Flèche haut` | Déplacer ligne haut | `ddkP` |
| `Alt+Flèche bas` | Déplacer ligne bas | `ddp` |
| `Ctrl+Z` | Annuler | `u` |
| `Ctrl+Shift+Z` | Refaire | `Ctrl+r` |

---

## Refactor et LSP

| IntelliJ | Action | Neovim |
|----------|--------|--------|
| `Shift+F6` | Renommer | `<leader>rn` |
| `Alt+Entrée` | Code actions | `<leader>ca` |
| `Ctrl+Q` | Documentation | `K` |
| `Ctrl+P` | Signature | `Ctrl+k` |

---

## Diagnostics et Trouble

| Action | Neovim |
|--------|--------|
| Diagnostic suivant | `]d` |
| Diagnostic précédent | `[d` |
| Diagnostics (projet) | `<leader>xx` |
| Diagnostics (buffer) | `<leader>xX` |
| Symboles (Trouble) | `<leader>cs` |
| Références LSP | `<leader>cS` |
| Location list | `<leader>xL` |
| Quickfix list | `<leader>xQ` |
| Naviguer quickfix | `[q` / `]q` |

---

## Git - Basique

| IntelliJ | Action | Neovim |
|----------|--------|--------|
| Fenêtre Git | Neogit | `<leader>gg` |
| — | Hunk suivant | `]c` |
| — | Hunk précédent | `[c` |
| — | Stage hunk | `<leader>hs` |
| — | Reset hunk | `<leader>hr` |
| — | Undo stage hunk | `<leader>hu` |
| — | Preview hunk | `<leader>hp` |
| — | Blame ligne | `<leader>hb` |
| — | Diff this | `<leader>hd` |

---

## Git - Avancé

| Action | Neovim |
|--------|--------|
| Git status (Fugitive) | `<leader>gs` |
| Git diff (Fugitive) | `<leader>gD` |
| Git blame complet | `<leader>gB` |
| Diffview open | `<leader>gd` |
| File history | `<leader>gH` |
| Advanced Git Search | `<leader>gc` |
| Git log search | `<leader>gl` |
| Git file history | `<leader>gf` |

---

## GitHub (Octo.nvim)

| Action | Neovim |
|--------|--------|
| Liste des PRs | `<leader>gp` |
| Créer une PR | `<leader>gP` |
| Liste des Issues | `<leader>gi` |
| Créer une Issue | `<leader>gI` |
| Démarrer review | `<leader>gr` |

---

## Terminal et Tasks

| Action | Neovim |
|--------|--------|
| Terminal (toggle) | `<C-\>` |
| Terminal flottant | `<leader>tf` |
| Terminal horizontal | `<leader>th` |
| Terminal vertical | `<leader>tv` |
| Run task (Overseer) | `<leader>or` |
| Task list | `<leader>ot` |

---

## Debug

| Action | Neovim |
|--------|--------|
| Continue | `<F5>` ou `<leader>dc` |
| Step over | `<F10>` ou `<leader>do` |
| Step into | `<F11>` ou `<leader>di` |
| Step out | `<F12>` ou `<leader>dO` |
| Toggle breakpoint | `<leader>db` |
| Conditional breakpoint | `<leader>dB` |
| Open REPL | `<leader>dr` |
| Run last | `<leader>dl` |
| Toggle UI | `<leader>du` |
| Terminate | `<leader>dt` |

---

## Tests

| Action | Neovim |
|--------|--------|
| Test fichier | `<leader>tt` |
| Test nearest | `<leader>tT` |
| Test output | `<leader>to` |
| Test summary | `<leader>ts` |

---

## DevOps

| Action | Neovim |
|--------|--------|
| Kubectl interface | `<leader>k` |
| Docker containers | `<leader>Dp` |
| Docker images | `<leader>Di` |
| Docker volumes | `<leader>Dv` |
| YAML view | `<leader>yv` |
| YAML Telescope | `<leader>yt` |

---

## Base de données

| Action | Neovim |
|--------|--------|
| Database UI toggle | `<leader>Du` |
| DB find buffer | `<leader>Df` |
| DB rename buffer | `<leader>Dr` |
| DB last query info | `<leader>Dl` |

---

## HTTP / REST

| Action | Neovim |
|--------|--------|
| Run HTTP request | `<leader>rr` |
| Preview request | `<leader>rp` |
| Rerun last request | `<leader>rl` |

---

## AI Assistance

| Action | Neovim |
|--------|--------|
| Toggle Claude Code | `<leader>cc` |

---

## Buffers

| Action | Neovim |
|--------|--------|
| Buffer suivant | `]b` ou `<S-l>` |
| Buffer précédent | `[b` ou `<S-h>` |
| Move buffer next | `]B` |
| Move buffer prev | `[B` |
| Delete buffer | `<leader>bd` |
| Delete buffer (force) | `<leader>bD` |
| Pin buffer | `<leader>bp` |
| Close other buffers | `<leader>bo` |
| Close right | `<leader>br` |
| Close left | `<leader>bl` |

---

## Sessions

| Action | Neovim |
|--------|--------|
| Save session | `<leader>qs` |
| Restore session | `<leader>qr` |
| Delete session | `<leader>qd` |

---

## UI / Noice

| Action | Neovim |
|--------|--------|
| Dismiss notifications | `<leader>un` |
| Noice last message | `<leader>snl` |
| Noice history | `<leader>snh` |
| Noice all | `<leader>sna` |
| Noice dismiss | `<leader>snd` |
| Startup time | `<leader>us` |

---

## Explorateur

| Action | Neovim |
|--------|--------|
| Toggle NvimTree | `<leader>e` |

---

# Annexe B — Muscle memory quotidienne

À pratiquer chaque jour pendant 5 à 10 minutes :

**Navigation de base :**
- ouvrir un fichier avec `<leader>ff`
- naviguer entre buffers avec `]b` et `[b`
- aller à la définition avec `gd`
- revenir avec `Ctrl+o`

**LSP :**
- renommer une variable avec `<leader>rn`
- corriger un diagnostic avec `<leader>ca`
- voir la documentation avec `K`

**Git :**
- voir le status avec `<leader>gg`
- stage un hunk avec `<leader>hs`
- naviguer les hunks avec `]c` / `[c`

**Navigation avancée :**
- ajouter à Harpoon avec `<leader>ha`
- sauter avec Leap : `s` + 2 caractères
- voir l'outline avec `<leader>so`

La répétition crée l'automatisme.

---

# Annexe C — Checklist de workflow sain

Avant chaque session :

- je sais sur quoi je travaille
- une session correspond à une tâche

Pendant le travail :

- je reste en mode Normal autant que possible
- je fais confiance aux diagnostics
- je stage par intention
- j'utilise Harpoon pour mes fichiers principaux
- je consulte l'outline pour naviguer

Après le travail :

- je ferme proprement
- je laisse un état clair
- je peux reprendre facilement demain

---

# Annexe D — Rappels mentaux essentiels

- Neovim est composable
- le clavier exprime des intentions
- le LSP comprend le code
- les outils travaillent pour toi
- la simplicité est un choix actif

---

# Annexe E — Groupes de raccourcis par préfixe

| Préfixe | Domaine |
|---------|---------|
| `<leader>b` | Buffer |
| `<leader>c` | Code (LSP) |
| `<leader>d` | Debug |
| `<leader>D` | Docker/Database |
| `<leader>f` | File/Find |
| `<leader>g` | Git |
| `<leader>h` | Harpoon / Hunk |
| `<leader>o` | Overseer (tasks) |
| `<leader>q` | Quit/Session |
| `<leader>r` | REST / Rename |
| `<leader>s` | Search / Symbols |
| `<leader>t` | Terminal / Tests |
| `<leader>u` | UI |
| `<leader>x` | Diagnostics/Quickfix |
| `<leader>y` | YAML |
| `[` | Previous |
| `]` | Next |
| `g` | Goto |
| `z` | Fold |

---

# Fin des annexes

Ce guide est conçu pour être relu,
consulté partiellement,
et utilisé sur le long terme.

Neovim n'est pas appris en un jour.
Il se construit par couches successives.

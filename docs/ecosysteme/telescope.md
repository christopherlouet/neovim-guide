---
title: Telescope
sidebar_position: 1
---

# Telescope

Telescope est le couteau suisse de la recherche dans Neovim. C'est l'équivalent de "Find Anything" (Ctrl+Shift+A) d'IntelliJ, mais en beaucoup plus puissant.

:::tip Plugin utilisé
Cette section couvre le plugin suivant de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** — Fuzzy finder extensible
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** — Algorithme FZF natif pour des performances optimales
:::

---

## Concept

Telescope est un **fuzzy finder** : tu tapes quelques lettres, et il trouve ce que tu cherches parmi des milliers de possibilités.

### Pourquoi Telescope change tout

| Sans Telescope | Avec Telescope |
|----------------|----------------|
| Parcourir l'arborescence | `<leader>ff` + quelques lettres |
| Grep manuel | `<leader>fg` + pattern |
| Chercher dans les onglets | `<leader>fb` |
| Ouvrir l'historique | `<leader>fr` |

Telescope unifie toutes les recherches dans une seule interface.

---

## Raccourcis essentiels

### Recherche de fichiers

| Raccourci | Action |
|-----------|--------|
| `<leader>ff` | Find Files — Chercher un fichier par nom |
| `<leader>fg` | Find Grep — Chercher du texte dans tous les fichiers |
| `<leader>fb` | Find Buffers — Fichiers ouverts |
| `<leader>fr` | Find Recent — Fichiers récents |
| `<leader>fo` | Find Old files — Historique complet |

### Navigation dans le code

| Raccourci | Action |
|-----------|--------|
| `<leader>fs` | Find Symbols — Symboles du fichier courant |
| `<leader>fw` | Find Workspace symbols — Symboles du projet |
| `<leader>fd` | Find Diagnostics — Erreurs et warnings |

### Git

| Raccourci | Action |
|-----------|--------|
| `<leader>gc` | Git Commits — Historique des commits |
| `<leader>gs` | Git Status — Fichiers modifiés |
| `<leader>gb` | Git Branches — Branches |

### Aide et configuration

| Raccourci | Action |
|-----------|--------|
| `<leader>fh` | Find Help — Documentation Neovim |
| `<leader>fk` | Find Keymaps — Tous les raccourcis |
| `<leader>fc` | Find Commands — Commandes disponibles |

---

## Interface Telescope

### Zones de l'interface

```
┌─────────────────────────────────────────────┐
│ > Pattern de recherche                       │  ← Input (mode Insert)
├─────────────────────────────────────────────┤
│   fichier1.ts                               │  ← Résultats
│ > fichier2.ts                    [selected] │
│   fichier3.ts                               │
├─────────────────────────────────────────────┤
│ Preview du fichier sélectionné              │  ← Preview (optionnel)
│                                             │
└─────────────────────────────────────────────┘
```

### Navigation dans les résultats

| Raccourci | Action |
|-----------|--------|
| `<C-n>` ou `<Down>` | Résultat suivant |
| `<C-p>` ou `<Up>` | Résultat précédent |
| `<C-j>` | Résultat suivant (alternatif) |
| `<C-k>` | Résultat précédent (alternatif) |
| `<Enter>` | Ouvrir la sélection |
| `<Esc>` | Fermer Telescope |

### Actions sur les résultats

| Raccourci | Action |
|-----------|--------|
| `<C-x>` | Ouvrir en split horizontal |
| `<C-v>` | Ouvrir en split vertical |
| `<C-t>` | Ouvrir dans un nouvel onglet |
| `<Tab>` | Marquer pour sélection multiple |
| `<C-q>` | Envoyer vers quickfix list |

### Scroll dans le preview

| Raccourci | Action |
|-----------|--------|
| `<C-d>` | Scroll bas dans le preview |
| `<C-u>` | Scroll haut dans le preview |

---

## Find Files (`<leader>ff`)

Le picker le plus utilisé. Recherche par nom de fichier dans tout le projet.

### Syntaxe de recherche

La recherche est **floue** (fuzzy) :

```
usrserv    →  trouve "UserService.ts"
comphdr    →  trouve "ComponentHeader.tsx"
```

### Astuces

- **Pas besoin de taper tout** : `usrserv` suffit pour `UserService`
- **L'ordre compte** : les caractères doivent apparaître dans l'ordre
- **Slash pour les chemins** : `src/comp/btn` trouve `src/components/Button.tsx`

### Exclusions automatiques

Par défaut, Telescope ignore :
- `node_modules/`
- `.git/`
- Fichiers listés dans `.gitignore`

---

## Find Grep (`<leader>fg`)

Recherche du texte dans tous les fichiers du projet. C'est le `Ctrl+Shift+F` d'IntelliJ.

### Utilisation

1. `<leader>fg`
2. Tape ton pattern
3. Les résultats s'affichent avec contexte
4. `<Enter>` pour aller au fichier

### Syntaxe

```
# Recherche simple
handleClick

# Recherche avec contexte
function handleClick

# Regex basique
handle.*Click
```

### Live Grep vs Grep String

- **Live Grep** (`<leader>fg`) : Recherche en temps réel pendant que tu tapes
- **Grep String** : Recherche un pattern fixe (plus rapide sur gros projets)

---

## Find Buffers (`<leader>fb`)

Liste les fichiers actuellement ouverts (buffers).

### Pourquoi l'utiliser

- Plus rapide que `]b` / `[b` quand tu as beaucoup de buffers
- Permet de chercher par nom
- Affiche le preview du fichier

### Actions spéciales

| Raccourci | Action |
|-----------|--------|
| `<C-d>` | Supprimer le buffer (fermer le fichier) |

---

## Find Symbols (`<leader>fs`)

Liste les symboles (fonctions, classes, variables) du fichier courant.

### Utilité

- Naviguer rapidement dans un gros fichier
- Trouver une fonction sans scroller
- Voir la structure du fichier

### Types de symboles

- Fonctions
- Classes
- Interfaces
- Types
- Variables
- Constantes

---

## Find Workspace Symbols (`<leader>fw`)

Comme Find Symbols, mais pour tout le projet.

### Cas d'usage

- Trouver une classe dans un gros projet
- Localiser une fonction utilitaire
- Explorer une API inconnue

---

## Telescope + LSP

Telescope s'intègre parfaitement avec le LSP pour des recherches intelligentes.

### Références avec Telescope

Quand tu utilises `gr` (Go to References), les résultats s'affichent dans Telescope si plusieurs références existent.

### Diagnostics avec Telescope

```
<leader>fd
```

Affiche tous les diagnostics (erreurs, warnings) du projet dans Telescope.

---

## Pickers avancés

### Git Commits (`<leader>gc`)

Parcours l'historique des commits avec preview des changements.

### Git Status (`<leader>gs`)

Liste les fichiers modifiés avec diff intégré.

### Keymaps (`<leader>fk`)

Cherche parmi tous les raccourcis configurés. Très utile pour découvrir de nouvelles commandes.

### Help Tags (`<leader>fh`)

Cherche dans la documentation Neovim. Remplace `:help`.

---

## Multi-sélection

Telescope permet de sélectionner plusieurs éléments.

### Workflow

1. Ouvre un picker (ex: `<leader>ff`)
2. `<Tab>` pour marquer un fichier
3. Navigue et marque d'autres fichiers
4. `<C-q>` pour envoyer vers la quickfix list
5. Utilise `:cnext` / `:cprev` pour naviguer

### Cas d'usage

- Ouvrir plusieurs fichiers d'un coup
- Refactoring sur plusieurs fichiers
- Créer une liste de fichiers à modifier

---

## Comparaison IntelliJ

| IntelliJ | Neovim (Telescope) |
|----------|-------------------|
| Ctrl+Shift+N (Find File) | `<leader>ff` |
| Ctrl+Shift+F (Find in Path) | `<leader>fg` |
| Ctrl+E (Recent Files) | `<leader>fr` |
| Ctrl+Tab (Switcher) | `<leader>fb` |
| Ctrl+Shift+A (Find Action) | `<leader>fc` |
| Alt+7 (Structure) | `<leader>fs` |
| Ctrl+Alt+Shift+N (Symbol) | `<leader>fw` |

---

## Astuces avancées

### Recherche dans un dossier spécifique

```vim
:Telescope find_files cwd=src/components
```

Ou avec le picker :
1. `<leader>ff`
2. Tape `src/components/` au début

### Recherche de fichiers cachés

Par défaut, les fichiers cachés (`.env`, `.gitignore`) sont exclus.

```vim
:Telescope find_files hidden=true
```

### Changer le layout

Telescope peut s'afficher différemment :

- **dropdown** : Menu déroulant compact
- **cursor** : Près du curseur
- **center** : Centré (défaut)

### Resume

Pour reprendre la dernière recherche :

```vim
:Telescope resume
```

Ou avec un raccourci si configuré.

---

## Performance

### Pourquoi Telescope est rapide

- **FZF native** : Algorithme optimisé en C
- **Ripgrep** : Recherche de texte ultra-rapide
- **Async** : Ne bloque pas l'éditeur

### Sur très gros projets

Si le projet est énorme (100k+ fichiers) :
1. Assure-toi que `telescope-fzf-native` est installé
2. Utilise des patterns plus spécifiques
3. Limite la recherche à certains dossiers

---

## Exercices pratiques

### Exercice 1 : Navigation basique

1. `<leader>ff` — Ouvre Find Files
2. Tape le nom d'un fichier de ton projet
3. `<Enter>` pour l'ouvrir
4. `<leader>fb` — Retrouve-le dans les buffers

### Exercice 2 : Recherche de texte

1. `<leader>fg` — Ouvre Live Grep
2. Cherche une fonction de ton projet
3. Navigue dans les résultats avec `<C-n>` / `<C-p>`
4. `<C-v>` pour ouvrir en split vertical

### Exercice 3 : Exploration du code

1. `<leader>fs` — Symboles du fichier courant
2. Observe la structure du fichier
3. `<leader>fw` — Symboles du workspace
4. Cherche une classe ou fonction

### Exercice 4 : Git avec Telescope

1. `<leader>gs` — Git status
2. Observe les fichiers modifiés
3. `<leader>gc` — Git commits
4. Explore l'historique avec preview

### Exercice 5 : Multi-sélection

1. `<leader>ff` — Find Files
2. `<Tab>` sur 3 fichiers différents
3. `<C-q>` — Envoie vers quickfix
4. `:cnext` pour naviguer

---

## Checklist de fin de chapitre

- [ ] Je connais les raccourcis principaux (`<leader>ff`, `<leader>fg`, `<leader>fb`)
- [ ] Je sais naviguer dans l'interface Telescope
- [ ] J'utilise les splits (`<C-x>`, `<C-v>`) pour ouvrir les fichiers
- [ ] Je connais la recherche de symboles
- [ ] Je peux utiliser la multi-sélection avec `<Tab>`

---

## Pour aller plus loin

- [Navigation sans souris](/docs/productivite/navigation) — Concepts de fichiers, buffers et fenêtres
- [LSP](/docs/ecosysteme/lsp) — Intégration Telescope + LSP
- [Git dans Neovim](/docs/workflow/git) — Utiliser Telescope pour Git


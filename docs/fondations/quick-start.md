---
title: Quick Start
sidebar_position: 1
---

# Quick Start

Démarre avec Neovim en 5 minutes. Ce guide te donne les bases essentielles pour être opérationnel immédiatement.

:::info Prérequis
Ce guide suppose que tu as installé **[neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide)**. Sinon, suis les instructions d'installation sur le dépôt GitHub.
:::

---

## Installation rapide

### 1. Cloner le dépôt

```bash
git clone https://github.com/christopherlouet/neovim-intellij-ide
cd neovim-intellij-ide
```

### 2. Lancer l'installation

```bash
chmod +x install.sh
./install.sh
```

Le script installe automatiquement :
- **Neovim ≥ 0.11** (via PPA, AppImage ou Homebrew selon ta plateforme)
- Les dépendances système nécessaires
- La configuration dans `~/.config/nvim`
- Les plugins via **Lazy.nvim**
- Les parsers **Treesitter**

:::tip Options utiles
```bash
./install.sh --dry-run     # Voir ce qui sera fait sans rien installer
./install.sh --verbose     # Mode verbeux pour le debug
./install.sh --help        # Toutes les options
```
:::

### 3. Vérifier l'installation

```bash
./healthcheck.sh
```

Ce script vérifie que tout est correctement configuré.

### 4. Lancer Neovim

```bash
nvim
```

Tu es prêt.

:::info Plateformes supportées
- **Ubuntu** / **Debian** — Installation complète testée
- **Fedora** — Installation complète testée
- **macOS** — Via Homebrew
- **Windows** — Via WSL2 + Ubuntu

Voir la [documentation complète](https://github.com/christopherlouet/neovim-intellij-ide#-plateformes-supportées) pour les détails.
:::

---

## Choisir un profil (optionnel)

La configuration propose plusieurs **profils** adaptés à différents usages :

| Profil | Description | Cas d'usage |
|--------|-------------|-------------|
| `full` | Configuration complète (défaut) | Tout inclus |
| `minimal` | Core IDE (LSP, completion) | Édition rapide, SSH |
| `javascript` | Minimal + JS/TS tooling | Développement frontend |
| `devops` | Minimal + K8s, Terraform, Docker | Platform engineering |

Pour changer de profil, ajoute dans ton `init.lua` :

```lua
vim.g.nvim_profile = "devops"  -- ou "minimal", "javascript", "full"
```

:::tip
Le profil `full` est le défaut. Tu peux changer plus tard selon tes besoins.
Voir [Profils](/personnalisation/profils) pour les détails.
:::

---

## Les 10 raccourcis essentiels

Ces raccourcis couvrent 80% de ton usage quotidien.

| # | Raccourci | Action | Équivalent IntelliJ |
|---|-----------|--------|---------------------|
| 1 | `<leader>ff` | Ouvrir un fichier | Ctrl+Shift+N |
| 2 | `<leader>fg` | Rechercher du texte | Ctrl+Shift+F |
| 3 | `gd` | Aller à la définition | Ctrl+B |
| 4 | `gr` | Trouver les références | Alt+F7 |
| 5 | `K` | Documentation hover | Ctrl+Q |
| 6 | `<leader>ca` | Code actions | Alt+Enter |
| 7 | `<leader>rn` | Renommer | Shift+F6 |
| 8 | `]d` / `[d` | Diagnostic suivant/précédent | F2 |
| 9 | `<leader>e` | Explorateur de fichiers | Alt+1 |
| 10 | `<leader>gg` | Git (Neogit) | Alt+9 |

:::tip Leader key
`<leader>` est la touche **Espace** par défaut dans neovim-intellij-ide.
:::

---

## Premier workflow

### Ouvrir un projet

```bash
cd ~/mon-projet
nvim
```

La session précédente est restaurée automatiquement si elle existe.

### Naviguer

1. **Ouvrir un fichier** : `<leader>ff` + tape quelques lettres
2. **Chercher du texte** : `<leader>fg` + tape ton pattern
3. **Aller à la définition** : curseur sur un symbole → `gd`
4. **Revenir** : `Ctrl+o`

### Éditer

1. **Mode Insert** : `i` pour taper du texte
2. **Mode Normal** : `Esc` pour les commandes
3. **Sauvegarder** : `:w` ou `<leader>w`
4. **Annuler** : `u`

### Quitter

- `:q` — Quitter le fichier courant
- `:qa` — Quitter tout
- `:wqa` — Sauvegarder et quitter tout

---

## Comprendre les modes

Neovim a plusieurs modes. C'est **la** différence fondamentale avec IntelliJ.

| Mode | Touche | Usage |
|------|--------|-------|
| **Normal** | `Esc` | Navigation, commandes (80% du temps) |
| **Insert** | `i`, `a`, `o` | Écrire du texte |
| **Visual** | `v`, `V` | Sélectionner du texte |
| **Command** | `:` | Commandes Ex (`:w`, `:q`, etc.) |

### Règle d'or

> Si tu ne sais pas où tu es → `Esc`

`Esc` te ramène toujours en mode Normal.

---

## Découvrir les raccourcis avec Which-key

Tu n'as pas besoin de tout mémoriser. **Which-key** t'aide.

### Comment ça marche

1. Appuie sur `<leader>` (Espace)
2. **Attends** ~300ms
3. Un menu apparaît avec toutes les options

### Explorer les catégories

| Préfixe | Catégorie |
|---------|-----------|
| `<leader>f` | Find (recherche) |
| `<leader>g` | Git |
| `<leader>b` | Buffers |
| `<leader>c` | Code |
| `<leader>d` | Debug |
| `<leader>t` | Terminal / Tests |

---

## Cheatsheet de survie

### Navigation dans un fichier

| Raccourci | Action |
|-----------|--------|
| `h j k l` | Gauche, bas, haut, droite |
| `w` / `b` | Mot suivant / précédent |
| `gg` / `G` | Début / fin du fichier |
| `Ctrl+d` / `Ctrl+u` | Demi-page bas / haut |
| `0` / `$` | Début / fin de ligne |

### Édition rapide

| Raccourci | Action |
|-----------|--------|
| `dd` | Supprimer une ligne |
| `yy` | Copier une ligne |
| `p` | Coller |
| `u` | Annuler |
| `Ctrl+r` | Refaire |
| `o` / `O` | Nouvelle ligne dessous / dessus |

### Buffers (fichiers ouverts)

| Raccourci | Action |
|-----------|--------|
| `]b` / `[b` | Buffer suivant / précédent |
| `<leader>bd` | Fermer le buffer |
| `<leader>fb` | Liste des buffers |

---

## Premiers problèmes courants

### "Je suis bloqué dans un mode bizarre"

→ `Esc` plusieurs fois

### "Mes changements ne sont pas sauvegardés"

→ `:w` pour sauvegarder

### "Je ne trouve pas un fichier"

→ `<leader>ff` et tape une partie du nom

### "Le LSP ne fonctionne pas"

→ `:LspInfo` pour vérifier l'état

### "Je veux revenir à l'endroit précédent"

→ `Ctrl+o`

---

## Prochaines étapes

Tu as les bases. Voici l'ordre recommandé pour approfondir :

1. **[Mental model Vim](/fondations/mental-model)** — Comprendre la philosophie
2. **[Navigation](/productivite/navigation)** — Maîtriser les déplacements
3. **[Telescope](/ecosysteme/telescope)** — Le fuzzy finder en détail
4. **[LSP](/ecosysteme/lsp)** — L'intelligence du code
5. **[Git](/workflow/git)** — Workflow Git intégré

---

## Raccourcis par contexte

### Développement quotidien

```
<leader>ff    → Ouvrir fichier
<leader>fg    → Chercher texte
gd            → Définition
gr            → Références
<leader>ca    → Code action
<leader>rn    → Renommer
```

### Debug et diagnostics

```
]d            → Erreur suivante
[d            → Erreur précédente
<leader>xx    → Liste des diagnostics
<leader>db    → Ajouter breakpoint
<F5>          → Lancer debug
```

### Git

```
<leader>gg    → Ouvrir Neogit
<leader>hs    → Stage hunk
<leader>hr    → Reset hunk
]c            → Hunk suivant
[c            → Hunk précédent
```

### Terminal

```
<C-\>         → Toggle terminal
<leader>tf    → Terminal flottant
<leader>th    → Terminal horizontal
<leader>tv    → Terminal vertical
```

---

## Checklist Quick Start

- [ ] Neovim-intellij-ide est installé
- [ ] Je connais les 10 raccourcis essentiels
- [ ] Je comprends les modes (Normal, Insert, Visual)
- [ ] Je sais utiliser Which-key (`<leader>` + attendre)
- [ ] Je peux ouvrir, éditer et sauvegarder un fichier


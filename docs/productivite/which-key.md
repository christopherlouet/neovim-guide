---
title: Which-key
sidebar_position: 4
---

# Which-key

Which-key est ton filet de sécurité pour découvrir et mémoriser les raccourcis.

:::tip Plugin utilisé
Cette section couvre le plugin suivant de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** — Affichage interactif des keymaps
:::

---

## Concept

Which-key résout un problème fondamental :

> Comment découvrir les raccourcis sans mémoriser une documentation ?

La réponse : **observe et apprends**.

Quand tu hésites, appuie sur une touche de départ (comme `<leader>`) et attends. Which-key affiche tous les raccourcis disponibles.

---

## Pourquoi Which-key change tout

### Sans Which-key

- Tu dois mémoriser les raccourcis
- Tu consultes la doc régulièrement
- Tu oublies les commandes peu utilisées
- La charge mentale augmente

### Avec Which-key

- Tu découvres les raccourcis en temps réel
- Tu apprends par l'usage
- Tu retrouves les commandes oubliées
- La charge mentale diminue

---

## Utilisation de base

### Déclencher Which-key

Appuie sur une touche de préfixe et **attends** (~300ms) :

| Touche | Affiche |
|--------|---------|
| `<leader>` | Menu principal des raccourcis |
| `g` | Commandes "go to" (gd, gr, etc.) |
| `z` | Commandes de fold et scroll |
| `[` | Commandes "précédent" |
| `]` | Commandes "suivant" |
| `"` | Registres disponibles |
| `'` | Marques disponibles |

### Exemple concret

1. Appuie sur `<leader>`
2. Attends ~300ms
3. Le menu apparaît avec les catégories :
   - `f` → Find (recherche)
   - `g` → Git
   - `b` → Buffer
   - `c` → Code
   - etc.

4. Appuie sur `f` pour voir les sous-commandes Find
5. Appuie sur `f` à nouveau pour `<leader>ff` (Find Files)

---

## Structure des menus

### Menu principal (`<leader>`)

Les raccourcis sont organisés par catégorie logique :

| Préfixe | Catégorie |
|---------|-----------|
| `f` | Find — Recherche Telescope |
| `g` | Git — Commandes Git |
| `b` | Buffer — Gestion des buffers |
| `c` | Code — Actions sur le code |
| `d` | Debug — Debugger |
| `q` | Session — Sessions |
| `t` | Terminal / Tests |
| `x` | Trouble — Diagnostics |
| `h` | Harpoon — Fichiers favoris |
| `o` | Overseer — Tâches |

### Sous-menus

Chaque catégorie a ses propres sous-commandes. Par exemple `<leader>f` :

| Raccourci | Action |
|-----------|--------|
| `<leader>ff` | Find Files |
| `<leader>fg` | Find Grep (recherche texte) |
| `<leader>fb` | Find Buffers |
| `<leader>fh` | Find Help |
| `<leader>fr` | Find Recent |
| `<leader>fp` | Find Projects |

---

## Raccourcis sans leader

Which-key fonctionne aussi avec d'autres préfixes :

### `g` — Go to

| Raccourci | Action |
|-----------|--------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `gi` | Go to Implementation |
| `gD` | Go to Declaration |

### `[` et `]` — Navigation

| Raccourci | Action |
|-----------|--------|
| `]d` | Diagnostic suivant |
| `[d` | Diagnostic précédent |
| `]c` | Hunk Git suivant |
| `[c` | Hunk Git précédent |
| `]b` | Buffer suivant |
| `[b` | Buffer précédent |

### `z` — Folds et affichage

| Raccourci | Action |
|-----------|--------|
| `za` | Toggle fold |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |

---

## Workflow d'apprentissage

### Phase 1 : Découverte

1. Quand tu ne sais pas → `<leader>` → observe
2. Explore les catégories
3. Essaie des commandes
4. Note mentalement celles utiles

### Phase 2 : Mémorisation naturelle

1. Utilise Which-key comme aide-mémoire
2. Les raccourcis fréquents deviennent automatiques
3. Tu consultes Which-key de moins en moins

### Phase 3 : Fluidité

1. Les raccourcis principaux sont acquis
2. Which-key reste utile pour les commandes rares
3. Tu ne bloques plus jamais

---

## Comparaison IntelliJ

| IntelliJ | Neovim + Which-key |
|----------|-------------------|
| Find Action (Ctrl+Shift+A) | Which-key + `<leader>` |
| Keymap settings | `:map` + Which-key |
| Documentation des raccourcis | Inline dans Which-key |

L'avantage de Which-key : l'apprentissage est **contextuel** et **progressif**.

---

## Personnalisation

### Ajouter des descriptions

Dans la configuration de neovim-intellij-ide, les keymaps ont des descriptions :

```lua
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
```

Ces descriptions apparaissent dans Which-key.

### Modifier le délai

Par défaut, Which-key attend ~300ms. Tu peux ajuster :

```lua
vim.o.timeout = true
vim.o.timeoutlen = 300  -- millisecondes
```

---

## Astuces

### Raccourci direct vs menu

Tu n'es pas obligé d'attendre le menu.

- **Si tu connais le raccourci** : tape-le directement (`<leader>ff`)
- **Si tu hésites** : attends le menu

### Explorer une nouvelle catégorie

Quand tu veux découvrir les commandes Git :

1. `<leader>g` + attends
2. Observe toutes les options
3. Essaie-en une
4. Répète

### Raccourcis "one-shot"

Certains raccourcis sont directs :

- `<leader>e` → Explorateur
- `<leader>w` → Save
- `<leader>/` → Comment toggle

Ils apparaissent au premier niveau du menu.

---

## Exercices pratiques

### Exercice 1 : Exploration du menu principal

1. `<leader>` + attends
2. Observe les catégories disponibles
3. Entre dans 3 catégories différentes
4. Note les raccourcis utiles

### Exercice 2 : Découvrir les commandes Git

1. `<leader>g` + attends
2. Essaie `<leader>gg` (Neogit)
3. Essaie `<leader>gb` (Blame)
4. Essaie `<leader>gd` (Diff)

### Exercice 3 : Navigation avec `[` et `]`

1. Ouvre un fichier avec des erreurs
2. `]` + attends pour voir les options
3. `]d` pour aller au diagnostic suivant
4. `[d` pour revenir

### Exercice 4 : Raccourcis `g`

1. Place le curseur sur une fonction
2. `g` + attends
3. `gd` pour aller à la définition
4. `gr` pour voir les références

---

## Checklist de fin de chapitre

- [ ] Je sais déclencher Which-key avec `<leader>`
- [ ] Je connais les principales catégories de raccourcis
- [ ] Je n'ai plus peur d'oublier un raccourci
- [ ] J'utilise Which-key pour découvrir de nouvelles commandes
- [ ] Mon apprentissage des raccourcis est progressif


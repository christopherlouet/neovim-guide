---
title: Terminal
sidebar_position: 3
---

# Terminal

Le terminal intégré permet d'exécuter des commandes sans quitter Neovim.

:::tip Plugin utilisé
Cette section couvre le plugin suivant de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** — Terminal intégré avec plusieurs modes
:::

---

## Concept

Dans IntelliJ, tu as un terminal en bas de l'écran. Neovim offre la même chose, mais avec plus de flexibilité :
- Plusieurs terminaux
- Modes flottant, horizontal, vertical
- Toggle rapide

### Avantages

- **Pas de changement de contexte** — Reste dans Neovim
- **Plusieurs terminaux** — Un pour les tests, un pour le serveur
- **Flexible** — Change la disposition selon tes besoins

---

## Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<C-\>` | Toggle terminal (défaut) |
| `<leader>tf` | Terminal flottant |
| `<leader>th` | Terminal horizontal (en bas) |
| `<leader>tv` | Terminal vertical (à droite) |

---

## Modes de terminal

### Terminal flottant

```
<leader>tf
```

Le terminal apparaît au centre de l'écran. Idéal pour :
- Commandes rapides
- Vérifications ponctuelles

### Terminal horizontal

```
<leader>th
```

Le terminal apparaît en bas. Idéal pour :
- Logs de serveur
- Watch mode des tests
- Tâches de longue durée

### Terminal vertical

```
<leader>tv
```

Le terminal apparaît à droite. Idéal pour :
- Code à gauche, sortie à droite
- Comparaison code/résultat

---

## Navigation

### Entrer/Sortir du mode terminal

Dans un terminal Neovim, tu es en mode "terminal". Pour revenir au mode Normal :

```
<C-\><C-n>
```

Ou simplement `<Esc>` si configuré.

### Basculer entre fenêtres

| Raccourci | Action |
|-----------|--------|
| `<C-h>` | Fenêtre de gauche |
| `<C-j>` | Fenêtre du bas |
| `<C-k>` | Fenêtre du haut |
| `<C-l>` | Fenêtre de droite |

---

## Workflow typique

### Développement web

```
1. <leader>th → Terminal horizontal

2. npm run dev (ou yarn dev)

3. Édite ton code au-dessus

4. Le serveur se recharge automatiquement

5. <C-\> pour cacher le terminal si besoin
```

### Tests en watch mode

```
1. <leader>tv → Terminal vertical

2. npm test -- --watch

3. Édite le code à gauche

4. Les tests se relancent automatiquement à droite
```

### Commandes Git

```
1. <C-\> → Toggle terminal

2. git status, git diff, etc.

3. <C-\> → Ferme le terminal

4. Continue à coder
```

---

## Plusieurs terminaux

Toggle-term supporte plusieurs terminaux numérotés :

```vim
:ToggleTerm 1   " Terminal 1
:ToggleTerm 2   " Terminal 2
:ToggleTerm 3   " Terminal 3
```

### Exemple : Serveur + Tests

```
:ToggleTerm 1 direction=horizontal
npm run dev

:ToggleTerm 2 direction=vertical
npm test -- --watch
```

Tu as maintenant :
- Serveur en bas
- Tests à droite
- Code au centre

---

## Commandes utiles dans le terminal

### Développement

```bash
# Serveur de développement
npm run dev
yarn dev
python manage.py runserver

# Build
npm run build
cargo build

# Linting
npm run lint
eslint .
```

### Git (rapide)

```bash
git status
git diff
git add -p
git commit -m "message"
git push
```

Pour Git avancé, utilise plutôt Neogit (`<leader>gg`).

### Outils système

```bash
# Voir les processus
htop
top

# Espace disque
df -h
du -sh *

# Réseau
curl -I https://example.com
```

---

## Comparaison IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| Alt+F12 (Terminal) | `<C-\>` |
| New Terminal tab | `:ToggleTerm 2` |
| Terminal en bas | `<leader>th` |
| — | `<leader>tf` (flottant) |
| — | `<leader>tv` (vertical) |

---

## Astuces

### Terminal persistant

Le terminal garde son état quand tu le toggle. Si tu as lancé un serveur, il continue de tourner même quand le terminal est caché.

### Copier depuis le terminal

1. `<C-\><C-n>` pour passer en mode Normal
2. Sélectionne avec `v` ou `V`
3. `y` pour copier
4. `i` pour revenir au mode terminal

### Scroll dans le terminal

1. `<C-\><C-n>` pour passer en mode Normal
2. `<C-u>` / `<C-d>` pour scroller
3. `i` pour revenir au mode terminal

### Terminal et splits

Tu peux avoir du code en haut et le terminal en bas :

```
┌─────────────────────────┐
│         Code            │
│                         │
├─────────────────────────┤
│       Terminal          │
└─────────────────────────┘
```

Ou code à gauche, terminal à droite :

```
┌────────────┬────────────┐
│            │            │
│   Code     │  Terminal  │
│            │            │
└────────────┴────────────┘
```

---

## Exercices pratiques

### Exercice 1 : Premier terminal

1. `<C-\>` pour ouvrir le terminal
2. Tape `ls -la`
3. `<C-\>` pour fermer

### Exercice 2 : Modes de terminal

1. `<leader>tf` — Observe le terminal flottant
2. `<leader>th` — Observe le terminal horizontal
3. `<leader>tv` — Observe le terminal vertical

### Exercice 3 : Workflow dev

1. `<leader>th` — Terminal en bas
2. Lance un serveur (`npm run dev` ou équivalent)
3. Édite du code
4. Observe le rechargement automatique

---

## Checklist de fin de chapitre

- [ ] Je sais ouvrir/fermer le terminal avec `<C-\>`
- [ ] Je connais les trois modes (flottant, horizontal, vertical)
- [ ] Je sais naviguer entre le terminal et mon code
- [ ] Je peux utiliser plusieurs terminaux
- [ ] J'ai un workflow fluide code + terminal

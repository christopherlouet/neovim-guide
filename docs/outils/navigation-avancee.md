---
title: Navigation avancée
sidebar_position: 1
---

# Navigation avancée

Au-delà de la navigation de base, Neovim offre des outils puissants pour se déplacer instantanément dans le code.

---

## Harpoon — Fichiers favoris

Harpoon permet de marquer les fichiers sur lesquels tu travailles régulièrement et d'y accéder instantanément.

### Concept

Dans IntelliJ, tu utilises probablement les "Recent Files" (`Ctrl+E`). Harpoon va plus loin : tu choisis explicitement tes fichiers de travail.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>ha` | Ajouter le fichier actuel à Harpoon |
| `<leader>hh` | Ouvrir le menu Harpoon |
| `<leader>1` | Aller au fichier 1 |
| `<leader>2` | Aller au fichier 2 |
| `<leader>3` | Aller au fichier 3 |
| `<leader>4` | Aller au fichier 4 |

### Workflow typique

1. Ouvre les fichiers sur lesquels tu travailles
2. Pour chaque fichier important : `<leader>ha`
3. Navigue entre eux avec `<leader>1`, `<leader>2`, etc.
4. Le menu `<leader>hh` permet de réorganiser ou supprimer des entrées

### Cas d'usage

- **Développement feature** : Controller + Service + Test + Component
- **Debugging** : Source + Logs + Config
- **Review** : Plusieurs fichiers modifiés

---

## Leap — Mouvement instantané

Leap améliore les mouvements `f`/`F` de Vim pour sauter n'importe où dans le buffer visible.

### Concept

Au lieu de répéter `f` ou d'utiliser `/` pour chercher, Leap te permet d'atteindre n'importe quel point visible en 2-3 frappes.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `s` | Leap forward (vers l'avant) |
| `S` | Leap backward (vers l'arrière) |
| `gs` | Leap depuis toutes les fenêtres |

### Comment ça marche

1. Appuie sur `s`
2. Tape les 2 premiers caractères de ta cible
3. Des labels apparaissent si plusieurs correspondances
4. Tape le label pour sauter

### Exemple pratique

```javascript
// Curseur ici ▼
const user = getUser(id);
const validated = validateUser(user);
return processUser(validated);
```

Pour aller à `processUser` :
1. `s`
2. `pr` (premiers caractères)
3. Tu y es !

---

## Aerial — Vue structure / Outline

Aerial affiche la structure du fichier (fonctions, classes, méthodes) comme l'outline d'IntelliJ.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>so` | Toggle l'outline |

### Navigation dans Aerial

- `j`/`k` : Naviguer dans la liste
- `Enter` : Aller à l'élément
- `q` : Fermer

### Équivalent IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| `Ctrl+F12` (File Structure) | `<leader>so` |
| `Alt+7` (Structure panel) | `<leader>so` |

---

## Marks — Marques améliorées

Le plugin `marks.nvim` améliore le système de marques natif de Vim.

### Marques Vim natives

| Raccourci | Action |
|-----------|--------|
| `ma` | Créer marque 'a' |
| `'a` | Aller à la ligne de la marque 'a' |
| `` `a `` | Aller à la position exacte de 'a' |

### Marques locales vs globales

- **Minuscules** (`a-z`) : Locales au buffer
- **Majuscules** (`A-Z`) : Globales (cross-files)

### Marques spéciales

| Marque | Signification |
|--------|---------------|
| `.` | Dernière modification |
| `<` | Début de la dernière sélection |
| `>` | Fin de la dernière sélection |
| `^` | Dernière insertion |

### Avec marks.nvim

- Les marques sont visibles dans la gouttière (sign column)
- `dm<marque>` pour supprimer une marque
- `m]` / `m[` pour naviguer entre les marques

---

## Todo Comments — Navigation par TODO

Surligne et permet de naviguer vers les commentaires TODO, FIXME, NOTE, etc.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `]t` | Aller au prochain TODO |
| `[t` | Aller au TODO précédent |
| `<leader>st` | Rechercher tous les TODOs (Telescope) |
| `<leader>xt` | Voir les TODOs dans Trouble |

### Mots-clés reconnus

| Mot-clé | Couleur | Usage |
|---------|---------|-------|
| `TODO` | Bleu | À faire |
| `FIXME` / `BUG` | Rouge | Bug à corriger |
| `HACK` | Orange | Solution temporaire |
| `WARN` / `XXX` | Jaune | Attention requise |
| `PERF` / `OPTIM` | Violet | Optimisation |
| `NOTE` / `INFO` | Vert | Information |
| `TEST` | Cyan | Tests |

### Exemple

```typescript
// TODO: Implémenter la validation
// FIXME: Cette fonction crashe avec des valeurs null
// HACK: Workaround pour le bug #123
// PERF: Optimiser cette boucle
```

---

## Trouble — Liste de diagnostics

Trouble affiche les diagnostics, TODOs, et références LSP dans un panel dédié.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>xx` | Toggle diagnostics (projet) |
| `<leader>xX` | Diagnostics du buffer actuel |
| `<leader>cs` | Symbols du fichier |
| `<leader>cS` | Références LSP |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |
| `[q` / `]q` | Naviguer entre les items |

### Équivalent IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| `Alt+6` (Problems) | `<leader>xx` |
| `Ctrl+Shift+F7` (Usages) | `<leader>cS` |

---

## Projet / Sessions — Persistence

Le projet neovim-intellij-ide utilise `project.nvim` et `auto-session` pour la gestion des projets.

### Projects (Telescope)

| Raccourci | Action |
|-----------|--------|
| `<leader>fp` | Liste des projets récents |

### Sessions

| Raccourci | Action |
|-----------|--------|
| `<leader>qs` | Sauvegarder la session |
| `<leader>qr` | Restaurer la session |
| `<leader>qd` | Supprimer la session |

### Comportement

- La session se restaure automatiquement à l'ouverture d'un projet
- Inclut : buffers ouverts, positions du curseur, état des fenêtres
- Exclut : `~/`, `~/Downloads`, `/`

---

## Comparaison IntelliJ

| Fonctionnalité IntelliJ | Neovim |
|-------------------------|--------|
| Recent Files (`Ctrl+E`) | `<leader>fh` + Harpoon |
| File Structure (`Ctrl+F12`) | `<leader>so` (Aerial) |
| Go to Symbol (`Ctrl+Shift+Alt+N`) | `<leader>fs` / `<leader>fS` |
| Bookmarks | Marks (`m` + lettre) |
| TODO list | `<leader>st` / `<leader>xt` |
| Problems panel | `<leader>xx` |
| Find Usages | `<leader>cS` |

---

## Exercices pratiques

### Exercice 1 : Harpoon
1. Ouvre 3 fichiers de ton projet
2. Ajoute-les à Harpoon (`<leader>ha`)
3. Navigue entre eux avec `<leader>1`, `<leader>2`, `<leader>3`

### Exercice 2 : Leap
1. Place ton curseur en haut d'un fichier
2. Utilise `s` pour sauter à différents endroits
3. Essaie `gs` pour sauter vers une autre fenêtre

### Exercice 3 : Marks
1. Crée une marque globale sur un fichier : `mA`
2. Change de fichier
3. Reviens à la marque : `'A`

---

## Checklist de fin de chapitre

- [ ] Je sais ajouter des fichiers à Harpoon
- [ ] Je peux naviguer instantanément avec Leap
- [ ] J'utilise Aerial pour voir la structure
- [ ] Je connais les marques et les TODOs
- [ ] Je sais utiliser Trouble pour les diagnostics

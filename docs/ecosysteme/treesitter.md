---
title: Treesitter
sidebar_position: 2
---

# Treesitter

Treesitter transforme Neovim en éditeur qui **comprend** vraiment ton code, pas juste sa syntaxe.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** — Highlighting et parsing intelligent
- **[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** — Text-objects basés sur la syntaxe
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** — Auto-fermeture des tags HTML/JSX
:::

---

## Concept

### Le problème des regex

Traditionnellement, la coloration syntaxique utilise des **expressions régulières**. C'est approximatif et source d'erreurs.

```javascript
// Regex ne comprend pas la différence entre :
const function = "test";  // variable nommée "function"
function test() {}        // déclaration de fonction
```

### La solution Treesitter

Treesitter **parse** réellement ton code et construit un **arbre syntaxique** (AST). Il comprend la structure du code, pas juste ses patterns.

```
Program
├── VariableDeclaration
│   └── Identifier: "function"
└── FunctionDeclaration
    └── Identifier: "test"
```

### Avantages

| Sans Treesitter | Avec Treesitter |
|-----------------|-----------------|
| Coloration approximative | Coloration précise |
| Pas de text-objects intelligents | `vaf` sélectionne une fonction |
| Indentation basique | Indentation contextuelle |
| Fold manuel | Fold automatique par syntaxe |

---

## Coloration syntaxique

### Activation

Dans neovim-intellij-ide, Treesitter est activé automatiquement pour les langages supportés.

### Langages supportés

Treesitter supporte 100+ langages, dont :

- JavaScript / TypeScript / TSX
- Python / Go / Rust / Java
- HTML / CSS / SCSS
- JSON / YAML / TOML
- Lua / Bash / SQL
- Markdown / LaTeX

### Comparaison visuelle

**Sans Treesitter** (regex) :
```javascript
// Coloration basique, parfois incorrecte
const MyComponent = ({ title }) => {
  return <div className="test">{title}</div>;
};
```

**Avec Treesitter** :
- `const` → mot-clé
- `MyComponent` → fonction/composant
- `title` → paramètre
- `className` → propriété JSX
- `"test"` → string

Chaque élément a sa couleur appropriée selon son **rôle sémantique**.

---

## Text-objects intelligents

La vraie puissance de Treesitter : les **text-objects** basés sur la syntaxe du langage.

### Sélection de fonctions

| Raccourci | Action |
|-----------|--------|
| `vaf` | Sélectionner **a** **f**unction (entière) |
| `vif` | Sélectionner **i**nside **f**unction (corps) |
| `daf` | Supprimer une fonction |
| `yaf` | Copier une fonction |
| `cif` | Changer le corps d'une fonction |

### Sélection de classes

| Raccourci | Action |
|-----------|--------|
| `vac` | Sélectionner **a** **c**lass |
| `vic` | Sélectionner **i**nside **c**lass |
| `dac` | Supprimer une classe |

### Sélection de paramètres

| Raccourci | Action |
|-----------|--------|
| `via` | Sélectionner **i**nside **a**rgument |
| `vaa` | Sélectionner **a**round **a**rgument |
| `cia` | Changer un argument |
| `daa` | Supprimer un argument |

### Sélection de conditions/boucles

| Raccourci | Action |
|-----------|--------|
| `vai` | Sélectionner **a** cond**i**tional |
| `vii` | Sélectionner **i**nside conditional |
| `val` | Sélectionner **a** **l**oop |
| `vil` | Sélectionner **i**nside loop |

### Exemples pratiques

```javascript
function calculateTotal(items, tax) {
  // Curseur ici
  return items.reduce((sum, item) => sum + item.price, 0) * (1 + tax);
}
```

- `vaf` → Sélectionne toute la fonction `calculateTotal`
- `vif` → Sélectionne uniquement le `return ...`
- `vaa` sur `items` → Sélectionne `items, ` (avec la virgule)
- `via` sur `items` → Sélectionne juste `items`

---

## Navigation par syntaxe

### Aller à la fonction suivante/précédente

| Raccourci | Action |
|-----------|--------|
| `]f` | Fonction suivante |
| `[f` | Fonction précédente |
| `]c` | Classe suivante |
| `[c` | Classe précédente |

### Aller au début/fin

| Raccourci | Action |
|-----------|--------|
| `]F` | Fin de la fonction courante |
| `[F` | Début de la fonction courante |

---

## Incremental Selection

Sélection progressive basée sur la syntaxe.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<C-Space>` | Démarrer la sélection / Étendre |
| `<BS>` | Réduire la sélection (en mode visuel) |

### Workflow

1. Place le curseur sur un mot
2. `<C-Space>` → Sélectionne le mot
3. `<C-Space>` → Étend à l'expression
4. `<C-Space>` → Étend au statement
5. `<C-Space>` → Étend à la fonction
6. `<BS>` → Réduit d'un niveau

### Exemple

```javascript
const result = items.filter(x => x.active).map(x => x.name);
//                   ^curseur ici
```

1. `<C-Space>` → `filter`
2. `<C-Space>` → `items.filter(x => x.active)`
3. `<C-Space>` → `items.filter(x => x.active).map(x => x.name)`
4. `<C-Space>` → toute la ligne
5. `<BS>` → retour à l'expression précédente

---

## Folding avec Treesitter

Treesitter permet un folding intelligent basé sur la syntaxe.

### Raccourcis de fold

| Raccourci | Action |
|-----------|--------|
| `za` | Toggle fold sous le curseur |
| `zo` | Ouvrir le fold |
| `zc` | Fermer le fold |
| `zR` | Ouvrir tous les folds |
| `zM` | Fermer tous les folds |
| `zr` | Ouvrir un niveau de plus |
| `zm` | Fermer un niveau de plus |

### Ce qui est foldable

- Fonctions
- Classes
- Objets / Arrays
- Blocs if/for/while
- Imports (groupés)
- Commentaires multi-lignes

---

## Auto-tag (HTML/JSX)

Le plugin `nvim-ts-autotag` utilise Treesitter pour :

### Fermeture automatique

```html
<div>  →  <div></div>
```

### Renommage synchronisé

```html
<div>content</div>
<!-- Change "div" en "section" -->
<section>content</section>  <!-- Les deux changent -->
```

---

## Indentation intelligente

Treesitter améliore l'indentation automatique.

### Exemple JavaScript

```javascript
// Sans Treesitter : indentation parfois cassée
function test() {
return {
    value: 1,  // ← incohérent
  };
}

// Avec Treesitter : indentation correcte
function test() {
  return {
    value: 1,
  };
}
```

### Commandes d'indentation

| Raccourci | Action |
|-----------|--------|
| `=` | Réindenter la sélection |
| `==` | Réindenter la ligne |
| `gg=G` | Réindenter tout le fichier |

---

## Playground (Debug)

Pour comprendre comment Treesitter voit ton code :

```vim
:InspectTree
```

Affiche l'arbre syntaxique du fichier courant.

### Utilité

- Comprendre la structure du code
- Débugger des problèmes de highlighting
- Apprendre comment fonctionne l'AST

---

## Comparaison IntelliJ

| IntelliJ | Neovim (Treesitter) |
|----------|---------------------|
| Syntax highlighting | Treesitter highlighting |
| Structure view | `:InspectTree` |
| Extend Selection (Ctrl+W) | `<C-Space>` incremental selection |
| Code folding | `za`, `zR`, `zM` |
| Smart indent | Treesitter indent |

---

## Installation de nouveaux langages

Si un langage manque :

```vim
:TSInstall <langage>
```

Exemples :
```vim
:TSInstall python
:TSInstall rust
:TSInstall go
```

### Vérifier les langages installés

```vim
:TSInstallInfo
```

### Mettre à jour les parsers

```vim
:TSUpdate
```

---

## Astuces

### Désactiver temporairement

Si Treesitter pose problème sur un fichier :

```vim
:TSBufDisable highlight
```

### Voir les captures

Pour voir comment un élément est catégorisé :

```vim
:Inspect
```

Place le curseur sur un mot et exécute cette commande.

### Performance

Treesitter est optimisé mais peut ralentir sur très gros fichiers (10k+ lignes).

Solutions :
1. Diviser le fichier
2. Désactiver certains modules Treesitter
3. Utiliser `:TSBufDisable highlight` temporairement

---

## Exercices pratiques

### Exercice 1 : Text-objects fonctions

1. Ouvre un fichier avec plusieurs fonctions
2. Place le curseur dans une fonction
3. `vaf` → Observe la sélection
4. `Esc`, puis `vif` → Compare avec `vaf`
5. `daf` → Supprime la fonction
6. `u` → Annule

### Exercice 2 : Text-objects arguments

1. Crée une fonction avec plusieurs paramètres :
   ```javascript
   function test(arg1, arg2, arg3) {}
   ```
2. Curseur sur `arg2`
3. `vaa` → Sélectionne `arg2, `
4. `via` → Sélectionne juste `arg2`
5. `daa` → Supprime l'argument avec sa virgule

### Exercice 3 : Incremental selection

1. Place le curseur au milieu d'une expression
2. `<C-Space>` plusieurs fois → Observe l'extension
3. `<BS>` → Réduis la sélection
4. Une fois satisfait, `y` pour copier ou `d` pour supprimer

### Exercice 4 : Folding

1. Ouvre un fichier avec plusieurs fonctions
2. `zM` → Ferme tous les folds
3. `za` sur une fonction → Toggle son fold
4. `zR` → Réouvre tout
5. `zc` sur une fonction spécifique

### Exercice 5 : Navigation

1. `]f` → Va à la fonction suivante
2. `[f` → Reviens à la précédente
3. Répète pour naviguer dans le fichier
4. Combine avec `vaf` pour sélectionner après navigation

---

## Checklist de fin de chapitre

- [ ] Je comprends la différence entre regex et Treesitter
- [ ] J'utilise `vaf` / `vif` pour les fonctions
- [ ] J'utilise `vaa` / `via` pour les arguments
- [ ] Je connais la sélection incrémentale (`<C-Space>`)
- [ ] Je sais utiliser le folding (`za`, `zR`, `zM`)
- [ ] Je peux naviguer entre fonctions (`]f`, `[f`)

---

## Pour aller plus loin

- [Édition efficace](/productivite/edition) — Text-objects Vim de base
- [LSP](/ecosysteme/lsp) — Treesitter complète le LSP
- [Navigation avancée](/outils/navigation-avancee) — Aerial utilise Treesitter


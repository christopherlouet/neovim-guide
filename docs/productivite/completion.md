---
title: Autocomplétion
sidebar_position: 3
---

# Autocomplétion

L'autocomplétion intelligente de Neovim rivalise avec celle d'IntelliJ.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** — Moteur d'autocomplétion
- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** — Source LSP pour nvim-cmp
- **[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** — Complétion depuis le buffer
- **[cmp-path](https://github.com/hrsh7th/cmp-path)** — Complétion des chemins de fichiers
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** — Moteur de snippets
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** — Collection de snippets
:::

---

## Concept

L'autocomplétion dans Neovim est modulaire. Contrairement à IntelliJ où tout est intégré, nvim-cmp agrège plusieurs **sources** :

| Source | Contenu |
|--------|---------|
| LSP | Symboles, fonctions, types |
| Buffer | Mots du fichier courant |
| Path | Chemins de fichiers |
| Snippets | Templates de code |
| Cmdline | Commandes Vim |

---

## Raccourcis essentiels

### Dans le menu de complétion

| Raccourci | Action |
|-----------|--------|
| `<C-n>` ou `<Tab>` | Élément suivant |
| `<C-p>` ou `<S-Tab>` | Élément précédent |
| `<Enter>` ou `<C-y>` | Confirmer la sélection |
| `<C-e>` | Annuler la complétion |
| `<C-Space>` | Forcer l'affichage du menu |

### Navigation dans la documentation

| Raccourci | Action |
|-----------|--------|
| `<C-d>` | Scroll bas dans la doc |
| `<C-f>` | Scroll haut dans la doc |

---

## Workflow de base

### 1. Complétion automatique

En mode Insert, la complétion apparaît automatiquement après quelques caractères.

```javascript
const use  // ← Menu apparaît avec suggestions
```

### 2. Filtrage intelligent

Continue à taper pour filtrer :

```javascript
const userS  // ← Filtre vers "userService", "userState", etc.
```

### 3. Sélection rapide

- `<Tab>` pour naviguer
- `<Enter>` pour confirmer

---

## Sources de complétion

### LSP (Language Server)

La source principale pour le code. Fournit :

- Fonctions et méthodes
- Variables et constantes
- Types et interfaces
- Paramètres de fonction

**Icône dans le menu** : Symbole du langage

### Buffer

Complète avec les mots du fichier actuel.

Utile pour :
- Répéter des identifiants
- Noms de variables locales

**Icône dans le menu** : `[Buffer]`

### Path

Complète les chemins de fichiers.

```javascript
import { Button } from "./components/  // ← Suggestions de fichiers
```

**Icône dans le menu** : `[Path]`

### Snippets

Templates de code prédéfinis.

Exemple : tape `func` puis `<Tab>` pour un template de fonction.

**Icône dans le menu** : `[Snippet]`

---

## Snippets avec LuaSnip

### Utilisation basique

1. Tape le déclencheur du snippet
2. Il apparaît dans le menu avec `[Snippet]`
3. `<Enter>` pour insérer
4. `<Tab>` pour naviguer entre les placeholders

### Exemples de snippets courants

#### JavaScript/TypeScript

| Trigger | Expansion |
|---------|-----------|
| `log` | `console.log()` |
| `func` | Function déclaration |
| `afunc` | Arrow function |
| `imp` | Import statement |
| `useS` | useState hook |
| `useE` | useEffect hook |

#### React

| Trigger | Expansion |
|---------|-----------|
| `rfc` | React functional component |
| `rfce` | React functional component with export |
| `useState` | useState avec destructuring |

#### Lua

| Trigger | Expansion |
|---------|-----------|
| `fn` | Function |
| `for` | For loop |
| `if` | If statement |

### Navigation dans les snippets

Une fois le snippet inséré :

| Raccourci | Action |
|-----------|--------|
| `<Tab>` | Placeholder suivant |
| `<S-Tab>` | Placeholder précédent |

---

## Priorité des sources

nvim-cmp affiche les résultats par priorité :

1. **LSP** — Le plus pertinent pour le code
2. **Snippets** — Templates utiles
3. **Buffer** — Mots locaux
4. **Path** — Chemins de fichiers

Cette priorité peut être personnalisée dans la configuration.

---

## Comparaison IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| Ctrl+Space | `<C-Space>` |
| Tab/Enter pour sélectionner | Identique |
| Live Templates | LuaSnip snippets |
| Postfix completion | Disponible via LSP |

---

## Astuces

### Forcer la complétion

Si le menu ne s'affiche pas automatiquement :

```
<C-Space>
```

### Signature des fonctions

Quand tu tapes les arguments d'une fonction, la signature s'affiche automatiquement grâce au LSP.

```javascript
myFunction(  // ← Signature affichée
```

### Complétion en mode commande

La complétion fonctionne aussi pour les commandes Vim :

```vim
:e src/comp  → <Tab> → autocomplete le chemin
```

### Documentation inline

Dans le menu de complétion, la documentation s'affiche à droite. Utilise `<C-d>` / `<C-f>` pour la parcourir.

---

## Personnalisation

### Mapping personnalisé

Dans neovim-intellij-ide, les mappings par défaut sont :

```lua
-- Dans la config nvim-cmp
mapping = {
  ['<C-n>'] = cmp.mapping.select_next_item(),
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-e>'] = cmp.mapping.abort(),
}
```

### Ajouter des sources

Tu peux ajouter des sources supplémentaires :
- `cmp-git` pour les commits Git
- `cmp-npm` pour les packages npm
- `cmp-emoji` pour les emojis

---

## Exercices pratiques

### Exercice 1 : Complétion LSP

1. Ouvre un fichier TypeScript
2. Tape le début d'une fonction connue
3. Observe le menu de complétion
4. Navigue avec `<Tab>` et `<S-Tab>`
5. Confirme avec `<Enter>`

### Exercice 2 : Snippets

1. Dans un fichier `.tsx`, tape `rfc`
2. `<Tab>` ou `<Enter>` pour insérer
3. Navigue entre les placeholders avec `<Tab>`
4. Complète le composant

### Exercice 3 : Complétion de chemins

1. Commence à écrire un import : `import { } from "./`
2. Observe la complétion de chemin
3. Navigue dans l'arborescence

### Exercice 4 : Forcer la complétion

1. Place le curseur au milieu d'un mot
2. `<C-Space>` pour forcer le menu
3. Observe les suggestions

---

## Checklist de fin de chapitre

- [ ] Je connais les raccourcis de navigation dans le menu
- [ ] Je sais utiliser les snippets avec LuaSnip
- [ ] Je comprends les différentes sources de complétion
- [ ] Je peux forcer l'affichage avec `<C-Space>`
- [ ] La complétion ne me ralentit plus


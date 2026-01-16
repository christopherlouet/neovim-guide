---
title: Debug
sidebar_position: 5
---

# Debug

Le debugger intégré de Neovim (nvim-dap) offre une expérience de debugging comparable à celle d'IntelliJ.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** — Debug Adapter Protocol client
- **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** — Interface utilisateur pour le debug
- **[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)** — Valeurs inline pendant le debug
- **[mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)** — Installation automatique des adapters
:::

---

## Concept

Le Debug Adapter Protocol (DAP) est un protocole standard (comme LSP pour le code) qui permet à Neovim de communiquer avec différents debuggers.

### Avantages

- **Unifié** — Même interface pour tous les langages
- **Intégré** — Pas de changement de contexte
- **Puissant** — Breakpoints conditionnels, watchers, REPL

---

## Raccourcis essentiels

### Contrôle d'exécution

| Raccourci | Action |
|-----------|--------|
| `<F5>` | Continuer / Démarrer |
| `<F10>` | Step over (ligne suivante) |
| `<F11>` | Step into (entrer dans fonction) |
| `<F12>` | Step out (sortir de fonction) |

### Avec leader

| Raccourci | Action |
|-----------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Breakpoint conditionnel |
| `<leader>dc` | Continuer |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Ouvrir REPL |
| `<leader>dl` | Relancer dernier debug |
| `<leader>du` | Toggle UI debug |
| `<leader>dt` | Terminer la session |

---

## Workflow de base

### 1. Ajouter un breakpoint

Place ton curseur sur la ligne et appuie sur `<leader>db`.

Un point rouge apparaît dans la gouttière.

```javascript
function processUser(user) {
  const validated = validate(user);  // ← Breakpoint ici
  return save(validated);
}
```

### 2. Lancer le debug

Plusieurs options :
- `<F5>` — Lance le debugger
- `<leader>dc` — Continuer/Démarrer

Le debugger s'arrête au premier breakpoint.

### 3. Inspecter les variables

Quand le debug est en pause :
- **Virtual text** — Les valeurs s'affichent à côté des variables
- **UI** — Le panneau latéral montre les variables
- **Hover** — Place le curseur sur une variable pour voir sa valeur

### 4. Naviguer dans le code

| Action | Raccourci |
|--------|-----------|
| Ligne suivante | `<F10>` ou `<leader>do` |
| Entrer dans fonction | `<F11>` ou `<leader>di` |
| Sortir de fonction | `<F12>` ou `<leader>dO` |
| Continuer | `<F5>` ou `<leader>dc` |

### 5. Terminer

`<leader>dt` pour terminer la session de debug.

---

## Interface Debug (dap-ui)

### Ouvrir/Fermer l'UI

```
<leader>du
```

### Panneaux disponibles

L'interface affiche plusieurs panneaux :

| Panneau | Contenu |
|---------|---------|
| **Scopes** | Variables locales et globales |
| **Breakpoints** | Liste des breakpoints |
| **Stacks** | Call stack (pile d'appels) |
| **Watches** | Variables surveillées |
| **Console** | Sortie du programme |
| **REPL** | Console interactive |

### Navigation dans les panneaux

- `j`/`k` — Naviguer
- `Enter` — Développer/Réduire
- `e` — Éditer une watch expression
- `d` — Supprimer

---

## Breakpoints avancés

### Breakpoint simple

```
<leader>db
```

Toggle un breakpoint sur la ligne courante.

### Breakpoint conditionnel

```
<leader>dB
```

Demande une condition. Le breakpoint ne s'active que si la condition est vraie.

**Exemple :**
```
user.id === 123
```

Le debug ne s'arrête que si `user.id` vaut 123.

### Log point

Au lieu de s'arrêter, affiche un message dans la console.

Utile pour tracer sans interrompre l'exécution.

---

## REPL (Read-Eval-Print Loop)

Le REPL permet d'exécuter du code pendant le debug.

### Ouvrir le REPL

```
<leader>dr
```

### Utilisation

Dans le REPL, tu peux :
- Évaluer des expressions
- Modifier des variables
- Appeler des fonctions

**Exemple :**
```
> user.name
"John"
> user.age + 10
35
> validate(user)
true
```

---

## Debug par langage

### JavaScript/TypeScript (Node.js)

1. **Installer l'adapter** via Mason :
   ```vim
   :Mason
   ```
   Cherche `js-debug-adapter`

2. **Configuration** (automatique avec neovim-intellij-ide)

3. **Lancer** :
   - Ouvre ton fichier
   - `<leader>db` sur la ligne voulue
   - `<F5>` pour démarrer

### Python

1. **Installer** via Mason : `debugpy`

2. **Lancer** :
   - `<leader>db` pour breakpoint
   - `<F5>` pour démarrer

### Go

1. **Installer** via Mason : `delve`

2. **Lancer** :
   - `<leader>db` pour breakpoint
   - `<F5>` pour démarrer

---

## Comparaison IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| Click gouttière → Breakpoint | `<leader>db` |
| Debug (Shift+F9) | `<F5>` ou `<leader>dc` |
| Step Over (F8) | `<F10>` ou `<leader>do` |
| Step Into (F7) | `<F11>` ou `<leader>di` |
| Step Out (Shift+F8) | `<F12>` ou `<leader>dO` |
| Variables panel | `<leader>du` |
| Evaluate Expression | `<leader>dr` (REPL) |
| Conditional Breakpoint | `<leader>dB` |

---

## Bonnes pratiques

### Quand utiliser le debugger

- **Bug complexe** — Quand `console.log` ne suffit pas
- **État inattendu** — Pour comprendre le flux
- **Code inconnu** — Pour explorer pas à pas

### Quand NE PAS utiliser le debugger

- **Erreur simple** — Un `console.log` suffit
- **Erreur de type** — Le LSP l'affiche déjà
- **Test qui échoue** — Lis d'abord l'erreur

### Conseils

1. **Commence par la fin** — Place le breakpoint où le bug se manifeste
2. **Remonte** — Step out pour comprendre d'où vient la donnée
3. **Utilise les watches** — Pour surveiller des expressions spécifiques
4. **Breakpoint conditionnel** — Évite de s'arrêter 1000 fois dans une boucle

---

## Astuces avancées

### Virtual text

Les valeurs des variables s'affichent directement dans le code pendant le debug :

```javascript
function calculate(x, y) {      // x = 5, y = 10
  const sum = x + y;            // sum = 15
  return sum * 2;               // return 30
}
```

### Watch expressions

Ajoute des expressions à surveiller dans le panneau Watches :
- `user.orders.length`
- `Object.keys(data)`
- `array.filter(x => x > 0)`

### Attacher à un process

Pour debugger un serveur déjà lancé :
1. Lance ton serveur avec `--inspect` (Node.js)
2. Configure DAP pour s'attacher au port
3. `<F5>` pour s'attacher

---

## Exercices pratiques

### Exercice 1 : Premier debug

1. Crée une fonction simple avec un bug
2. `<leader>db` pour ajouter un breakpoint
3. `<F5>` pour lancer
4. Inspecte les variables
5. `<F10>` pour avancer pas à pas

### Exercice 2 : Breakpoint conditionnel

1. Crée une boucle qui itère 100 fois
2. `<leader>dB` avec condition `i === 50`
3. Le debug ne s'arrête qu'à l'itération 50

### Exercice 3 : REPL

1. Arrête-toi sur un breakpoint
2. `<leader>dr` pour ouvrir le REPL
3. Évalue des expressions
4. Modifie une variable et continue

---

## Checklist de fin de chapitre

- [ ] Je sais ajouter des breakpoints
- [ ] Je maîtrise les raccourcis de navigation (F5, F10, F11, F12)
- [ ] J'utilise l'interface debug pour inspecter les variables
- [ ] Je sais utiliser les breakpoints conditionnels
- [ ] Je connais le REPL pour évaluer des expressions
- [ ] Je sais quand utiliser le debugger vs console.log

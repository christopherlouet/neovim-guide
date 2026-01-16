---
title: Tests
sidebar_position: 4
---

# Tests

Exécuter et gérer les tests directement depuis Neovim pour un workflow de développement fluide.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[neotest](https://github.com/nvim-neotest/neotest)** — Framework de test unifié
- **[neotest-jest](https://github.com/nvim-neotest/neotest-jest)** — Adaptateur Jest
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** — Terminal intégré pour tests manuels
- **[overseer.nvim](https://github.com/stevearc/overseer.nvim)** — Task runner
:::

---

## Concept

Dans IntelliJ, tu cliques sur l'icône verte à côté d'un test pour l'exécuter. Dans Neovim, tu utilises des raccourcis clavier pour la même chose, mais plus rapidement.

### Avantages

- **Pas de changement de contexte** — Tests dans l'éditeur
- **Feedback rapide** — Résultats inline
- **Intégration Git** — Teste les fichiers modifiés
- **Automation** — Scripts et keymaps personnalisés

---

## Raccourcis Neotest

| Raccourci | Action |
|-----------|--------|
| `<leader>tt` | Exécuter le test sous le curseur |
| `<leader>tT` | Exécuter tous les tests du fichier |
| `<leader>to` | Afficher la sortie du test |
| `<leader>ts` | Afficher le résumé des tests |

---

## Workflow de base

### 1. Exécuter un test unique

Place ton curseur sur un test et appuie sur `<leader>tt`.

```javascript
// Curseur ici ▼
describe('UserService', () => {
  it('should create a user', () => {   // ← <leader>tt
    // ...
  });
});
```

### 2. Exécuter tous les tests du fichier

N'importe où dans le fichier : `<leader>tT`

### 3. Voir les résultats

- **Inline** — Les tests passés/échoués sont marqués dans la gouttière
- **Output** — `<leader>to` pour voir la sortie complète
- **Summary** — `<leader>ts` pour un résumé global

---

## Tests JavaScript/TypeScript (Jest/Vitest)

### Configuration

Le projet neovim-intellij-ide utilise `neotest-jest` pour Jest et les frameworks compatibles (Vitest avec configuration Jest).

### Workflow Jest typique

```
1. Ouvre ton fichier de test (.test.ts, .spec.ts)

2. Place le curseur sur un test
   → it('should...', () => { ... })

3. <leader>tt pour exécuter

4. Résultat dans la gouttière :
   ✓ = passé
   ✗ = échoué

5. <leader>to si tu veux voir les détails
```

### Debugging d'un test échoué

1. `<leader>tt` — Lance le test
2. `<leader>to` — Voir l'erreur complète
3. Corrige le code
4. `<leader>tt` — Relance

---

## Tests dans le terminal

Pour les cas où neotest ne suffit pas, utilise le terminal intégré.

### Raccourcis terminal

| Raccourci | Action |
|-----------|--------|
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Terminal flottant |
| `<leader>th` | Terminal horizontal |
| `<leader>tv` | Terminal vertical |

### Workflow terminal

```bash
# Dans le terminal intégré (<C-\>)

# Jest
npm test

# Jest watch mode
npm test -- --watch

# Vitest
npx vitest

# Python pytest
pytest

# Python avec coverage
pytest --cov
```

---

## Task Runner (Overseer)

Overseer permet de définir et exécuter des tâches de test récurrentes.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>or` | Exécuter une tâche |
| `<leader>ot` | Liste des tâches |

### Exemple de workflow

```
1. <leader>or → Menu des tâches

2. Sélectionne "npm test" ou ta tâche

3. La tâche s'exécute en arrière-plan

4. <leader>ot pour voir le statut
```

---

## TDD Workflow

Le Test-Driven Development fonctionne naturellement avec Neovim.

### Cycle Red-Green-Refactor

```
1. ROUGE — Écris un test qui échoue
   → <leader>tt → ✗

2. VERT — Écris le code minimal pour passer
   → <leader>tt → ✓

3. REFACTOR — Améliore le code
   → <leader>tt → ✓ (vérifie que ça passe toujours)
```

### Astuce : Watch mode

Utilise le terminal en split pour avoir les tests en watch :

```
1. <leader>tv → Terminal vertical

2. npm test -- --watch

3. Édite ton code dans l'autre split

4. Les tests se relancent automatiquement
```

---

## Comparaison IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| Click icône verte | `<leader>tt` |
| Run All in File | `<leader>tT` |
| Test Results panel | `<leader>to` / `<leader>ts` |
| Debug Test | `<leader>db` + `<leader>tt` |
| Coverage | Terminal + `--coverage` |

---

## Tests par langage

### JavaScript/TypeScript

```bash
# Jest
npm test
npm test -- --watch
npm test -- --coverage

# Vitest
npx vitest
npx vitest --watch
npx vitest --coverage
```

### Python

```bash
# pytest
pytest
pytest -v                    # Verbose
pytest --cov                 # Coverage
pytest -k "test_name"        # Filtre par nom
pytest path/to/test.py       # Fichier spécifique
```

### Go

```bash
go test ./...
go test -v ./...
go test -cover ./...
```

### Rust

```bash
cargo test
cargo test -- --nocapture
```

---

## Intégration avec Git

### Tester les fichiers modifiés

Workflow pratique avant un commit :

```
1. Vérifie les fichiers modifiés
   <leader>gg → Neogit

2. Pour chaque fichier modifié avec tests :
   - Ouvre le fichier test
   - <leader>tT pour exécuter tous les tests

3. Si tout passe → Commit
```

### Pre-commit hook

Le projet neovim-intellij-ide peut inclure des hooks pre-commit qui lancent les tests automatiquement.

---

## Astuces

### Raccourci pour test et résultat

```
<leader>tt    → Lance le test
<leader>to    → Voir la sortie immédiatement après
```

### Terminal dédié aux tests

Crée un terminal horizontal juste pour les tests :
```
<leader>th    → Terminal en bas
npm test -- --watch
```

Le terminal reste actif pendant que tu codes.

### Tests et diagnostics

Si un test échoue à cause d'une erreur de type :
1. `<leader>to` — Voir l'erreur
2. `]d` — Aller au diagnostic suivant
3. `<leader>ca` — Code action pour corriger

---

## Exercices pratiques

### Exercice 1 : Premier test

1. Ouvre un fichier de test de ton projet
2. Place le curseur sur un test
3. `<leader>tt` pour l'exécuter
4. `<leader>to` pour voir la sortie

### Exercice 2 : Watch mode

1. `<leader>tv` pour un terminal vertical
2. Lance `npm test -- --watch`
3. Modifie un fichier testé
4. Observe le test se relancer

### Exercice 3 : TDD

1. Crée un nouveau fichier de test
2. Écris un test qui échoue (`<leader>tt` → ✗)
3. Écris le code pour le faire passer
4. `<leader>tt` → ✓

---

## Checklist de fin de chapitre

- [ ] Je sais exécuter un test avec `<leader>tt`
- [ ] Je peux voir les résultats avec `<leader>to`
- [ ] J'utilise le terminal pour le watch mode
- [ ] Je comprends le workflow TDD dans Neovim
- [ ] Je sais utiliser Overseer pour les tâches récurrentes

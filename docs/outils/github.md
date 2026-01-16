---
title: GitHub Integration
sidebar_position: 5
---

# GitHub Integration

Neovim peut s'intégrer directement avec GitHub pour gérer les Pull Requests, Issues, et rechercher dans l'historique Git.

---

## Octo.nvim — GitHub dans Neovim

### Concept

`octo.nvim` transforme Neovim en client GitHub complet :
- Créer et reviewer des PRs
- Gérer les issues
- Commenter et approuver
- Tout sans quitter l'éditeur

### Prérequis

```bash
# GitHub CLI doit être installé et authentifié
gh auth login
```

---

## Raccourcis principaux

| Raccourci | Action |
|-----------|--------|
| `<leader>gp` | Liste des Pull Requests |
| `<leader>gP` | Créer une Pull Request |
| `<leader>gi` | Liste des Issues |
| `<leader>gI` | Créer une Issue |
| `<leader>gr` | Démarrer une review |

---

## Pull Requests

### Lister les PRs

```
<leader>gp
```

Affiche toutes les PRs du repo avec :
- Titre
- Auteur
- Status (open, draft, merged)
- Labels

### Navigation dans la liste

| Touche | Action |
|--------|--------|
| `j`/`k` | Naviguer |
| `Enter` | Ouvrir la PR |
| `Ctrl+o` | Ouvrir dans le navigateur |

### Créer une PR

```
<leader>gP
```

1. Remplis le titre
2. Ajoute la description
3. Sélectionne les reviewers (optionnel)
4. Confirme

### Dans une PR ouverte

| Raccourci | Action |
|-----------|--------|
| `<leader>ca` | Ajouter un commentaire |
| `<leader>cd` | Supprimer un commentaire |
| `<leader>cm` | Merger la PR |
| `<leader>cc` | Fermer la PR |
| `<leader>cr` | Refresh |

---

## Code Review

### Démarrer une review

```
<leader>gr
```

### Workflow de review

1. `<leader>gp` → Sélectionne une PR
2. Navigue dans les fichiers modifiés
3. Ajoute des commentaires sur les lignes
4. Soumets la review (approve/request changes)

### Ajouter un commentaire de review

Dans le diff :
1. Positionne le curseur sur la ligne
2. `:Octo comment add`
3. Écris ton commentaire

### Soumettre la review

```vim
:Octo review submit
```

Options :
- `approve` : Approuver
- `request_changes` : Demander des modifications
- `comment` : Commentaire simple

---

## Issues

### Lister les issues

```
<leader>gi
```

### Créer une issue

```
<leader>gI
```

### Dans une issue

| Raccourci | Action |
|-----------|--------|
| `<leader>ca` | Ajouter un commentaire |
| `<leader>cc` | Fermer l'issue |
| `<leader>co` | Réouvrir l'issue |
| `<leader>cl` | Ajouter un label |

---

## Advanced Git Search

### Concept

`advanced-git-search.nvim` permet de rechercher dans l'historique Git avec une interface Telescope.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>gc` | Recherche Git avancée |
| `<leader>gl` | Recherche dans les logs |
| `<leader>gf` | Historique du fichier |

### Recherche dans les logs

```
<leader>gl
```

Recherche dans les messages de commit et le contenu des commits.

### Historique d'un fichier

```
<leader>gf
```

Affiche tous les commits qui ont modifié le fichier courant.

---

## Diffview

### Concept

`diffview.nvim` fournit une vue diff améliorée pour Git.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>gd` | Ouvrir Diffview |
| `<leader>gH` | Historique du fichier |

### Navigation dans Diffview

| Touche | Action |
|--------|--------|
| `Tab` | Fichier suivant |
| `Shift+Tab` | Fichier précédent |
| `]c` | Changement suivant |
| `[c` | Changement précédent |
| `q` | Fermer |

---

## Fugitive

### Concept

`vim-fugitive` est le plugin Git classique de Tim Pope, intégré pour les opérations de base.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>gs` | Git status |
| `<leader>gD` | Git diff (fugitive) |
| `<leader>gB` | Git blame (fichier complet) |

### Dans Git status (`:Git`)

| Touche | Action |
|--------|--------|
| `s` | Stage le fichier |
| `u` | Unstage le fichier |
| `=` | Toggle diff inline |
| `cc` | Commit |
| `ca` | Commit amend |
| `P` | Push |

---

## Workflow : Review d'une PR

### Scénario complet

```
1. Liste les PRs
   <leader>gp

2. Sélectionne la PR à reviewer
   j/k pour naviguer, Enter pour ouvrir

3. Examine les changements
   - Les fichiers modifiés sont listés
   - Navigue avec Tab/Shift+Tab

4. Ajoute des commentaires
   - Position sur une ligne
   - :Octo comment add

5. Soumets la review
   :Octo review submit

6. Merge si approuvé
   <leader>cm
```

---

## Workflow : Créer une PR

### Scénario complet

```
1. Assure-toi que ta branche est poussée
   git push -u origin feature/ma-feature

2. Crée la PR
   <leader>gP

3. Remplis les informations
   - Titre descriptif
   - Description avec contexte
   - Mention des reviewers

4. Soumet
   La PR est créée sur GitHub
```

---

## Comparaison avec GitHub Web

| Action | GitHub Web | Neovim |
|--------|------------|--------|
| Lister PRs | Interface web | `<leader>gp` |
| Créer PR | Bouton "New" | `<leader>gP` |
| Review | Onglet "Files changed" | Diffview + Octo |
| Commenter | Bouton "+" sur ligne | `:Octo comment` |
| Approuver | Bouton "Review" | `:Octo review submit` |
| Recherche historique | Interface limitée | `<leader>gc` |

### Avantages Neovim

- Pas de changement de contexte
- Navigation Vim dans les diffs
- Recherche puissante dans l'historique
- Workflow clavier complet

---

## Astuces

### Checkout une PR localement

```vim
:Octo pr checkout 123
```

### Lister les PRs d'un autre repo

```vim
:Octo pr list owner/repo
```

### Chercher un commit par message

```
<leader>gl
```
Puis tape le message recherché.

### Blame avec navigation

Dans un fichier :
```
<leader>gB
```
Puis sur un commit, `Enter` pour voir le diff.

---

## Configuration

### Labels personnalisés

Octo supporte les labels GitHub :
- Bug, Feature, Documentation, etc.
- Ajoute avec `:Octo label add`

### Templates

Si ton repo a des templates de PR/Issue :
```
.github/
├── PULL_REQUEST_TEMPLATE.md
└── ISSUE_TEMPLATE/
    ├── bug_report.md
    └── feature_request.md
```

Octo les utilise automatiquement.

---

## Exercices pratiques

### Exercice 1 : Explorer les PRs
1. Ouvre un projet avec des PRs
2. `<leader>gp` pour lister
3. Ouvre une PR et explore les fichiers

### Exercice 2 : Recherche dans l'historique
1. `<leader>gc` pour la recherche avancée
2. Cherche un terme dans les commits
3. Navigue dans les résultats

### Exercice 3 : Créer une issue
1. `<leader>gI` pour créer
2. Ajoute un titre et description
3. Vérifie sur GitHub que l'issue existe

---

## Checklist de fin de chapitre

- [ ] Je sais lister et ouvrir des PRs
- [ ] Je peux créer une PR depuis Neovim
- [ ] Je sais faire une code review
- [ ] J'utilise la recherche Git avancée
- [ ] Je connais les raccourcis Diffview
- [ ] Je comprends l'intégration Fugitive

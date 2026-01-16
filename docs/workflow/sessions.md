---
title: Sessions et projets
sidebar_position: 2
---

# Sessions et projets

Gérer les sessions et les projets pour reprendre ton travail instantanément.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[auto-session](https://github.com/rmagatti/auto-session)** — Sauvegarde et restauration automatique des sessions
- **[project.nvim](https://github.com/ahmedkhalf/project.nvim)** — Détection et gestion des projets
:::

---

## Concept

### Le problème

À chaque reprise de travail, tu dois souvent :
- Retrouver les fichiers ouverts
- Te rappeler ce que tu faisais
- Reconstituer mentalement le contexte

Ce coût est invisible, mais réel. Il fatigue et ralentit.

### La solution

Avec les sessions :
- Neovim restaure automatiquement tes fichiers ouverts
- Les positions du curseur sont préservées
- Tu reprends exactement où tu en étais

---

## Raccourcis

### Sessions

| Raccourci | Action |
|-----------|--------|
| `<leader>qs` | Sauvegarder la session |
| `<leader>qr` | Restaurer la session |
| `<leader>qd` | Supprimer la session |

### Projets

| Raccourci | Action |
|-----------|--------|
| `<leader>fp` | Liste des projets récents |

---

## Sessions avec auto-session

### Fonctionnement automatique

auto-session sauvegarde et restaure automatiquement :
- **À la fermeture** — La session est sauvegardée
- **À l'ouverture** — La session est restaurée si elle existe

### Ce qui est sauvegardé

- Buffers ouverts
- Position du curseur dans chaque fichier
- Disposition des fenêtres (splits)
- Onglets
- État des folds

### Ce qui n'est PAS sauvegardé

- Terminal intégré (tu dois relancer tes commandes)
- État du debugger
- Résultats de recherche

---

## Workflow quotidien

### Scénario 1 : Fin de journée

```
1. Tu travailles sur plusieurs fichiers

2. Tu quittes Neovim
   :q ou :qa

3. La session est automatiquement sauvegardée
```

### Scénario 2 : Reprise le lendemain

```
1. cd ~/mon-projet

2. nvim

3. Tous tes fichiers sont rouverts automatiquement
   Le curseur est à la même position
```

### Scénario 3 : Forcer une sauvegarde

Si tu veux sauvegarder explicitement :

```
<leader>qs
```

Utile avant une opération risquée.

### Scénario 4 : Repartir de zéro

Si tu veux ouvrir le projet sans restaurer la session :

```
<leader>qd
```

Puis ferme et rouvre Neovim.

---

## Projets avec project.nvim

### Détection automatique

project.nvim détecte les projets par :
- Présence d'un `.git`
- Présence de `package.json`, `Cargo.toml`, etc.
- Fichiers de configuration (`.nvim.lua`, etc.)

### Liste des projets récents

```
<leader>fp
```

Ouvre Telescope avec la liste des projets sur lesquels tu as travaillé.

### Navigation rapide

Dans la liste des projets :
- `j`/`k` — Naviguer
- `Enter` — Ouvrir le projet
- La session de ce projet est restaurée automatiquement

---

## Projet vs Session

Il est crucial de distinguer les deux notions.

### Projet

- Un dossier racine
- Un dépôt Git
- Une configuration LSP

### Session

- Des buffers ouverts
- Une disposition de fenêtres
- Un état de travail précis

**Un projet peut avoir plusieurs sessions.**
Une session appartient toujours à un projet.

---

## Bonnes pratiques

### Une session par tâche

```
Feature A → Session A
Bug fix B → Session B (autre branche, autres fichiers)
```

### Nettoyer régulièrement

N'accumule pas 50 buffers ouverts. Ferme ce dont tu n'as plus besoin :
- `<leader>bd` — Ferme le buffer actuel
- `<leader>bo` — Ferme tous les autres buffers

### Sessions par branche Git

auto-session peut sauvegarder des sessions différentes par branche Git. Si tu changes de branche, ta session peut changer aussi.

Configuration dans neovim-intellij-ide :
```lua
git_use_branch_name = true
```

---

## Plusieurs projets en parallèle

### Approche recommandée

Une instance Neovim par projet :

```bash
# Terminal 1
cd ~/projet-a
nvim

# Terminal 2
cd ~/projet-b
nvim
```

### Pourquoi ?

- Pas de mélange de buffers
- Pas de mélange de contextes LSP
- Sessions isolées
- Plus facile à gérer mentalement

Neovim démarre en ~50ms. Il vaut mieux plusieurs instances claires qu'une seule instance confuse.

---

## Comparaison IntelliJ

| IntelliJ | Neovim |
|----------|--------|
| Recent Projects | `<leader>fp` |
| Reopen last project | Automatique avec auto-session |
| Save All | `<leader>qs` |
| Invalidate Caches | `<leader>qd` + reopen |

---

## Dossiers exclus

Par défaut, auto-session n'enregistre pas de sessions pour :
- `~/` (home directory)
- `~/Downloads`
- `/` (root)

Cela évite d'avoir une session "générique" qui mélange tout.

---

## Astuces

### Vérifier la session active

```vim
:SessionInfo
```

Affiche des informations sur la session courante.

### Problème de session corrompue

Si Neovim s'ouvre avec des erreurs :

1. Supprime la session :
   ```
   <leader>qd
   ```

2. Quitte et rouvre :
   ```
   :qa
   nvim
   ```

### Session + Harpoon

Combine sessions et Harpoon pour un workflow optimal :
- Session restaure tes buffers ouverts
- Harpoon te permet de naviguer entre tes fichiers clés

---

## Fichiers de session

Les sessions sont stockées dans :
```
~/.local/share/nvim/sessions/
```

Chaque projet a son fichier de session basé sur le chemin du dossier.

---

## Exercices pratiques

### Exercice 1 : Session automatique

1. Ouvre un projet : `cd ~/mon-projet && nvim`
2. Ouvre 3-4 fichiers différents
3. Quitte Neovim : `:qa`
4. Rouvre Neovim : `nvim`
5. Vérifie que tous tes fichiers sont là

### Exercice 2 : Liste des projets

1. `<leader>fp` — Liste des projets
2. Navigue et sélectionne un projet
3. Vérifie que la session est restaurée

### Exercice 3 : Session par branche

1. Travaille sur une branche avec certains fichiers ouverts
2. Change de branche : `git checkout autre-branche`
3. Quitte et rouvre Neovim
4. Observe si la session change

### Exercice 4 : Repartir à zéro

1. `<leader>qd` — Supprime la session
2. `:qa` — Quitte
3. `nvim` — Rouvre
4. Neovim s'ouvre sans fichiers

---

## Checklist de fin de chapitre

- [ ] Je comprends la différence projet / session
- [ ] Je sais que ma session se sauvegarde automatiquement
- [ ] Je connais `<leader>fp` pour les projets récents
- [ ] Je peux forcer une sauvegarde avec `<leader>qs`
- [ ] Je sais supprimer une session avec `<leader>qd`
- [ ] Je travaille avec une instance Neovim par projet

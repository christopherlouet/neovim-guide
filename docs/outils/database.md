---
title: Base de données
sidebar_position: 3
---

# Base de données

`vim-dadbod-ui` transforme Neovim en client de base de données complet, similaire à DataGrip ou DBeaver.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[vim-dadbod](https://github.com/tpope/vim-dadbod)** — Interface base de données par Tim Pope
- **[vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)** — UI graphique pour vim-dadbod
- **[vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion)** — Autocomplétion SQL
:::

---

## Concept

Dans IntelliJ Ultimate ou DataGrip, tu as un "Database Tool Window" pour :
- Te connecter aux bases de données
- Explorer les tables
- Exécuter des requêtes SQL
- Voir les résultats

Neovim offre la même chose avec `vim-dadbod` + `vim-dadbod-ui`.

---

## Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>Du` | Toggle l'interface Database UI |
| `<leader>Df` | Trouver un buffer DB |
| `<leader>Dr` | Renommer un buffer |
| `<leader>Dl` | Info dernière requête |

---

## Interface utilisateur

### Ouvrir l'interface

```
<leader>Du
```

L'interface s'ouvre sur la droite avec :
- Liste des connexions
- Tables et vues
- Requêtes sauvegardées

### Navigation dans l'UI

| Touche | Action |
|--------|--------|
| `o` | Ouvrir/fermer un noeud |
| `Enter` | Sélectionner |
| `R` | Rafraîchir |
| `d` | Supprimer |
| `r` | Renommer |

---

## Configurer une connexion

### Méthode 1 : Commande

```vim
:DBUIAddConnection
```

Puis entre l'URL de connexion.

### Méthode 2 : Variable d'environnement

Dans ton `.env` ou terminal :
```bash
export DATABASE_URL="postgresql://user:pass@localhost:5432/mydb"
```

### Méthode 3 : Fichier de config

Les connexions sont sauvegardées dans :
```
~/.config/nvim/db_ui/
```

### Formats d'URL

| Base de données | Format |
|-----------------|--------|
| PostgreSQL | `postgresql://user:pass@host:5432/db` |
| MySQL | `mysql://user:pass@host:3306/db` |
| SQLite | `sqlite:///path/to/file.db` |
| SQL Server | `sqlserver://user:pass@host:1433/db` |

---

## Exécuter des requêtes

### Créer un buffer de requête

1. Dans l'UI, sélectionne une connexion
2. Appuie sur `Enter` pour créer un buffer
3. Écris ta requête SQL

### Exécuter

Dans le buffer SQL :
- Le fichier doit être sauvegardé avec extension `.sql`
- Ou utilise `:DB` pour exécuter

### Raccourcis dans le buffer

| Raccourci | Action |
|-----------|--------|
| `<leader>S` | Exécuter la requête sous le curseur |
| Sélection visuelle + `<leader>S` | Exécuter la sélection |

---

## Autocomplétion SQL

Le plugin `vim-dadbod-completion` fournit l'autocomplétion :
- Noms de tables
- Noms de colonnes
- Mots-clés SQL
- Fonctions

### Fonctionnement

1. Connecte-toi à une base
2. Ouvre un buffer `.sql`
3. Commence à taper → autocomplétion contextuelle

### Exemple

```sql
SELECT * FROM use  -- Autocomplete → users
SELECT id, na      -- Autocomplete → name (colonne)
```

---

## Helpers de table

Des requêtes pré-définies sont disponibles pour chaque table :

### PostgreSQL / MySQL

| Action | Description |
|--------|-------------|
| Count | `SELECT COUNT(1) FROM table` |
| Explain | `EXPLAIN ANALYZE {last_query}` |

### Utilisation

1. Dans l'UI, navigue vers une table
2. Appuie sur `H` pour voir les helpers
3. Sélectionne une action

---

## Workflow typique

### Scénario : Debug d'une requête

```
1. Ouvre l'UI
   <leader>Du

2. Sélectionne ta connexion
   ↓ pour naviguer, Enter pour ouvrir

3. Crée un buffer de requête
   Enter sur la connexion

4. Écris ta requête
   SELECT * FROM users WHERE id = 123

5. Exécute
   <leader>S

6. Vois les résultats
   Le résultat s'affiche dans un buffer
```

### Scénario : Exploration de schéma

```
1. <leader>Du → Ouvre l'UI
2. Navigue dans les tables
3. 'o' pour expand une table → voir les colonnes
4. Enter sur une colonne → voir les détails
```

---

## Comparaison avec DataGrip/DBeaver

| Fonctionnalité | DataGrip | Neovim (dadbod) |
|----------------|----------|-----------------|
| Connexions multiples | ✅ | ✅ |
| Exploration schéma | ✅ | ✅ |
| Autocomplétion | ✅ | ✅ |
| Exécution requêtes | ✅ | ✅ |
| Résultats tabulaires | ✅ Rich | ✅ Simple |
| Diagrammes ER | ✅ | ❌ |
| Export CSV/JSON | ✅ Built-in | ✅ Via SQL |
| Refactoring DB | ✅ | ❌ |

### Avantages Neovim

- Léger et rapide
- Édition Vim (motions, macros)
- Intégré au workflow
- Fonctionne en SSH

---

## Astuces

### Requêtes sauvegardées

Crée des fichiers `.sql` dans ton projet :
```
queries/
├── users_active.sql
├── orders_today.sql
└── stats_monthly.sql
```

Ouvre-les directement, ils seront connectés à la base active.

### Résultats en mode Vim

Les résultats sont dans un buffer normal :
- `/` pour chercher
- `yy` pour copier une ligne
- Macros pour transformer les données

### Variables dans les requêtes

```sql
-- Variable inline
SELECT * FROM users WHERE id = $1;

-- Ou avec un fichier .env
SELECT * FROM users WHERE status = '$STATUS';
```

---

## Exercices pratiques

### Exercice 1 : Connexion
1. Lance une base PostgreSQL locale (ou SQLite)
2. `<leader>Du` pour ouvrir l'UI
3. `:DBUIAddConnection` avec l'URL
4. Vérifie que la connexion apparaît

### Exercice 2 : Requête simple
1. Sélectionne ta connexion
2. Crée un buffer de requête
3. Écris `SELECT * FROM ta_table LIMIT 10`
4. Exécute avec `<leader>S`

### Exercice 3 : Autocomplétion
1. Dans un buffer SQL connecté
2. Tape le début d'un nom de table
3. Vérifie que l'autocomplétion suggère les tables

---

## Checklist de fin de chapitre

- [ ] Je sais ouvrir l'interface Database UI
- [ ] Je peux ajouter une connexion
- [ ] Je sais exécuter des requêtes SQL
- [ ] J'utilise l'autocomplétion pour les tables/colonnes
- [ ] Je connais les helpers de table

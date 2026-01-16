---
title: Configuration par projet
sidebar_position: 2
---

# Configuration par projet

Neovim-intellij-ide supporte les configurations spécifiques par projet via un fichier `.nvim.lua` à la racine de chaque projet.

---

## Concept

Chaque projet peut avoir ses propres :
- Options (tabstop, shiftwidth, etc.)
- Keymaps spécifiques
- Variables d'environnement
- Configuration LSP

C'est l'équivalent des fichiers `.idea/` d'IntelliJ, mais en Lua.

---

## Sécurité

Le système utilise un modèle de **confiance explicite** :

- Les fichiers `.nvim.lua` ne sont **jamais** exécutés automatiquement
- Tu dois **explicitement faire confiance** à chaque projet
- La liste des projets de confiance est stockée dans `~/.local/share/nvim/trusted_projects.json`

:::warning
Ne fais confiance qu'aux projets dont tu connais le contenu du `.nvim.lua`.
:::

---

## Utilisation

### Créer une configuration projet

Crée un fichier `.nvim.lua` à la racine de ton projet :

```lua
-- .nvim.lua - Configuration spécifique au projet

-- Options locales
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- Variables de projet
vim.g.project_name = "mon-projet"

-- Keymaps spécifiques
vim.keymap.set("n", "<leader>pt", function()
  vim.cmd("!npm test")
end, { desc = "Run project tests" })
```

### Faire confiance à un projet

Lorsque tu ouvres un projet avec un fichier `.nvim.lua`, tu seras invité à :

1. **Faire confiance** — Le fichier sera exécuté
2. **Ignorer** — Le fichier ne sera pas exécuté
3. **Voir le fichier** — Ouvrir le fichier pour inspection

### Commandes

| Commande | Description |
|----------|-------------|
| `:ProjectConfig` | Afficher le statut du projet |
| `:ProjectConfig trust` | Faire confiance au répertoire courant |
| `:ProjectConfig untrust` | Retirer la confiance |
| `:ProjectConfig reload` | Recharger la config (si trusted) |
| `:ProjectConfig list` | Lister les répertoires de confiance |
| `:ProjectConfig edit` | Éditer le fichier .nvim.lua |

---

## Exemples par langage

### Projet JavaScript/TypeScript

```lua
-- .nvim.lua
-- Formatage avec le formatter du projet
vim.g.project_formatter = "prettier"

-- Commandes npm
vim.keymap.set("n", "<leader>pd", "<cmd>!npm run dev<cr>", { desc = "npm dev" })
vim.keymap.set("n", "<leader>pb", "<cmd>!npm run build<cr>", { desc = "npm build" })
vim.keymap.set("n", "<leader>pt", "<cmd>!npm test<cr>", { desc = "npm test" })
```

### Projet Python

```lua
-- .nvim.lua
-- Utiliser l'environnement virtuel local
local venv = vim.fn.getcwd() .. "/.venv"
if vim.fn.isdirectory(venv) == 1 then
  vim.env.VIRTUAL_ENV = venv
  vim.env.PATH = venv .. "/bin:" .. vim.env.PATH
end

-- Commande pour lancer les tests
vim.keymap.set("n", "<leader>pt", "<cmd>!pytest<cr>", { desc = "Run pytest" })
```

### Projet Go

```lua
-- .nvim.lua
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false  -- Go utilise des tabs

vim.keymap.set("n", "<leader>pt", "<cmd>!go test ./...<cr>", { desc = "go test" })
vim.keymap.set("n", "<leader>pb", "<cmd>!go build<cr>", { desc = "go build" })
```

### Projet avec Docker

```lua
-- .nvim.lua
vim.keymap.set("n", "<leader>du", "<cmd>!docker-compose up -d<cr>", { desc = "docker up" })
vim.keymap.set("n", "<leader>dd", "<cmd>!docker-compose down<cr>", { desc = "docker down" })
vim.keymap.set("n", "<leader>dl", "<cmd>!docker-compose logs -f<cr>", { desc = "docker logs" })
```

### Projet Rust

```lua
-- .nvim.lua
vim.keymap.set("n", "<leader>pt", "<cmd>!cargo test<cr>", { desc = "cargo test" })
vim.keymap.set("n", "<leader>pb", "<cmd>!cargo build<cr>", { desc = "cargo build" })
vim.keymap.set("n", "<leader>pr", "<cmd>!cargo run<cr>", { desc = "cargo run" })
```

---

## Configuration LSP spécifique

Tu peux personnaliser le LSP par projet :

```lua
-- .nvim.lua
vim.g.lsp_settings = {
  python = {
    pythonPath = ".venv/bin/python"
  },
  typescript = {
    preferences = {
      importModuleSpecifier = "relative"
    }
  }
}
```

---

## Mode verbeux

Pour voir les notifications de chargement :

```lua
-- Dans ton init.lua
vim.g.nvim_project_verbose = true
```

---

## Bonnes pratiques

1. **Ne jamais stocker de secrets** dans `.nvim.lua`
2. **Versionner** le fichier `.nvim.lua` avec le projet
3. **Documenter** les configurations spéciales dans le README du projet
4. **Utiliser des chemins relatifs** quand possible
5. **Tester** la configuration avant de committer

---

## Dépannage

### Le fichier n'est pas chargé

1. Vérifie que le fichier existe : `:ProjectConfig status`
2. Vérifie que le projet est trusted : `:ProjectConfig list`
3. Recharge manuellement : `:ProjectConfig reload`

### Erreur de syntaxe

Si le fichier `.nvim.lua` contient une erreur, un message sera affiché. Corrige l'erreur et utilise `:ProjectConfig reload`.

### Réinitialiser la confiance

Pour supprimer tous les projets de confiance :

```bash
rm ~/.local/share/nvim/trusted_projects.json
```

---

## Checklist

- [ ] Je sais créer un fichier `.nvim.lua`
- [ ] Je comprends le système de confiance
- [ ] Je peux ajouter des keymaps spécifiques au projet
- [ ] Je sais utiliser `:ProjectConfig`

---

## Pour aller plus loin

- [Profils](/personnalisation/profils) — Configuration globale par usage
- [Customisation](/personnalisation/customisation) — Personnalisation avancée

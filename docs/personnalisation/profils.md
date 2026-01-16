---
title: Profils
sidebar_position: 1
---

# Profils

Les profils permettent d'adapter la configuration Neovim à différents usages, en chargeant uniquement les plugins nécessaires.

---

## Profils disponibles

| Profil | Modules | Description | Cas d'usage |
|--------|---------|-------------|-------------|
| `full` | 19 | Configuration complète | Tout inclus (défaut) |
| `minimal` | 9 | Core IDE | Édition rapide, SSH, ressources limitées |
| `javascript` | 13 | JS/TS development | Frontend, React, Vue, Node.js |
| `devops` | 15 | Infrastructure | K8s, Terraform, Docker, Ansible |

---

## Utilisation

### Définir un profil

Ajoute dans ton `init.lua` **avant** le chargement des plugins :

```lua
vim.g.nvim_profile = "javascript"  -- ou "minimal", "devops", "full"
```

### Via variable d'environnement

```bash
export NVIM_PROFILE=devops
nvim
```

Puis dans `init.lua` :

```lua
vim.g.nvim_profile = vim.env.NVIM_PROFILE or "full"
```

### Vérifier le profil actif

```vim
:NvimProfile info
:NvimProfile list
```

---

## Détail des profils

### minimal (9 modules)

**Idéal pour** : édition rapide, machines avec ressources limitées, SSH.

**Inclut** :
- Interface (theme, statusline)
- LSP (Language servers)
- Autocomplétion
- Telescope (recherche fuzzy)
- Treesitter (syntax highlighting)
- Git basique
- Formatters

**N'inclut PAS** : Debug, tests, Docker, DevOps, AI, HTTP client.

### javascript (13 modules)

**Idéal pour** : développement JS/TS, React, Vue, Node.js.

**Inclut** `minimal` plus :
- Terminal intégré
- Debugging (DAP)
- Test runners (Jest, Vitest)
- Navigation avancée (Leap, Harpoon)

### devops (15 modules)

**Idéal pour** : DevOps, Platform engineering, SRE.

**Inclut** `minimal` plus :
- Terminal intégré
- Kubernetes (kubectl.nvim)
- Terraform
- Docker
- Ansible, Helm
- Database (vim-dadbod)
- REST client

### full (19 modules)

**Configuration complète** avec tous les plugins.

**Inclut** : `minimal` + `javascript` + `devops` + AI.

---

## Performance

| Profil | Modules | Temps démarrage |
|--------|---------|-----------------|
| minimal | 9 | ~150ms |
| javascript | 13 | ~200ms |
| devops | 15 | ~220ms |
| full | 19 | ~250ms |

*Temps mesurés sur une machine moderne (SSD, 16GB RAM)*

---

## Profil temporaire

Lance Neovim avec un profil spécifique :

```bash
nvim --cmd "let g:nvim_profile='minimal'"
```

---

## Configurations multiples

Utilise `NVIM_APPNAME` pour avoir plusieurs configurations :

```bash
# Configuration devops
NVIM_APPNAME=nvim-devops NVIM_PROFILE=devops nvim

# Configuration minimal
NVIM_APPNAME=nvim-minimal NVIM_PROFILE=minimal nvim
```

Chaque configuration aura ses propres :
- Plugins (`~/.local/share/nvim-devops/`)
- Cache (`~/.cache/nvim-devops/`)
- État (`~/.local/state/nvim-devops/`)

---

## Créer un profil personnalisé

1. Édite `nvim/lua/profiles/init.lua`
2. Ajoute ton profil dans `M.profiles` :

```lua
M.profiles = {
  -- ... autres profils ...

  -- Mon profil personnalisé
  my_profile = {
    "plugins.lazy",
    "plugins.ui",
    "plugins.lsp",
    "plugins.completion",
    -- Ajoute les modules souhaités
  },
}
```

3. Utilise-le :

```lua
vim.g.nvim_profile = "my_profile"
```

---

## FAQ

### Les keymaps changent-ils selon le profil ?

Non, les keymaps de base restent identiques. Seuls les keymaps spécifiques aux plugins désactivés ne seront pas disponibles.

### Comment voir quels plugins sont chargés ?

```vim
:Lazy
```

### Quel profil choisir ?

| Tu fais... | Profil recommandé |
|------------|-------------------|
| Du JS/TS au quotidien | `javascript` |
| Du DevOps/Infra | `devops` |
| Un peu de tout | `full` |
| Édition rapide / SSH | `minimal` |

---

## Checklist

- [ ] Je connais les 4 profils disponibles
- [ ] Je sais définir un profil dans `init.lua`
- [ ] Je comprends ce que chaque profil inclut/exclut
- [ ] Je peux lancer Neovim avec un profil temporaire

---

## Pour aller plus loin

- [Configuration](/personnalisation/config) — Structure des fichiers de configuration
- [Customisation](/personnalisation/customisation) — Personnaliser au-delà des profils

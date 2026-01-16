---
title: Troubleshooting
sidebar_position: 6
---

# Troubleshooting

Quand quelque chose ne fonctionne pas dans Neovim, voici comment diagnostiquer et résoudre les problèmes.

:::tip Outils de diagnostic
Cette section utilise les commandes intégrées de Neovim et les outils de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- `:checkhealth` — Diagnostic complet de l'installation
- `:LspInfo` — État des serveurs LSP
- `:Mason` — Gestionnaire d'outils LSP
- `:Lazy` — Gestionnaire de plugins
:::

---

## Diagnostic général : checkhealth

La première commande à exécuter en cas de problème :

```vim
:checkhealth
```

Cette commande vérifie :
- L'installation de Neovim
- Les providers (Python, Node, Ruby)
- Les plugins installés
- Les dépendances manquantes

### Lire les résultats

| Symbole | Signification |
|---------|---------------|
| `OK` | Tout fonctionne |
| `WARNING` | Problème non bloquant |
| `ERROR` | Problème à corriger |

### Exemple de sortie

```
health#nvim#check
========================================================================
## Configuration
  - OK: no issues found

## Performance
  - OK: Build type: Release

## Remote Plugins
  - WARNING: No remote plugins found
```

---

## Problèmes LSP

### Le LSP ne démarre pas

**Symptômes :**
- Pas d'autocomplétion
- `gd` ne fonctionne pas
- Pas de diagnostics

**Diagnostic :**

```vim
:LspInfo
```

Affiche les serveurs LSP attachés au buffer courant.

**Solutions courantes :**

1. **Serveur non installé**
   ```vim
   :Mason
   ```
   Vérifie que le serveur est installé (ex: `typescript-language-server`)

2. **Type de fichier non reconnu**
   ```vim
   :set filetype?
   ```
   Vérifie que le filetype est correct (ex: `typescript` pour `.ts`)

3. **Serveur crashé**
   ```vim
   :LspRestart
   ```
   Redémarre les serveurs LSP

### Autocomplétion absente

**Vérifications :**

1. **nvim-cmp chargé ?**
   ```vim
   :Lazy
   ```
   Cherche `nvim-cmp` dans la liste

2. **Sources configurées ?**
   L'autocomplétion vient de plusieurs sources :
   - LSP (code)
   - Buffer (mots du fichier)
   - Path (chemins de fichiers)
   - Snippets (LuaSnip)

3. **Mode Insert actif ?**
   L'autocomplétion ne s'active qu'en mode Insert.

---

## Problèmes de plugins

### Plugin non chargé

**Diagnostic :**

```vim
:Lazy
```

Cherche le plugin et vérifie son état :
- Loaded
- Not loaded (lazy)
- Disabled

**Solutions :**

1. **Forcer le chargement**
   ```vim
   :Lazy load nom-du-plugin
   ```

2. **Vérifier les erreurs**
   ```vim
   :Lazy log
   ```

3. **Réinstaller**
   ```vim
   :Lazy sync
   ```

### Conflit entre plugins

**Symptômes :**
- Erreurs Lua au démarrage
- Comportements inattendus
- Keymaps qui ne fonctionnent pas

**Diagnostic :**

1. **Voir les messages d'erreur**
   ```vim
   :messages
   ```

2. **Démarrer sans config** (pour isoler)
   ```bash
   nvim --clean
   ```

3. **Vérifier les logs Lazy**
   ```vim
   :Lazy log
   ```

---

## Problèmes de performance

### Neovim démarre lentement

**Diagnostic :**

```vim
:StartupTime
```

Affiche le temps de chargement de chaque plugin.

**Ou depuis le terminal :**

```bash
nvim --startuptime startup.log
cat startup.log | sort -k2 -n -r | head -20
```

**Solutions :**

1. **Lazy loading**
   - Vérifie que les plugins lourds sont en lazy loading
   - Les plugins ne devraient charger qu'au besoin

2. **Désactiver les plugins inutilisés**
   ```lua
   -- Dans la config du plugin
   enabled = false
   ```

3. **Vérifier les autocmds**
   ```vim
   :autocmd
   ```
   Trop d'autocmds peut ralentir

### Neovim freeze sur gros fichiers

**Solutions :**

1. **Désactiver Treesitter pour les gros fichiers**
   ```vim
   :TSBufDisable highlight
   ```

2. **Désactiver la coloration syntaxique**
   ```vim
   :syntax off
   ```

3. **Désactiver les plugins de ligne**
   - Lualine peut être lent sur très gros fichiers

---

## Problèmes Git

### Gitsigns ne s'affiche pas

**Vérifications :**

1. **Dans un repo Git ?**
   ```bash
   git status
   ```

2. **Plugin chargé ?**
   ```vim
   :Lazy
   ```
   Cherche `gitsigns.nvim`

3. **Vérifier les signes**
   ```vim
   :Gitsigns debug_messages
   ```

### Neogit ne s'ouvre pas

**Solutions :**

1. **Vérifier les dépendances**
   ```vim
   :checkhealth neogit
   ```

2. **Vérifier diffview**
   Neogit dépend de diffview pour certaines fonctions

---

## Problèmes de formatage

### Le format ne fonctionne pas

**Diagnostic :**

```vim
:LspInfo
```

Vérifie si un formateur est attaché.

**Ou vérifie null-ls/none-ls :**

```vim
:NullLsInfo
```

**Solutions courantes :**

1. **Formateur non installé**
   ```vim
   :Mason
   ```
   Installe le formateur (ex: `prettier`, `stylua`)

2. **Mauvais filetype**
   ```vim
   :set filetype?
   ```

3. **Format manuel**
   ```vim
   :lua vim.lsp.buf.format()
   ```

---

## Problèmes de keymaps

### Un raccourci ne fonctionne pas

**Diagnostic :**

1. **Vérifier si le keymap existe**
   ```vim
   :map <leader>ff
   ```

2. **Vérifier le leader key**
   ```vim
   :echo mapleader
   ```

3. **Utiliser Which-key**
   Appuie sur `<leader>` et attends — Which-key affiche les keymaps disponibles

### Conflit de keymaps

**Diagnostic :**

```vim
:verbose map <le-raccourci>
```

Affiche où le keymap est défini.

**Solution :**
- Un seul plugin devrait définir chaque raccourci
- Vérifie ta config pour les doublons

---

## Commandes de diagnostic essentielles

| Commande | Usage |
|----------|-------|
| `:checkhealth` | Diagnostic complet |
| `:LspInfo` | État des serveurs LSP |
| `:LspLog` | Logs des serveurs LSP |
| `:LspRestart` | Redémarrer les LSP |
| `:Mason` | Gérer les outils |
| `:Lazy` | Gérer les plugins |
| `:Lazy log` | Logs des plugins |
| `:Lazy sync` | Synchroniser les plugins |
| `:messages` | Voir les messages/erreurs |
| `:StartupTime` | Profiler le démarrage |
| `:verbose map X` | Trouver l'origine d'un keymap |

---

## Réinitialisation complète

Si rien ne fonctionne, tu peux réinitialiser :

### 1. Nettoyer le cache

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

### 2. Relancer l'installation

```bash
cd ~/chemin/vers/neovim-intellij-ide
./install.sh
```

### 3. Synchroniser les plugins

```vim
:Lazy sync
```

---

## Obtenir de l'aide

### Dans Neovim

```vim
:help sujet
```

Exemple : `:help lsp`, `:help telescope`

### Ressources externes

- **GitHub Issues** du plugin concerné
- **Reddit** : r/neovim
- **Discord** : Neovim Discord server

### Informations à fournir pour demander de l'aide

1. Version de Neovim : `:version`
2. Sortie de `:checkhealth`
3. Messages d'erreur : `:messages`
4. Étapes pour reproduire le problème

---

## Checklist de diagnostic rapide

- [ ] `:checkhealth` ne montre pas d'erreurs critiques
- [ ] `:LspInfo` affiche le serveur attendu
- [ ] `:Mason` montre les outils installés
- [ ] Les keymaps fonctionnent (test avec Which-key)
- [ ] Le formatage fonctionne (`:lua vim.lsp.buf.format()`)
- [ ] Git fonctionne (`:Gitsigns` visible dans la gouttière)

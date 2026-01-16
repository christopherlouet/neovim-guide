---
title: DevOps & Infrastructure
sidebar_position: 2
---

# DevOps & Infrastructure

Neovim peut devenir un outil central pour le travail DevOps grâce à des plugins dédiés pour Kubernetes, Terraform, Ansible, Docker et plus.

:::tip Plugins utilisés
Cette section couvre les plugins suivants de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[kubectl.nvim](https://github.com/ramilito/kubectl.nvim)** — Interface Kubernetes intégrée
- **[telescope-docker.nvim](https://github.com/krisajenkins/telescope-docker.nvim)** — Exploration Docker via Telescope
- **[vim-terraform](https://github.com/hashivim/vim-terraform)** — Support Terraform avec formatage auto
- **[ansible-vim](https://github.com/pearofducks/ansible-vim)** — Syntax highlighting Ansible
- **[vim-helm](https://github.com/towolf/vim-helm)** — Support Helm charts
- **[yaml.nvim](https://github.com/cuducos/yaml.nvim)** — YAML avec validation par schémas
- **[vim-systemd-syntax](https://github.com/wgwoods/vim-systemd-syntax)** — Syntax systemd
:::

---

## Kubernetes avec kubectl.nvim

### Concept

`kubectl.nvim` fournit une interface intégrée pour interagir avec vos clusters Kubernetes directement depuis Neovim.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>k` | Ouvrir l'interface Kubectl |

### Fonctionnalités

- Liste des pods, deployments, services, etc.
- Logs en temps réel
- Describe des ressources
- Port-forwarding
- Exec dans les pods

### Utilisation

```
<leader>k → Interface kubectl
```

Dans l'interface :
- Navigue avec `j`/`k`
- `Enter` pour voir les détails
- `l` pour les logs
- `d` pour describe
- `e` pour exec

### Prérequis

- `kubectl` installé et configuré
- Contexte Kubernetes actif (`kubectl config current-context`)

---

## Docker avec telescope-docker

### Concept

`telescope-docker` permet d'explorer et gérer les containers, images et volumes Docker via Telescope.

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>Dp` | Liste des containers (docker ps) |
| `<leader>Di` | Liste des images |
| `<leader>Dv` | Liste des volumes |

### Actions disponibles

Dans chaque vue Telescope :
- `Enter` : Action par défaut (logs, shell, etc.)
- `Ctrl+d` : Supprimer
- `Ctrl+s` : Start/Stop

### Exemple de workflow

1. `<leader>Dp` → Liste les containers
2. Sélectionne un container
3. `Enter` → Attache au container ou affiche les logs

---

## Terraform

### Concept

`vim-terraform` fournit :
- Syntax highlighting pour `.tf` et `.tfvars`
- Formatage automatique à la sauvegarde
- Alignement du code

### Configuration active

```lua
vim.g.terraform_fmt_on_save = 1  -- Format à la sauvegarde
vim.g.terraform_align = 1        -- Alignement automatique
```

### LSP Support

Le LSP `terraformls` est configuré pour :
- Autocomplétion des ressources
- Documentation au hover
- Navigation vers les définitions
- Validation des fichiers

### Workflow

1. Édite ton fichier `.tf`
2. La sauvegarde formate automatiquement
3. Les erreurs de syntaxe apparaissent dans les diagnostics

---

## Ansible

### Concept

`ansible-vim` améliore l'édition des playbooks et rôles Ansible.

### Fonctionnalités

- Syntax highlighting avancé
- Highlight des noms de tâches
- Support des keywords spéciaux
- Indentation automatique

### LSP Support

Le LSP `ansiblels` fournit :
- Autocomplétion des modules
- Documentation des paramètres
- Validation YAML + Ansible

### Détection des fichiers

Les fichiers sont automatiquement détectés comme Ansible si :
- Dans un dossier `playbooks/`, `roles/`, `tasks/`
- Nommés `playbook.yml`, `site.yml`, etc.

---

## Helm Charts

### Concept

`vim-helm` fournit le support pour les charts Helm :
- Syntax highlighting pour les templates Go
- Support des fichiers `values.yaml`

### LSP Support

Le LSP `helm_ls` est configuré pour l'autocomplétion et la validation.

### Fichiers reconnus

- `*.yaml` dans un dossier avec `Chart.yaml`
- Templates dans `templates/`

---

## YAML avec schémas

### Concept

`yaml.nvim` et le LSP `yamlls` fournissent :
- Validation avec schémas JSON
- Support des schémas Kubernetes, GitHub Actions, etc.
- Navigation dans la structure YAML

### Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>yv` | Vue YAML (structure) |
| `<leader>yt` | YAML Telescope (recherche) |

### Schémas populaires auto-détectés

| Fichier | Schéma |
|---------|--------|
| `.github/workflows/*.yml` | GitHub Actions |
| `docker-compose.yml` | Docker Compose |
| `Chart.yaml` | Helm Chart |
| `kustomization.yaml` | Kustomize |

---

## Systemd

### Concept

`vim-systemd-syntax` fournit le highlighting pour les fichiers unit systemd.

### Fichiers reconnus

- `*.service`
- `*.socket`
- `*.timer`
- `*.mount`
- etc.

---

## Workflow DevOps typique

### Scénario : Déploiement Kubernetes

```
1. Éditer le manifest
   - Ouvre deployment.yaml
   - LSP valide le YAML + schéma K8s
   - Autocomplétion des champs

2. Appliquer les changements
   - <leader>k → Interface kubectl
   - Apply le manifest

3. Vérifier le déploiement
   - <leader>Dp → Voir les pods
   - Sélectionner le pod → Voir les logs

4. Debug si nécessaire
   - Exec dans le pod
   - Check les configmaps/secrets
```

### Scénario : Infrastructure Terraform

```
1. Éditer le code
   - Ouvre main.tf
   - LSP fournit l'autocomplétion
   - Sauvegarde → Format automatique

2. Terminal intégré
   - <C-\> → Terminal
   - terraform plan
   - terraform apply
```

---

## Configuration des LSP DevOps

Le projet neovim-intellij-ide configure automatiquement ces LSP :

| LSP | Langage/Outil |
|-----|---------------|
| `terraformls` | Terraform |
| `ansiblels` | Ansible |
| `helm_ls` | Helm |
| `yamlls` | YAML (+ schémas) |
| `dockerls` | Dockerfile |
| `bashls` | Bash/Shell |

### Vérifier l'installation

```vim
:LspInfo
```

Ou dans le terminal :
```bash
:Mason
```

---

## Comparaison avec outils dédiés

| Outil dédié | Équivalent Neovim |
|-------------|-------------------|
| Lens (K8s IDE) | kubectl.nvim + Telescope |
| Docker Desktop | telescope-docker |
| HashiCorp Cloud | vim-terraform + LSP |
| Ansible Navigator | ansible-vim + LSP |

### Avantages de l'approche Neovim

- **Cohérence** : Même interface pour tout
- **Légèreté** : Pas d'applications lourdes
- **SSH** : Fonctionne en remote
- **Scripting** : Automatisation avec Lua

---

## Exercices pratiques

### Exercice 1 : Kubernetes
1. Configure un contexte Kubernetes
2. `<leader>k` pour ouvrir kubectl.nvim
3. Liste les pods d'un namespace
4. Affiche les logs d'un pod

### Exercice 2 : Docker
1. Lance quelques containers (`docker run -d nginx`)
2. `<leader>Dp` pour les lister
3. Explore les images avec `<leader>Di`

### Exercice 3 : Terraform
1. Crée un fichier `example.tf`
2. Vérifie que le LSP est actif (`:LspInfo`)
3. Teste l'autocomplétion
4. Sauvegarde et observe le formatage

---

## Checklist de fin de chapitre

- [ ] Je sais utiliser kubectl.nvim pour Kubernetes
- [ ] Je peux explorer Docker avec Telescope
- [ ] Je comprends le support Terraform/Ansible
- [ ] Je connais les LSP DevOps disponibles
- [ ] Je peux travailler sur des fichiers YAML avec schémas

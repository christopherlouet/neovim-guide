---
title: AI Assistance
sidebar_position: 6
---

# AI Assistance

Le projet [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) intègre Claude Code directement dans Neovim pour l'assistance IA pendant le développement.

:::tip Plugin utilisé
Cette section couvre le plugin suivant de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[claude-code.nvim](https://github.com/greggh/claude-code.nvim)** — Interface Claude Code intégrée
:::

---

## Claude Code

### Concept

`claude-code.nvim` ouvre une interface Claude Code dans un terminal intégré à Neovim. Tu peux :
- Demander de l'aide sur le code
- Générer du code
- Refactorer
- Expliquer du code complexe
- Débugger des erreurs

### Raccourci

| Raccourci | Action |
|-----------|--------|
| `<leader>cc` | Toggle Claude Code |

---

## Interface

### Ouvrir Claude Code

```
<leader>cc
```

Un terminal s'ouvre en bas de l'écran (33% de la hauteur) avec l'interface Claude Code.

### Fermer

```
<leader>cc
```

Le même raccourci toggle l'interface.

---

## Workflow typique

### Scénario : Aide sur du code

```
1. Ouvre le fichier sur lequel tu travailles

2. <leader>cc pour ouvrir Claude Code

3. Décris ce que tu veux faire :
   "Aide-moi à refactorer cette fonction pour
   la rendre plus lisible"

4. Claude analyse le contexte et propose des solutions

5. Applique les suggestions ou demande des clarifications
```

### Scénario : Générer du code

```
1. <leader>cc

2. Décris ce que tu veux :
   "Crée une fonction TypeScript qui valide
   un email avec une regex"

3. Claude génère le code

4. Copie/colle ou laisse Claude l'insérer
```

### Scénario : Debug

```
1. Tu as une erreur

2. <leader>cc

3. Colle l'erreur et demande :
   "Explique cette erreur et comment la corriger"

4. Claude analyse et propose des solutions
```

---

## Bonnes pratiques

### Contexte

Claude Code a accès au contexte de ton projet :
- Fichier actuel
- Structure du projet
- Fichiers liés

Pour de meilleurs résultats :
- Sois spécifique dans tes demandes
- Mentionne les fichiers concernés
- Donne le contexte métier si nécessaire

### Exemples de prompts efficaces

**Mauvais :**
```
Aide-moi avec ce code
```

**Bon :**
```
Dans la fonction validateUser du fichier user.service.ts,
ajoute la validation du format du numéro de téléphone
français (format: 06 XX XX XX XX ou +33 6 XX XX XX XX)
```

**Mauvais :**
```
J'ai une erreur
```

**Bon :**
```
J'ai l'erreur "TypeError: Cannot read property 'map' of undefined"
à la ligne 45 de UserList.tsx. La variable users vient d'un
appel API. Comment gérer ce cas ?
```

---

## Intégration avec le workflow

### Avec le terminal

Tu peux basculer entre :
- `<leader>cc` : Claude Code
- `<C-\>` : Terminal classique
- `<leader>tf` : Terminal flottant

### Avec les fichiers

1. Navigue vers un fichier avec Telescope ou Harpoon
2. `<leader>cc` pour demander de l'aide
3. Claude a le contexte du fichier ouvert

### Avec Git

Demande à Claude de :
- Générer un message de commit
- Expliquer un diff
- Reviewer des changements

---

## Comparaison avec GitHub Copilot

| Fonctionnalité | GitHub Copilot | Claude Code |
|----------------|----------------|-------------|
| Autocomplétion inline | ✅ Temps réel | ❌ |
| Génération de code | ✅ | ✅ Plus détaillé |
| Explication de code | ❌ | ✅ |
| Refactoring guidé | ❌ | ✅ |
| Debug assisté | ❌ | ✅ |
| Conversation | ❌ | ✅ |
| Contexte projet | Limité | ✅ Complet |

### Complémentarité

Tu peux utiliser les deux :
- Copilot pour l'autocomplétion rapide
- Claude Code pour les tâches complexes

---

## Cas d'usage avancés

### Génération de tests

```
Génère des tests Jest pour la fonction calculateTotal
dans order.service.ts. Couvre les cas :
- Commande vide
- Commande avec articles
- Remises appliquées
- Taxes
```

### Documentation

```
Génère la documentation JSDoc pour toutes les fonctions
publiques de user.controller.ts
```

### Migration

```
Convertis ce composant React class en composant
fonctionnel avec hooks
```

### Regex

```
Crée une regex pour valider les IBAN français
et explique chaque partie
```

### SQL

```
Optimise cette requête SQL qui prend trop de temps :
[colle ta requête]
```

---

## Configuration

### Position du terminal

Par défaut, le terminal s'ouvre en bas (`botright`) avec 33% de la hauteur.

Dans la configuration :
```lua
require("claude-code").setup({
  window = {
    position = "botright",
    split_ratio = 0.33,
    enter_insert = true,
  },
})
```

### Auto-refresh

Le plugin rafraîchit automatiquement le contexte quand tu changes de fichier.

---

## Astuces

### Sélection visuelle

1. Sélectionne du code en mode Visual (`v` ou `V`)
2. `<leader>cc`
3. Le code sélectionné est envoyé comme contexte

### Historique

Claude Code garde l'historique de la conversation. Tu peux :
- Faire référence à des discussions précédentes
- Demander des modifications sur du code déjà généré

### Mode expert

Pour des réponses plus techniques :
```
En tant qu'expert TypeScript senior, revois cette
implémentation et suggère des améliorations de
performance et de maintenabilité
```

---

## Exercices pratiques

### Exercice 1 : Premier dialogue
1. Ouvre un fichier de ton projet
2. `<leader>cc`
3. Demande une explication du fichier

### Exercice 2 : Génération de code
1. `<leader>cc`
2. Demande de générer une fonction utilitaire
3. Copie le code généré dans ton projet

### Exercice 3 : Debug
1. Crée volontairement une erreur
2. `<leader>cc`
3. Demande à Claude de t'aider à la corriger

---

## Checklist de fin de chapitre

- [ ] Je sais ouvrir/fermer Claude Code
- [ ] Je comprends comment formuler des prompts efficaces
- [ ] J'utilise le contexte du projet
- [ ] Je connais les cas d'usage principaux
- [ ] J'intègre Claude Code dans mon workflow

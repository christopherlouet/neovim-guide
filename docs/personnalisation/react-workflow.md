---
title: React & workflow réel
---

# Chapitre 11 — React & TypeScript en profondeur (IDE-ready)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- naviguer efficacement dans un projet React / TypeScript
- comprendre comment le LSP interprète JSX et TSX
- refactoriser des composants sans casser
- gérer props, types et imports sereinement
- atteindre un confort équivalent ou supérieur à IntelliJ pour React

---

## 11.1 — Pourquoi React est un bon révélateur d’IDE

React cumule :

- beaucoup de fichiers
- des composants imbriqués
- des props typées
- des hooks
- une logique parfois distribuée

Si ton IDE gère bien React,
il gère la majorité des cas réels.

---

## 11.2 — Ce que voit réellement le LSP dans un fichier TSX

Pour le LSP :

- JSX est une structure syntaxique
- un composant est une fonction
- les props sont des types
- les hooks sont des appels analysables

React n’est pas magique.  
C’est du TypeScript enrichi.

---

## 11.3 — Navigation entre composants

Aller à la définition :

```bash
gd
```

Trouver les usages :
```bash
gr
```

Ces commandes fonctionnent :

- pour des composants locaux
- pour des composants importés
- pour des bibliothèques typées

---

## 11.4 — Comprendre rapidement un composant inconnu

Workflow recommandé :
1. ouvrir le composant
2. lire la signature des props
3. inspecter les types
4. trouver les usages
5. revenir en arrière

Tu comprends un composant sans parcourir tout le projet.

---

## 11.5 — Props et types : refactor sans danger

Renommer une prop :
```bash
\<leader\>rn
```

Le LSP :

- met à jour le type
- met à jour tous les usages
- respecte les scopes

Une recherche texte est dangereuse ici.

---

## 11.6 — Imports automatiques

Cas classique :

- tu utilises un composant non importé

Solution :
```bash
\<leader\>ca
```

L’import est ajouté :

- au bon endroit
- avec le bon nom
- sans erreur

---

## 11.7 — Hooks et erreurs courantes

Erreurs fréquentes :

- hook mal utilisé
- dépendances manquantes
- type incorrect

Approche saine :

- lire le diagnostic
- comprendre le message
- appliquer une action si possible
- corriger manuellement sinon

---

## 11.8 — Exercice pratique

- ouvre un composant React
- navigue avec gd et gr
- renomme une prop
- corrige les diagnostics
- vérifie les imports

---

## 11.9 — Checklist de fin de chapitre

- [ ] Je navigue facilement dans React
- [ ] Je comprends props et types
- [ ] Je refactorise sans peur
- [ ] Neovim est confortable pour le front

---

# Chapitre 12 — Workflow React réel (de la feature au commit)

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- développer une feature React complète
- enchaîner navigation, édition, refactor, tests et Git
- conserver un flux continu
- produire des commits clairs et prêts à relire

---

## 12.1 — Pourquoi un workflow réel est indispensable

Les tutoriels montrent rarement :

- du code existant
- des erreurs
- des ajustements
- des tests cassés

Ce chapitre simule une vraie journée de développement.

---

## 12.2 — Scénario de départ

Contexte :

- projet React avec TypeScript
- composant existant nommé UserCard
- nouvelle fonctionnalité :
  afficher le rôle utilisateur

---

## 12.3 — Étape 1 : comprendre avant d’agir

- ouvrir le composant
- lire les props
- inspecter les types
- vérifier les usages

Aucun code n’est écrit tant que ce n’est pas clair.

---

## 12.4 — Étape 2 : modifier la source de vérité

- ajouter la prop dans le type
- sauvegarder
- observer les diagnostics

Les erreurs apparaissent volontairement.

---

## 12.5 — Étape 3 : corriger les usages

- naviguer entre diagnostics
- corriger chaque appel
- sauvegarder régulièrement

Le LSP te guide.

---

## 12.6 — Étape 4 : ajuster le rendu

- modifier le JSX
- afficher la nouvelle information
- laisser le formatter agir

---

## 12.7 — Étape 5 : refactor léger

- renommer une variable si nécessaire
- clarifier un nom
- extraire du JSX

Toujours avec des outils assistés.

---

## 12.8 — Étape 6 : tests

- lancer les tests
- lire l’erreur
- corriger
- relancer

Les tests confirment ton intention.

---

## 12.9 — Étape 7 : Git

- vérifier les changements
- stage par intention
- écrire un commit clair

Exemple de message :
feat(user): display user role in UserCard

---

## 12.10 — Checklist de fin de chapitre

- [ ] Je développe une feature complète
- [ ] Mon workflow est fluide
- [ ] Mes commits sont propres
- [ ] Je garde le contexte jusqu’au bout

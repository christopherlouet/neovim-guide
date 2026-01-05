---
title: Personnaliser sans casser
---

# Chapitre 14 — Personnaliser sans casser

## Objectif du chapitre

À la fin de ce chapitre, tu dois :

- personnaliser avec intention
- éviter les anti-patterns courants
- garder une configuration stable
- faire évoluer ton IDE sereinement

---

## 14.1 — Pourquoi les configurations cassent

Les configurations cassent souvent à cause de :

- trop de plugins
- absence d’intention claire
- accumulation sans nettoyage

Le problème n’est pas Neovim,
mais la méthode.

---

## 14.2 — Règle numéro un : une intention par modification

Avant chaque ajout, pose-toi la question :

- quel problème précis est-ce que je résous ?

Si tu n’as pas de réponse claire,
n’ajoute rien.

---

## 14.3 — Chargement différé obligatoire

Un plugin doit être chargé :

- sur un événement
- sur une touche
- sur un type de fichier

Jamais tout au démarrage.

---

## 14.4 — Supprimer est une compétence

Un plugin inutile :

- ralentit l’éditeur
- augmente la complexité
- fragilise la configuration

Supprimer est une action saine.

---

## 14.5 — Checklist de fin de chapitre

- [ ] J’ajoute avec intention
- [ ] Je supprime sans peur
- [ ] Ma configuration est lisible
- [ ] Mon IDE reste stable

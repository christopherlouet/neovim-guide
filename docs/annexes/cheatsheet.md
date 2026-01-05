---
title: Cheatsheet IntelliJ → Neovim
---

# Annexes — Références, muscle memory et checklists

Ces annexes sont conçues pour :

- consultation rapide
- impression
- révision quotidienne
- sécurisation du workflow long terme

---

# Annexe A — Cheatsheet IntelliJ → Neovim

## Navigation et recherche

```bash
IntelliJ                     Action                              Neovim
Ctrl+P                       Ouvrir un fichier                   \<leader\>ff
Ctrl+Shift+F                 Rechercher dans le projet           \<leader\>fg
Ctrl+B                       Aller à la définition               gd
Alt+F7                       Trouver les usages                  gr
Ctrl+O                       Structure du fichier                \<leader\>fw
Ctrl+Tab                     Fichier suivant                     ]b
Ctrl+Shift+Tab               Fichier précédent                   [b
—                            Historique arrière                  Ctrl+o
—                            Historique avant                    Ctrl+i
```

---

## Édition

```bash
IntelliJ                     Action                              Neovim
Ctrl+D                       Dupliquer une ligne                 yyp
Ctrl+Y                       Supprimer une ligne                 dd
Ctrl+/                       Commenter une ligne                gcc
Alt+Flèche haut              Déplacer une ligne                  ddkP
Alt+Flèche bas               Déplacer une ligne                  ddp
Ctrl+Z                       Annuler                             u
Ctrl+Shift+Z                 Refaire                             Ctrl+r
```

---

## Refactor et LSP

```bash
IntelliJ                     Action                              Neovim
Shift+F6                     Renommer                            \<leader\>rn
Alt+Entrée                   Code actions                        \<leader\>ca
Ctrl+Q                       Documentation                       K
Ctrl+P                       Signature                           Ctrl+k
```

---

## Diagnostics

```bash
Action                                                       Neovim
Diagnostic suivant                                          ]d
Diagnostic précédent                                        [d
Liste globale des diagnostics                               \<leader\>xx
```

---

## Git

```bash
IntelliJ                     Action                              Neovim
Fenêtre Git                  Statut Git                          \<leader\>gg
—                            Hunk suivant                        ]c
—                            Hunk précédent                      [c
—                            Stage hunk                          \<leader\>hs
—                            Reset hunk                          \<leader\>hr
—                            Preview hunk                        \<leader\>hp
—                            Blame ligne                         \<leader\>hb
```

---

## Terminal, tests et debug

```bash
Action                                                       Neovim
Terminal intégré                                             \<leader\>tf
Test le plus proche                                          \<leader\>tt
Tests du fichier                                             \<leader\>tf
Tous les tests                                               \<leader\>ta
Ajouter un breakpoint                                        \<leader\>db
Continuer le debug                                           \<leader\>dc
Afficher ou masquer l’UI debug                               \<leader\>du
```

---

# Annexe B — Muscle memory quotidienne

À pratiquer chaque jour pendant 5 à 10 minutes :

- ouvrir un fichier avec \<leader\>ff
- naviguer entre buffers avec ]b et [b
- aller à la définition avec gd
- revenir avec Ctrl+o
- renommer une variable avec \<leader\>rn
- corriger un diagnostic avec \<leader\>ca
- stage un hunk avec \<leader\>hs
- commit avec une intention claire

La répétition crée l’automatisme.

---

# Annexe C — Checklist de workflow sain

Avant chaque session :

- je sais sur quoi je travaille
- une session correspond à une tâche

Pendant le travail :

- je reste en mode Normal autant que possible
- je fais confiance aux diagnostics
- je stage par intention

Après le travail :

- je ferme proprement
- je laisse un état clair
- je peux reprendre facilement demain

---

# Annexe D — Rappels mentaux essentiels

- Neovim est composable
- le clavier exprime des intentions
- le LSP comprend le code
- les outils travaillent pour toi
- la simplicité est un choix actif

---

# Fin des annexes

Ce guide est conçu pour être relu,
consulté partiellement,
et utilisé sur le long terme.

Neovim n’est pas appris en un jour.
Il se construit par couches successives.


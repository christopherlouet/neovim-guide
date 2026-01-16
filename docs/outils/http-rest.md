---
title: HTTP & REST Client
sidebar_position: 4
---

# HTTP & REST Client

`rest.nvim` permet de tester des APIs REST directement depuis Neovim, comme Postman ou le client HTTP d'IntelliJ.

:::tip Plugin utilisé
Cette section couvre le plugin suivant de [neovim-intellij-ide](https://github.com/christopherlouet/neovim-intellij-ide) :
- **[rest.nvim](https://github.com/rest-nvim/rest.nvim)** — Client HTTP/REST intégré
:::

---

## Concept

Dans IntelliJ, tu utilises peut-être les fichiers `.http` pour tester tes APIs. Neovim offre la même fonctionnalité avec `rest.nvim`.

### Avantages

- **Version control** : Les requêtes sont des fichiers texte
- **Partage** : Toute l'équipe peut utiliser les mêmes requêtes
- **Documentation** : Les fichiers HTTP documentent l'API
- **Intégration** : Même éditeur pour code et tests

---

## Raccourcis

| Raccourci | Action |
|-----------|--------|
| `<leader>rr` | Exécuter la requête sous le curseur |
| `<leader>rp` | Prévisualiser la requête (sans exécuter) |
| `<leader>rl` | Re-exécuter la dernière requête |

---

## Format des fichiers HTTP

Crée un fichier avec l'extension `.http` :

```http
### Get all users
GET https://api.example.com/users

### Get specific user
GET https://api.example.com/users/123

### Create user
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

### Structure d'une requête

```http
### Commentaire/Nom de la requête
METHOD URL
Header: value
Header2: value2

{body JSON optionnel}
```

---

## Exécution

### Requête simple

1. Place le curseur sur une requête
2. `<leader>rr` pour exécuter
3. Le résultat s'affiche dans un buffer

### Résultat

Le buffer de résultat affiche :
- URL appelée
- Code de statut HTTP
- Headers de réponse
- Corps de la réponse (formaté si JSON)

---

## Variables d'environnement

### Fichier .env

Crée un fichier `.env` à la racine du projet :

```env
API_URL=https://api.example.com
AUTH_TOKEN=Bearer abc123
```

### Utilisation dans les requêtes

```http
### Get users with auth
GET {{API_URL}}/users
Authorization: {{AUTH_TOKEN}}
```

### Variables dynamiques

```http
### Avec timestamp
POST {{API_URL}}/logs
Content-Type: application/json

{
  "timestamp": "{{$timestamp}}",
  "uuid": "{{$uuid}}"
}
```

| Variable | Description |
|----------|-------------|
| `{{$timestamp}}` | Timestamp Unix |
| `{{$uuid}}` | UUID v4 |
| `{{$randomInt}}` | Entier aléatoire |

---

## Chaîner les requêtes

### Capturer une réponse

```http
### Login - capture le token
# @name login
POST {{API_URL}}/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "secret"
}

### Utiliser le token
GET {{API_URL}}/profile
Authorization: Bearer {{login.response.body.token}}
```

---

## Workflow typique

### Scénario : Test d'API

```
1. Crée un fichier requests.http

2. Écris tes requêtes
   GET /users
   POST /users
   PUT /users/:id
   DELETE /users/:id

3. Test avec <leader>rr

4. Vérifie les résultats

5. Commit le fichier .http avec ton code
```

### Scénario : Debug d'endpoint

```
1. Ouvre le fichier .http

2. Modifie la requête problématique

3. <leader>rp pour prévisualiser
   → Vérifie que tout est correct

4. <leader>rr pour exécuter

5. Analyse la réponse dans le buffer
```

---

## Configuration du projet

### Structure recommandée

```
project/
├── src/
├── tests/
└── http/
    ├── .env
    ├── .env.production
    ├── users.http
    ├── orders.http
    └── auth.http
```

### Fichier .env par environnement

```env
# .env (développement)
API_URL=http://localhost:3000

# .env.production
API_URL=https://api.production.com
```

---

## Exemples de requêtes

### REST basique

```http
### GET avec paramètres
GET https://api.example.com/users?page=1&limit=10
Accept: application/json

### POST avec JSON
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "New User",
  "role": "admin"
}

### PUT update
PUT https://api.example.com/users/123
Content-Type: application/json

{
  "name": "Updated Name"
}

### DELETE
DELETE https://api.example.com/users/123
```

### Authentification

```http
### Basic Auth
GET https://api.example.com/secure
Authorization: Basic dXNlcjpwYXNz

### Bearer Token
GET https://api.example.com/profile
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...

### API Key
GET https://api.example.com/data
X-API-Key: your-api-key
```

### Upload de fichier

```http
### Multipart form
POST https://api.example.com/upload
Content-Type: multipart/form-data; boundary=boundary

--boundary
Content-Disposition: form-data; name="file"; filename="test.txt"
Content-Type: text/plain

File content here
--boundary--
```

---

## Comparaison avec Postman/Insomnia

| Fonctionnalité | Postman | rest.nvim |
|----------------|---------|-----------|
| Interface GUI | ✅ | ❌ Text-based |
| Requêtes HTTP | ✅ | ✅ |
| Variables | ✅ | ✅ |
| Environnements | ✅ | ✅ (.env) |
| Collections | ✅ Folders | ✅ Fichiers |
| Tests automatisés | ✅ JS scripts | ❌ |
| Version control | ✅ Export/Import | ✅ Natif (fichiers) |
| Collaboration | ✅ Cloud | ✅ Git |

### Avantages rest.nvim

- Fichiers versionnés avec le code
- Édition Vim (macros, motions)
- Pas d'application externe
- Fonctionne en SSH

---

## Astuces

### Organiser les requêtes

```http
###################################
# Authentication
###################################

### Login
POST {{API_URL}}/auth/login
...

### Logout
POST {{API_URL}}/auth/logout
...

###################################
# Users
###################################

### List users
GET {{API_URL}}/users
...
```

### Requête rapide ad-hoc

Pas besoin de fichier `.http` pour une requête rapide :

```vim
:Rest GET https://api.example.com/health
```

### Copier une requête curl

Convertis une commande curl en format HTTP :

```bash
# curl
curl -X POST https://api.com/users \
  -H "Content-Type: application/json" \
  -d '{"name": "John"}'
```

```http
# Équivalent HTTP
POST https://api.com/users
Content-Type: application/json

{"name": "John"}
```

---

## Exercices pratiques

### Exercice 1 : Première requête
1. Crée un fichier `test.http`
2. Ajoute une requête GET vers une API publique :
   ```http
   GET https://jsonplaceholder.typicode.com/users
   ```
3. Exécute avec `<leader>rr`

### Exercice 2 : Variables
1. Crée un fichier `.env` avec `API_URL=https://jsonplaceholder.typicode.com`
2. Utilise `{{API_URL}}` dans tes requêtes
3. Vérifie que la substitution fonctionne

### Exercice 3 : POST request
1. Ajoute une requête POST :
   ```http
   POST https://jsonplaceholder.typicode.com/posts
   Content-Type: application/json

   {
     "title": "Test",
     "body": "Content",
     "userId": 1
   }
   ```
2. Exécute et vérifie la réponse

---

## Checklist de fin de chapitre

- [ ] Je sais créer un fichier `.http`
- [ ] Je peux exécuter des requêtes avec `<leader>rr`
- [ ] J'utilise les variables d'environnement
- [ ] Je sais organiser mes requêtes
- [ ] Je comprends l'avantage du versioning

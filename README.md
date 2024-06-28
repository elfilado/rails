# Projet

Le but de ce projet est de réaliser une application type e-commerce en Ruby on Rails. La partie évaluée sera principalement la partie Backend. Les fonctionnalités minimales demandées du site sont les suivantes :
- Inscription (création) d'un utilisateur
- Connexion d'un utilisateur
- Changer le type de profil d'un utilisateur (acheteur et/ou vendeur)
- Parcourir des produits
- Voir un produit
- Vendre (créer) des produits (profil vendeur)
- Acheter (commander) des produits

Vous êtes libre sur la partie Frontend (dispositions des pages, format, ...). Vous trouverez ci-dessous la spécification des différents modèles de l'application.

# Modèles

## User

Colonnes (minimum) :
```yml
- email: string

- password: string
# ou
- password_digest: string # avec has_secure_password
```

Compte utilisateur utilisé pour s'inscrire et se connecter.

## Buyer

Colonnes (minimum) :
```yml
- user: references
```

Compte acheteur d'un utilisateur. Tous les utilisateurs en ont un à la création de leur compte.

## Seller

Colonnes (minimum) :
```yml
- user: references
```

Compte vendeur d'un utilisateur. Est défini lors de la création du compte et/ou dans une page "paramètres", avec une case à cocher.

## Product

Colonnes (minimum) :
```yml
- name: string
- description: text
- price: number
- stock: integer
- seller: references
```

Produit vendu par un vendeur (Seller) et achetable par un utilisateur (Buyer).

## Order

Colonnes (minimum) :
```yml
- product: references
- buyer: references
- quantity: integer
- total_price: number
```

Commande d'une certaine quantité d'un seul produit par un acheteur.

# Routes / Pages

Routes liées au User :
```bash
GET /login       # page de connection
  POST /login    # connection
  DELETE /logout # déconnection
GET /register    # page de création de compte
  POST /register # création du compte
```

Routes liées au Product :
```bash
(CRUD products)
GET /products           # liste des produits
POST /products          # ajouter un produit
GET /products/new       # page de création d'un produit
GET /products/:id       # page d'un seul produit pour l'acheter
GET /products/:id/edit  # page d'édition d'un produit
PATCH /products/:id     # édition/mise à jour d'un produit
DELETE /products/:id    # suppression d'un produit
```

Routes liées au Order :
```bash
POST /orders   # création d'une nouvelle commande
```

# Bonus

- Ajouter des tests
- Soigner le frontend (CSS)
- Ajouter un modèle Cart et des routes+pages pour gérer le panier d'un Buyer
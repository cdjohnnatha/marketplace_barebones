# Summer 2019 Developer Intern Challenge Question

## Table of Contents

<!-- vscode-markdown-toc -->
- 1. [Requirements](#Requirements)
- 2. [Installation](#Installation)
- 3. [The Challenge](#TheChallenge)
  - 3.1. [Extra](#Extra)
  - 3.2. [ExtraExtra](#ExtraExtra)
- 4. [Demo Requirements](#DemoRequirements)
- 5. [Tips](#Tips)
- 5. [Goal](#Goal)
- 6. [Application Goals](#Objects)
- 7. [Functionalities](#Functionalities)
- 8. [Makefile](#Makefile)

## 1. <a name='Requirements'></a>Requirements
- [Ruby on Rails](https://rubyonrails.org/)
- [Docker](https://www.docker.com/)

## 2. <a name='Installation'></a>Installation
1. First, clone this repo.

```bash
git clone https://github.com/cdjohnnatha/marketplace_barebones.git
```

2. The Installation can be choose one of the ways bellow:
     1. [Docker](DockerInstall).
     2. [Ruby on Rails](RailsInstall).
     2. [Makefile](Makefile).

* <a name='DockerInstall'></a>Docker

 Install by Docker, just run in you terminal/bash:
  ```bash
  docker-compose up -d
  docker-compose run web make createdb
  docker-compose run web make migrations
  docker-compose run web make db_seed
  make yarn-install
  ```

* <a name='RailsInstall'></a>Ruby on rails
  It is possible to use all the rails commands.
  **Install [postgresdb](https://www.postgresql.org/download/) or use docker to run the postgres using 'make build_postgresdb'**
  ```bash
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
  rails s
  ```

## 3. <a name='TheChallenge'></a>The Challenge

### **Task: Build the barebones of an online marketplace.**

* To do this, build a server side web api that can be used to fetch products either one at a time or all at once.

* Every product should have a title, price, and inventory_count.

* Querying for all products should support passing an argument to only return products with available inventory. 

* Products should be able to be "purchased" which should reduce the inventory by 1. Products with no inventory cannot be purchased.

* **P.s. No need to make a frontend!**

#### <a name='Extra'></a> 3.1. Extra

**Extra credit (100% optional as there are lots of different ways to shine in your application):**

* Fit these product purchases into the context of a simple shopping cart. 

* That means purchasing a product requires first creating a cart, adding products to the cart, and then "completing" the cart.

* The cart should contain a list of all included products, a total dollar amount (the total value of all products), and product inventory shouldn't reduce until after a cart has been completed.

#### <a name='ExtraExtra'></a>3.2ExtraExtra
**Extra extra credit (please, only do this if you really want to, honest!):**

* Bonus points for making your API (at least partly) secure, writing documentation that doesn’t suck, including unit tests, and/or building your API using GraphQL.

### <a name='DemoRequirements'></a>Demo requirements

* **All of the functionality of your API should be documented so we know what it does, and how to interact with it.**

### <a name='Tips'></a>4. Tips

* While you can tackle this challenge using any language and platform that you want, you’ll almost certainly find the work easier and more manageable with the aid of a web development framework (we use the Ruby on Rails framework at Shopify).



### 5. <a name='Goal'></a>Goal

Build a backend api using graphql for a fictional marketplace. The application it will be access by an user authenticated who will use it, there will be products which contains title, price and inventory_count. User can take a look in a list of products and check details of it.

The Marketplace should have a cart where the user can add products showing a total amount from them in dollars, the product inventory shouldn't reduce until after a cart has been completed.

Products purchased should reduce the invetory by one and can't be purchased when the inventory is empty.

**Task:** Build the barebones of an online marketplace.

## 6. <a name='Objects'></a>The Application Goals

1. The marketplace_barebones have resources for.
  * Authentication
  * Cart
  * User
  * Products

2. Guests
  * Guests are authorized jus to take a look in products.
3. User
  * It is necessary make a registration. They are authorized add/buy products and they will be added in a cart.


## 6. <a name='Makefile'></a>MakeFile

Commands            | Action                                                     |
---                 | ---                                                        |
up                  | Make container up.                                         |
down                | Stop container.                                            |
bash                | Access bash into container                                 |
console             | Access console into container                              |
restart-app         | Restart the container                                      |
build               | Build container                                            |
rebuild             | Rebuild container                                          |
docker-createdb     | Create databases into container                            |
createdb            | Create database outside container                          |
run                 | Run application outside container using rails              |
build_postgresdb    | Start a postgresdb in container (Just if is not installed) |



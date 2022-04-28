<h1 align="center">Welcome to backend-payers 👋</h1>
<p>
  <a href="#" target="_blank">
    <img alt="Rails" src="https://img.shields.io/badge/rails-%3E%3D7.0.2-red" />
  </a>
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

> Rails API for handling adding, spending, and viewing user points for select companies.

## Install

```sh
# first install all gems
bundle install
# Then setup PostgreSQL database
rails db:create db:migrate db:seed
```

## Start Rails Server

```sh
# Defaults to port 3000
rails s
```

## Run tests

```sh
rails test -p
```

## Routes

### Users:
-   GET  `/users`
-   POST `/users`
-   GET  `/users/:id`
-   GET  `/users/:id/total_points`
-   GET  `/users/:id/points_balance`

### Payers:
-   GET  `/payers`
-   POST `/payers`
-   GET  `/payers/:id`

### Transactions:
-   GET  `/transactions`
-   GET  `/transactions/:id`
-   POST  `/spend_points`
-   POST  `/add_transaction`


## Author

👤 **Phil Roth**

* Website: https://phil-roth.dev
* Twitter: [@rothberry_](https://twitter.com/rothberry_)
* Github: [@rothberry](https://github.com/rothberry)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
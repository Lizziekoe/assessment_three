Hair Salon
==========

Creates a web app using Ruby to add Salon Stylists and Clients.

Database Setup
--------------

```sh
$ psql
$ CREATE DATABASE hair_salon;
$ \c hair_salon;
$ CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
$ CREATE TABLE clients (id serial PRIMARY KEY, stylist_id int, name varchar);
```
App Setup
----------

Assuming you have ruby installed. In the terminal:
```sh
$ gem install bundler
$ bundle
$ ruby app.rb
```

Go to http://localhost:4567 in your browser

Tests
-----

In psql

```sh
$ CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon
```

Testing the ruby methods can be done via rspec.

```sh
$ gem install rspec
$ rspec
```
Motivation
---------

This app was created to assess how well I can interact with SQL databases using PostgreSQL and the PG gem and using a one to many relationship.

License
-------

MIT License, copyright 2015. Created by Lizzie Koehler.
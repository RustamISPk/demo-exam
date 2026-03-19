-- CREATE DATABASE demo_exam;

CREATE TABLE product (
                         id serial PRIMARY KEY,
                         name text NOT NULL,
                         price numeric(10, 3) NOT NULL,
                         description text,
                         code text,
                         quantity numeric(10, 3) NOT NULL
);

CREATE TABLE characteristics (
                                 id serial PRIMARY KEY,
                                 name text NOT NULL,
                                 description text
);

CREATE TABLE characteristics_for_products (
                                              id serial PRIMARY KEY,
                                              product_id integer NOT NULL,
                                              characteristic_id integer NOT NULL,
                                              FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE ,
                                              FOREIGN KEY (characteristic_id) REFERENCES characteristics (id) ON DELETE CASCADE
);

CREATE TABLE role (
                      id serial PRIMARY KEY,
                      name text NOT NULL,
                      description text
);

CREATE TABLE employers (
                           id serial PRIMARY KEY,
                           surname text NOT NULL,
                           name text NOT NULL,
                           patronymic text,
                           role integer NOT NULL,
                           FOREIGN KEY (role) REFERENCES role (id) ON DELETE CASCADE
);

CREATE TABLE customer (
                          id serial PRIMARY KEY,
                          name text NOT NULL,
                          inn text,
                          address text NOT NULL,
                          phone text NOT NULL,
                          salesman bool NOT NULL,
                          buyer bool NOT NULL
);

CREATE TABLE orders (
                        id serial PRIMARY KEY,
                        products integer NOT NULL,
)


-- CREATE DATABASE demo_exam;

CREATE TABLE product
(
    id          serial PRIMARY KEY,
    name        text           NOT NULL,
    price       numeric(10, 3) NOT NULL,
    description text,
    code        text,
    quantity    numeric(10, 3) NOT NULL
);

CREATE TABLE characteristics
(
    id          serial PRIMARY KEY,
    name        text NOT NULL,
    description text
);

CREATE TABLE characteristics_for_products
(
    id                serial PRIMARY KEY,
    product_id        integer NOT NULL,
    characteristic_id integer NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE,
    FOREIGN KEY (characteristic_id) REFERENCES characteristics (id) ON DELETE CASCADE
);

CREATE TABLE role
(
    id          serial PRIMARY KEY,
    name        text NOT NULL,
    description text
);

CREATE TABLE employers
(
    id         serial PRIMARY KEY,
    surname    text    NOT NULL,
    name       text    NOT NULL,
    patronymic text,
    role       integer NOT NULL,
    FOREIGN KEY (role) REFERENCES role (id) ON DELETE CASCADE
);

CREATE TABLE customer
(
    id       serial PRIMARY KEY,
    name     text NOT NULL,
    inn      text,
    address  text NOT NULL,
    phone    text NOT NULL,
    salesman bool NOT NULL,
    buyer    bool NOT NULL
);

CREATE TABLE orders
(
    id       serial PRIMARY KEY,
    customer integer NOT NULL,
    employer integer NOT NULL,
    date     date    NOT NULL,
    FOREIGN KEY (customer) REFERENCES customer (id) ON DELETE CASCADE,
    FOREIGN KEY (employer) REFERENCES employers (id) ON DELETE CASCADE
);

CREATE TABLE products_for_order
(
    id         serial PRIMARY KEY,
    product_id integer        NOT NULL,
    order_id   integer        NOT NULL,
    quantity   numeric(10, 3) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE
);

CREATE TABLE product_maps
(
    id                     serial PRIMARY KEY,
    name                   text           NOT NULL,
    main_product_id        integer        NOT NULL,
    product_final_quantity numeric(10, 3) NOT NULL,
    FOREIGN KEY (main_product_id) REFERENCES product (id) ON DELETE CASCADE
);

CREATE TABLE materials_for_product_maps
(
    id             serial PRIMARY KEY,
    product_map_id integer NOT NULL,
    material       integer NOT NULL,
    quantity       numeric(10, 3),
    FOREIGN KEY (product_map_id) REFERENCES product_maps (id) ON DELETE CASCADE,
    FOREIGN KEY (material) REFERENCES product (id) ON DELETE CASCADE
);

INSERT INTO product
VALUES (0, 'Сметана классическая 15%', 80, '', 'НФ-00000006', 100);
INSERT INTO product
VALUES (1, 'Закваска сметанная', 10, '', 'НФ-00000004', 100);
INSERT INTO product
VALUES (2, 'Молоко нормализованное', 40, '', 'НФ-00000005', 100);

ALTER TABLE characteristics_for_products
    ADD value numeric(10, 3);

INSERT INTO characteristics
VALUES (0, 'масса в граммах', '');
INSERT INTO characteristics_for_products
VALUES (0, 0, 0, 100);
INSERT INTO characteristics_for_products
VALUES (1, 1, 0, 100);
INSERT INTO characteristics_for_products
VALUES (2, 2, 0, 100);

INSERT INTO product_maps
VALUES (0, 'Сметана классическая 15%', 0, 1);
INSERT INTO materials_for_product_maps
VALUES (0, 0, 1, 900);
INSERT INTO materials_for_product_maps
VALUES (1, 0, 2, 70);

INSERT INTO role
VALUES (0, 'Менеджер по продажам', '');
INSERT INTO employers
VALUES (0, 'Тестов', 'Тест', 'Тестович', 0);

INSERT INTO orders
VALUES (0, 1, 0, '2026-03-18');

INSERT INTO products_for_order
VALUES (0, 0, 0, 2);

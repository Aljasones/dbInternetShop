CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'AVAILAIBLE', -- may be 'ABSENT'
    quantity INTEGER CHECK ( quantity >= 0 ) DEFAULT 0,
    price INTEGER NOT NULL CHECK ( price > 0 )
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL
);

CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER REFERENCES users NOT NULL,
    status TEXT NOT NULL DEFAULT 'SELECTED' -- may be 'COMPLETED', 'PAID', 'CANCELED'

);
 CREATE TABLE sales(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     order_id INTEGER REFERENCES orders NOT NULL,
     product_id INTEGER REFERENCES products NOT NULL,
     quantity INTEGER NOT NULL CHECK ( quantity > 0 ),
     price INTEGER REFERENCES products NOT NULL CHECK ( price > 0 )

 );

INSERT INTO products (name, category, status, quantity, price) VALUES
('iPhone', 'Smartphones', 'AVAILAIBLE', 100, 90000),
('Samsung', 'Smartphones', 'AVAILAIBLE', 200, 65000),
('Honor', 'Smartphones', 'AVAILAIBLE', 150, 40000);

INSERT INTO users (login, name) VALUES
('Jhon', 'Evgeniy'),
('Vasya', 'Vasiliy Ivanovich'),
('111', 'Masha');

INSERT INTO orders (user_id, status)  VALUES
(1, 'COMPLETED'),
(2, 'PAID'),
(3, 'PAID'),
(1, 'SELECTED');

INSERT INTO sales (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 90000),
(2, 2, 2, 65000),
(3, 3, 1, 40000),
(4, 2, 3, 65000);

SELECT order_id, product_id, quantity, price, quantity*price total_price FROM sales;
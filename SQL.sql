create database mystore;

create table products (
  id serial PRIMARY KEY,
  sku varchar(10) NOT NULL,
  name varchar(255) NOT NULL,
  price int NOT NULL
);

create table orders (
  id serial PRIMARY KEY,
  order_no varchar(20) NOT NULL,
  tracking_no varchar(20)
);

create table order_details (
  id serial PRIMARY KEY,
  product_id int REFERENCES products(id),
  order_id int REFERENCES orders(id) ON DELETE CASCADE,
  qty int DEFAULT 1
);

INSERT INTO products (sku, name, price) VALUES ('PC-001', 'Fancy', 2300000);
INSERT INTO products (sku, name, price) VALUES ('Heroku-003', 'Heroku', 40000);
INSERT INTO products (sku, name, price) VALUES ('Spotify-002', 'Spotify', 900);
INSERT INTO products (sku, name, price) VALUES ('Guaro-media-004', 'Media de Guaro', 40000);
INSERT INTO products (sku, name, price) VALUES ('Guaro-botella-005', 'Botella de Guaro', 80000);

alter table products alter column sku type varchar(50);

INSERT INTO products (sku, name, price) VALUES ('Spotify-002', 'Spotify', 900);
INSERT INTO products (sku, name, price) VALUES ('Guaro-media-004', 'Media de Guaro', 40000);
INSERT INTO products (sku, name, price) VALUES ('Guaro-botella-005', 'Botella de Guaro', 80000);

SELECT * from products;
SELECT * from products where price > 45000;
SELECT * from products where name like '%Guaro%';

DELETE from products where sku = 'Heroku-003';

UPDATE products SET price = 15000 where sku = 'Spotify-002';

INSERT INTO orders (order_no) VALUES ('ord_001');
INSERT INTO orders (order_no) VALUES ('ord_002');

INSERT INTO order_details (product_id, order_id) VALUES (1, 1);
INSERT INTO order_details (product_id, order_id) VALUES (3, 1);
INSERT INTO order_details (product_id, order_id) VALUES (4, 2);
INSERT INTO order_details (product_id, order_id) VALUES (5, 2);

SELECT order_details.* FROM orders
INNER JOIN order_details
ON order_details.order_id = orders.id
WHERE orders.id = 1;

SELECT * FROM orders
LEFT OUTER JOIN order_details
ON order_details.order_id = orders.id
WHERE orders.id = 1;

SELECT order_details.* FROM orders
RIGHT OUTER JOIN order_details
ON order_details.order_id = orders.id
WHERE orders.id = 1;

create database store;

create table products (
  id serial PRIMARY KEY,
  sku varchar(50) NOT NULL,
  name varchar(255) NOT NULL,
  price int NOT NULL
);

create table orders (
  id serial PRIMARY KEY,
  order_no varchar(20) NOT NULL,
  tracking_no varchar(20)
);

create table order_details (
  id serial PRIMARY KEY,
  product_id int REFERENCES products(id),
  order_id int REFERENCES orders(id) ON DELETE CASCADE,
  quantity int DEFAULT 1
);


-- Products          OrderDetails                  Orders
-- id(1) salchichon  id(1) p_id(1) o_id(1)         id(1) O_001 track_001
-- 2 limon           id(2) p_id(3) o_id(1)
-- 3 pan             id(3) p_id(4) o_id(1)
-- 4 cocacola

INSERT INTO products (sku, name, price) VALUES ('PC-001', 'Fancy', 2300000);
INSERT INTO products (sku, name, price) VALUES ('Heroku-003', 'Heroku', 40000);
INSERT INTO products (sku, name, price) VALUES ('Spotify-002', 'Spotify', 900);
INSERT INTO products (sku, name, price) VALUES ('Guaro-media-004', 'Media de Guaro', 40000);
INSERT INTO products (sku, name, price) VALUES ('Guaro-botella-005', 'Botella de Guaro', 80000);

select * from orders join order_details on order_details.order_id = orders.id where orders.id = 1

alter table NOMBRE ADD COLUMN NOM_COL TYPE;
alter table products ALTER COLUMN sku TYPE varchar(50);

create database hotel;
create table rooms (
  id serial PRIMARY KEY,
  user_id int REFERENCES users(id),
  room_no int
);
alter table rooms ADD COLUMN room_no int;

create table users (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL
);

INSERT INTO rooms (room_no) VALUES (101);
INSERT INTO rooms (room_no) VALUES (102);
INSERT INTO rooms (room_no) VALUES (103);
INSERT INTO rooms (room_no) VALUES (201);
INSERT INTO rooms (room_no) VALUES (202);
INSERT INTO rooms (room_no) VALUES (203);

INSERT INTO users (name) VALUES ('Pepe');
INSERT INTO users (name) VALUES ('Rodrigo');
INSERT INTO users (name) VALUES ('James');
INSERT INTO users (name) VALUES ('Simon');

UPDATE rooms set user_id = 1 where room_no = 101;
UPDATE rooms set user_id = 2 where room_no = 201;
UPDATE rooms set user_id = 3 where room_no = 203;

select * from rooms, users where rooms.user_id = users.id;
select * from rooms join users on rooms.user_id = users.id;
select * from rooms
join users
on rooms.user_id = users.id
WHERE users.name = 'Rodrigo';

select * from rooms
left join users
on rooms.user_id = users.id;

select * from rooms
right join users
on rooms.user_id = users.id;



INSERT INTO orders (order_no) VALUES ('ord_001');
INSERT INTO orders (order_no) VALUES ('ord_002');

INSERT INTO order_details (product_id, order_id) VALUES (1, 1);
INSERT INTO order_details (product_id, order_id) VALUES (3, 1);
INSERT INTO order_details (product_id, order_id) VALUES (4, 2);
INSERT INTO order_details (product_id, order_id) VALUES (5, 2);

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



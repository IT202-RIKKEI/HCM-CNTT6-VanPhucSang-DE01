CREATE DATABASE SalesManagement;
USE SalesManagement;

DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2),
    customer_id VARCHAR(10),
    note TEXT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_detail (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity_purchased INT,
    sell_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product VALUES
('P01', 'MacBook Air M2', 'Apple', 20000000, 10),
('P02', 'iPhone 13', 'Apple', 15000000, 20),
('P03', 'Dell XPS 13', 'Dell', 18000000, 5),
('P04', 'HP Pavilion', 'HP', 12000000, 8),
('P05', 'Asus VivoBook', 'Asus', 10000000, 15);

INSERT INTO customer VALUES
('C01', 'Nguyen Van A', 'a@gmail.com', '0123', 'Ha Noi'),
('C02', 'Tran Van B', 'b@gmail.com', NULL, 'TP HCM'),
('C03', 'Le Van C', 'c@gmail.com', '0456', 'Da Nang'),
('C04', 'Pham Van D', 'd@gmail.com', NULL, 'Hue'),
('C05', 'Hoang Van E', 'e@gmail.com', '0789', 'Can Tho');

INSERT INTO orders VALUES
('DH001', '2024-01-01', 20000000, 'C01', NULL),
('DH002', '2024-01-02', 15000000, 'C02', NULL),
('DH003', '2024-01-03', 18000000, 'C03', NULL),
('DH004', '2024-01-04', 12000000, 'C04', NULL),
('DH005', '2024-01-05', 10000000, 'C05', NULL);

INSERT INTO order_detail VALUES
('DH001', 'P01', 1, 20000000),
('DH002', 'P02', 1, 15000000),
('DH003', 'P03', 1, 18000000),
('DH004', 'P04', 1, 12000000),
('DH005', 'P05', 1, 10000000);

UPDATE product
SET price = price * 1.1
WHERE manufacturer = 'Apple';

DELETE FROM customer
WHERE phone_number IS NULL;

SELECT *
FROM product
WHERE price BETWEEN 10000000 AND 20000000;

DROP TABLE order_detail;
DROP TABLE orders;
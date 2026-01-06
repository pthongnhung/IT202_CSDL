DROP DATABASE IF EXISTS b4_ss7;
CREATE DATABASE b4_ss7;
USE b4_ss7;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- 2) Dữ liệu mẫu: mỗi bảng >= 5 dòng
INSERT INTO customers (name, email) VALUES
('Nguyen Van A', 'a@gmail.com'),
('Tran Thi B', 'b@gmail.com'),
('Le Van C', 'c@gmail.com'),
('Pham Thi D', 'd@gmail.com'),
('Hoang Van E', 'e@gmail.com');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-01-01', 500000),
(1, '2025-01-05', 300000),
(2, '2025-01-03', 700000),
(3, '2025-01-04', 250000),
(5, '2025-01-07', 450000),
(2, '2025-01-10', 400000),  -- thêm để đủ dữ liệu + tạo tổng lớn hơn
(5, '2025-01-12', 700000);  -- thêm để đủ dữ liệu

-- 3) KHÔNG JOIN: Khách hàng có tổng tiền mua lớn nhất
--    Yêu cầu: >= 2 cấp subquery, dùng SUM + MAX
SELECT
    c.*,
    (SELECT SUM(o.total_amount)
     FROM orders o
     WHERE o.customer_id = c.id) AS total_money
FROM customers c
WHERE c.id IN (
    SELECT t1.customer_id
    FROM (
        SELECT o1.customer_id, SUM(o1.total_amount) AS total_money
        FROM orders o1
        GROUP BY o1.customer_id
    ) t1
    WHERE t1.total_money = (
        SELECT MAX(t2.total_money)
        FROM (
            SELECT SUM(o2.total_amount) AS total_money
            FROM orders o2
            GROUP BY o2.customer_id
        ) t2
    )
);

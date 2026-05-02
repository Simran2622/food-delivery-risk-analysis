-- Create Table
CREATE TABLE orders (
    order_date DATE,
    total_orders INTEGER,
    total_cancellations INTEGER,
    wastage_flag INTEGER,
    fraud_flag INTEGER
);

-- Insert Data
INSERT INTO orders VALUES
('2024-01-01',120,10,0,0),
('2024-01-02',135,15,0,0),
('2024-01-03',110,8,0,0),
('2024-01-04',150,20,0,0),
('2024-01-05',160,18,0,0),
('2024-01-06',170,25,1,0),
('2024-01-07',140,12,0,0),
('2024-01-08',130,10,0,0),
('2024-01-09',145,14,0,0),
('2024-01-10',155,22,1,0),
('2024-01-11',165,20,0,0),
('2024-01-12',175,28,1,1),
('2024-01-13',180,30,1,1),
('2024-01-14',150,12,0,0);

-- Total Orders & Cancellations
SELECT 
    SUM(total_orders) AS total_orders,
    SUM(total_cancellations) AS total_cancellations
FROM orders;

-- Fraud Cases
SELECT COUNT(*) AS fraud_cases
FROM orders
WHERE fraud_flag = 1;

-- Wastage Percentage
SELECT 
    (SUM(wastage_flag) * 100.0 / COUNT(*)) AS wastage_percentage
FROM orders;

-- Top Cancellation Days
SELECT order_date, total_cancellations
FROM orders
ORDER BY total_cancellations DESC
LIMIT 5;

-- Average Orders
SELECT AVG(total_orders) AS avg_orders
FROM orders;

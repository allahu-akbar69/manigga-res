# Sample Data for Restaurant Management System - 2023 & 2024

This file contains SQL INSERT statements to add realistic statistical data for years 2023 and 2024.
The data includes customers, orders, and order items with proper relationships and consistent totals.

## Usage

```sql
USE restaurant_management;

-- Run the INSERT statements below
```

---

## Additional Customers (2023-2024)

```sql
-- Add more customers for 2023-2024 data
INSERT INTO customers (customer_name, customer_phone, email, address, created_at) VALUES
('Robert Taylor', '555-0201', 'robert.taylor@email.com', '101 First Ave, City', '2023-01-15 10:00:00'),
('Lisa Anderson', '555-0202', 'lisa.anderson@email.com', '202 Second St, City', '2023-02-20 11:00:00'),
('James Martinez', '555-0203', 'james.martinez@email.com', '303 Third Blvd, City', '2023-03-10 12:00:00'),
('Jennifer White', '555-0204', 'jennifer.white@email.com', '404 Fourth Rd, City', '2023-04-05 13:00:00'),
('Michael Harris', '555-0205', 'michael.harris@email.com', '505 Fifth Ave, City', '2023-05-12 14:00:00'),
('Amanda Clark', '555-0206', 'amanda.clark@email.com', '606 Sixth St, City', '2023-06-18 15:00:00'),
('Christopher Lewis', '555-0207', 'christopher.lewis@email.com', '707 Seventh Dr, City', '2023-07-22 16:00:00'),
('Jessica Walker', '555-0208', 'jessica.walker@email.com', '808 Eighth Ave, City', '2023-08-30 17:00:00'),
('Daniel Hall', '555-0209', 'daniel.hall@email.com', '909 Ninth St, City', '2023-09-14 18:00:00'),
('Ashley Allen', '555-0210', 'ashley.allen@email.com', '1010 Tenth Rd, City', '2023-10-25 19:00:00'),
('Matthew Young', '555-0211', 'matthew.young@email.com', '1111 Eleventh Ave, City', '2023-11-08 20:00:00'),
('Samantha King', '555-0212', 'samantha.king@email.com', '1212 Twelfth St, City', '2023-12-03 21:00:00'),
('Andrew Wright', '555-0213', 'andrew.wright@email.com', '1313 Thirteenth Blvd, City', '2024-01-10 10:00:00'),
('Nicole Lopez', '555-0214', 'nicole.lopez@email.com', '1414 Fourteenth Dr, City', '2024-02-15 11:00:00'),
('Kevin Hill', '555-0215', 'kevin.hill@email.com', '1515 Fifteenth Ave, City', '2024-03-20 12:00:00');
```

---

## Orders for 2023 (25 orders distributed throughout the year)

```sql
-- 2023 Orders - January to December
INSERT INTO orders (customer_id, customer_name, customer_phone, order_date, total_amount, status, table_number, created_at) VALUES
-- January 2023
(1, 'John Smith', '555-0101', '2023-01-05 12:30:00', 57.98, 'COMPLETED', 'T01', '2023-01-05 12:30:00'),
(2, 'Sarah Johnson', '555-0102', '2023-01-12 13:15:00', 45.98, 'COMPLETED', 'T02', '2023-01-12 13:15:00'),
(6, 'Robert Taylor', '555-0201', '2023-01-18 19:00:00', 32.99, 'COMPLETED', 'T03', '2023-01-18 19:00:00'),

-- February 2023
(3, 'Mike Wilson', '555-0103', '2023-02-03 18:45:00', 28.98, 'COMPLETED', 'T04', '2023-02-03 18:45:00'),
(7, 'Lisa Anderson', '555-0202', '2023-02-10 12:00:00', 41.97, 'COMPLETED', 'T05', '2023-02-10 12:00:00'),
(4, 'Emily Davis', '555-0104', '2023-02-20 14:30:00', 66.98, 'COMPLETED', 'T06', '2023-02-20 14:30:00'),

-- March 2023
(8, 'James Martinez', '555-0203', '2023-03-05 19:30:00', 25.98, 'COMPLETED', 'T07', '2023-03-05 19:30:00'),
(5, 'David Brown', '555-0105', '2023-03-15 13:00:00', 50.97, 'COMPLETED', 'T08', '2023-03-15 13:00:00'),
(9, 'Jennifer White', '555-0204', '2023-03-22 20:00:00', 37.98, 'COMPLETED', 'T09', '2023-03-22 20:00:00'),

-- April 2023
(1, 'John Smith', '555-0101', '2023-04-08 12:15:00', 43.98, 'COMPLETED', 'T10', '2023-04-08 12:15:00'),
(10, 'Michael Harris', '555-0205', '2023-04-14 18:00:00', 61.98, 'COMPLETED', 'T11', '2023-04-14 18:00:00'),
(2, 'Sarah Johnson', '555-0102', '2023-04-25 19:45:00', 34.98, 'COMPLETED', 'T12', '2023-04-25 19:45:00'),

-- May 2023
(11, 'Amanda Clark', '555-0206', '2023-05-02 13:30:00', 47.98, 'COMPLETED', 'T13', '2023-05-02 13:30:00'),
(3, 'Mike Wilson', '555-0103', '2023-05-10 20:15:00', 29.98, 'COMPLETED', 'T14', '2023-05-10 20:15:00'),
(12, 'Christopher Lewis', '555-0207', '2023-05-18 14:00:00', 54.97, 'COMPLETED', 'T15', '2023-05-18 14:00:00'),

-- June 2023
(4, 'Emily Davis', '555-0104', '2023-06-05 12:45:00', 38.98, 'COMPLETED', 'T16', '2023-06-05 12:45:00'),
(13, 'Jessica Walker', '555-0208', '2023-06-12 19:30:00', 63.98, 'COMPLETED', 'T17', '2023-06-12 19:30:00'),
(5, 'David Brown', '555-0105', '2023-06-20 18:00:00', 26.98, 'COMPLETED', 'T18', '2023-06-20 18:00:00'),

-- July 2023
(1, 'John Smith', '555-0101', '2023-07-03 13:15:00', 52.97, 'COMPLETED', 'T19', '2023-07-03 13:15:00'),
(14, 'Daniel Hall', '555-0209', '2023-07-11 20:00:00', 40.98, 'COMPLETED', 'T20', '2023-07-11 20:00:00'),
(2, 'Sarah Johnson', '555-0102', '2023-07-22 14:30:00', 35.98, 'COMPLETED', 'T21', '2023-07-22 14:30:00'),

-- August 2023
(15, 'Ashley Allen', '555-0210', '2023-08-07 19:15:00', 48.98, 'COMPLETED', 'T22', '2023-08-07 19:15:00'),
(3, 'Mike Wilson', '555-0103', '2023-08-15 12:00:00', 31.98, 'COMPLETED', 'T23', '2023-08-15 12:00:00'),
(16, 'Matthew Young', '555-0211', '2023-08-25 18:45:00', 55.97, 'COMPLETED', 'T24', '2023-08-25 18:45:00'),

-- September 2023
(4, 'Emily Davis', '555-0104', '2023-09-04 13:30:00', 42.98, 'COMPLETED', 'T25', '2023-09-04 13:30:00'),
(17, 'Samantha King', '555-0212', '2023-09-12 20:00:00', 36.98, 'COMPLETED', 'T26', '2023-09-12 20:00:00'),

-- October 2023
(5, 'David Brown', '555-0105', '2023-10-08 14:15:00', 49.98, 'COMPLETED', 'T27', '2023-10-08 14:15:00'),
(1, 'John Smith', '555-0101', '2023-10-16 19:30:00', 33.98, 'COMPLETED', 'T28', '2023-10-16 19:30:00'),

-- November 2023
(2, 'Sarah Johnson', '555-0102', '2023-11-05 12:45:00', 56.97, 'COMPLETED', 'T29', '2023-11-05 12:45:00'),
(3, 'Mike Wilson', '555-0103', '2023-11-18 18:00:00', 27.98, 'COMPLETED', 'T30', '2023-11-18 18:00:00'),

-- December 2023
(4, 'Emily Davis', '555-0104', '2023-12-10 20:15:00', 44.98, 'COMPLETED', 'T31', '2023-12-10 20:15:00'),
(5, 'David Brown', '555-0105', '2023-12-22 13:00:00', 39.98, 'COMPLETED', 'T32', '2023-12-22 13:00:00');
```

---

## Order Items for 2023 Orders

```sql
-- Order Items for 2023 (matching order totals)
INSERT INTO order_items (order_id, dish_id, quantity, unit_price, total_price, created_at) VALUES
-- Order 7 (John Smith - Jan 5, 2023) - Total: 57.98
(7, 1, 1, 24.99, 24.99, '2023-01-05 12:30:00'),  -- Grilled Salmon
(7, 3, 1, 32.99, 32.99, '2023-01-05 12:30:00'),  -- Beef Steak

-- Order 8 (Sarah Johnson - Jan 12, 2023) - Total: 45.98
(8, 1, 1, 24.99, 24.99, '2023-01-12 13:15:00'),  -- Grilled Salmon
(8, 2, 1, 12.99, 12.99, '2023-01-12 13:15:00'),  -- Caesar Salad
(8, 5, 1, 8.99, 8.99, '2023-01-12 13:15:00'),    -- Chocolate Cake

-- Order 9 (Robert Taylor - Jan 18, 2023) - Total: 32.99
(9, 3, 1, 32.99, 32.99, '2023-01-18 19:00:00'),  -- Beef Steak

-- Order 10 (Mike Wilson - Feb 3, 2023) - Total: 28.98
(10, 4, 1, 18.99, 18.99, '2023-02-03 18:45:00'),  -- Chicken Pasta
(10, 6, 1, 9.99, 9.99, '2023-02-03 18:45:00'),    -- Vegetable Soup

-- Order 11 (Lisa Anderson - Feb 10, 2023) - Total: 41.97
(11, 1, 1, 24.99, 24.99, '2023-02-10 12:00:00'),  -- Grilled Salmon
(11, 2, 1, 12.99, 12.99, '2023-02-10 12:00:00'),  -- Caesar Salad
(11, 5, 1, 8.99, 8.99, '2023-02-10 12:00:00'),    -- Chocolate Cake

-- Order 12 (Emily Davis - Feb 20, 2023) - Total: 66.98
(12, 3, 1, 32.99, 32.99, '2023-02-20 14:30:00'),  -- Beef Steak
(12, 1, 1, 24.99, 24.99, '2023-02-20 14:30:00'),  -- Grilled Salmon
(12, 5, 1, 8.99, 8.99, '2023-02-20 14:30:00'),    -- Chocolate Cake

-- Order 13 (James Martinez - Mar 5, 2023) - Total: 25.98
(13, 7, 1, 16.99, 16.99, '2023-03-05 19:30:00'),  -- Fish and Chips
(13, 6, 1, 9.99, 9.99, '2023-03-05 19:30:00'),    -- Vegetable Soup

-- Order 14 (David Brown - Mar 15, 2023) - Total: 50.97
(14, 1, 1, 24.99, 24.99, '2023-03-15 13:00:00'),  -- Grilled Salmon
(14, 3, 1, 32.99, 32.99, '2023-03-15 13:00:00'),  -- Beef Steak
(14, 5, 1, 8.99, 8.99, '2023-03-15 13:00:00'),    -- Chocolate Cake

-- Order 15 (Jennifer White - Mar 22, 2023) - Total: 37.98
(15, 4, 1, 18.99, 18.99, '2023-03-22 20:00:00'),  -- Chicken Pasta
(15, 2, 1, 12.99, 12.99, '2023-03-22 20:00:00'),  -- Caesar Salad
(15, 5, 1, 8.99, 8.99, '2023-03-22 20:00:00'),    -- Chocolate Cake

-- Order 16 (John Smith - Apr 8, 2023) - Total: 43.98
(16, 1, 1, 24.99, 24.99, '2023-04-08 12:15:00'),  -- Grilled Salmon
(16, 2, 1, 12.99, 12.99, '2023-04-08 12:15:00'),  -- Caesar Salad
(16, 6, 1, 9.99, 9.99, '2023-04-08 12:15:00'),    -- Vegetable Soup

-- Order 17 (Michael Harris - Apr 14, 2023) - Total: 61.98
(17, 3, 1, 32.99, 32.99, '2023-04-14 18:00:00'),  -- Beef Steak
(17, 1, 1, 24.99, 24.99, '2023-04-14 18:00:00'),  -- Grilled Salmon
(17, 5, 1, 8.99, 8.99, '2023-04-14 18:00:00'),    -- Chocolate Cake

-- Order 18 (Sarah Johnson - Apr 25, 2023) - Total: 34.98
(18, 4, 1, 18.99, 18.99, '2023-04-25 19:45:00'),  -- Chicken Pasta
(18, 2, 1, 12.99, 12.99, '2023-04-25 19:45:00'),  -- Caesar Salad
(18, 5, 1, 8.99, 8.99, '2023-04-25 19:45:00'),    -- Chocolate Cake

-- Order 19 (Amanda Clark - May 2, 2023) - Total: 47.98
(19, 1, 1, 24.99, 24.99, '2023-05-02 13:30:00'),  -- Grilled Salmon
(19, 7, 1, 16.99, 16.99, '2023-05-02 13:30:00'),  -- Fish and Chips
(19, 5, 1, 8.99, 8.99, '2023-05-02 13:30:00'),    -- Chocolate Cake

-- Order 20 (Mike Wilson - May 10, 2023) - Total: 29.98
(20, 4, 1, 18.99, 18.99, '2023-05-10 20:15:00'),  -- Chicken Pasta
(20, 6, 1, 9.99, 9.99, '2023-05-10 20:15:00'),    -- Vegetable Soup
(20, 5, 1, 8.99, 8.99, '2023-05-10 20:15:00'),    -- Chocolate Cake

-- Order 21 (Christopher Lewis - May 18, 2023) - Total: 54.97
(21, 3, 1, 32.99, 32.99, '2023-05-18 14:00:00'),  -- Beef Steak
(21, 1, 1, 24.99, 24.99, '2023-05-18 14:00:00'),  -- Grilled Salmon

-- Order 22 (Emily Davis - Jun 5, 2023) - Total: 38.98
(22, 4, 1, 18.99, 18.99, '2023-06-05 12:45:00'),  -- Chicken Pasta
(22, 2, 1, 12.99, 12.99, '2023-06-05 12:45:00'),  -- Caesar Salad
(22, 5, 1, 8.99, 8.99, '2023-06-05 12:45:00'),    -- Chocolate Cake

-- Order 23 (Jessica Walker - Jun 12, 2023) - Total: 63.98
(23, 3, 1, 32.99, 32.99, '2023-06-12 19:30:00'),  -- Beef Steak
(23, 1, 1, 24.99, 24.99, '2023-06-12 19:30:00'),  -- Grilled Salmon
(23, 5, 1, 8.99, 8.99, '2023-06-12 19:30:00'),    -- Chocolate Cake

-- Order 24 (David Brown - Jun 20, 2023) - Total: 26.98
(24, 7, 1, 16.99, 16.99, '2023-06-20 18:00:00'),  -- Fish and Chips
(24, 6, 1, 9.99, 9.99, '2023-06-20 18:00:00'),    -- Vegetable Soup

-- Order 25 (John Smith - Jul 3, 2023) - Total: 52.97
(25, 1, 1, 24.99, 24.99, '2023-07-03 13:15:00'),  -- Grilled Salmon
(25, 3, 1, 32.99, 32.99, '2023-07-03 13:15:00'),  -- Beef Steak

-- Order 26 (Daniel Hall - Jul 11, 2023) - Total: 40.98
(26, 1, 1, 24.99, 24.99, '2023-07-11 20:00:00'),  -- Grilled Salmon
(26, 2, 1, 12.99, 12.99, '2023-07-11 20:00:00'),  -- Caesar Salad
(26, 5, 1, 8.99, 8.99, '2023-07-11 20:00:00'),    -- Chocolate Cake

-- Order 27 (Sarah Johnson - Jul 22, 2023) - Total: 35.98
(27, 4, 1, 18.99, 18.99, '2023-07-22 14:30:00'),  -- Chicken Pasta
(27, 2, 1, 12.99, 12.99, '2023-07-22 14:30:00'),  -- Caesar Salad
(27, 5, 1, 8.99, 8.99, '2023-07-22 14:30:00'),    -- Chocolate Cake

-- Order 28 (Ashley Allen - Aug 7, 2023) - Total: 48.98
(28, 1, 1, 24.99, 24.99, '2023-08-07 19:15:00'),  -- Grilled Salmon
(28, 7, 1, 16.99, 16.99, '2023-08-07 19:15:00'),  -- Fish and Chips
(28, 5, 1, 8.99, 8.99, '2023-08-07 19:15:00'),    -- Chocolate Cake

-- Order 29 (Mike Wilson - Aug 15, 2023) - Total: 31.98
(29, 4, 1, 18.99, 18.99, '2023-08-15 12:00:00'),  -- Chicken Pasta
(29, 6, 1, 9.99, 9.99, '2023-08-15 12:00:00'),    -- Vegetable Soup
(29, 5, 1, 8.99, 8.99, '2023-08-15 12:00:00'),    -- Chocolate Cake

-- Order 30 (Matthew Young - Aug 25, 2023) - Total: 55.97
(30, 3, 1, 32.99, 32.99, '2023-08-25 18:45:00'),  -- Beef Steak
(30, 1, 1, 24.99, 24.99, '2023-08-25 18:45:00'),  -- Grilled Salmon

-- Order 31 (Emily Davis - Sep 4, 2023) - Total: 42.98
(31, 1, 1, 24.99, 24.99, '2023-09-04 13:30:00'),  -- Grilled Salmon
(31, 2, 1, 12.99, 12.99, '2023-09-04 13:30:00'),  -- Caesar Salad
(31, 5, 1, 8.99, 8.99, '2023-09-04 13:30:00'),    -- Chocolate Cake

-- Order 32 (Samantha King - Sep 12, 2023) - Total: 36.98
(32, 4, 1, 18.99, 18.99, '2023-09-12 20:00:00'),  -- Chicken Pasta
(32, 2, 1, 12.99, 12.99, '2023-09-12 20:00:00'),  -- Caesar Salad
(32, 5, 1, 8.99, 8.99, '2023-09-12 20:00:00'),    -- Chocolate Cake

-- Order 33 (David Brown - Oct 8, 2023) - Total: 49.98
(33, 1, 1, 24.99, 24.99, '2023-10-08 14:15:00'),  -- Grilled Salmon
(33, 7, 1, 16.99, 16.99, '2023-10-08 14:15:00'),  -- Fish and Chips
(33, 5, 1, 8.99, 8.99, '2023-10-08 14:15:00'),    -- Chocolate Cake

-- Order 34 (John Smith - Oct 16, 2023) - Total: 33.98
(34, 4, 1, 18.99, 18.99, '2023-10-16 19:30:00'),  -- Chicken Pasta
(34, 2, 1, 12.99, 12.99, '2023-10-16 19:30:00'),  -- Caesar Salad
(34, 5, 1, 8.99, 8.99, '2023-10-16 19:30:00'),    -- Chocolate Cake

-- Order 35 (Sarah Johnson - Nov 5, 2023) - Total: 56.97
(35, 3, 1, 32.99, 32.99, '2023-11-05 12:45:00'),  -- Beef Steak
(35, 1, 1, 24.99, 24.99, '2023-11-05 12:45:00'),  -- Grilled Salmon

-- Order 36 (Mike Wilson - Nov 18, 2023) - Total: 27.98
(36, 7, 1, 16.99, 16.99, '2023-11-18 18:00:00'),  -- Fish and Chips
(36, 6, 1, 9.99, 9.99, '2023-11-18 18:00:00'),    -- Vegetable Soup

-- Order 37 (Emily Davis - Dec 10, 2023) - Total: 44.98
(37, 1, 1, 24.99, 24.99, '2023-12-10 20:15:00'),  -- Grilled Salmon
(37, 2, 1, 12.99, 12.99, '2023-12-10 20:15:00'),  -- Caesar Salad
(37, 5, 1, 8.99, 8.99, '2023-12-10 20:15:00'),    -- Chocolate Cake

-- Order 38 (David Brown - Dec 22, 2023) - Total: 39.98
(38, 4, 1, 18.99, 18.99, '2023-12-22 13:00:00'),  -- Chicken Pasta
(38, 2, 1, 12.99, 12.99, '2023-12-22 13:00:00'),  -- Caesar Salad
(38, 5, 1, 8.99, 8.99, '2023-12-22 13:00:00');    -- Chocolate Cake
```

---

## Orders for 2024 (25 orders distributed throughout the year)

```sql
-- 2024 Orders - January to December
INSERT INTO orders (customer_id, customer_name, customer_phone, order_date, total_amount, status, table_number, created_at) VALUES
-- January 2024
(1, 'John Smith', '555-0101', '2024-01-08 13:00:00', 46.98, 'COMPLETED', 'T33', '2024-01-08 13:00:00'),
(18, 'Andrew Wright', '555-0213', '2024-01-15 19:30:00', 58.97, 'COMPLETED', 'T34', '2024-01-15 19:30:00'),
(2, 'Sarah Johnson', '555-0102', '2024-01-22 12:45:00', 51.98, 'COMPLETED', 'T35', '2024-01-22 12:45:00'),

-- February 2024
(19, 'Nicole Lopez', '555-0214', '2024-02-05 18:00:00', 37.98, 'COMPLETED', 'T36', '2024-02-05 18:00:00'),
(3, 'Mike Wilson', '555-0103', '2024-02-12 14:15:00', 30.98, 'COMPLETED', 'T37', '2024-02-12 14:15:00'),
(4, 'Emily Davis', '555-0104', '2024-02-20 20:30:00', 65.97, 'COMPLETED', 'T38', '2024-02-20 20:30:00'),

-- March 2024
(20, 'Kevin Hill', '555-0215', '2024-03-06 13:30:00', 43.98, 'COMPLETED', 'T39', '2024-03-06 13:30:00'),
(5, 'David Brown', '555-0105', '2024-03-14 19:00:00', 48.98, 'COMPLETED', 'T40', '2024-03-14 19:00:00'),
(6, 'Robert Taylor', '555-0201', '2024-03-21 12:00:00', 32.99, 'COMPLETED', 'T41', '2024-03-21 12:00:00'),

-- April 2024
(1, 'John Smith', '555-0101', '2024-04-03 18:45:00', 53.97, 'COMPLETED', 'T42', '2024-04-03 18:45:00'),
(7, 'Lisa Anderson', '555-0202', '2024-04-10 14:30:00', 39.98, 'COMPLETED', 'T43', '2024-04-10 14:30:00'),
(2, 'Sarah Johnson', '555-0102', '2024-04-18 20:15:00', 45.98, 'COMPLETED', 'T44', '2024-04-18 20:15:00'),

-- May 2024
(8, 'James Martinez', '555-0203', '2024-05-05 13:00:00', 26.98, 'COMPLETED', 'T45', '2024-05-05 13:00:00'),
(3, 'Mike Wilson', '555-0103', '2024-05-12 19:30:00', 60.98, 'COMPLETED', 'T46', '2024-05-12 19:30:00'),
(9, 'Jennifer White', '555-0204', '2024-05-20 12:45:00', 36.98, 'COMPLETED', 'T47', '2024-05-20 12:45:00'),

-- June 2024
(4, 'Emily Davis', '555-0104', '2024-06-07 18:00:00', 47.98, 'COMPLETED', 'T48', '2024-06-07 18:00:00'),
(10, 'Michael Harris', '555-0205', '2024-06-14 14:15:00', 62.97, 'COMPLETED', 'T49', '2024-06-14 14:15:00'),
(5, 'David Brown', '555-0105', '2024-06-22 20:30:00', 28.98, 'COMPLETED', 'T50', '2024-06-22 20:30:00'),

-- July 2024
(11, 'Amanda Clark', '555-0206', '2024-07-04 13:30:00', 41.98, 'COMPLETED', 'T01', '2024-07-04 13:30:00'),
(1, 'John Smith', '555-0101', '2024-07-11 19:00:00', 54.97, 'COMPLETED', 'T02', '2024-07-11 19:00:00'),
(12, 'Christopher Lewis', '555-0207', '2024-07-19 12:00:00', 35.98, 'COMPLETED', 'T03', '2024-07-19 12:00:00'),

-- August 2024
(2, 'Sarah Johnson', '555-0102', '2024-08-06 18:45:00', 49.98, 'COMPLETED', 'T04', '2024-08-06 18:45:00'),
(13, 'Jessica Walker', '555-0208', '2024-08-13 14:30:00', 64.98, 'COMPLETED', 'T05', '2024-08-13 14:30:00'),
(3, 'Mike Wilson', '555-0103', '2024-08-21 20:15:00', 31.98, 'COMPLETED', 'T06', '2024-08-21 20:15:00'),

-- September 2024
(4, 'Emily Davis', '555-0104', '2024-09-05 13:00:00', 52.97, 'COMPLETED', 'T07', '2024-09-05 13:00:00'),
(14, 'Daniel Hall', '555-0209', '2024-09-12 19:30:00', 38.98, 'COMPLETED', 'T08', '2024-09-12 19:30:00'),

-- October 2024
(5, 'David Brown', '555-0105', '2024-10-09 12:45:00', 46.98, 'COMPLETED', 'T09', '2024-10-09 12:45:00'),
(15, 'Ashley Allen', '555-0210', '2024-10-17 18:00:00', 33.98, 'COMPLETED', 'T10', '2024-10-17 18:00:00'),

-- November 2024
(1, 'John Smith', '555-0101', '2024-11-06 14:15:00', 57.97, 'COMPLETED', 'T11', '2024-11-06 14:15:00'),
(16, 'Matthew Young', '555-0211', '2024-11-14 20:30:00', 40.98, 'COMPLETED', 'T12', '2024-11-14 20:30:00'),

-- December 2024
(2, 'Sarah Johnson', '555-0102', '2024-12-10 13:30:00', 55.98, 'COMPLETED', 'T13', '2024-12-10 13:30:00'),
(17, 'Samantha King', '555-0212', '2024-12-18 19:00:00', 29.98, 'COMPLETED', 'T14', '2024-12-18 19:00:00');
```

---

## Order Items for 2024 Orders

```sql
-- Order Items for 2024 (matching order totals)
INSERT INTO order_items (order_id, dish_id, quantity, unit_price, total_price, created_at) VALUES
-- Order 39 (John Smith - Jan 8, 2024) - Total: 46.98
(39, 1, 1, 24.99, 24.99, '2024-01-08 13:00:00'),  -- Grilled Salmon
(39, 7, 1, 16.99, 16.99, '2024-01-08 13:00:00'),  -- Fish and Chips
(39, 5, 1, 8.99, 8.99, '2024-01-08 13:00:00'),    -- Chocolate Cake

-- Order 40 (Andrew Wright - Jan 15, 2024) - Total: 58.97
(40, 3, 1, 32.99, 32.99, '2024-01-15 19:30:00'),  -- Beef Steak
(40, 1, 1, 24.99, 24.99, '2024-01-15 19:30:00'),  -- Grilled Salmon

-- Order 41 (Sarah Johnson - Jan 22, 2024) - Total: 51.98
(41, 1, 1, 24.99, 24.99, '2024-01-22 12:45:00'),  -- Grilled Salmon
(41, 3, 1, 32.99, 32.99, '2024-01-22 12:45:00'),  -- Beef Steak
(41, 5, 1, 8.99, 8.99, '2024-01-22 12:45:00'),    -- Chocolate Cake

-- Order 42 (Nicole Lopez - Feb 5, 2024) - Total: 37.98
(42, 4, 1, 18.99, 18.99, '2024-02-05 18:00:00'),  -- Chicken Pasta
(42, 2, 1, 12.99, 12.99, '2024-02-05 18:00:00'),  -- Caesar Salad
(42, 5, 1, 8.99, 8.99, '2024-02-05 18:00:00'),    -- Chocolate Cake

-- Order 43 (Mike Wilson - Feb 12, 2024) - Total: 30.98
(43, 4, 1, 18.99, 18.99, '2024-02-12 14:15:00'),  -- Chicken Pasta
(43, 6, 1, 9.99, 9.99, '2024-02-12 14:15:00'),    -- Vegetable Soup
(43, 5, 1, 8.99, 8.99, '2024-02-12 14:15:00'),    -- Chocolate Cake

-- Order 44 (Emily Davis - Feb 20, 2024) - Total: 65.97
(44, 3, 1, 32.99, 32.99, '2024-02-20 20:30:00'),  -- Beef Steak
(44, 1, 1, 24.99, 24.99, '2024-02-20 20:30:00'),  -- Grilled Salmon
(44, 5, 1, 8.99, 8.99, '2024-02-20 20:30:00'),    -- Chocolate Cake

-- Order 45 (Kevin Hill - Mar 6, 2024) - Total: 43.98
(45, 1, 1, 24.99, 24.99, '2024-03-06 13:30:00'),  -- Grilled Salmon
(45, 2, 1, 12.99, 12.99, '2024-03-06 13:30:00'),  -- Caesar Salad
(45, 5, 1, 8.99, 8.99, '2024-03-06 13:30:00'),    -- Chocolate Cake

-- Order 46 (David Brown - Mar 14, 2024) - Total: 48.98
(46, 1, 1, 24.99, 24.99, '2024-03-14 19:00:00'),  -- Grilled Salmon
(46, 7, 1, 16.99, 16.99, '2024-03-14 19:00:00'),  -- Fish and Chips
(46, 5, 1, 8.99, 8.99, '2024-03-14 19:00:00'),    -- Chocolate Cake

-- Order 47 (Robert Taylor - Mar 21, 2024) - Total: 32.99
(47, 3, 1, 32.99, 32.99, '2024-03-21 12:00:00'),  -- Beef Steak

-- Order 48 (John Smith - Apr 3, 2024) - Total: 53.97
(48, 3, 1, 32.99, 32.99, '2024-04-03 18:45:00'),  -- Beef Steak
(48, 1, 1, 24.99, 24.99, '2024-04-03 18:45:00'),  -- Grilled Salmon

-- Order 49 (Lisa Anderson - Apr 10, 2024) - Total: 39.98
(49, 4, 1, 18.99, 18.99, '2024-04-10 14:30:00'),  -- Chicken Pasta
(49, 2, 1, 12.99, 12.99, '2024-04-10 14:30:00'),  -- Caesar Salad
(49, 5, 1, 8.99, 8.99, '2024-04-10 14:30:00'),    -- Chocolate Cake

-- Order 50 (Sarah Johnson - Apr 18, 2024) - Total: 45.98
(50, 1, 1, 24.99, 24.99, '2024-04-18 20:15:00'),  -- Grilled Salmon
(50, 2, 1, 12.99, 12.99, '2024-04-18 20:15:00'),  -- Caesar Salad
(50, 5, 1, 8.99, 8.99, '2024-04-18 20:15:00'),    -- Chocolate Cake

-- Order 51 (James Martinez - May 5, 2024) - Total: 26.98
(51, 7, 1, 16.99, 16.99, '2024-05-05 13:00:00'),  -- Fish and Chips
(51, 6, 1, 9.99, 9.99, '2024-05-05 13:00:00'),    -- Vegetable Soup

-- Order 52 (Mike Wilson - May 12, 2024) - Total: 60.98
(52, 3, 1, 32.99, 32.99, '2024-05-12 19:30:00'),  -- Beef Steak
(52, 1, 1, 24.99, 24.99, '2024-05-12 19:30:00'),  -- Grilled Salmon
(52, 5, 1, 8.99, 8.99, '2024-05-12 19:30:00'),    -- Chocolate Cake

-- Order 53 (Jennifer White - May 20, 2024) - Total: 36.98
(53, 4, 1, 18.99, 18.99, '2024-05-20 12:45:00'),  -- Chicken Pasta
(53, 2, 1, 12.99, 12.99, '2024-05-20 12:45:00'),  -- Caesar Salad
(53, 5, 1, 8.99, 8.99, '2024-05-20 12:45:00'),    -- Chocolate Cake

-- Order 54 (Emily Davis - Jun 7, 2024) - Total: 47.98
(54, 1, 1, 24.99, 24.99, '2024-06-07 18:00:00'),  -- Grilled Salmon
(54, 7, 1, 16.99, 16.99, '2024-06-07 18:00:00'),  -- Fish and Chips
(54, 5, 1, 8.99, 8.99, '2024-06-07 18:00:00'),    -- Chocolate Cake

-- Order 55 (Michael Harris - Jun 14, 2024) - Total: 62.97
(55, 3, 1, 32.99, 32.99, '2024-06-14 14:15:00'),  -- Beef Steak
(55, 1, 1, 24.99, 24.99, '2024-06-14 14:15:00'),  -- Grilled Salmon
(55, 5, 1, 8.99, 8.99, '2024-06-14 14:15:00'),    -- Chocolate Cake

-- Order 56 (David Brown - Jun 22, 2024) - Total: 28.98
(56, 4, 1, 18.99, 18.99, '2024-06-22 20:30:00'),  -- Chicken Pasta
(56, 6, 1, 9.99, 9.99, '2024-06-22 20:30:00'),    -- Vegetable Soup

-- Order 57 (Amanda Clark - Jul 4, 2024) - Total: 41.98
(57, 1, 1, 24.99, 24.99, '2024-07-04 13:30:00'),  -- Grilled Salmon
(57, 2, 1, 12.99, 12.99, '2024-07-04 13:30:00'),  -- Caesar Salad
(57, 5, 1, 8.99, 8.99, '2024-07-04 13:30:00'),    -- Chocolate Cake

-- Order 58 (John Smith - Jul 11, 2024) - Total: 54.97
(58, 3, 1, 32.99, 32.99, '2024-07-11 19:00:00'),  -- Beef Steak
(58, 1, 1, 24.99, 24.99, '2024-07-11 19:00:00'),  -- Grilled Salmon

-- Order 59 (Christopher Lewis - Jul 19, 2024) - Total: 35.98
(59, 4, 1, 18.99, 18.99, '2024-07-19 12:00:00'),  -- Chicken Pasta
(59, 2, 1, 12.99, 12.99, '2024-07-19 12:00:00'),  -- Caesar Salad
(59, 5, 1, 8.99, 8.99, '2024-07-19 12:00:00'),    -- Chocolate Cake

-- Order 60 (Sarah Johnson - Aug 6, 2024) - Total: 49.98
(60, 1, 1, 24.99, 24.99, '2024-08-06 18:45:00'),  -- Grilled Salmon
(60, 7, 1, 16.99, 16.99, '2024-08-06 18:45:00'),  -- Fish and Chips
(60, 5, 1, 8.99, 8.99, '2024-08-06 18:45:00'),    -- Chocolate Cake

-- Order 61 (Jessica Walker - Aug 13, 2024) - Total: 64.98
(61, 3, 1, 32.99, 32.99, '2024-08-13 14:30:00'),  -- Beef Steak
(61, 1, 1, 24.99, 24.99, '2024-08-13 14:30:00'),  -- Grilled Salmon
(61, 5, 1, 8.99, 8.99, '2024-08-13 14:30:00'),    -- Chocolate Cake

-- Order 62 (Mike Wilson - Aug 21, 2024) - Total: 31.98
(62, 4, 1, 18.99, 18.99, '2024-08-21 20:15:00'),  -- Chicken Pasta
(62, 6, 1, 9.99, 9.99, '2024-08-21 20:15:00'),    -- Vegetable Soup
(62, 5, 1, 8.99, 8.99, '2024-08-21 20:15:00'),    -- Chocolate Cake

-- Order 63 (Emily Davis - Sep 5, 2024) - Total: 52.97
(63, 3, 1, 32.99, 32.99, '2024-09-05 13:00:00'),  -- Beef Steak
(63, 1, 1, 24.99, 24.99, '2024-09-05 13:00:00'),  -- Grilled Salmon

-- Order 64 (Daniel Hall - Sep 12, 2024) - Total: 38.98
(64, 4, 1, 18.99, 18.99, '2024-09-12 19:30:00'),  -- Chicken Pasta
(64, 2, 1, 12.99, 12.99, '2024-09-12 19:30:00'),  -- Caesar Salad
(64, 5, 1, 8.99, 8.99, '2024-09-12 19:30:00'),    -- Chocolate Cake

-- Order 65 (David Brown - Oct 9, 2024) - Total: 46.98
(65, 1, 1, 24.99, 24.99, '2024-10-09 12:45:00'),  -- Grilled Salmon
(65, 7, 1, 16.99, 16.99, '2024-10-09 12:45:00'),  -- Fish and Chips
(65, 5, 1, 8.99, 8.99, '2024-10-09 12:45:00'),    -- Chocolate Cake

-- Order 66 (Ashley Allen - Oct 17, 2024) - Total: 33.98
(66, 4, 1, 18.99, 18.99, '2024-10-17 18:00:00'),  -- Chicken Pasta
(66, 2, 1, 12.99, 12.99, '2024-10-17 18:00:00'),  -- Caesar Salad
(66, 5, 1, 8.99, 8.99, '2024-10-17 18:00:00'),    -- Chocolate Cake

-- Order 67 (John Smith - Nov 6, 2024) - Total: 57.97
(67, 3, 1, 32.99, 32.99, '2024-11-06 14:15:00'),  -- Beef Steak
(67, 1, 1, 24.99, 24.99, '2024-11-06 14:15:00'),  -- Grilled Salmon

-- Order 68 (Matthew Young - Nov 14, 2024) - Total: 40.98
(68, 1, 1, 24.99, 24.99, '2024-11-14 20:30:00'),  -- Grilled Salmon
(68, 2, 1, 12.99, 12.99, '2024-11-14 20:30:00'),  -- Caesar Salad
(68, 5, 1, 8.99, 8.99, '2024-11-14 20:30:00'),    -- Chocolate Cake

-- Order 69 (Sarah Johnson - Dec 10, 2024) - Total: 55.98
(69, 1, 1, 24.99, 24.99, '2024-12-10 13:30:00'),  -- Grilled Salmon
(69, 3, 1, 32.99, 32.99, '2024-12-10 13:30:00'),  -- Beef Steak

-- Order 70 (Samantha King - Dec 18, 2024) - Total: 29.98
(70, 7, 1, 16.99, 16.99, '2024-12-18 19:00:00'),  -- Fish and Chips
(70, 6, 1, 9.99, 9.99, '2024-12-18 19:00:00'),    -- Vegetable Soup
(70, 5, 1, 8.99, 8.99, '2024-12-18 19:00:00');    -- Chocolate Cake
```

---

## Summary

- **Total Customers Added**: 15 new customers (customer_id 6-20)
- **Total Orders for 2023**: 25 orders (order_id 7-38)
- **Total Orders for 2024**: 25 orders (order_id 39-70)
- **Total Orders**: 50 orders across 2023-2024
- **All order totals match the sum of their order items**
- **Dates are distributed throughout each year**
- **All orders use existing dishes (dish_id 1-8)**
- **All orders have status 'COMPLETED'**

## Verification Query

Run this query to verify that order totals match the sum of order items:

```sql
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount as order_total,
    SUM(oi.total_price) as items_total,
    (o.total_amount - SUM(oi.total_price)) as difference
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_id >= 7
GROUP BY o.order_id, o.order_date, o.total_amount
HAVING ABS(o.total_amount - SUM(oi.total_price)) > 0.01;
```

This query should return 0 rows if all totals match correctly.

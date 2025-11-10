-- Restaurant Management System Database Schema (SQLite)
-- Created for the two modules: Customer Search and Management Statistics
-- Note: This file is for reference only. The actual database is created automatically by the DAO class.

-- Create dishes table
CREATE TABLE dishes (
    dish_id INT AUTO_INCREMENT PRIMARY KEY,
    dish_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(100),
    image_url VARCHAR(500),
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(20),
    email VARCHAR(255),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(20),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('PENDING', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    table_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    dish_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (dish_id) REFERENCES dishes(dish_id) ON DELETE CASCADE
);

-- Create users table for management staff
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    position ENUM('MANAGER', 'SALE_STAFF', 'WAREHOUSE_STAFF', 'ADMIN') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample dishes
INSERT INTO dishes (dish_name, description, price, category, image_url, is_available) VALUES
('Grilled Salmon', 'Fresh Atlantic salmon grilled to perfection with herbs and lemon', 24.99, 'Main Course', 'https://example.com/salmon.jpg', TRUE),
('Caesar Salad', 'Crisp romaine lettuce with parmesan cheese and croutons', 12.99, 'Salad', 'https://example.com/caesar.jpg', TRUE),
('Beef Steak', 'Premium ribeye steak cooked to your preference', 32.99, 'Main Course', 'https://example.com/steak.jpg', TRUE),
('Chicken Pasta', 'Creamy alfredo pasta with grilled chicken breast', 18.99, 'Pasta', 'https://example.com/pasta.jpg', TRUE),
('Chocolate Cake', 'Rich chocolate cake with vanilla ice cream', 8.99, 'Dessert', 'https://example.com/cake.jpg', TRUE),
('Vegetable Soup', 'Fresh seasonal vegetables in a light broth', 9.99, 'Soup', 'https://example.com/soup.jpg', TRUE),
('Fish and Chips', 'Beer-battered cod with crispy fries', 16.99, 'Main Course', 'https://example.com/fish.jpg', TRUE),
('Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil', 14.99, 'Pizza', 'https://example.com/pizza.jpg', TRUE);

-- Insert sample customers
INSERT INTO customers (customer_name, customer_phone, email, address) VALUES
('John Smith', '555-0101', 'john.smith@email.com', '123 Main St, City'),
('Sarah Johnson', '555-0102', 'sarah.johnson@email.com', '456 Oak Ave, City'),
('Mike Wilson', '555-0103', 'mike.wilson@email.com', '789 Pine Rd, City'),
('Emily Davis', '555-0104', 'emily.davis@email.com', '321 Elm St, City'),
('David Brown', '555-0105', 'david.brown@email.com', '654 Maple Dr, City');

-- Insert sample orders
INSERT INTO orders (customer_id, customer_name, customer_phone, total_amount, status, table_number) VALUES
(1, 'John Smith', '555-0101', 45.98, 'COMPLETED', 'T01'),
(2, 'Sarah Johnson', '555-0102', 32.99, 'COMPLETED', 'T02'),
(3, 'Mike Wilson', '555-0103', 28.98, 'PENDING', 'T03'),
(4, 'Emily Davis', '555-0104', 41.97, 'COMPLETED', 'T04'),
(5, 'David Brown', '555-0105', 25.98, 'COMPLETED', 'T05');

-- Insert sample order items
INSERT INTO order_items (order_id, dish_id, quantity, unit_price, total_price) VALUES
-- Order 1 (John Smith)
(1, 1, 1, 24.99, 24.99),  -- Grilled Salmon
(1, 2, 1, 12.99, 12.99),  -- Caesar Salad
(1, 5, 1, 8.99, 8.99),    -- Chocolate Cake

-- Order 2 (Sarah Johnson)
(2, 3, 1, 32.99, 32.99),  -- Beef Steak

-- Order 3 (Mike Wilson)
(3, 4, 1, 18.99, 18.99),  -- Chicken Pasta
(3, 6, 1, 9.99, 9.99),    -- Vegetable Soup

-- Order 4 (Emily Davis)
(4, 1, 1, 24.99, 24.99),  -- Grilled Salmon
(4, 2, 1, 12.99, 12.99),  -- Caesar Salad
(4, 5, 1, 8.99, 8.99),    -- Chocolate Cake

-- Order 5 (David Brown)
(5, 7, 1, 16.99, 16.99),  -- Fish and Chips
(5, 6, 1, 9.99, 9.99);    -- Vegetable Soup

-- Insert sample users
INSERT INTO users (username, password, name, position) VALUES
('manager', 'password123', 'Restaurant Manager', 'MANAGER'),
('sales', 'password123', 'Sales Staff', 'SALE_STAFF'),
('warehouse', 'password123', 'Warehouse Staff', 'WAREHOUSE_STAFF'),
('admin', 'password123', 'System Administrator', 'ADMIN');

-- Create indexes for better performance
CREATE INDEX idx_dishes_name ON dishes(dish_name);
CREATE INDEX idx_dishes_category ON dishes(category);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_dish ON order_items(dish_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);

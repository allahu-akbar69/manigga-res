package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
    public static Connection con;
    
    public DAO() {
        if (con == null) {
            // MySQL configuration (supports environment variables and system properties)
            String host = firstNonEmpty(
                System.getProperty("DB_HOST"),
                System.getenv("DB_HOST"),
                "127.0.0.1");
            String port = firstNonEmpty(
                System.getProperty("DB_PORT"),
                System.getenv("DB_PORT"),
                "3306");
            String databaseName = firstNonEmpty(
                System.getProperty("DB_NAME"),
                System.getenv("DB_NAME"),
                "restaurant_management");
            String username = firstNonEmpty(
                System.getProperty("DB_USER"),
                System.getenv("DB_USER"),
                "root");
            String password = firstNonEmpty(
                System.getProperty("DB_PASS"),
                System.getenv("DB_PASS"),
                "1");

            String dbClass = "com.mysql.cj.jdbc.Driver";
            String dbUrl = "jdbc:mysql://" + host + ":" + port + "/" + databaseName
                + "?useUnicode=true&characterEncoding=UTF-8"
                + "&useSSL=false&allowPublicKeyRetrieval=true"
                + "&serverTimezone=Asia/Ho_Chi_Minh"
                + "&autoReconnect=true&zeroDateTimeBehavior=CONVERT_TO_NULL";
            
            try {
                Class.forName(dbClass);
                try {
                    con = DriverManager.getConnection(dbUrl, username, password);
                } catch (SQLException ex) {
                    // Unknown database or first run: try to create database then reconnect
                    ensureDatabaseExists(host, port, databaseName, username, password);
                    con = DriverManager.getConnection(dbUrl, username, password);
                }
                createTablesIfNotExist();
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to connect to MySQL database", e);
            }
        }
    }
    
    private void ensureDatabaseExists(String host, String port, String databaseName, String username, String password) {
        String serverUrl = "jdbc:mysql://" + host + ":" + port + "/?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Ho_Chi_Minh";
        try (Connection serverCon = DriverManager.getConnection(serverUrl, username, password);
             Statement stmt = serverCon.createStatement()) {
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName + " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        } catch (SQLException e) {
            throw new RuntimeException("Unable to create or access database '" + databaseName + "'", e);
        }
    }

    private String firstNonEmpty(String a, String b, String fallback) {
        if (a != null && !a.trim().isEmpty()) return a.trim();
        if (b != null && !b.trim().isEmpty()) return b.trim();
        return fallback;
    }
    
    private void createTablesIfNotExist() {
        try {
            Statement stmt = con.createStatement();
            
            // Create dishes table
            String createDishesTable = "CREATE TABLE IF NOT EXISTS dishes (" +
                "dish_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "dish_name VARCHAR(255) NOT NULL, " +
                "description TEXT, " +
                "price DECIMAL(10,2) NOT NULL, " +
                "category VARCHAR(100), " +
                "image_url VARCHAR(500), " +
                "is_available BOOLEAN DEFAULT TRUE, " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                "updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" +
                ")";
            stmt.execute(createDishesTable);
            
            // Create customers table
            String createCustomersTable = "CREATE TABLE IF NOT EXISTS customers (" +
                "customer_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "customer_name VARCHAR(255) NOT NULL, " +
                "customer_phone VARCHAR(20), " +
                "email VARCHAR(255), " +
                "address TEXT, " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                ")";
            stmt.execute(createCustomersTable);
            
            // Create orders table
            String createOrdersTable = "CREATE TABLE IF NOT EXISTS orders (" +
                "order_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "customer_id INT, " +
                "customer_name VARCHAR(255) NOT NULL, " +
                "customer_phone VARCHAR(20), " +
                "order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                "total_amount DECIMAL(10,2) NOT NULL, " +
                "status VARCHAR(50) DEFAULT 'PENDING', " +
                "table_number VARCHAR(20), " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (customer_id) REFERENCES customers(customer_id)" +
                ")";
            stmt.execute(createOrdersTable);
            
            // Create order_items table
            String createOrderItemsTable = "CREATE TABLE IF NOT EXISTS order_items (" +
                "order_item_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "order_id INT NOT NULL, " +
                "dish_id INT NOT NULL, " +
                "quantity INT NOT NULL DEFAULT 1, " +
                "unit_price DECIMAL(10,2) NOT NULL, " +
                "total_price DECIMAL(10,2) NOT NULL, " +
                "dish_name VARCHAR(255) NOT NULL, " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (order_id) REFERENCES orders(order_id), " +
                "FOREIGN KEY (dish_id) REFERENCES dishes(dish_id)" +
                ")";
            stmt.execute(createOrderItemsTable);
            
            // Create users table
            String createUsersTable = "CREATE TABLE IF NOT EXISTS users (" +
                "user_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "username VARCHAR(100) UNIQUE NOT NULL, " +
                "password VARCHAR(255) NOT NULL, " +
                "name VARCHAR(255) NOT NULL, " +
                "position VARCHAR(100) NOT NULL, " +
                "is_active BOOLEAN DEFAULT TRUE, " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                ")";
            stmt.execute(createUsersTable);
            
            // Insert sample data if tables are empty
            insertSampleData(stmt);
            
            // Insert sample orders with proper dates
            insertSampleOrders(stmt);
            
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void insertSampleOrders(Statement stmt) throws SQLException {
        // Check if orders table is empty
        var result = stmt.executeQuery("SELECT COUNT(*) as count FROM orders");
        int orderCount = 0;
        if (result.next()) {
            orderCount = result.getInt("count");
        }
        result.close();
        
        if (orderCount == 0) {
            // Insert sample orders with recent dates
            String insertOrders = "INSERT INTO orders (customer_id, customer_name, customer_phone, order_date, total_amount, status, table_number) VALUES " +
                "(1, 'John Smith', '555-0101', '2024-01-15 12:30:00', 45.98, 'COMPLETED', 'T01'), " +
                "(2, 'Sarah Johnson', '555-0102', '2024-01-16 13:45:00', 32.99, 'COMPLETED', 'T02'), " +
                "(3, 'Mike Wilson', '555-0103', '2024-01-17 14:20:00', 28.98, 'COMPLETED', 'T03'), " +
                "(4, 'Emily Davis', '555-0104', '2024-01-18 15:10:00', 41.97, 'COMPLETED', 'T04'), " +
                "(5, 'David Brown', '555-0105', '2024-01-19 16:30:00', 25.98, 'COMPLETED', 'T05')";
            stmt.execute(insertOrders);
            
            // Insert sample order items
            String insertOrderItems = "INSERT INTO order_items (order_id, dish_id, quantity, unit_price, total_price) VALUES " +
                "(1, 1, 1, 24.99, 24.99), " +  // Grilled Salmon
                "(1, 2, 1, 12.99, 12.99), " +  // Caesar Salad
                "(1, 5, 1, 8.99, 8.99), " +    // Chocolate Cake
                "(2, 3, 1, 32.99, 32.99), " +  // Beef Steak
                "(3, 4, 1, 18.99, 18.99), " +  // Chicken Pasta
                "(3, 6, 1, 9.99, 9.99), " +   // Vegetable Soup
                "(4, 1, 1, 24.99, 24.99), " +  // Grilled Salmon
                "(4, 2, 1, 12.99, 12.99), " +  // Caesar Salad
                "(4, 5, 1, 8.99, 8.99), " +    // Chocolate Cake
                "(5, 7, 1, 16.99, 16.99), " +  // Fish and Chips
                "(5, 6, 1, 9.99, 9.99)";       // Vegetable Soup
            stmt.execute(insertOrderItems);
        }
    }
    
    private void insertSampleData(Statement stmt) throws SQLException {
        // Check if dishes table is empty
        var result = stmt.executeQuery("SELECT COUNT(*) as count FROM dishes");
        int dishCount = 0;
        if (result.next()) {
            dishCount = result.getInt("count");
        }
        result.close();
        
        if (dishCount == 0) {
            // Insert sample dishes
            String insertDishes = "INSERT INTO dishes (dish_name, description, price, category, image_url, is_available) VALUES " +
                "('Grilled Salmon', 'Fresh Atlantic salmon grilled to perfection with herbs and lemon', 24.99, 'Main Course', 'https://example.com/salmon.jpg', 1), " +
                "('Caesar Salad', 'Crisp romaine lettuce with parmesan cheese and croutons', 12.99, 'Salad', 'https://example.com/caesar.jpg', 1), " +
                "('Beef Steak', 'Premium ribeye steak cooked to your preference', 32.99, 'Main Course', 'https://example.com/steak.jpg', 1), " +
                "('Chicken Pasta', 'Creamy alfredo pasta with grilled chicken breast', 18.99, 'Pasta', 'https://example.com/pasta.jpg', 1), " +
                "('Chocolate Cake', 'Rich chocolate cake with vanilla ice cream', 8.99, 'Dessert', 'https://example.com/cake.jpg', 1), " +
                "('Vegetable Soup', 'Fresh seasonal vegetables in a light broth', 9.99, 'Soup', 'https://example.com/soup.jpg', 1), " +
                "('Fish and Chips', 'Beer-battered cod with crispy fries', 16.99, 'Main Course', 'https://example.com/fish.jpg', 1), " +
                "('Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil', 14.99, 'Pizza', 'https://example.com/pizza.jpg', 1)";
            stmt.execute(insertDishes);
            
            // Insert sample customers
            String insertCustomers = "INSERT INTO customers (customer_name, customer_phone, email, address) VALUES " +
                "('John Smith', '555-0101', 'john.smith@email.com', '123 Main St, City'), " +
                "('Sarah Johnson', '555-0102', 'sarah.johnson@email.com', '456 Oak Ave, City'), " +
                "('Mike Wilson', '555-0103', 'mike.wilson@email.com', '789 Pine Rd, City'), " +
                "('Emily Davis', '555-0104', 'emily.davis@email.com', '321 Elm St, City'), " +
                "('David Brown', '555-0105', 'david.brown@email.com', '654 Maple Dr, City')";
            stmt.execute(insertCustomers);
            
            // Insert sample orders
            String insertOrders = "INSERT INTO orders (customer_id, customer_name, customer_phone, total_amount, status, table_number) VALUES " +
                "(1, 'John Smith', '555-0101', 45.98, 'COMPLETED', 'T01'), " +
                "(2, 'Sarah Johnson', '555-0102', 32.99, 'COMPLETED', 'T02'), " +
                "(3, 'Mike Wilson', '555-0103', 28.98, 'PENDING', 'T03'), " +
                "(4, 'Emily Davis', '555-0104', 41.97, 'COMPLETED', 'T04'), " +
                "(5, 'David Brown', '555-0105', 25.98, 'COMPLETED', 'T05')";
            stmt.execute(insertOrders);
            
            // Insert sample order items
            String insertOrderItems = "INSERT INTO order_items (order_id, dish_id, quantity, unit_price, total_price) VALUES " +
                "(1, 1, 1, 24.99, 24.99), " +
                "(1, 2, 1, 12.99, 12.99), " +
                "(1, 5, 1, 8.99, 8.99), " +
                "(2, 3, 1, 32.99, 32.99), " +
                "(3, 4, 1, 18.99, 18.99), " +
                "(3, 6, 1, 9.99, 9.99), " +
                "(4, 1, 1, 24.99, 24.99), " +
                "(4, 2, 1, 12.99, 12.99), " +
                "(4, 5, 1, 8.99, 8.99), " +
                "(5, 7, 1, 16.99, 16.99), " +
                "(5, 6, 1, 9.99, 9.99)";
            stmt.execute(insertOrderItems);
            
            // Insert sample users
            String insertUsers = "INSERT INTO users (username, password, name, position) VALUES " +
                "('manager', 'password123', 'Restaurant Manager', 'MANAGER'), " +
                "('sales', 'password123', 'Sales Staff', 'SALE_STAFF'), " +
                "('warehouse', 'password123', 'Warehouse Staff', 'WAREHOUSE_STAFF'), " +
                "('admin', 'password123', 'System Administrator', 'ADMIN')";
            stmt.execute(insertUsers);
        }
    }
}
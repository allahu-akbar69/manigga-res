package dao;

import model.Order;
import model.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DAO {
    
    public List<Order> getOrdersByDishId(int dishId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT DISTINCT o.* FROM orders o " +
                    "INNER JOIN order_items oi ON o.order_id = oi.order_id " +
                    "WHERE oi.dish_id = ? " +
                    "ORDER BY o.order_date DESC";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, dishId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomerId(rs.getInt("customer_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setCustomerPhone(rs.getString("customer_phone"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getBigDecimal("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setTableNumber(rs.getString("table_number"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return orders;
    }
    
    public Order getOrderDetail(int orderId) {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setCustomerId(rs.getInt("customer_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setCustomerPhone(rs.getString("customer_phone"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getBigDecimal("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setTableNumber(rs.getString("table_number"));
                
                // Get order items
                order.setOrderItems(getOrderItems(orderId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return order;
    }
    
    private List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();
        String sql = "SELECT oi.*, d.dish_name FROM order_items oi " +
                    "INNER JOIN dishes d ON oi.dish_id = d.dish_id " +
                    "WHERE oi.order_id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemId(rs.getInt("order_item_id"));
                orderItem.setOrderId(rs.getInt("order_id"));
                orderItem.setDishId(rs.getInt("dish_id"));
                orderItem.setDishName(rs.getString("dish_name"));
                orderItem.setUnitPrice(rs.getBigDecimal("unit_price")); // Set unitPrice first
                orderItem.setQuantity(rs.getInt("quantity")); // Then set quantity
                // Use the total_price from database if available, otherwise calculate it
                if (rs.getBigDecimal("total_price") != null) {
                    orderItem.setTotalPrice(rs.getBigDecimal("total_price"));
                } else {
                    orderItem.recalculateTotalPrice(); // Calculate if not in database
                }
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return orderItems;
    }
}


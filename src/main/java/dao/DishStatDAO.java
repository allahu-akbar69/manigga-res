package dao;

import model.DishStat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DishStatDAO extends DAO {
    
    public List<DishStat> getDishStatistics(String startDate, String endDate) {
        List<DishStat> dishStats = new ArrayList<>();
        
        // Validate date parameters
        if (startDate == null || startDate.trim().isEmpty() || 
            endDate == null || endDate.trim().isEmpty()) {
            System.err.println("Invalid date parameters: startDate=" + startDate + ", endDate=" + endDate);
            return dishStats;
        }
        
        // Fixed query to handle both order_date and order_items.created_at for date filtering
        String sql = "SELECT d.dish_id, d.dish_name, " +
                    "COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold, " +
                    "COALESCE(SUM(oi.total_price), 0) AS total_revenue, " +
                    "COUNT(DISTINCT oi.order_id) AS total_orders " +
                    "FROM dishes d " +
                    "INNER JOIN order_items oi ON d.dish_id = oi.dish_id " +
                    "INNER JOIN orders o ON oi.order_id = o.order_id " +
                    "WHERE d.is_available = 1 " +
                    "AND DATE(o.order_date) BETWEEN ? AND ? " +
                    "GROUP BY d.dish_id, d.dish_name " +
                    "HAVING total_quantity_sold > 0 " +
                    "ORDER BY total_revenue DESC";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            
            System.out.println("Executing query with dates: " + startDate + " to " + endDate);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                DishStat dishStat = new DishStat();
                dishStat.setDishId(rs.getInt("dish_id"));
                dishStat.setDishName(rs.getString("dish_name"));
                dishStat.setTotalQuantitySold(rs.getInt("total_quantity_sold"));
                dishStat.setTotalRevenue(rs.getBigDecimal("total_revenue"));
                dishStat.setTotalOrders(rs.getInt("total_orders"));
                dishStats.add(dishStat);
            }
            
            System.out.println("Found " + dishStats.size() + " dish statistics for date range");
            
            // If no results, check if there are any orders in the date range at all
            if (dishStats.isEmpty()) {
                checkDataAvailability(startDate, endDate);
            }
            
        } catch (SQLException e) {
            System.err.println("Error executing dish statistics query: " + e.getMessage());
            e.printStackTrace();
        }
        
        return dishStats;
    }
    
    private void checkDataAvailability(String startDate, String endDate) {
        try {
            // Check if there are any orders in the date range (both order_date and order_items.created_at)
            String checkSql = "SELECT " +
                             "COUNT(DISTINCT o.order_id) AS order_count, " +
                             "MIN(o.order_date) AS min_order_date, MAX(o.order_date) AS max_order_date, " +
                             "MIN(oi.created_at) AS min_item_date, MAX(oi.created_at) AS max_item_date " +
                             "FROM orders o " +
                             "INNER JOIN order_items oi ON o.order_id = oi.order_id " +
                             "WHERE DATE(o.order_date) BETWEEN ? AND ?";
            
            try (PreparedStatement ps = con.prepareStatement(checkSql)) {
                ps.setString(1, startDate);
                ps.setString(2, endDate);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    int orderCount = rs.getInt("order_count");
                    String minOrderDate = rs.getString("min_order_date");
                    String maxOrderDate = rs.getString("max_order_date");
                    String minItemDate = rs.getString("min_item_date");
                    String maxItemDate = rs.getString("max_item_date");
                    
                    System.out.println("Date range check: " + startDate + " to " + endDate);
                    System.out.println("Orders found in range: " + orderCount);
                    System.out.println("Order dates - Min: " + minOrderDate + ", Max: " + maxOrderDate);
                    System.out.println("Order item dates - Min: " + minItemDate + ", Max: " + maxItemDate);
                    
                    if (orderCount == 0) {
                        // Check all available dates in database
                        System.out.println("Checking all available dates...");
                        String allOrderDatesSql = "SELECT DISTINCT DATE(order_date) as order_date FROM orders ORDER BY order_date";
                        try (PreparedStatement allPs = con.prepareStatement(allOrderDatesSql)) {
                            ResultSet allRs = allPs.executeQuery();
                            System.out.println("All order dates in database:");
                            while (allRs.next()) {
                                System.out.println("  - Order date: " + allRs.getString("order_date"));
                            }
                        }
                        
                        String allItemDatesSql = "SELECT DISTINCT DATE(created_at) as item_date FROM order_items ORDER BY item_date";
                        try (PreparedStatement allPs = con.prepareStatement(allItemDatesSql)) {
                            ResultSet allRs = allPs.executeQuery();
                            System.out.println("All order item dates in database:");
                            while (allRs.next()) {
                                System.out.println("  - Item date: " + allRs.getString("item_date"));
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking data availability: " + e.getMessage());
        }
    }
}


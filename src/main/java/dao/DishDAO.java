package dao;

import model.Dish;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DishDAO extends DAO {
    
    public List<Dish> getListDishByName(String dishName) {
        List<Dish> dishes = new ArrayList<>();
        String sql = "SELECT * FROM dishes WHERE dish_name LIKE ? AND is_available = 1";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + dishName + "%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Dish dish = new Dish();
                dish.setDishId(rs.getInt("dish_id"));
                dish.setDishName(rs.getString("dish_name"));
                dish.setDescription(rs.getString("description"));
                dish.setPrice(rs.getBigDecimal("price"));
                dish.setCategory(rs.getString("category"));
                dish.setImageUrl(rs.getString("image_url"));
                dish.setAvailable(rs.getBoolean("is_available"));
                dishes.add(dish);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return dishes;
    }
    
    public Dish getDishInfo(int dishId) {
        Dish dish = null;
        String sql = "SELECT * FROM dishes WHERE dish_id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, dishId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                dish = new Dish();
                dish.setDishId(rs.getInt("dish_id"));
                dish.setDishName(rs.getString("dish_name"));
                dish.setDescription(rs.getString("description"));
                dish.setPrice(rs.getBigDecimal("price"));
                dish.setCategory(rs.getString("category"));
                dish.setImageUrl(rs.getString("image_url"));
                dish.setAvailable(rs.getBoolean("is_available"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return dish;
    }
    
    public List<Dish> getAllDishes() {
        List<Dish> dishes = new ArrayList<>();
        String sql = "SELECT * FROM dishes WHERE is_available = 1 ORDER BY dish_name";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Dish dish = new Dish();
                dish.setDishId(rs.getInt("dish_id"));
                dish.setDishName(rs.getString("dish_name"));
                dish.setDescription(rs.getString("description"));
                dish.setPrice(rs.getBigDecimal("price"));
                dish.setCategory(rs.getString("category"));
                dish.setImageUrl(rs.getString("image_url"));
                dish.setAvailable(rs.getBoolean("is_available"));
                dishes.add(dish);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return dishes;
    }
}


package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class DishStat implements Serializable {
    private int dishId;
    private String dishName;
    private int totalQuantitySold;
    private BigDecimal totalRevenue;
    private int totalOrders;
    
    public DishStat() {
        super();
    }
    
    public DishStat(int dishId, String dishName, int totalQuantitySold, BigDecimal totalRevenue, int totalOrders) {
        super();
        this.dishId = dishId;
        this.dishName = dishName;
        this.totalQuantitySold = totalQuantitySold;
        this.totalRevenue = totalRevenue;
        this.totalOrders = totalOrders;
    }
    
    public int getDishId() {
        return dishId;
    }
    
    public void setDishId(int dishId) {
        this.dishId = dishId;
    }
    
    public String getDishName() {
        return dishName;
    }
    
    public void setDishName(String dishName) {
        this.dishName = dishName;
    }
    
    public int getTotalQuantitySold() {
        return totalQuantitySold;
    }
    
    public void setTotalQuantitySold(int totalQuantitySold) {
        this.totalQuantitySold = totalQuantitySold;
    }
    
    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }
    
    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
    
    public int getTotalOrders() {
        return totalOrders;
    }
    
    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }
}


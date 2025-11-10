package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Dish implements Serializable {
    private int dishId;
    private String dishName;
    private String description;
    private BigDecimal price;
    private String category;
    private String imageUrl;
    private boolean isAvailable;
    
    public Dish() {
        super();
    }
    
    public Dish(String dishName, String description, BigDecimal price, String category, String imageUrl, boolean isAvailable) {
        super();
        this.dishName = dishName;
        this.description = description;
        this.price = price;
        this.category = category;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
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
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public BigDecimal getPrice() {
        return price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public boolean isAvailable() {
        return isAvailable;
    }
    
    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
}




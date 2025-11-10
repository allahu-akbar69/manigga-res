package servlet;

import dao.DishDAO;
import model.Dish;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/customer/dish-detail")
public class DishDetailServlet extends BaseServlet {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String dishIdStr = request.getParameter("dishId");
        Dish dish = null;
        
        if (dishIdStr != null && !dishIdStr.trim().isEmpty()) {
            try {
                int dishId = Integer.parseInt(dishIdStr);
                DishDAO dishDAO = new DishDAO();
                dish = dishDAO.getDishById(dishId);
                
                if (dish == null) {
                    request.setAttribute("error", "Dish not found with ID: " + dishId);
                }
                
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid dish ID: " + dishIdStr);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error retrieving dish information: " + e.getMessage());
            }
        } else {
            request.setAttribute("error", "Missing dishId parameter");
        }
        
        request.setAttribute("dish", dish);
        forwardToJsp(request, response, "/customer/dishDetail.jsp");
    }
}





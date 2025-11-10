package servlet;

import dao.OrderDAO;
import dao.DishDAO;
import model.Order;
import model.Dish;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/management/order-list")
public class OrderListServlet extends BaseServlet {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String dishIdStr = request.getParameter("dishId");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        List<Order> orders = null;
        String dishName = "";
        
        if (dishIdStr != null && !dishIdStr.trim().isEmpty()) {
            try {
                int dishId = Integer.parseInt(dishIdStr);
                OrderDAO orderDAO = new OrderDAO();
                orders = orderDAO.getOrdersByDishId(dishId);
                
                // Get dish name
                DishDAO dishDAO = new DishDAO();
                Dish dish = dishDAO.getDishById(dishId);
                if (dish != null) {
                    dishName = dish.getDishName();
                } else {
                    dishName = "Dish ID: " + dishId;
                }
                
                request.setAttribute("orders", orders);
                request.setAttribute("dishName", dishName);
                request.setAttribute("dishId", dishIdStr);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid dish ID: " + dishIdStr);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error retrieving order list: " + e.getMessage());
            }
        } else {
            request.setAttribute("error", "Missing dishId parameter");
        }
        
        forwardToJsp(request, response, "/management/orderListView.jsp");
    }
}





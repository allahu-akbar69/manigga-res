package servlet;

import dao.DishDAO;
import model.Dish;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer/search")
public class CustomerSearchServlet extends BaseServlet {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String searchTerm = request.getParameter("searchTerm");
        List<Dish> dishes = null;
        
        try {
            DishDAO dishDAO = new DishDAO();
            
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                dishes = dishDAO.searchDishesByName(searchTerm);
            } else {
                dishes = dishDAO.getAllDishes();
            }
            
            request.setAttribute("dishes", dishes);
            request.setAttribute("searchTerm", searchTerm);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error searching for dishes: " + e.getMessage());
        }
        
        forwardToJsp(request, response, "/customer/searchDish.jsp");
    }
}





package servlet;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/management/order-detail")
public class OrderDetailServlet extends BaseServlet {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String orderIdStr = request.getParameter("orderId");
        String dishId = request.getParameter("dishId");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Order order = null;
        
        if (orderIdStr != null && !orderIdStr.trim().isEmpty()) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDAO orderDAO = new OrderDAO();
                order = orderDAO.getOrderDetail(orderId);
                
                if (order == null) {
                    request.setAttribute("error", "Order not found with ID: " + orderId);
                }
                
                request.setAttribute("order", order);
                request.setAttribute("dishId", dishId);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid order ID: " + orderIdStr);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error retrieving order details: " + e.getMessage());
            }
        } else {
            request.setAttribute("error", "Missing orderId parameter");
        }
        
        forwardToJsp(request, response, "/management/detailOrderView.jsp");
    }
}





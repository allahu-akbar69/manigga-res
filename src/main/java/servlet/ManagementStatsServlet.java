package servlet;

import dao.DishStatDAO;
import model.DishStat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/management/dish-stats")
public class ManagementStatsServlet extends BaseServlet {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        List<DishStat> dishStats = null;
        String error = null;
        
        // Validate and set default dates
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();
        
        if (startDate == null || startDate.trim().isEmpty()) {
            Date oneMonthAgo = new Date(today.getTime() - (30L * 24 * 60 * 60 * 1000));
            startDate = sdf.format(oneMonthAgo);
        }
        if (endDate == null || endDate.trim().isEmpty()) {
            endDate = sdf.format(today);
        }
        
        // Validate date format and range
        try {
            Date start = sdf.parse(startDate);
            Date end = sdf.parse(endDate);
            
            if (start.after(end)) {
                error = "Start date cannot be after end date";
            } else if (start.after(today)) {
                error = "Start date cannot be in the future";
            } else {
                // Check if the date range is too far in the past (more than 5 years)
                long daysDiff = (today.getTime() - end.getTime()) / (24 * 60 * 60 * 1000);
                if (daysDiff > 1825) { // 5 years
                    System.out.println("Warning: Date range is more than 5 years in the past");
                }
            }
        } catch (Exception e) {
            error = "Invalid date format. Please use YYYY-MM-DD format";
        }
        
        if (error == null) {
            try {
                System.out.println("Processing statistics request: " + startDate + " to " + endDate);
                DishStatDAO dishStatDAO = new DishStatDAO();
                dishStats = dishStatDAO.getDishStat(startDate, endDate);
                
                System.out.println("Retrieved " + (dishStats != null ? dishStats.size() : 0) + " dish statistics");
                
            } catch (Exception e) {
                e.printStackTrace();
                error = "Error retrieving dish statistics: " + e.getMessage();
            }
        }
        
        request.setAttribute("dishStats", dishStats);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("error", error);
        
        forwardToJsp(request, response, "/management/dishStatView.jsp");
    }
}





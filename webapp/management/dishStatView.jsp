<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DishStat" %>
<%@ page import="java.util.List" %>
<%
    List<DishStat> dishStats = (List<DishStat>) request.getAttribute("dishStats");
    String startDate = (String) request.getAttribute("startDate");
    String endDate = (String) request.getAttribute("endDate");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê món ăn - Quản lý</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .topnav {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            margin: -20px -20px 20px -20px;
        }
        .brand { font-weight: bold; letter-spacing: 0.5px; }
        .navlinks a { color: #ecf0f1; text-decoration: none; margin-left: 16px; padding: 6px 10px; border-radius: 6px; }
        .navlinks a:hover { background-color: rgba(255,255,255,0.12); }
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .subtitle { color: #7f8c8d; margin-top: 4px; }
        .date-form {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .date-form form {
            display: flex;
            gap: 15px;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }
        .date-form input[type="date"] {
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            font-size: 16px;
        }
        .date-form button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .date-form button:hover {
            background-color: #2980b9;
        }
        .stats-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .stats-table th,
        .stats-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .stats-table th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        .stats-table tr:hover {
            background-color: #f5f5f5;
        }
        .revenue {
            color: #27ae60;
            font-weight: bold;
        }
        .quantity {
            color: #3498db;
            font-weight: bold;
        }
        .orders {
            color: #e74c3c;
            font-weight: bold;
        }
        .back-btn {
            background-color: #95a5a6;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .back-btn:hover {
            background-color: #7f8c8d;
        }
        .view-orders-btn {
            background-color: #27ae60;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
        }
        .view-orders-btn:hover {
            background-color: #229954;
        }
        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .summary-card {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        .summary-card h3 {
            margin: 0 0 10px 0;
            font-size: 14px;
        }
        .summary-card .value {
            font-size: 24px;
            font-weight: bold;
        }
        /* Ensure no pseudo-element decorative icons */
        h1::before, h1::after, h2::before, h2::after { content: '' !important; display: none !important; }
    </style>
</head>
<body>
    <div class="topnav">
        <div class="brand">Nhà hàng</div>
        <div class="navlinks">
            <a href="../index.jsp">Trang chủ</a>
            <a href="../customer/searchDish.jsp">Khách hàng</a>
            <a href="dishStatView.jsp" style="background-color: rgba(255,255,255,0.15);">Thống kê</a>
        </div>
    </div>
    <div class="container">
        <a href="statView.jsp" class="back-btn">Quay lại thống kê</a>
        
        <div class="header">
            <h1>Thống kê món ăn</h1>
            <p class="subtitle">Phân tích doanh thu và hiệu suất theo khoảng thời gian</p>
        </div>
        
        <div class="date-form">
            <form method="get" action="/restaurant-management/management/dish-stats">
                <label for="startDate">Từ ngày:</label>
                <input type="date" id="startDate" name="startDate" value="<%= startDate != null ? startDate : "" %>" required>
                
                <label for="endDate">Đến ngày:</label>
                <input type="date" id="endDate" name="endDate" value="<%= endDate != null ? endDate : "" %>" required>
                
                <button type="submit">Xem thống kê</button>
            </form>
        </div>
        
        <% if (dishStats != null && !dishStats.isEmpty()) { %>
            <%
                // Calculate summary statistics
                int totalDishes = dishStats.size();
                int totalQuantitySold = 0;
                double totalRevenue = 0.0;
                int totalOrders = 0;
                
                for (DishStat stat : dishStats) {
                    totalQuantitySold += stat.getTotalQuantitySold();
                    totalRevenue += stat.getTotalRevenue().doubleValue();
                    totalOrders += stat.getTotalOrders();
                }
            %>
            
            <div class="summary-cards">
                <div class="summary-card">
                    <h3>Tổng số món</h3>
                    <div class="value"><%= totalDishes %></div>
                </div>
                <div class="summary-card">
                    <h3>Tổng số lượng bán</h3>
                    <div class="value"><%= totalQuantitySold %></div>
                </div>
                <div class="summary-card">
                    <h3>Tổng doanh thu</h3>
                    <div class="value">₫<%= String.format("%.2f", totalRevenue) %></div>
                </div>
                <div class="summary-card">
                    <h3>Tổng số đơn</h3>
                    <div class="value"><%= totalOrders %></div>
                </div>
            </div>
            
            <table class="stats-table">
                <thead>
                    <tr>
                        <th class="rank">#</th>
                        <th>Tên món</th>
                        <th>Số lượng bán</th>
                        <th>Doanh thu</th>
                        <th>Số đơn</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <% int rank = 1; for (DishStat stat : dishStats) { %>
                        <tr>
                            <td class="rank"><%= rank++ %></td>
                            <td class="dish-name"><%= stat.getDishName() %></td>
                            <td><span class="quantity"><%= stat.getTotalQuantitySold() %></span></td>
                            <td><span class="revenue">₫<%= String.format("%.2f", stat.getTotalRevenue().doubleValue()) %></span></td>
                            <td><span class="orders"><%= stat.getTotalOrders() %></span></td>
                            <td>
                                <a href="/restaurant-management/management/order-list?dishId=<%= stat.getDishId() %>&startDate=<%= startDate %>&endDate=<%= endDate %>" class="view-orders-btn">Xem đơn</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div style="text-align: center; padding: 40px; color: #7f8c8d;">
                <p>Không có dữ liệu trong khoảng thời gian đã chọn.</p>
            </div>
        <% } %>
    </div>
</body>
</html>




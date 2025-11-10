<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    String dishName = (String) request.getAttribute("dishName");
    String dishId = (String) request.getAttribute("dishId");
    String startDate = (String) request.getAttribute("startDate");
    String endDate = (String) request.getAttribute("endDate");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order List - Management</title>
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
            max-width: 1200px;
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
        /* Prevent pseudo-element icons */
        h1::before, h1::after { content: '' !important; display: none !important; }
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .orders-table th,
        .orders-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .orders-table th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        .orders-table tr:hover {
            background-color: #f5f5f5;
        }
        .order-id {
            color: #3498db;
            font-weight: bold;
        }
        .customer-name {
            color: #2c3e50;
            font-weight: bold;
        }
        .total-amount {
            color: #27ae60;
            font-weight: bold;
        }
        .status {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
        }
        .status.pending {
            background-color: #f39c12;
            color: white;
        }
        .status.completed {
            background-color: #27ae60;
            color: white;
        }
        .status.cancelled {
            background-color: #e74c3c;
            color: white;
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
        .view-detail-btn {
            background-color: #27ae60;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
        }
        .view-detail-btn:hover {
            background-color: #229954;
        }
        .no-orders {
            text-align: center;
            color: #7f8c8d;
            font-size: 18px;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <div class="brand">Restaurant</div>
        <div class="navlinks">
            <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/customer/search">Customer</a>
            <a href="${pageContext.request.contextPath}/management/dish-stats">Statistics</a>
        </div>
    </div>
    <div class="container">
        <a href="${pageContext.request.contextPath}/management/dish-stats<%= (startDate != null || endDate != null) ? ("?" + (startDate != null ? ("startDate=" + startDate) : "") + (startDate != null && endDate != null ? "&" : "") + (endDate != null ? ("endDate=" + endDate) : "")) : "" %>" class="back-btn">Back to Dish Statistics</a>
        
        <div class="header">
            <h1>Orders for <%= dishName %></h1>
            <p>List of orders containing the selected dish</p>
        </div>
        
        <% if (orders != null && !orders.isEmpty()) { %>
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Phone</th>
                        <th>Table</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Order order : orders) { %>
                        <tr>
                            <td><span class="order-id">#<%= order.getOrderId() %></span></td>
                            <td><span class="customer-name"><%= order.getCustomerName() %></span></td>
                            <td><%= order.getCustomerPhone() %></td>
                            <td><%= order.getTableNumber() %></td>
                            <td><%= order.getOrderDate() %></td>
                            <td><span class="total-amount">$<%= String.format("%.2f", order.getTotalAmount().doubleValue()) %></span></td>
                            <td>
                                <span class="status <%= order.getStatus().toLowerCase() %>">
                                    <%= order.getStatus().toUpperCase() %>
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/management/order-detail?orderId=<%= order.getOrderId() %><%= (dishId != null ? ("&dishId=" + dishId) : "") %><%= (startDate != null ? ("&startDate=" + startDate) : "") %><%= (endDate != null ? ("&endDate=" + endDate) : "") %>" class="view-detail-btn">View Details</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="no-orders">
                <p>No orders found for the selected dish.</p>
            </div>
        <% } %>
    </div>
</body>
</html>




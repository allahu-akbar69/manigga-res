<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Order" %>
<%@ page import="model.OrderItem" %>
<%@ page import="java.util.List" %>
<%
    Order order = (Order) request.getAttribute("order");
    String dishId = (String) request.getAttribute("dishId");
    String startDate = (String) request.getAttribute("startDate");
    String endDate = (String) request.getAttribute("endDate");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details - Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
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
        .order-info {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .order-info h3 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .info-item {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }
        .info-item strong {
            color: #2c3e50;
            display: block;
            margin-bottom: 5px;
        }
        .info-item span {
            color: #7f8c8d;
        }
        .status {
            padding: 6px 12px;
            border-radius: 15px;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
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
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .items-table th,
        .items-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .items-table th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        .items-table tr:hover {
            background-color: #f5f5f5;
        }
        .dish-name {
            color: #2c3e50;
            font-weight: bold;
        }
        .quantity {
            color: #3498db;
            font-weight: bold;
        }
        .unit-price {
            color: #7f8c8d;
        }
        .total-price {
            color: #27ae60;
            font-weight: bold;
        }
        .order-total {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
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
        .error-message {
            text-align: center;
            color: #e74c3c;
            font-size: 18px;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/restaurant-management/management/order-list<%
            String qs = "";
            boolean first = true;
            if (dishId != null) { qs += (first ? "?" : "&") + "dishId=" + dishId; first = false; }
            if (startDate != null) { qs += (first ? "?" : "&") + "startDate=" + startDate; first = false; }
            if (endDate != null) { qs += (first ? "?" : "&") + "endDate=" + endDate; first = false; }
            out.print(qs);
        %>" class="back-btn">Back to Order List</a>
        
        <% if (order != null) { %>
            <div class="header">
                <h1>Order Details #<%= order.getOrderId() %></h1>
                <p>Complete information for the selected order</p>
            </div>
            
            <div class="order-info">
                <h3>Order Information</h3>
                <div class="info-grid">
                    <div class="info-item">
                        <strong>Order ID</strong>
                        <span>#<%= order.getOrderId() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Customer Name</strong>
                        <span><%= order.getCustomerName() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Phone Number</strong>
                        <span><%= order.getCustomerPhone() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Table Number</strong>
                        <span><%= order.getTableNumber() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Order Date</strong>
                        <span><%= order.getOrderDate() %></span>
                    </div>
                    <div class="info-item">
                        <strong>Status</strong>
                        <span class="status <%= order.getStatus().toLowerCase() %>">
                            <%= order.getStatus().toUpperCase() %>
                        </span>
                    </div>
                </div>
            </div>
            
            <h3>Order Items</h3>
            <table class="items-table">
                <thead>
                    <tr>
                        <th>Dish Name</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (order.getOrderItems() != null && !order.getOrderItems().isEmpty()) { %>
                        <% for (OrderItem item : order.getOrderItems()) { %>
                            <tr>
                                <td><span class="dish-name"><%= item.getDishName() %></span></td>
                                <td><span class="quantity"><%= item.getQuantity() %></span></td>
                                <td><span class="unit-price">$<%= String.format("%.2f", item.getUnitPrice().doubleValue()) %></span></td>
                                <td><span class="total-price">$<%= String.format("%.2f", item.getTotalPrice().doubleValue()) %></span></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="4" style="text-align: center; color: #7f8c8d; padding: 20px;">
                                No items found for this order.
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            
            <div class="order-total">
                Total Amount: $<%= String.format("%.2f", order.getTotalAmount().doubleValue()) %>
            </div>
        <% } else { %>
            <div class="error-message">
                <p><%= error != null ? error : "Order not found or invalid order ID." %></p>
                <a href="/restaurant-management/management/order-list" class="back-btn">Back to Order List</a>
            </div>
        <% } %>
    </div>
</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Dish" %>
<%
    Dish dish = (Dish) request.getAttribute("dish");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dish Information</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 24px; background: #f7f7f7; }
        .wrap { width: 900px; margin: 0 auto; background: #fff; border: 1px solid #ddd; border-radius: 6px; padding: 24px; }
        .row { margin-bottom: 16px; }
        .btn { background: #e9f0ff; border: 1px solid #9bb6f1; padding: 6px 12px; border-radius: 4px; cursor: pointer; text-decoration: none; color: #2c3e50; }
        h1 { text-align: center; margin: 8px 0 24px 0; }
        .field { display: grid; grid-template-columns: 140px 1fr; gap: 12px; padding: 8px 0; }
        .label { color: #444; }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="row">
            <a href="${pageContext.request.contextPath}/customer/search" class="btn">Back</a>
        </div>
        <% if (dish != null) { %>
            <h1>Dish Details</h1>
            <div class="field">
                <div class="label">Dish Name:</div>
                <div><%= dish.getDishName() %></div>
            </div>
            <div class="field">
                <div class="label">Price:</div>
                <div><%= dish.getPrice() %></div>
            </div>
            <div class="field">
                <div class="label">Description:</div>
                <div><%= dish.getDescription() != null ? dish.getDescription() : "" %></div>
            </div>
        <% } else { %>
            <div style="text-align:center; color:#e74c3c; padding: 20px;">
                <%= error != null ? error : "Dish not found." %>
            </div>
        <% } %>
    </div>
</body>
</html>




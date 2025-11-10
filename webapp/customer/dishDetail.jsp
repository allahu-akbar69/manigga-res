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
    <title>Thông tin món ăn</title>
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
            <a href="/restaurant-management/customer/search" class="btn">Quay lại</a>
        </div>
        <% if (dish != null) { %>
            <h1>Thông tin chi tiết món ăn</h1>
            <div class="field">
                <div class="label">Tên món ăn:</div>
                <div><%= dish.getDishName() %></div>
            </div>
            <div class="field">
                <div class="label">Giá:</div>
                <div><%= dish.getPrice() %></div>
            </div>
            <div class="field">
                <div class="label">Mô tả:</div>
                <div><%= dish.getDescription() != null ? dish.getDescription() : "" %></div>
            </div>
        <% } else { %>
            <div style="text-align:center; color:#e74c3c; padding: 20px;">
                <%= error != null ? error : "Không tìm thấy món ăn." %>
            </div>
        <% } %>
    </div>
</body>
</html>




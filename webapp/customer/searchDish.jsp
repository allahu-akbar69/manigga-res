<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.DishDAO" %>
<%@ page import="model.Dish" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm món ăn - Khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 24px; background: #f7f7f7; }
        .wrap { width: 900px; margin: 0 auto; background: #fff; border: 1px solid #ddd; border-radius: 6px; padding: 24px; }
        .row { margin-bottom: 16px; }
        .btn { background: #e9f0ff; border: 1px solid #9bb6f1; padding: 6px 12px; border-radius: 4px; cursor: pointer; text-decoration: none; color: #2c3e50; }
        h1 { text-align: center; margin: 8px 0 20px 0; }
        .search-area input[type="text"] { width: 520px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        .search-area button { margin-left: 12px; }
        table { width: 100%; border-collapse: collapse; margin-top: 12px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #f0f4f8; }
        .muted { color: #888; font-size: 12px; }
    </style>
    </head>
<body>
    <div class="wrap">
        <div class="row">
            <a href="../index.jsp" class="btn">Quay lại</a>
        </div>
        <h1>Tìm món ăn</h1>

        <div class="row search-area">
            <form method="get" action="/restaurant-management/customer/search">
                <input type="text" name="searchTerm" placeholder="Nhập tên món ăn" value="<%= request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm") : "" %>">
                <button type="submit" class="btn">Tìm kiếm</button>
            </form>
        </div>

        <%
            List<Dish> dishes = (List<Dish>) request.getAttribute("dishes");
            String error = (String) request.getAttribute("error");
        %>

        <div class="row">
            <h3>DANH SÁCH MÓN ĂN</h3>
            <table>
                <thead>
                    <tr>
                        <th style="width: 70px;">TT</th>
                        <th>Tên</th>
                        <th style="width: 160px;">Giá</th>
                        <th style="width: 160px;">Xem chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (dishes != null && !dishes.isEmpty()) {
                            int idx = 1;
                            for (Dish dish : dishes) {
                    %>
                        <tr>
                            <td><%= idx++ %></td>
                            <td><%= dish.getDishName() %></td>
                            <td><%= dish.getPrice() %></td>
                            <td><a class="btn" href="/restaurant-management/customer/dish-detail?dishId=<%= dish.getDishId() %>">Xem</a></td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="4" class="muted">(click để xem)</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>




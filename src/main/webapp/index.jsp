<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
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
        .module-section {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }
        .module-card {
            flex: 1;
            border: 2px solid #3498db;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .module-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .module-card h3 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .module-card p {
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .features {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        .features h3 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .features ul {
            list-style-type: none;
            padding: 0;
        }
        .features li {
            padding: 5px 0;
            color: #34495e;
        }
        .features li:before { content: '' !important; }
        /* Remove any emojis/pseudo icons that may show as squares */
        h1::before, h1::after, h3::before, h3::after { content: '' !important; display: none !important; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Restaurant Management System</h1>
            <p>Comprehensive solution for restaurant operations</p>
        </div>
        
        <div class="module-section">
            <div class="module-card">
                <h3>Customer Module</h3>
                <p>Search and view dish information, book tables, and place orders online</p>
                <a href="${pageContext.request.contextPath}/customer/search" class="btn">Search Dishes</a>
            </div>
            
            <div class="module-card">
                <h3>Management Module</h3>
                <p>View statistics, manage dishes, and monitor restaurant performance</p>
                <a href="${pageContext.request.contextPath}/management/dish-stats" class="btn">View Statistics</a>
            </div>
        </div>
        
        <div class="features">
            <h3>System Features</h3>
            <ul>
                <li>Customer dish search and information viewing</li>
                <li>Management staff statistics and reporting</li>
                <li>Order management and tracking</li>
                <li>Table reservation system</li>
                <li>Revenue and performance analytics</li>
                <li>Multi-role access control</li>
            </ul>
        </div>
    </div>
</body>
</html>




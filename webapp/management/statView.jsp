<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Statistics View - Management</title>
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
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        .stat-card {
            border: 2px solid #3498db;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            transition: transform 0.3s ease;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        .stat-card h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 20px;
        }
        .stat-card p {
            color: #7f8c8d;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 8px;
            display: inline-block;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
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
        .icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="../index.jsp" class="back-btn">Back to Home</a>
        
        <div class="header">
            <h1>📊 Statistical Reports</h1>
            <p>Choose a statistical report to view detailed analytics</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="icon">🍽️</div>
                <h3>Dish Statistics</h3>
                <p>View revenue and performance statistics for dishes. Analyze which dishes are most popular and profitable.</p>
                <a href="dishStatView.jsp" class="btn">View Dish Statistics</a>
            </div>
            
            <div class="stat-card">
                <div class="icon">👥</div>
                <h3>Customer Statistics</h3>
                <p>Analyze customer behavior, preferences, and loyalty patterns to improve service quality.</p>
                <a href="#" class="btn" onclick="alert('Customer Statistics module coming soon!')">View Customer Statistics</a>
            </div>
            
            <div class="stat-card">
                <div class="icon">📦</div>
                <h3>Ingredient Statistics</h3>
                <p>Monitor ingredient usage, costs, and inventory levels to optimize procurement and reduce waste.</p>
                <a href="#" class="btn" onclick="alert('Ingredient Statistics module coming soon!')">View Ingredient Statistics</a>
            </div>
            
            <div class="stat-card">
                <div class="icon">🏪</div>
                <h3>Supplier Statistics</h3>
                <p>Track supplier performance, delivery times, and cost analysis to make informed procurement decisions.</p>
                <a href="#" class="btn" onclick="alert('Supplier Statistics module coming soon!')">View Supplier Statistics</a>
            </div>
        </div>
    </div>
</body>
</html>




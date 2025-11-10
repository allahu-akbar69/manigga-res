# Restaurant Management System

A comprehensive restaurant management system built with Java Web (JSP/Servlet) and MySQL. This web application includes two main modules:

1. **Customer Search Module** - Allows customers to search and view dish information
2. **Management Statistics Module** - Enables management staff to view dish statistics and order details

## Features

### Customer Module
- Search dishes by name with real-time filtering
- View detailed dish information including price, description, and availability
- Browse all available dishes in a table format
- Modern web interface with responsive design

### Management Module
- View dish statistics with revenue analysis
- Filter statistics by date range
- View orders containing specific dishes
- Detailed order information with items
- Comprehensive reporting dashboard with summary cards

## Technology Stack

- **Backend**: Java 11, JSP/Servlet
- **Database**: MySQL
- **Build Tool**: Maven
- **Frontend**: JSP with modern web UI design
- **Architecture**: Web Application (WAR file)

## Project Structure

```
RestaurantManagementSystem/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── servlet/        # Servlet controllers
│   │   │   │   ├── CustomerSearchServlet.java
│   │   │   │   ├── DishDetailServlet.java
│   │   │   │   ├── ManagementStatsServlet.java
│   │   │   │   ├── OrderListServlet.java
│   │   │   │   └── OrderDetailServlet.java
│   │   │   ├── model/          # Entity classes
│   │   │   │   ├── Dish.java
│   │   │   │   ├── Order.java
│   │   │   │   ├── OrderItem.java
│   │   │   │   └── DishStat.java
│   │   │   └── dao/            # Data Access Objects
│   │   │       ├── DAO.java
│   │   │       ├── DishDAO.java
│   │   │       ├── DishStatDAO.java
│   │   │       └── OrderDAO.java
│   │   └── webapp/            # Web resources
│   │       ├── index.jsp
│   │       ├── customer/      # Customer module JSPs
│   │       ├── management/    # Management module JSPs
│   │       └── WEB-INF/
│   │           └── web.xml
├── database/
│   └── restaurant_schema.sql
├── pom.xml
└── README.md
```

## Setup Instructions

### Prerequisites
- Java 11 or higher
- Maven 3.6 or higher
- MySQL 8.0 or higher
- Apache Tomcat 9.0 or higher (or any Java servlet container)

### Database Setup
1. Create a MySQL database:
   ```sql
   CREATE DATABASE restaurant_management;
   ```
2. Import the schema:
   ```bash
   mysql -u root -p restaurant_management < database/restaurant_schema.sql
   ```
3. Update database connection settings in `src/main/java/dao/DAO.java` if needed

### Building the Application
1. Build the WAR file:
   ```bash
   mvn clean package
   ```
2. The WAR file will be created at: `target/restaurant-management.war`

### Deploying the Application

#### Method 1: Deploy to Tomcat
1. Copy `target/restaurant-management.war` to Tomcat's `webapps/` directory
2. Start Tomcat server
3. Access the application at: `http://localhost:8080/restaurant-management/`

#### Method 2: Run with Embedded Server (for development)
1. Use `run-website.bat` (Windows) or create a similar script for your OS
2. Or use Maven Tomcat plugin:
   ```bash
   mvn tomcat7:run
   ```

### Running the Application
1. Start your servlet container (Tomcat, Jetty, etc.)
2. Deploy the WAR file
3. Open your browser and navigate to: `http://localhost:8080/restaurant-management/`
4. You'll see the main page with links to Customer Module and Management Module

## Module Descriptions

### Customer Search Module
**Sequence Flow:**
1. Customer clicks "Search Dishes" from main page
2. Customer enters dish name to search in the search field
3. System displays list of matching dishes in a table
4. Customer clicks "View Details" link for a dish
5. System displays detailed dish information

**Files:**
- `src/main/java/servlet/CustomerSearchServlet.java` - Search controller
- `src/main/java/servlet/DishDetailServlet.java` - Dish details controller
- `src/main/webapp/customer/searchDish.jsp` - Search interface
- `src/main/webapp/customer/dishDetail.jsp` - Dish details page
- `src/main/java/dao/DishDAO.java` - Data access for dishes

### Management Statistics Module
**Sequence Flow:**
1. Management staff clicks "View Statistics" from main page
2. Staff selects start and end date for statistics
3. System displays dish statistics with revenue data in a table
4. Staff clicks "View Orders" link for a dish
5. System displays list of orders containing the dish
6. Staff clicks "View Details" link for an order
7. System displays complete order details with items

**Files:**
- `src/main/java/servlet/ManagementStatsServlet.java` - Statistics controller
- `src/main/java/servlet/OrderListServlet.java` - Order list controller
- `src/main/java/servlet/OrderDetailServlet.java` - Order details controller
- `src/main/webapp/management/dishStatView.jsp` - Dish statistics page
- `src/main/webapp/management/orderListView.jsp` - Order list page
- `src/main/webapp/management/detailOrderView.jsp` - Order details page
- `src/main/java/dao/DishStatDAO.java` - Statistics data access
- `src/main/java/dao/OrderDAO.java` - Order data access

## Database Schema

The system uses the following main tables:
- `dishes` - Store dish information
- `customers` - Customer data
- `orders` - Order records
- `order_items` - Individual items in orders
- `users` - System users (management staff)

## Sample Data

The database includes sample data for testing:
- 8 sample dishes with different categories
- 5 sample customers
- 5 sample orders with various items
- 4 sample users with different roles

## Testing

1. **Customer Module Testing:**
   - Navigate to the main page and click "Search Dishes"
   - Search for "salmon" to find grilled salmon
   - Search for "pizza" to find margherita pizza
   - Click "View Details" link for any dish to see detailed information

2. **Management Module Testing:**
   - Click "View Statistics" from main page
   - Select date range (default: last 30 days)
   - Click "Generate Report" to view revenue and quantity statistics
   - Click "View Orders" link for any dish
   - Click "View Details" link for any order

## Troubleshooting

### Common Issues:
1. **Database Connection Error:**
   - Verify MySQL server is running
   - Check database credentials in `DAO.java`
   - Ensure database and tables are created
   - Verify MySQL JDBC driver is in classpath

2. **Web Application Issues:**
   - Verify Java version (should be 11+)
   - Check if servlet container is running
   - Verify WAR file is deployed correctly
   - Check server logs for errors

3. **Missing Dependencies:**
   - Run `mvn clean install` in project root
   - Refresh Maven project in IDE
   - Check Maven settings

4. **Application Won't Start:**
   - Check servlet container logs
   - Verify web.xml configuration
   - Ensure all dependencies are downloaded
   - Check database connection

## Future Enhancements

- User authentication and authorization
- Real-time order tracking
- Inventory management
- Customer feedback system
- Advanced reporting and analytics
- RESTful API endpoints
- Mobile-responsive design improvements

## Support

For issues or questions, please check:
1. Database connection settings
2. Tomcat server configuration
3. Maven dependency resolution
4. Java version compatibility

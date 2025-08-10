-- Top 10 Countries by Revenue with Growth Analysis
SELECT 
    Country,
    ROUND(total_revenue, 2) as total_revenue,
    ROUND(avg_order_value, 2) as avg_order_value,
    total_orders,
    unique_customers,
    ROUND(total_revenue / unique_customers, 2) as revenue_per_customer
FROM country_performance
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly Revenue Trend Analysis
SELECT 
    strftime('%Y-%m', InvoiceDate) as month,
    COUNT(*) as total_transactions,
    SUM(TotalAmount) as monthly_revenue,
    AVG(TotalAmount) as avg_transaction_value,
    COUNT(DISTINCT CustomerID) as active_customers
FROM sales_transactions
GROUP BY strftime('%Y-%m', InvoiceDate)
ORDER BY month;

-- Product Performance Analysis
SELECT 
    p.StockCode,
    p.Description,
    p.total_revenue,
    p.total_quantity_sold,
    p.total_orders,
    ROUND(p.total_revenue / p.total_quantity_sold, 2) as avg_unit_price
FROM product_performance p
ORDER BY total_revenue DESC
LIMIT 20;

-- Customer Segmentation Analysis
SELECT 
    CustomerType,
    COUNT(*) as transaction_count,
    SUM(TotalAmount) as total_revenue,
    AVG(TotalAmount) as avg_transaction_value,
    SUM(Quantity) as total_items_sold
FROM sales_transactions
GROUP BY CustomerType;
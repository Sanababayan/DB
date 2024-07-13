SELECT Practice2.Categories.CategoryID, COUNT(DISTINCT Practice2.Customers.customerId) As distinctCustomers
FROM  Practice2.customers
    RIGHT JOIN Practice2.orders ON Practice2.Customers.customerid = Practice2.Orders.customerid
    RIGHT JOIN Practice2.OrderDetails ON Practice2.OrderDetails.OrderID = Practice2.Orders.OrderID
    RIGHT JOIN Practice2.Products ON Practice2.Products.ProductID = Practice2.OrderDetails.ProductID
    RIGHT JOIN Practice2.Categories ON Practice2.Categories.CategoryID = Practice2.Products.CategoryID
group by Practice2.Categories.CategoryID;
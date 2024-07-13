SELECT Practice2.Categories.CategoryID, SUM(Practice2.OrderDetails.quantity * Practice2.OrderDetails.unitprice) As total
FROM  Practice2.OrderDetails
    RIGHT JOIN Practice2.orders ON Practice2.OrderDetails.OrderID = Practice2.Orders.OrderID
    RIGHT JOIN Practice2.Products ON Practice2.Products.ProductID = Practice2.OrderDetails.ProductID
    RIGHT JOIN Practice2.Categories ON Practice2.Categories.CategoryID = Practice2.Products.CategoryID
group by Practice2.Categories.CategoryID;

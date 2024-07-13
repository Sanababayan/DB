CREATE TEMPORARY TABLE minmax AS (SELECT Min(total) AS min, Max(total) AS max From(SELECT Practice2.Customers.CustomerID, SUM(Practice2.OrderDetails.quantity * Practice2.OrderDetails.unitprice) As total
    FROM Practice2.OrderDetails
    RIGHT JOIN Practice2.Orders ON Practice2.Orders.OrderID = Practice2.OrderDetails.OrderID
    RIGHT JOIN Practice2.Customers ON Practice2.Customers.CustomerID = Practice2.Orders.CustomerID
    WHERE Practice2.Orders.orderdate >= now() - Interval '1' YEAR AND Practice2.Orders.orderdate <= now()
    GROUP BY (Practice2.Customers.CustomerID)));


CREATE TEMPORARY TABLE TableWithorderBy AS (
    SELECT Practice2.Customers.CustomerID As two, SUM(Practice2.OrderDetails.quantity * Practice2.OrderDetails.unitprice) As total
    FROM Practice2.OrderDetails
    RIGHT JOIN Practice2.Orders ON Practice2.Orders.OrderID = Practice2.OrderDetails.OrderID
    RIGHT JOIN Practice2.Customers ON Practice2.Customers.CustomerID = Practice2.Orders.CustomerID
    WHERE Practice2.Orders.orderdate >= now() - Interval '1' YEAR AND Practice2.Orders.orderdate <= now()
    GROUP BY (Practice2.Customers.CustomerID)
    ORDER BY (total)
);

SELECT TableWithorderBy.two, minmax.min, minmax.max, CASE
    WHEN TableWithorderBy.total <= minmax.min + ((minmax.max - minmax.min) / 3) THEN 'Low Level'
    WHEN TableWithorderBy.total > minmax.min + ((minmax.max - minmax.min) / 3) AND TableWithorderBy.total <= minmax.min + ((minmax.max - minmax.min) * (2 / 3)) THEN 'Average Level'
    ELSE 'High Level'
    END
    FROM TableWithorderBy, minmax;
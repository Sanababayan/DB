CREATE SCHEMA Practice2;

CREATE TABLE Practice2.Customers(
    CustomerID NUMERIC,
    CustomerName VARCHAR(32),
    COUNTRY VARCHAR(32),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Practice2.Orders(
    OrderID NUMERIC,
    CustomerID NUMERIC,
    OrderDate DATE,
    Status VARCHAR,
    PRIMARY KEY (OrderId),
    FOREIGN KEY (CustomerID) references Practice2.Customers
);

CREATE TABLE Practice2.Categories(
    CategoryID NUMERIC,
    CategoryName VARCHAR(32),
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Practice2.Products(
    ProductID NUMERIC,
    ProductName VARCHAR(32),
    CategoryID NUMERIC,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (CategoryID) references Practice2.Categories
);

CREATE TABLE Practice2.OrderDetails(
    OrderDatailID NUMERIC,
    OrderID NUMERIC,
    ProductID NUMERIC,
    Quantity NUMERIC,
    UnitPrice NUMERIC,
    PRIMARY KEY (OrderDatailID),
    FOREIGN KEY (OrderID) references Practice2.Orders,
    FOREIGN KEY (ProductID) references Practice2.Products
);

INSERT INTO Practice2.Customers(customerid, customername, country)
VALUES (1, 'Farzam', 'Farzam Kade');
INSERT INTO Practice2.Customers(customerid, customername, country)
VALUES (2, 'Kian', 'Kian Kade');
INSERT INTO Practice2.Customers(customerid, customername, country)
VALUES (3, 'Armin', 'Armin Kade');

INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (1, 1, '2020-10-11', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (2, 1, '2020-09-11', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (3, 2, '2019-10-11', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (4, 3, '2021-10-11', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (5, 3, '2023-08-05', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (6, 3, '2024-04-03', 'done');
INSERT INTO Practice2.Orders(orderid, customerid, orderdate, status)
VALUES (7, 3, '2021-10-11', 'done');

INSERT INTO Practice2.Categories(categoryid, categoryname)
VALUES (1, 'home');
INSERT INTO Practice2.Categories(categoryid, categoryname)
VALUES (2, 'office');
INSERT INTO Practice2.Categories(categoryid, categoryname)
VALUES (3, 'cooking');
INSERT INTO Practice2.Categories(categoryid, categoryname)
VALUES (4, 'digital');

INSERT INTO Practice2.Products(productid, productname, categoryid)
VALUES (1, 'carpet', 1);
INSERT INTO Practice2.Products(productid, productname, categoryid)
VALUES (2, 'pan', 3);
INSERT INTO Practice2.Products(productid, productname, categoryid)
VALUES (3, 'computer', 4);
INSERT INTO Practice2.Products(productid, productname, categoryid)
VALUES (4, 'monitor', 4);

INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (1, 1, 1, 2, 400);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (2, 2, 2, 5, 150);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (3, 4, 4, 1, 78);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (4, 3, 3, 7, 2000);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (5, 3, 3, 5, 20);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (6, 3, 3, 2, 430);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (7, 3, 3, 1, 2);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (8, 5, 3, 2, 71);
INSERT INTO Practice2.OrderDetails(orderdatailid, orderid, productid, quantity, unitprice)
VALUES (9, 6, 3, 60, 85);

SELECT Practice2.Customers.CustomerID, SUM(Practice2.OrderDetails.quantity * Practice2.OrderDetails.unitprice) As total
    FROM Practice2.OrderDetails
    RIGHT JOIN Practice2.Orders ON Practice2.Orders.OrderID = Practice2.OrderDetails.OrderID
    RIGHT JOIN Practice2.Customers ON Practice2.Customers.CustomerID = Practice2.Orders.CustomerID
    WHERE Practice2.Orders.orderdate >= now() - Interval '1' YEAR AND Practice2.Orders.orderdate <= now()
    GROUP BY (Practice2.Customers.CustomerID);
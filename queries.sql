
-- CREATE DATABASE IF NOT EXISTS BookstoreDB;

-- USE BookstoreDB;

-- create
CREATE TABLE IF NOT EXISTS Books( 
    BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT NOT NULL
);

INSERT INTO Books (Title, Author, Genre, Price, QuantityInStock) 
VALUES
     ('Book1', 'Author1', 'Fiction', 20.00, 50),
     ('Book2', 'Author2', 'Science', 25.00, 30),
     ('Book3', 'Author3', 'Mystery', 18.50, 40),
     ('Book4', 'Author4', 'Fantasy', 22.50, 25),
     ('Book5', 'Author5', 'Romance', 15.00, 60),
     ('Book4', 'Author4', 'Thriller', 30.00, 15),
     ('Book6', 'Author6', 'Historical', 22.00, 25),
     ('Book7', 'Author7', 'Science', 28.50, 20);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

INSERT INTO Customers (Name, Email, Phone)
VALUES
    ('Customer1', 'customer1@example.com', '123-456-7890'),
    ('Customer2', 'customer2@example.com', '987-654-3210'),
    ('Customer3', 'customer3@example.com', '111-222-3333'),
    ('Customer4', 'customer4@example.com', '444-555-6666'),
    ('Customer5', 'customer5@example.com', '777-888-9999'),
    ('Customer6', 'customer6@example.com', '123-456-7890'),
    ('Customer7', 'customer7@example.com', '987-654-3210'),
    ('Customer8', 'customer8@example.com', '111-222-3333');

CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    DateOfSale DATE NOT NULL,
    QuantitySold INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Sales (BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
VALUES
    (1, 1, '2023-01-01', 3, 60.00),
    (2, 2, '2023-01-02', 2, 50.00),
    (3, 3, '2023-01-03', 1, 22.00),
    (4, 4, '2023-01-04', 4, 120.00),
    (5, 5, '2023-01-05', 2, 30.00),
    (1, 6, '2023-01-06', 3, 45.00),
    (2, 7, '2023-01-07', 1, 25.00),
    (3, 8, '2023-01-08', 2, 44.00);
    
SELECT b.Title AS BookTitle, c.Name AS CustomerName, s.DateOfSale
FROM Sales s
JOIN Books b ON s.BookID = b.BookID
JOIN Customers c ON s.CustomerID = c.CustomerID;

SELECT b.Genre, SUM(s.TotalPrice) AS TotalRevenue
FROM Sales s
JOIN Books b ON s.BookID = b.BookID
GROUP BY b.Genre;


  




CREATE DATABASE Library;
USE Library;
CREATE TABLE Branch(Branch_no INT,Manager_Id INT,Branch_address VARCHAR(30),Contact_no BIGINT,
PRIMARY KEY (Branch_no));
  CREATE TABLE Employee(Emp_id int PRIMARY KEY,Emp_name VARCHAR(20),Position VARCHAR (20),Salary DECIMAL(10,2),branch_no INT,
  
FOREIGN KEY (branch_no) REFERENCES Branch(Branch_no)
  );

  CREATE TABLE Customer(Customer_Id INT,Customer_name VARCHAR(20),Customer_address VARCHAR(30),Reg_date DATE,
  PRIMARY KEY (Customer_id) );
  
  CREATE TABLE Books(ISBN INT PRIMARY KEY,Book_title VARCHAR(40),Category varchar(20),Rental_Price DECIMAL(10,2),
Status VARCHAR(3) CHECK ( STATUS IN ( 'YES' , 'NO')),
Author VARCHAR(20),Publisher VARCHAR(20));
CREATE TABLE IssueStatus (Issue_Id INT PRIMARY KEY,Issued_cust INT ,Issued_book_name VARCHAR (40),Issue_date DATE,Isbn_book INT,

FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_Book) REFERENCES Books(ISBN));




 CREATE TABLE ReturnStatus(Return_Id INT PRIMARY KEY ,Return_cust INT,Return_book_name VARCHAR(40),Return_date DATE,Isbn_book2 INT,

FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));


set sql_safe_updates = 0;
  
    
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address,Contact_no )
VALUES
    (1, 101, 'Main Street Branch', '8876775655'),
    (2, 102, 'Downtown Branch', '6877145677'),
    (3, 103, 'Westside Branch', '8567889012'),
    (4, 104, 'Main Branch', '3456789012'),
    (5, 105, 'Town Branch', '5689438053'),
    (6, 106, 'Northeast Branch', '5648934678'),   
    (7, 107, 'Street Branch', '5475863548'),
    (8, 108, 'Southeast Branch', '2354784940'),
    (9, 109, 'West Branch', '4567834576'),
    (10,110,'East Branch','3456223345');
    
    
    
    INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary,branch_no)
VALUES
(1, 'John Doe', 'Manager', 60000.00, 1),
  (2, 'Jane Smith', 'Assistant Manager', 55000.00, 1),
  (3, 'Bob Johnson', 'Clerk', 45000.00, 2),
  (4, 'Alice Williams', 'Manager', 62000.00, 2),
  (5, 'Charlie Brown', 'Clerk', 48000.00, 3),
  (6, 'Eva Davis', 'Assistant Manager', 58000.00, 1),
  (7, 'Frank White', 'Clerk', 46000.00, 1),
  (8, 'Grace Turner', 'Manager', 63000.00, 1),
  (9, 'Henry Lee', 'Clerk', 47000.00, 3),
  (10, 'Ivy Taylor', 'Assistant Manager', 59000.00, 1);
    
    
    
    
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (201, 'Alice ', '123 Main St', '2022-01-01'),
    (202, 'Bob ', '456 Oak St', '2022-02-15'),
    (203, 'Eva ', '789 Elm St', '2022-03-20') ,
    (204, ' Williams', '567 Main St', '2023-01-01'),
    (205, 'Davis', '678 Oak St', '2020-06-15'),
    (206, 'Miller', '403 Elm St', '2020-03-20') ,
    (207, 'John', '321  Main St', '2024-01-01'),
    (208, 'Rajesh', '900 Oak St', '2021-02-15'),
    (209, 'Pradeep', '679 Elm St', '2021-03-20'),
    (210,'Raju', '666 vik st ', '2023-08-26');
    
    


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, status , Author, Publisher)
VALUES
    (1001, 'Introduction to SQL', 'Programming', 159, 'Yes', 'John Smith', 'Tech Publications'),
    (1002, 'Data Structures in C', 'Programming', 209, 'No', 'Jane Johnson', 'Code Books Inc.'),
    (1003, 'History of Science', 'History', 185, 'Yes', 'Robert Brown', 'History Press'), 
    (1004, ' To Kill a Mockingbird','Fiction', 150, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co'),
    (1005, 'Dune', 'Science', 209, 'No', 'Frank Herber',  'Chilton Books'),
    (1006, 'The Girl with the Dragon Tattoo', 'Mystery', 185,'Yes',  'Stieg Larsson',  'Norstedts Förlag'),
	(1007, 'The Hobbit', 'Fantasy', 99,'Yes',  'J.R.R. Tolkien', 'Allen & Unwin'),
    (1008, 'The Pillars of the Earth', 'History', 200, 'Yes', 'Ken Follett', 'Macmillan'),
    (1009, 'Sapiens: A Brief History of Humankind', 'History', 180,'Yes',  'Yuval Noah Harari', 'Harvill Secker'),
    (1010,'Steve Jobs','Biography',346,'Yes', 'Walter Isaacson', 'Simon & Schuster');

INSERT INTO IssueStatus (Issue_Id,Issued_cust,  Issued_book_name, Issue_date,Isbn_book)
VALUES
    (301,201 , 'Introduction to SQL', '2022-04-01',1001),
    (302, 202, 'Data Structures in C', '2022-05-10',1002 ),
    (303,203 , 'History of Science', '2022-06-15',1003 ),
    (304,204,'To Kill a Mockingbird','2023-06-18',1004),
    (305,207, 'Dune','2023-06-11',1005),
    (308,208,'The Girl with the Dragon Tattoo','2024-03-08',1006),
    (306,209,'The Hobbit','2022-09-07',1007),
    (307,210,'The Pillars of the Earth','2023-08-31',1008);
    


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2 )
VALUES
    (401, 201, 'Introduction to SQL', '2022-04-15',1001),
    (402, 202, 'Data Structures in C', '2022-06-01',1002),
    (403, 203, 'History of Science', '2022-07-01',1003),
    (404,204,'To Kill a Mockingbird','2023-08-18',1004),
    (405,201, 'Dune','2023-09-11',1005),
    (406,207,'The Girl with the Dragon Tattoo','2024-04-08',1006),
    (407,208,'The Hobbit','2023-01-07',1008);

 -- 1.Retrieve the book title, category, and rental price of all available books.
 SELECT Book_title,Category,Rental_Price,Status FROM Books
 WHERE Status = 'Yes';
 
 -- 2. List the employee names and their respective salaries in descending order of salary.
 SELECT Emp_name,Salary FROM Employee
 ORDER BY  Salary DESC ;
 
 -- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;


-- 4. Display the total count of books in each category.
SELECT COUNT(Category), Category FROM Books
group by Category;


-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name ,Position, Salary FROM Employee
WHERE Salary > 50000 ;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
 SELECT Customer_name FROM Customer
 WHERE Reg_date < '2022-01-01' 
 AND Customer_Id NOT IN (SELECT DISTINCT Issued_cust FROM IssueStatus);
 
 -- 7. Display the branch numbers and the total count of employees in each branch.
 SELECT Branch_no , COUNT(Emp_Id) FROM Employee
 GROUP BY Branch_no ;    
 
 
		
-- 8. Display the names of customers who have issued books in the month of June 2023.

    
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

  -- 9. Retrieve book_title from book table containing history.
  SELECT Book_title  FROM Books
  where Category = 'history';
  
  --  10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
   SELECT Branch_no , COUNT(Emp_Id)  TOTAL_EMPLOYEE FROM Employee
 GROUP BY Branch_no 
 HAVING(TOTAL_EMPLOYEE > 5);
   
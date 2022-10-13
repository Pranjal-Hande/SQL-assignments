USE Assignment_cg

--Customer table
CREATE TABLE Customer
(
	Id int primary key not null,
	FirstName nvarchar(40),
	LastName nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
	Phone nvarchar(40)
);

--index of customer table
CREATE INDEX IndexCustomerName
ON Customer(FirstName, LastName);

--Orders table
CREATE TABLE Orders
(
	Id int primary key not null,
	OrderDate datetime not null,
	OrderNumber nvarchar(10),
	CustomerId int foreign key references customer(Id),
	TotalAmount decimal(12,2)
);

--index of Order table
CREATE INDEX IndexOrderCustomerId
ON Orders(CustomerId);

create index IndexOrderDate
ON Orders(OrderDate);

--Product table
CREATE TABLE Product
(
	Id int primary key not null,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	Package nvarchar(30),
	IsDiscontinued bit
);

--Index of Product table
create index IndexProductSupplierId
ON Product(Id);

create index IndexProductName
on Product(ProductName);


--OrderItem table
CREATE TABLE OrderItem
(
	Id int primary key not null,
	OrderId int foreign key references Orders(Id),
	ProductId int foreign key references Product(Id),
	UnitPrice decimal(12,2),
	Quantity int
);


--index of OrderItem
CREATE INDEX IndexOrderItemOrderId
on OrderItem(Id);

CREATE INDEX IndexOrderItemProductId
on OrderItem(ProductId);


--decribing Customer table
exec sp_help 'dbo.Customer';

--decribing OrderItem table
exec sp_help 'dbo.OrderItem';

 --decribing Orders table
exec sp_help 'dbo.Orders';

 --decribing Product table
exec sp_help 'dbo.Product';

--Inserting record in Customer table
INSERT INTO dbo.Customer VALUES(1, 'suresh', 'hande', 'kamothe', 'india', 9920851993);
 
INSERT INTO dbo.Customer VALUES(2, 'sadhana', 'hande', 'kharghar', 'canda', 9870060986);
 
INSERT INTO dbo.Customer VALUES(3, 'pragati', 'hande', 'belapur', 'USA', 9870060982);
 
INSERT INTO dbo.Customer VALUES(4, 'pooja', 'hande', 'seawoods', 'london', 9619066943);

INSERT INTO dbo.Customer VALUES(5, 'pranjal', 'hande', 'nerul', 'america', 9076460291);

INSERT INTO dbo.Customer VALUES(6, 'priya', 'hande', 'downtown', 'Japan', 9321428802);

--displaying records from Customer table
SELECT *FROM Customer;

--Inserting record in Orders table
INSERT INTO Orders VALUES(11, 21-01-2022, 10, 1, 11);
 
INSERT INTO Orders VALUES(22, 21-02-2022, 21, 2, 22);
 
INSERT INTO Orders VALUES(33, 21-03-2022, 32, 3, 33);
 
INSERT INTO Orders VALUES(44, 21-04-2022, 43, 4, 44);
 
INSERT INTO Orders VALUES(55, 21-05-2022, 54, 5, 55);
 
INSERT INTO Orders VALUES(66, 21-06-2022, 65, 6, 66);

--displaying records from Orders table
SELECT *FROM Orders;


--Inserting record in Product table
INSERT INTO Product VALUES(1111, 'study table', 5500.65, 'courier', 1);

INSERT INTO Product VALUES(2222, 'laptop', 65000.90, 'home-delivery', 1);

INSERT INTO Product VALUES(3333, 'hard-disk', 8000, 'courier', 0);

INSERT INTO Product VALUES(4444, 'tv-cabinet',12500.65, 'delivery', 0);

INSERT INTO Product VALUES(5555, 'perfume', 790.22, 'courier', 1);

INSERT INTO Product VALUES(6666, 'sofa-set', 17000.25, 'home-delivery', 0);

--displaying records from Product table
SELECT *FROM Product;

--Inserting record in OrderItem table
INSERT INTO OrderItem VALUES(111, 22, 1111, 5500.65, 10);

INSERT INTO OrderItem VALUES(222, 33, 2222, 65000.90, 20);

INSERT INTO OrderItem VALUES(333, 44, 3333, 8000, 30);

INSERT INTO OrderItem VALUES(444, 55, 4444, 12500.65, 40);

INSERT INTO OrderItem VALUES(555, 66, 5555, 790.22, 50);

INSERT INTO OrderItem VALUES(666, 66, 6666, 17000.25, 60);

--displaying records from OrderItem table
SELECT *FROM OrderItem;

--ASSIGNMENT QUERIES
--Q5
SELECT *FROM Customer;

--Q6
SELECT *FROM Customer
WHERE Country LIKE 'a%' OR Country LIKE 'l%'
ORDER BY Country;


--Q7
SELECT *FROM Customer
where FirstName LIKE '__i%';

---------------------------------------

use Assignment_cg

update Product
set ProductName='Chai' 
where Id='1111'

select *from Product

select * from Product
--WHERE Country ='USA'

select * from Orders

select * from Orders
join Product
on Orders.Id=Product.Id
WHERE ProductName='Chai'

-------------------------------

use Assignment_cg

select *from Customer;

select *from Product;

select *from Orders;

select *from OrderItem;

update Customer
set Country='germany'
where Id='2';

select *from Customer;

select *from Customer
where Country like 'Germany';


select *from Customer
where FirstName like '_u%';

--------------------------------

use Assignment_cg

select FirstName + ' ' + LastName FullName from Customer;

select *from Customer


update Customer
set Phone = '+1-212-9876543'
where Id ='3'

select *from Customer
where Phone like '%+1%'

select *from Orders

select *from OrderItem

update OrderItem
set UnitPrice='15'
where Id in ('333','555')

update OrderItem
set UnitPrice='12'
where Id='222'

select * from OrderItem 
join Orders
on OrderItem.OrderId=Orders.Id
where UnitPrice between '10'and'20'

select *from Orders
order by OrderDate

select *from Product
select *from OrderItem


select AVG(Quantity) , * from Product
join OrderItem 
on Product.Id=OrderItem.ProductId
group by Quantity,Product.Id
order by Quantity,Product.Id


--Display complete list of customers, the OrderID and date of any orders they have made
select Customer.FirstName,Customer.LastName, OrderItem.OrderId, Orders.OrderDate from Customer
join Orders
on Customer.Id=Orders.CustomerId
join OrderItem
on orders.Id=OrderItem.OrderId

select max(OrderItem.Quantity),customer.FirstName,Customer.LastName,count(*) from Customer
join Orders
on Customer.Id=Orders.CustomerId
join OrderItem
on Orders.Id=OrderItem.OrderId
group by OrderItem.Quantity
order by count(*) desc


select * from Customer
where FirstName like '%ra%'

--Display the first word of all the company name
alter table Product
alter column Company nvarchar(50)


select Company from Product

select *from Customer
select *from Orders
select *from OrderItem
select *from Product

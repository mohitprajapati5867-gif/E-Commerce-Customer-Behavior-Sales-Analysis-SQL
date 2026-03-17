/* Ecommerce Customer Behavior And Analysis*/

--------Business KPIs------
/*Total Revenue*/
select
sum([TotalAmount]) as "Total Revenue"
from Ecommerce_Dataset_1

---Total Orders
select
count(*) as "Total Orders"
from Ecommerce_Dataset_1

---Total Users
select 
count([UserID]) as "Total User"
from Ecommerce_Dataset_1

---Average Order Value
select
avg([TotalAmount]) as "Avg Order Value"
from Ecommerce_Dataset_1

---Revenue Per User
select
SUM([TotalAmount])/COUNT([userId]) as "Revenue Per User"
from Ecommerce_Dataset_1

---Total Revenue by Gender
select Gender,
sum([TotalAmount]) as "Total Amount"
from Ecommerce_Dataset_1
group by Gender
order by [Total Amount] desc

---Order by age group
select Age,
count(*) as "Users"
from Ecommerce_Dataset_1
group by Age

---Top 10 Users by Highest Revenue
select top 10 UserID,
sum([TotalAmount]) as "Revenue"
from Ecommerce_Dataset_1
group by UserID
order by Revenue desc

---Top 10 Users by lowest Revenue
select top 10 UserID,
sum([TotalAmount]) as "Revenue"
from Ecommerce_Dataset_1
group by UserID
order by Revenue asc

---Country Wise Revenue
select Country,
sum([TotalAmount]) as "Total Amount"
from Ecommerce_Dataset_1
group by Country
order by "Total Amount" desc

---Total Users by Country
select country,
COUNT([userId]) as "Total Users"
from Ecommerce_Dataset_1
group by Country

---Revenue Contribution By Country
select Country,
SUM([TotalAmount]) as "Revenue",
sum([TotalAmount])*100/SUM(sum([TotalAmount])) over() as "Contribution Percentage"
from Ecommerce_Dataset_1
group by Country

---Join Users with Products
select * from Ecommerce_Dataset_1 F
inner join Ecommerce_Dataset_2 S on F.ProductID=s.ProductID

---Revenue by Product
Select s.ProductName,
SUM(f.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S
inner join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by ProductName
order by [Total Revenue] desc

---Highest Revenue by Product
Select top 1 s.ProductName,
SUM(f.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S
inner join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by ProductName
order by [Total Revenue] desc

---Lowest Revenue by Product
Select top 1 s.ProductName,
SUM(f.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S
inner join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by ProductName
order by [Total Revenue] asc

---Quantity sold by Product
select ProductName,
SUM([quantity]) as "Quantity"
from Ecommerce_Dataset_2
group by ProductName

---Highest Quantity sold by Product
select Top 1 ProductName,
SUM([Quantity]) as "Quantity"
from Ecommerce_Dataset_2
group by ProductName
order by Quantity desc

---Lowest Quantity sold by Product
select Top 1 ProductName,
SUM([Quantity]) as "Quantity"
from Ecommerce_Dataset_2
group by ProductName
order by Quantity asc


---Quantity sold by Country
select Country,
SUM([quantity]) as "Total Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on f.ProductID=S.ProductID
group by Country

---Highest Quantity sold by Country
select top 1 country,
SUM([quantity]) as "Total Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on F.ProductID=S.ProductID
group by Country
order by [Total Quantity] desc

---Lowest Quantity sold by Country
select top 1 country,
SUM([quantity]) as "Total Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on F.ProductID=S.ProductID
group by Country
order by [Total Quantity] asc

---Category wise Revenue 
select S.Category,
SUM(S.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S 
Right Join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by S.Category
order by [Total Revenue] Desc

---Highest Revenue by Category
select top 1 S.Category,
SUM(S.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S 
right join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by s.Category
order by [Total Revenue] desc

---Lowest Revenue by Category
select top 1 S.Category,
SUM(S.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_2 S 
right join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by s.Category
order by [Total Revenue] asc

---Category wise Quantity
select S.Category,
SUM(S.Quantity) as "Total Quantity"
from Ecommerce_Dataset_2 S 
right join Ecommerce_Dataset_1 F on S.ProductID=f.ProductID
group by s.Category
order by [Total Quantity] desc

---Revenue By Device type
select DeviceType,
sum([totalamount]) as "Revenue"
from Ecommerce_Dataset_1
group by DeviceType
order by Revenue desc

---Quantity by Device type
select F.DeviceType,
SUM(S.Quantity) as "Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on f.ProductID=S.ProductID
group by f.DeviceType
order by Quantity desc

---Revenue by Referral Sources
select ReferralSource,
sum([totalamount]) as "Revenue"
from Ecommerce_Dataset_1
group by ReferralSource
order by Revenue Desc

---Quantity sold by Referral Sources
select F.ReferralSource,
sum(S.Quantity) as "Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on S.ProductID=f.ProductID
group by ReferralSource
order by Quantity Desc

----Discount and Non-Discount Applied
select HasDiscountApplied,
SUM([totalamount]) as "Revenue"
from Ecommerce_Dataset_1
group by HasDiscountApplied

---Max Discount Applied
select AVG([discountrate])
from Ecommerce_Dataset_1

---Total Orders with Discount
select count(*) as "Total Order" from Ecommerce_Dataset_1 where HasDiscountApplied = 1

---Avg Review Score
select AVG([reviewscore]) as "Avg Review Score" from Ecommerce_Dataset_1

---Max Review Score
select max([reviewscore]) as "Max Review Score" from Ecommerce_Dataset_1

---MIn Review Score
select min([reviewscore]) as "Min Review Score" from Ecommerce_Dataset_1

---Monthly Revenue And Quantity
select year(F.PurchaseDate) as "Year",
MONTH(F.PurchaseDate) as "Month",
sum(F.TotalAmount) as "Total Revenue",
sum(S.Quantity) as "Total Quantity"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on S.ProductID=F.ProductID
group by YEAR(F.PurchaseDate),MONTH(F.PurchaseDate)
order by [Total Revenue] desc

---Peak Revenue Month
Select top 1 year(F.PurchaseDate) as "Year",
month(F.PurchaseDate) as "Month",
sum(S.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on F.ProductID=s.ProductID
group by YEAR(F.PurchaseDate),MONTH(F.PurchaseDate)
order by [Total Revenue] desc

---Lowest Revenue Month
Select top 1 year(F.PurchaseDate) as "Year",
month(F.PurchaseDate) as "Month",
sum(S.TotalAmount) as "Total Revenue"
from Ecommerce_Dataset_1 F
right join Ecommerce_Dataset_2 S on F.ProductID=s.ProductID
group by YEAR(F.PurchaseDate),MONTH(F.PurchaseDate)
order by [Total Revenue] asc



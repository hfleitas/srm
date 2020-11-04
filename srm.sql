use master 
go
if db_id('SRM') is null create database SRM
go
use SRM
go 
drop table if exists Inventory;
drop table if exists Product;
go
create table Product (
    ProductCode int identity primary key clustered,
    Name varchar(128),
    Description varchar(max),
    Orgin varchar(128),
    Manufacture varchar(128),
    Size varchar(25),
    Price money, 
    Cost money,
    CreatedDate datetime default(getdate()),
    ModifiedDate datetime default(getdate())
);
go 
create table Inventory (
    -- InventoryID int identity primary key clustered, --reserved in CDM.
    ProductCode int foreign key references Product(ProductCode),
    Location varchar(128),
    Shelf varchar(25), 
    SquareFeet int,
    CreatedDate datetime default(getdate())
);
go 
set identity_insert Product on; 

insert Product ([ProductCode], [Name], [Description], [Orgin], [Manufacture], [Size], [Price], [Cost])
values
    (2350138, 'Hamlet Blanco', 'Glossy marble with snowy gray-whites undertones', 'Spain', 'SRM', '48x48', 3.53, .99*rand()),
    (2350099, 'Toscana Blanco', 'Glossy marble with white undertones and slight present gray tones', 'Spain', 'Geotiles', '36x36', 2.53, .99*rand()),
    (2350098, 'Salon Wiskey', 'Glossy marble with warm white undertone open balance gray-golds', 'Italy', 'Ferrari', '32x32', 2, .99*rand()),
    (24483052, 'Catalatta Gold', 'Glossy marble cream with minimal gray tone', 'Spain', 'Ecoceramic', '24x48', 2.89, .99*rand()),
    (24483051, 'Calacata Trento Gulk', 'Glossy marble light grays with minimal gray tone', 'India', 'Margrette', '24x48', 1.67, .99*rand()),
    (24483053, 'India Candela', 'Glossy marble white and gray very minimal', 'India', 'MGH', '24x48', 1.89, .99*rand()),
    (32323054, 'Snow Gray India', 'Glossy marble gray snowy', 'India', 'Pan Caliente', '32x32', 1.39, .99*rand()),
    (32323055, 'Statuario Elegant Polish', 'Glossy marble minimal white gray blues', 'India', 'Ella', '32x32', 1.89, .99*rand())

set identity_insert Product off; 
go 
insert Inventory (ProductCode, Location, Shelf, SquareFeet)
select 2350138, 'Doral', substring(convert(varchar(40),newid()),1,3), round(rand()*20000,0)+2700 union
select 2350099, 'Doral', substring(convert(varchar(40),newid()),1,3), round(rand()*20000,0)+2700 union
select 2350098, 'Doral', substring(convert(varchar(40),newid()),1,3), round(rand()*30000,0)+1000 union
select 24483052, 'Hialeah', substring(convert(varchar(40),newid()),1,3), round(rand()*30000,0)+1000 union
select 24483051, 'Hialeah', substring(convert(varchar(40),newid()),1,3), round(rand()*10000,0)+1000 union
select 24483053, 'Hialeah', substring(convert(varchar(40),newid()),1,3), round(rand()*20000,0)+1000 union
select 32323054, 'Warehouse', substring(convert(varchar(40),newid()),1,3), round(rand()*10000,0)+1000 union
select 32323055, 'Warehouse', substring(convert(varchar(40),newid()),1,3), round(rand()*10000,0)+1000 
go 
select * from Product
select * from Inventory
go
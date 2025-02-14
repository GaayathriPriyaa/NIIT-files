create database techmac_db;
use techmac_db;
create table techhyve_employees(employee_ID varchar (50) primary key,firstname varchar (50), lastname varchar (50), gender varchar(50), age int);
create table techcloud_employees(employee_ID varchar (50) primary key,firstname varchar (50), lastname varchar (50), gender varchar(50), age int);
create table techsoft_employees(employee_ID varchar (50) primary key,firstname varchar (50), lastname varchar (50), gender varchar(50), age int);
desc techhyve_employees;
desc techcloud_employees;
desc techsoft_employees;
insert into techhyve_employees value("TH0001","Eli","Evans","Male",26);
insert into techhyve_employees value("TH0002","Carlos","Simmons","Male",32);
insert into techhyve_employees value("TH0003","Kathie","Bryant","Female",25);
insert into techhyve_employees value("TH0004","Joey","Hughes","Male",41);
insert into techhyve_employees value("TH0005","Alice","Matthews","Female",52);
select * from techhyve_employees;
insert into techcloud_employees value("TC0001","Teresa","Bryant","Female",39);
insert into techcloud_employees value("TC0002","Alexis","Patterson","Male",48);
insert into techcloud_employees value("TC0003","Rose","Bell","Female",42);
insert into techcloud_employees value("TC0004","Gemma","Watkins","Female",44);
insert into techcloud_employees value("TC0005","Kingston","Martinez","Male",29);
select * from techcloud_employees;
insert into techsoft_employees value("TS0001","Peter","Burtler","Male",44);
insert into techsoft_employees value("TS0002","Harold","Simmons","Male",54);
insert into techsoft_employees value("TS0003","Juliana","Sanders","Female",36);
insert into techsoft_employees value("TS0004","Paul","Ward","Male",29);
select * from techsoft_employees;
-- taking backup;
create database backup_techmac_db;
use backup_techmac_db;
create table techhyve_employees_bkp as select * from techmac_db.techhyve_employees;
desc techhyve_employees_bkp;
create table techcloud_employees_bkp as select * from techmac_db.techcloud_employees;
desc techcloud_employees_bkp;
create table techsoft_employees_bkp as select * from techmac_db.techsoft_employees;
desc techsoft_employees_bkp;
insert techhyve_employees_bkp select * from techmac_db.techhyve_employees;
select * from techhyve_employees_bkp;
insert techcloud_employees_bkp select * from techmac_db.techcloud_employees;
select * from techcloud_employees_bkp;
insert techsoft_employees_bkp select * from techmac_db.techsoft_employees;
select * from techsoft_employees_bkp;
use techmac_db;
delete from techhyve_employees where employee_id = "TH0003";
select * from techhyve_employees;
delete from techhyve_employees where employee_id = "TH0005";
select * from techhyve_employees;
delete from techcloud_employees where employee_id = "TC0001";
select * from techcloud_employees;
delete from techcloud_employees where employee_id = "TC0004";
select * from techcloud_employees;
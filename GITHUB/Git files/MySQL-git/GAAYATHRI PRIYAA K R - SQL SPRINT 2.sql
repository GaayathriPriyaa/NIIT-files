Create database techmac_db;
use techmac_db;
create table techhyve_employer (employee_ID varchar(50) primary key,firstname varchar(50),lastname varchar(50),gender varchar(50),age int);
desc  techhyve_employer;
create table techcloud_employees (employee_ID varchar(50) primary key,firstname varchar(50),lastname varchar(50),gender varchar(50),age int);
desc techcloud_employees;
create table techsoft_employees ( employee_ID varchar(50) primary key,firstname varchar(50),lastname varchar(50),gender varchar(50),age int );
desc  techsoft_employees;
 insert into techhyve_employer value("TH0001","Eli","Evans","Male",26);
 insert into techhyve_employer value("TH0002","Carlos","simmons","male",32);
 insert into techhyve_employer value("TH0003","Kathie","Bryant","female",25);
 insert into techhyve_employer  value("TH0004","Joey","hughes","male",41);
 insert into techhyve_employer  value("TH0005","Alice","maththews","female",52);
 select*from techhyve_employer;
 insert into techcloud_employees value("TC0001","Teresa","brynt","Female",39);
 insert into techcloud_employees value("TC0002","Alexis","Petterson","Male",48);
 insert into techcloud_employees value("TC0003","Rose","Bell","Female",42);
 insert into techcloud_employees value("TC0004","Gemma","Watkins","Female",44);
 insert into techcloud_employees value("TC0005","Kingston","Martinez","Male",29);
 select*from techcloud_employees;
 insert into techsoft_employees value("TS0001","Peter","Burtler","Male",44);
 insert into techsoft_employees value("TS0002","Harold","Simmons","Male",54);
 insert into techsoft_employees value("TS0003","Juliana","Sanders","Female",36);
 insert into techsoft_employees value("TS0004","Paul","Ward","Male",29);
 insert into techsoft_employees value("TS0005","Nicole","Bryant","Female",30);
 select*from techsoft_employees;
 -- task 1(i)
 alter table techhyve_employer modify column first_name varchar (50)not null,modify last_name varchar (50) not null;
 alter table techcloud_employees modify column first_name varchar(50) not null,modify last_name varchar (50)not null ;
 alter table techsoft_employees modify column first_name varchar (50)not null,modify last_name varchar(50) not null ;
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 1(ii)
 alter table techhyve_employer modify column age int default 21;
 alter table techcloud_employees modify column age int default 21;
 alter table techsoft_employees modify column age int default 21;
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 1(iii)
 alter table techhyve_employer add check (age>=21 and age<=55);
 alter table techcloud_employees add check (age>=21 and age<=55);
 alter table techsoft_employees add check (age>=21 and age<=55);
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 1(iv)
 alter table techhyve_employer add column username varchar(50) not null,add column password varchar(50) not null;
 alter table techcloud_employees add column username varchar(50) not null,add column password varchar(50) not null;
 alter table techsoft_employees add column username varchar(50) not null,add column password varchar(50) not null;
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 1(v)
 alter table techhyve_employer add check (gender in ("male","female"));
 alter table techcloud_employees add check (gender in ("male","female"));
 alter table techsoft_employees add check (gender in ("male","female"));
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 2  
 alter table techhyve_employer add column com_prof int default 1, add check (com_prof in (1,5));
 alter table techcloud_employees add column com_prof int default 1, add check (com_prof in (1,5));
 alter table techsoft_employees add column com_prof int default 1, add check (com_prof in (1,5));
 desc techhyve_employer;
 desc techcloud_employees;
 desc techsoft_employees;
 -- task 3
 create table techhyvecloud_employee as select* from techhyve_employer union select * from techcloud_employees;
 select * from techhyvecloud_employee;
 truncate table techhyve_employer;
 truncate table techcloud_employees;
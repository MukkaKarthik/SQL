#show databases; this command will show all databases present in SQL server which got connected to client , used to view the databases
#create database Test_Database1;
drop database Test_Database1;#drop is the command for deleting database


create database Test_Database1;
select "Mindtree Developer";
select * from sys.sys_config;

use Test_Database1;#use <<database name>> to use the database

create table Employee_table1(Emp_ID int,Emp_Name varchar(15),Emp_Salary int,Emp_Location varchar(15));
show tables;

insert into Employee_table1 values(01,"Name1",2500,"Bangalore");
insert into Employee_table1 values(02,"Name2",3500,"Hyderabad");
insert into Employee_table1 values(03,"Name3",5000,"Chennai");
insert into Employee_table1 values(04,"Name4",2000,"Delhi");
insert into Employee_table1 values(05,"Name5",4000);# it will throw an error as table Employee_table1 cosnsist of 4 columns and data given here fall under 3 columns 
#we can overcome by following this way 
insert into Employee_table1(Emp_Name,Emp_Salary,Emp_Location) values("Name5",4000,"Gujarat");# values inserting only in first 3 columns and not the last column 
#if value is not inserted ,then it is treated as null

select * from Employee_table1;

describe Employee_table1;# this provides the meta data of the table 


select * from Employee_table1;

describe Employee_table1;#description of the given data table is provided 
 
 #creating table using existing table
 create table Employee_table2 as (select * from Employee_table1);
 select * from Employee_table2;
 
 create table Employee_table3 as (select  Emp_Name,Emp_Location from Employee_table2);
select * from Employee_table3;
 

#Insert into statements
show tables;
describe Employee_table3;


create table DataType_table1(a int,b varchar(10), c boolean);
select * from DataType_table1;

insert into DataType_table1 values(1,"Name1",true);
insert into DataType_table1 values(2,"Name2",true);
insert into DataType_table1 values(3,"Name3",false);
insert into DataType_table1 values(4,"Name4",true);
insert into DataType_table1 values(5,"Name5",false);
insert into DataType_table1(a,b) values(6,"Name6");
insert into DataType_table1(a) values(7.3);#7
insert into DataType_table1(a) values(7.5);#8
insert into DataType_table1(a) values(7.6);#8
insert into DataType_table1(a) values(7.64563);#8
insert into DataType_table1(a) values(7.3546);#7

select * from DataType_table1;


create table DataType_table2(a double);

use test_database1;
create table DataType_table2(a double);

insert into DataType_table2 values(9);
insert into DataType_table2 values(9.45);#9.45


select * from DataType_table2;

create table DataType_table3(a date);
insert into DataType_table3 values("2022-01-09");

select * from DataType_table3;

create table DataType_table4(a datetime);
insert into DataType_table4 values("2022-01-09 03:45:21");
select * from DataType_table4;


create table DataType_table5(a time);
insert into DataType_table5 values("03:45:21");
select * from DataType_table5;


create table datatype_table6(a year);
insert into datatype_table6 values("2022");
select * from DataType_table6;


show tables;

drop table datatype_table1;
drop table datatype_table2;
drop table datatype_table3;
drop table datatype_table4;
drop table datatype_table5;
drop table datatype_table6;

select * from employee_table1;
insert into employee_table1(Emp_Name,Emp_location) values("Name5","Bombay");

#is Null operator
select * from employee_table1 where Emp_ID is null;


#is not Null operator
select * from employee_table1 where Emp_ID is not null;


# delete statements

# for deleting databases, drop <<database name>> , for deleting tables, drop <<table name>>
# for deleting records, delete <<database name>>
select * from employee_table1;

delete from employee_table1 where Emp_ID = 4;

# if where condition is not used , then all the records are deleted from the table 
# delete from employee_table1; //in this all records are deleted 
select * from employee_table1;

update  employee_table1 set Emp_Name = "Name5_update" where Emp_Name = "Name5";#updating single column values
update employee_table1 set Emp_Name = "Name3_update",Emp_ID = 10,Emp_Location = "IIT Dhanbad" where Emp_Name = "Name3";#updating multiple column values
update employee_table1 set Emp_Salary=15000;# all records under column Emp_Salary will be updated as 15000
select * from employee_table1;



# working on alter statements
#changing table name 
show tables;


select * from employee_tablename_namechanged;
alter  table employee_tablename_namechanged add column newColumn int;
alter table employee_tablename_namechanged modify column newColumn varchar(15);
alter table employee_tablename_namechanged modify column newColumn int;
alter table employee_tablename_namechanged modify column newColumn varchar(15);
alter table employee_tablename_namechanged modify column newColumn varchar(20);# data type as well no of characters can also be changed
alter table employee_tablename_namechanged rename column newColumn to rename_column ;
alter table employee_tablename_namechanged drop column rename_column;
rename table employee_table1 to employee_tablename_nameChanged;

describe employee_tablename_namechanged;
select * from employee_tablename_namechanged;


select * from employee_tablename_namechanged;
insert into employee_tablename_namechanged(Emp_Name,Emp_Location) values("Name6","Delhi");


insert into employee_tablename_namechanged(Emp_Name,Emp_Location) values("Name7","Delhi_commit");
select * from employee_tablename_namechanged;

set autocommit = 0; # by doing this all dml operations happens  temporarily , when we retsart workbench and connect to database again , then all operations performed during this time will be vanished 
select * from employee_tablename_namechanged;
insert into employee_tablename_namechanged(Emp_Name,Emp_Location) values("Name8","Delhi_commit1");
select * from employee_tablename_namechanged;


set autocommit = 1;
select * from employee_tablename_namechanged;
insert into employee_tablename_namechanged(Emp_Name,Emp_Location) values("Name9","remove_commit1");
select * from employee_tablename_namechanged;



set autocommit = 0;
select * from employee_tablename_namechanged;

insert into employee_tablename_namechanged values(20,"Name10",45000,"Gujarat");
select * from employee_tablename_namechanged;

set autocommit = 1;
insert into employee_tablename_namechanged values(20,"Name15",45000,"Bangalore");
select * from employee_tablename_namechanged;




set autocommit =1 ;
delete from employee_tablename_namechanged;
select * from employee_tablename_namechanged;
rollback;

insert into employee_tablename_namechanged values(1,"Name1",2300,"Bangalore");
insert into employee_tablename_namechanged values(2,"Name2",3500,"Delhi");
insert into employee_tablename_namechanged values(3,"Name3",4500,"Bombay");
insert into employee_tablename_namechanged values(4,"Name4",7500,"Hyderabad");
insert into employee_tablename_namechanged values(5,"Name5",9500,"Pune");

select * from employee_tablename_namechanged;

set autocommit = 0;
insert into employee_tablename_namechanged values(6,"Name6",19500,"Chennai");
select * from employee_tablename_namechanged;
 
rollback;
select * from employee_tablename_namechanged;

delete from employee_tablename_namechanged;
select * from employee_tablename_namechanged;

rollback;
select * from employee_tablename_namechanged;#all data are visible and reverted 

delete from employee_tablename_namechanged;
commit;
select * from employee_tablename_namechanged;
rollback;#can't revert deletion process
select * from employee_tablename_namechanged;


set autocommit =1;


select * from employee_tablename_namechanged;

insert into employee_tablename_namechanged values(1,"Name1",2500,"Bangalore");
insert into employee_tablename_namechanged values(2,"Name2",3500,"Delhi");
insert into employee_tablename_namechanged values(3,"Name3",7500,"Bombay");
insert into employee_tablename_namechanged values(4,"Name4",5000,"Hyderabad");



# Union Operator 
create table t1(a int);
insert into t1 values(1);
insert into t1 values(3);
insert into t1 values(5);
select * from t1;


create table t2(a int);
insert into t2 values(2);
insert into t2 values(3);
insert into t2 values(4);
select * from t2;

#using union operator 
select * from t1 union select * from t2; #show duplicate values only once

#using union all operator 
select * from t1 union all select * from t2;#show duplicate values multiple times as many times values that value is present under multiple tables

#using intersect operator 
select * from t1 union select * from t2;


create table t3(a int,b varchar(15));
insert into t3 values(2,"Name2");
insert into t3 values(3,"Name3");
insert into t3 values(4,"Name4");
select * from t3;

create table t4(c int,d varchar(20));
insert into t4 values(1,"Name1");
insert into t4 values(3,"Name3");
insert into t4 values(5,"Name5");
insert into t4 values(3,"3Name");
select * from t4;

select * from t3 union select * from t4;
select b from t3 union select d from t4;
select d from t4 union select b from t3;
select a from t3 union select d from t4;

select a from t3 union select c,d from t4;# it will throw an error , not possible 
select a,b from t3 union select c,d from t4; # this is possible , since there are equal number of columns on left hand side and right hand side of union operator 
select a,b from t3 union select d,c from t4;


#Intersect operator 

create table t5(a int);

insert into t5 values(1);
insert into t5 values(3);
insert into t5 values(5);

select a from t5;

create table t6(b int);

insert into t6 values(2);
insert into t6 values(3);
insert into t6 values(4);
 
select b from t6;

#select a from t5 intersect select b from t6;//MySQL won't support intersect operator . Hence , it will throw an error 


# Minus Operator 

create table t7(a int);

insert into t7 values(2);
insert into t7 values(3);
insert into t7 values(4);
 
select a from t7;


create table t8(a int);

insert into t8 values(2);
insert into t8 values(3);
insert into t8 values(4);
 
select a from t8;

#select a from t7 minus select a from t8; //MySQL won't support minus operator . Hence , it will throw an error 

select * from t1,t2,t3,t4;

drop table t1;
drop table t2;
drop table t3;
drop table t4;
drop table t5;
drop table t6;



#table aliases

create table alias_table1(ID_table1 int, firstName_table1 varchar(35),lastName_table1 varchar(35));

insert into alias_table1 values(1,"firstName_table1_1","lastName_table1_1");
insert into alias_table1 values(2,"firstName_table1_2","lastName_table1_2");
insert into alias_table1 values(3,"firstName_table1_3","lastName_table1_3");
insert into alias_table1 values(4,"firstName_table1_4","lastName_table1_4");
insert into alias_table1 values(5,"firstName_table1_5","lastName_table1_5");

select * from alias_table1;


create table alias_table2(ID_table1 int, firstName_table2 varchar(35),lastName_table2 varchar(35));

insert into alias_table2 values(1,"firstName_table2_1","lastName_table2_1");
insert into alias_table2 values(2,"firstName_table2_2","lastName_table2_2");
insert into alias_table2 values(3,"firstName_table2_3","lastName_table2_3");
insert into alias_table2 values(4,"firstName_table2_4","lastName_table2_4");
insert into alias_table2 values(5,"firstName_table2_5","lastName_table2_5");

select * from alias_table2;

select * from alias_table1 a1,alias_table2 a2;


select a1.firstName from alias_table1 a1;
select a2.lastName from alias_table2 a2;

select a1.ID,a1.firstName,a2.lastName from  alias_table1 a1,alias_table2 a2 where a1.ID = a2.ID;



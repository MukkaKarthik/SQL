/*create database SQL_1st_Database;

--------use SQL_1st_Database;
*/
create table Employee(EMPID int,EMPName char(10),EMPSalary money,EmpAge tinyint);

use SQL_1st_Database;
create table Employee1(EMPID int,EMPName char(10),EMPSalary money,EmpAge tinyint);

sp_help Employee;

--how to change the datatype and size of the datatype ?

--alter table <tablename> alter column <cloumn name><new datatype>[new size]
alter table Employee alter column EMPName varchar(25);

--how to add new column to the table?
alter table Employee add EMPGender varchar(30);

--how to change a column name?
--sp_rename to change column name and table name 

select * from changed_June;

insert into table changed_June values(1,"yes",20,30);
--Syntax to change column name 
--sp_rename '<tableName>.<columnName>','<New column Name>'; 
sp_rename 'changed_June.EMPID','changed_June';

--Syntax to change table name 
--sp_rename '<oldTableName','new Table name';
sp_rename 'Employee','Employee_tableChanged';


--how to drop unwanted columns?
--alter table <table name> drop column <columnName>
alter table Employee_tableChanged drop column EMPID;


--changing table to check for double quotes
sp_rename "Employee_tableChanged","Employee_DoubleQuotes";


--to show all rows and columns from a table
select * from "Employee_DoubleQuotes";

--truncate commands :- to delete all rows from table at a time , we cannot delete specific row from the table
--because it does not support "where" keyword condition  

--truncate table Employee_DoubleQuotes where EMPName=M105;(will throw an error)

select * from "Employee_DoubleQuotes";

--dropping all rows from a table at a time  
truncate table "Employee_DoubleQuotes";

select * from "Employee_DoubleQuotes";



-- using drop command to drop entire table or entire structure(complete object is dropping,i.e table,data and object ) 
drop table "Employee_DoubleQuotes";

--drop table "MYCLASSDB"; // will throw an error as we are in a different database 

Create table Student(name varchar,age tinyint,Gender varchar,TotalMarks int); 

alter table Student alter column name varchar(100);
alter table Student alter column Gender varchar(100);


--working on data manipulation language commands (DML) :- we use these commands for changing table data 

--Insert :- to insert new values into table
--Method1 :- send equal values as per no of columns, if there are 4 columns send 4 values 
--insert [into] table <table name> values(value1,value2,..);

insert into Student values('Facebook',23,'Male',245);
insert into Student values('Google',53,'female',452);
insert into Student values('Microsoft',93,'Male',873);
insert into Student values('Yahoo',23,'female',982);


select * from Student;


--Method 2 
--insert [into] <table name>(req.column names) values(value1,value2,value3,...)

insert into Student (age,Gender) values(100,'Transgender');

select * from Student;


--into word is optional , 

--sending required parameters
insert Student (age,Gender) values(100,'Transgender_without into word');
select * from Student;

--sending all parameters
insert Student values('Messenger',50,'Transgender',675);
select * from Student;


--update (we can change all records at one time or specific records)
--Syntax :- update tableName set <columnName>=value1,<columnName>=value2,<columnName>=value3,...
--..........[where(condition)] always use where for a single specfic record changes , if not used then update wil apply for all records


update Student set TotalMarks =1000 where (name='Facebook');

update Student set name='replaced something' where name is NULL
select * from Student;

Example 3:-
update Student set TotalMarks=2000 where TotalMarks is NULL
select * from Student;

Example 4 :- updating all records at once
update Student set age = 50;
select * from Student;


--Delete :- delete all rows at once or delete specific data from a table 
--Syntax:- delete<table name> [where(condition)] //where is optional used only fo specific records

delete Student where TotalMarks=675;
select * from Student;

--from word is optional
delete from Student where TotalMarks=982;
select * from Student;

update  Student set Gender=Null where Gender='Male';
select * from Student;

delete from Student where Gender is Null;
select * from Student;

--when below statement is used , all records are deleted from table 
--delete from Student / delete Student 


--working with DQL (data query language) also called as DRL(data retrieving language), only one command is present Select
select age,Gender from Student;

-- * represents all columns
select * from Student;

select name,age,Gender,TotalMarks from Student where TotalMarks=2000;


select * from Student;

select * from Student where TotalMarks=2000;

select * from Student;

--without condition
select name from Student where age=50;

select * from Student;

--with condition
select age,Gender from Student;

--Example for identity function 

--using identity without using seed and increment
--create table Employee(EID int identity, EName varchar(35) identity,Salary Money,Sl_No int identity);
-- will throw an error for above statement 

create table Employee(EID int identity, EName varchar(35) ,Salary Money,Sl_No int );
--by doing this way ,values are already inserted into the table 
select * from Employee;

--User can't insert any value , it will throw an error for below line
insert Employee values(23,'Name1',3456,1);--not allowed

--but will work this way , no need to give as system will automatically give default value as 1
insert Employee values('Name1',3456,1);--allowed
select * from Employee;

insert Employee(EID,EID,Salary,Sl_No) values(23,'Name1',3456,1);--not allowed will throw an error 

select * from Employee

select * from Student;


insert into Student(name,Gender) values('Name2','Male-name2');
select * from Student;

select * from Employee

create table Student1(SID int identity(100,5),Salary int , Gender varchar, Name varchar);


--Setting Identity functions on and off

set identity_insert Student1 on;

select * from Student1;

insert Student1(SID,Salary) values(500,3412);
select * from Student1;



insert into Student1(SID,Salary) values(1000,5647);
insert into Student1(SID,Salary) values(1500,8765);
--select * from Student1;



select * from Student1 

set identity_insert Student1 off;

insert Student1(Salary) values (3400);
insert Student1(Salary) values (3401);

select * from Student1 



--create table Employees_Hyderabad(EID tinyint,EName varchar(100),Salary money);
--create table Employees_Bangalore(EID tinyint,EName varchar(100),Salary money);

--Set operators 
--1) Union :- No duplicate values are present , only unique values are combined

select * from Employees_Hyderabad union select * from Employees_Bangalore;

--select * from Employees_Hyderabad union select EName,Salary from Employees_Bangalore;//will throw an error as no of columns don't match

select EName,Salary from Employees_Hyderabad union select EName,Salary from Employees_Bangalore;
--above statement is allowed as no of columns are same 

select EName,Salary from Employees_Hyderabad union select Salary,EName from Employees_Bangalore;
--not allowed

select EName from Employees_Hyderabad union select Salary from Employees_Bangalore;
--not allowed


--2) union all (shows duplicate values too)
select * from Employees_Hyderabad union all select * from Employees_Bangalore;

--3) intersect (returns only common values from both tables)
select * from Employees_Hyderabad intersect select * from Employees_Bangalore;

--4) except (below 2 statements will display different values)
select * from Employees_Hyderabad except select * from Employees_Bangalore;
select * from Employees_Bangalore except select * from Employees_Hyderabad;


--working with Primary key and foreign key 
--Step 1:- creating parent table

create table department(DeptNo int primary key,DepartmentName varchar(100),Location varchar(30));
--this table is treated as parent table as it contains primary key , a key will be present which is visible in object explorer under keys 

insert department values(10,'Accounting','Bangalore');
insert department values(20,'Medical','Pune');
insert department values(30,'Engineering','Mumbai'),(40,'Architecture','Kolkata'),(50,'Crafting','Ranchi')

select * from department;

--Step 2:-creating child table
-- the column which has primary key in parent table should be present in child table too
create table department_child(DeptNo int foreign key references department(DeptNo),DepartmentName_child varchar(100),Location_child varchar(30));

select * from department;
select * from department_child;

insert department_child values(50,'Name_child','Bangalore');--allowed
insert department_child values(40,'Name_child4','Bangalore4');--allowed
insert department_child values(30,'Name_child3','Bangalore3');--allowed
insert department_child values(20,'Name_child2','Bangalore2');--allowed
insert department_child values(10,'Name_child1','Bangalore1');--allowed
--insert department_child values(100,'Name_child1','Bangalore1');//will throw an error as we can't insert any value apart from Primary Key values

select * from department;
select * from department_child;


create table table1_Student1(Student_ID int, SName varchar(40),Email varchar(40),CourseID int);

create table table2_Student2(Course_ID int, CourseName varchar(40),CourseFee decimal(6,2));

select * from table1_Student1;
select * from table2_Student2;


select * from table1_Student1 inner join table2_Student2 on Student_ID=Course_ID;--will get matching data
--will throw an error if where key word is used

use SQL_1st_Database;
select * from table1_Student1 inner join table2_Student2 on Email=CourseName;--won't get matching data


select * from table1_Student1;
select * from table2_Student2;

select * from table1_Student1 left outer join table2_Student2 on Student_ID=Course_ID;

select * from table1_Student1 t1 right outer join table2_Student2 t2 on t1.Student_ID=t2.Course_ID;
--t1 and t2 are aliases


select * from table1_Student1 full outer join table2_Student2 on Student_ID=Course_ID;

use SQL_1st_Database;
select * from table1_Student1 cross join table2_Student2;
--here 101 row1 from table1 is joining with 4 rows in table 2 101 with 10,20,30,40 as 7 rows are present in table1 hence 28 rows 

--select * from table1_Student1 natural join table2_Student2;//not supported in SQL , hence it throws an error

select * from table1_Student1 where Email='email7';--executing as we know the condition , applying where condition 

select * from table1_Student1 ts1,table1_Student1 ts2 where ts1.Email = ts2.Email;--will display entire data again 

select * from table1_Student1 s1 , table1_Student1 s2 where s1.Email = s2.Email and s2.Email = 'email7'; -- will display data twice 4 rows

select * from table1_Student1 s1  where s1.Email = s1.Email and s1.Email = 'email7';--will display data correctly 2 rows 

select SName,Email from table1_Student1 b1 where b1.Email = 'email7';

select Student_ID,CourseID,Email from table1_Student1 c1 where c1.Email = c1.Email;

select c1.Student_ID,c1.CourseID,c1.Email from table1_Student1 c1,table1_Student1 c2 where  c1.Email = 'email7';


select c1.Student_ID,c1.CourseID,c1.Email from table1_Student1 c1,table1_Student1 c2 where c1.Email = c2.Email and c1.Email = 'email7';

select c1.Student_ID,c1.CourseID,c1.Email from table1_Student1 c1,table1_Student1 c2 where c1.Email = c2.Email;

select c1.Student_ID,c1.CourseID,c1.Email from table1_Student1 c1,table1_Student1 c2 where c1.Email = c2.Email and c1.Email = 'email7';



select * from table1_Student1;

--grouping 
select SName,COUNT(*) from table1_Student1 group by SName;
select Email "Original Email Column",COUNT(Email) No_Of_EmailIDs from table1_Student1 group by Email; --No_Of_EmailIDs indicates aliases 

select * from table1_Student1;

select Email,Sum(CourseID) "Applying Sum function" from table1_Student1 group by Email;

alter table table1_Student1 add Salary int;

select * from table1_Student1;

select SName,sum(Salary) from table1_Student1 group by SName;

select * from table1_Student1;
select SName,sum(Salary) from table1_Student1 group by SName;


--select SName,max(Salary),MIN(Salary),Avg(Salary) from table1_Student1 group by SName;
select SName,max(CourseID) "Maximum Salary",MIN(CourseID) Minimum_Salary,Avg(CourseID) Average_Salary from table1_Student1 group by SName;

select * from table1_Student1;


--grouping by Multiple columns

select SName,Email,sum(CourseID) from table1_Student1 group by SName,Email;

select SName,Email,COUNT(*) Grouping_by_2_Columns from table1_Student1 group by SName,Email;

select * from table1_Student1;

select SName,count(*) Grouping_by_Sname from table1_Student1 group by SName;
select SName,count(SName) Grouping_by_Sname from table1_Student1 group by SName;


select Email,count(*) Grouping_byEmail from table1_Student1 group by Email;
select Email,count(Email) Grouping_byEmail from table1_Student1 group by Email;



--applying additional conditions after grouping data 
select SName,count(*) Grouping_by_Sname from table1_Student1 group by SName having count(*)=2;
select Email,count(*) Grouping_by_Email from table1_Student1 group by Email having count(*)>1;

select Email,count(*) Grouping_by_Email from table1_Student1 group by Email having count(Email)=4;

select * from table1_Student1;
select Student_ID,Salary,count(*) "Count function on Salary Column" from table1_Student1 group by Student_ID,Salary;

select Student_ID,Salary,count(*) "Count function on Salary Column" from table1_Student1 group by Student_ID,Salary having Salary>5000;



--Transactions
create table Branch(BCode int,BranchName varchar(50),Location_Branch varchar(50));

--sp_rename 'Branch.Location','Location_Branch';

--testing operations
insert into Branch values(101,'Mechanical','Bangalore');

update Branch set BranchName='Electrical' where Location_Branch='Bangalore';

delete from Branch where BranchName='Electrical';

select * from Branch;
Begin Transaction
select * from Branch;


RollBack
select * from Branch;


insert into Branch values(101,'Mechanical','Bangalore');
delete from Branch where BranchName='Mechanical';


Begin Transaction
insert into Branch values(101,'Mechanical','Bangalore');
select * from Branch;

Begin Transaction;
RollBack;
select * from Branch;


create table Branch(BCode int,BranchName varchar(50),Location_Branch varchar(50));
insert into Branch values(101,'Mechanical','Bangalore');
select * from Branch;

Begin transaction;
select * from Branch;
insert into Branch values(102,'Electrical','Delhi');
insert into Branch values(200,'College Student','Bangalore Head office');
select * from Branch;
RollBack;
select * from Branch;


Begin transaction;
insert into Branch values(103,'Civil','Mumbai');
select * from Branch;
Commit;
select * from Branch;
RollBack;--won't execute roll back as commit operation is permanent
select * from Branch;


Begin Transaction;
update Branch set BranchName = 'Aeronautical' where BranchName = 'Civil';
select * from Branch;
RollBack;
select * from Branch;

Begin Transaction;
update Branch set BranchName = 'Aeronautical' where BranchName = 'Civil';
select * from Branch;
Commit;
RollBack;
select * from Branch;


Begin Transaction;
delete Branch where BranchName = 'Mechanical';
RollBack;
select * from Branch;

Begin Transaction;
delete from Branch where BranchName = 'Aeronautical';
select * from Branch;
RollBack;
select * from Branch;


Begin Transaction;
delete from Branch where BranchName = 'Aeronautical';
Commit;
RollBack;-- roll back won't be executed as commit is a permanent change 


select * from Branch;

Begin transaction 
delete from Branch where BCode=101;
delete from Branch where BCode=102;
select * from Branch;
Rollback;
select * from Branch;

delete from Branch where BCode=103;
Save transaction s1;
select * from Branch;
RollBack transaction s1;

insert into Branch values(200,'College fresher','Joined recently');

select * from table1_Student1;

select SName,count(*) from table1_Student1 group by SName;

select SName,count(*) from table1_Student1 group by Rollup(SName);

select SName,count(*) from table1_Student1 group by Cube(SName);

select SName,Email,count(*) from table1_Student1 group by Rollup(SName,Email);



--Creating scalar valued functions to return gross salaray of employee based on following conditions
--1) HRA ---10%
--2)DA ---20%
--3) PF---10%


create table Employee_Rank(EmployeeID int,Employee_Name varchar(50),Salary money,Dept_No int);

select * from Employee_Rank;

select Employee_Name,EmployeeID,Salary,ROW_NUMBER() over (order by Salary desc) as setting_priority from Employee_Rank;
--people having same salaries are not getting same rank 


select Employee_Name,EmployeeID,Salary,rank() over (order by Salary desc) as setting_priority from Employee_Rank;
--rank sequence no's are skipped based on the same number of rows , here 2 comes twice then 4 is appearing for above query

select Employee_Name,EmployeeID,Salary,dense_rank() over (order by Salary desc) as setting_priority from Employee_Rank;

select Employee_Name,EmployeeID,Salary,ROW_NUMBER() over (Partition by Dept_No order by Salary desc) as setting_priority from Employee_Rank;

select Employee_Name,EmployeeID,Salary,rank() over (Partition by Dept_No order by Salary desc) as setting_priority from Employee_Rank;

select Employee_Name,EmployeeID,Salary,dense_rank() over (Partition by Dept_No order by Salary desc) as setting_priority from Employee_Rank;



create table employee_function(EID int,EName varchar(10),Salary money,DeptName varchar(10));

select * from employee_function;

CREATE PROCEDURE procedure_function1
as Begin
select * from procedure_function1;
End


execute procedure_function1;

exec procedure_function1;


create table employee_table_function(EmployeeID int,EName varchar(10),salary money,departmentName varchar(10));

select * from employee_table_function;


create function function_table1(@departmentName varchar(10)) 
returns table
as

Return(select * from employee_table_function where departmentName = @departmentName)


select * from  function_table1('Electrical');

select * from  function_table1('Mechanical');

select * from  function_table1('Civil');

select * from  function_table1('Chemical');


--working with establising relations having cascade rules

create database parent_database;

use parent_database;

--Working without cascade rules 
--Step1 :-

create table parent_table(EID int Primary key,EName varchar(10),Salary money);

insert into parent_table values(10,'Name1',2400);
insert into parent_table values(20,'Name2',3400);
insert into parent_table values(30,'Name3',1400);
insert into parent_table values(40,'Name4',2500);
insert into parent_table values(50,'Name5',3500);

insert into parent_table values(60,'Name6',4500),(70,'Name7',7500);

select * from parent_table;

create table child_table(departmentNo int,Salary_child bigint,EID int foreign key references parent_table(EID));

--insert into child_table values(101,23000,10),(102,25000,20),(103,33000,30),(104,43000,30),(103,33000,100);//will throw an error as last set having 100 is not present in parent table

insert into child_table values(101,23000,10),(102,25000,20),(103,33000,30),(104,43000,30);

select * from parent_table;
select * from child_table;

--Insertion rule (Unreferenced values are not accepted)

insert into child_table values(110,50000,70);

--insert into child_table values(110,50000,150);//will throw an error as 150 is not present in parent table


--Updation rule

update parent_table set EID = 150 where EID = 10;--will throw an error 


--Deletion rule 
delete from parent_table where EID=30;-- will throw an error as EID value is also used in child table , hence conflicting with child table





--Working with cascade rules 
--Step1 :-

create table parent_table_withCascade(EID int Primary key,EName varchar(10),Salary money);

insert into parent_table_withCascade values(10,'Name1',2400);
insert into parent_table_withCascade values(20,'Name2',3400);
insert into parent_table_withCascade values(30,'Name3',1400);
insert into parent_table_withCascade values(40,'Name4',2500);
insert into parent_table_withCascade values(50,'Name5',3500);

insert into parent_table_withCascade values(60,'Name6',4500),(70,'Name7',7500);


select * from parent_table_withCascade


create table child_table_withCascade(departmentNo int,Salary_child bigint,EID int foreign key references parent_table_withCascade(EID) on update cascade on delete cascade);

--insert into child_table values(101,23000,10),(102,25000,20),(103,33000,30),(104,43000,30),(103,33000,100);//will throw an error as last set having 100 is not present in parent table

insert into child_table_withCascade values(101,23000,10),(102,25000,20),(103,33000,30),(104,43000,30);
select * from child_table_withCascade;



select * from parent_table_withCascade;
select * from child_table_withCascade;

--Insertion rule (Unreferenced values are not accepted) (fixed rule) insertion rule won't work

insert into child_table_withCascade values(110,50000,70);

--insert into child_table_withCascade values(110,50000,150);//will throw an error as 150 is not present in parent table


--Updation rule (when data is updated in parent table , foreign key column having same key present in child table is also updated (associated data present in child table is also updated)

update parent_table_withCascade set EID = 150 where EID = 10; 
select * from parent_table_withCascade;
select * from child_table_withCascade;

update parent_table_withCascade set EID = 200 where EID = 20; 
update parent_table_withCascade set EID = 300 where EID = 30; 
select * from parent_table_withCascade;
select * from child_table_withCascade;


--Deletion rule (when data is deleted in parent table , foreign key column having same key present in child table is also deleted (associated data present in child table is also deleted)

delete from parent_table_withCascade where EID=30;-- will throw an error as EID value is also used in child table , hence conflicting with child table
select * from parent_table_withCascade;
select * from child_table_withCascade;


delete from parent_table_withCascade where EID=70;-- will throw an error as EID value is also used in child table , hence conflicting with child table
select * from parent_table_withCascade;
select * from child_table_withCascade;



--working with scalar valued functions

create table Employee_ScalarFunction(EID int, EName varchar(10),Salary money);

select * from Employee_ScalarFunction;

--gross salary statement updated incorrectly , hence don't checck this function , chek next function called "f_grossSalary_workingCorrectly"
create function f_grossSalary(@EID int)
returns money --since return statement is returning gross salary whichis of data type money
as
Begin
--declaring variables
declare @basic_salary money , @HRA_salary money,@PF_salary money,@DA_salary money , @Gross_salary money
select @basic_salary=Salary from Employee_ScalarFunction where EID = @EID;

set @HRA_salary = @basic_salary * 0.1;
set @PF_salary = @basic_salary * 0.3;
set @DA_salary = @basic_salary * 0.2;
set @Gross_salary = @DA_salary + @HRA_salary + @HRA_salary;
return @Gross_salary 
end

create function f_grossSalary_workingCorrectly(@EID int)
returns money --since return statement is returning gross salary whichis of data type money
as
Begin
--declaring variables
declare @basic_salary money , @HRA_salary money,@PF_salary money,@DA_salary money , @Gross_salary money
select @basic_salary=Salary from Employee_ScalarFunction where EID = @EID;

set @HRA_salary = @basic_salary * 0.1;
set @PF_salary = @basic_salary * 0.3;
set @DA_salary = @basic_salary * 0.2;
set @Gross_salary = @DA_salary + @HRA_salary + @PF_salary;
return @Gross_salary 
end


--executing scalar valued functions
select dbo.f_grossSalary_workingCorrectly(101);
select dbo.f_grossSalary_workingCorrectly(103);


--Example on Equi Join and No-Equi join

create table test_equiJoin(SLNO int, Name varchar(15));

select * from test_equiJoin;

create table test_equiJoin2(SLNO int, Name varchar(15));

--Equi Join
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO = test_equiJoin2.SLNO;

--Non-Equi Join
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO != test_equiJoin2.SLNO;
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO > test_equiJoin2.SLNO;
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO < test_equiJoin2.SLNO;
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO >= test_equiJoin2.SLNO;
select * from test_equiJoin,test_equiJoin2 where test_equiJoin.SLNO <= test_equiJoin2.SLNO;


--working on unique 
create table unique_table(SLNO int unique,Name varchar(10),Location varchar(15) unique);


insert unique_table values(1,'Name1','Bangalore');
insert unique_table values(1,'Name2','Delhi');--can't accept values as 1 is already used , use something else  
insert unique_table values(2,'Name3','Bangalore');--can't accept values as Bangalore is already used , use something else 
insert unique_table values(3,'Name4','Chennai');--allowed as 3 and chennai are unique values
insert unique_table values(null,null,null); --allowed  

--null value is also accepted , if we don't want this then use Not null



--working on Not null --duplicates are accepted,null values are not accepted
create table notNull_table(SLNO int not null,Name varchar(10) not null,Location varchar(15) not null);
select * from notNull_table;


insert notNull_table values(1,'Name1','Bangalore');
insert notNull_table values(1,'Name1','Bangalore');--allowed
insert notNull_table values(1,'Name1','Bangalore');--allowed

insert notNull_table values(null,null,null); --not allowed  


--working on check 
create table check_table(EName varchar(20),Salary money check(Salary>5000));

select * from check_table;

insert into check_table values('Name1',10000); --allowed
insert into check_table values('Name2',20000);--allowed
insert into check_table values('Name3',2000);--not allowed will throw an error as 2000<5000
insert into check_table values('Name4',2500);--not allowed will throw an error as 2500<5000


select * from check_table;




--Working with out parameters in stored procedures

select * from Employee_ScalarFunction;

create procedure out_storedProcedure(@EID int,@PF int out,@PT int out)
--we are declaring pf and pt because they are return parameters
as
begin
declare @Salary_variable money
select @Salary_variable=Salary from Employee_ScalarFunction where EID = @EID;

set @PF = 0.1 * @Salary_variable;
set @PT = 0.2 * @Salary_variable;

end

--execute out_storedProcedure(101);//will throw an error as it expects parameters as it is not working hence we ar using 3 rules 

declare @bind_PF int,@bind_PT money;--step 1
execute out_storedProcedure 101,@bind_PF out,@bind_PT out;--step 2
print @bind_PF
print @bind_PT


declare @bind_PF1 int,@bind_PT1 money;--step 1
execute out_storedProcedure 102,@bind_PF1 out,@bind_PT1 out;--step 2
print 'Provident fund = ' + cast(@bind_PF1 as varchar);
print @bind_PT1


--Working on subqueries

--Single row subquery
select * from Employee_ScalarFunction;

--select EID,EName,Salary from Employee_ScalarFunction where Salary= 75000;//we know highest salary already , hence we are able to fetch the value


--inner query
select max(Salary) from Employee_ScalarFunction;
--return value 75000


--Outer query
--select * from Employee_ScalarFunction where Salary = MAX(Salary);//will throw an error if we try to fetch value this way



--select * from Employee_ScalarFunction where Salary =
--Subquery = Outer Query + Inner Query
--=>SubQuery=OuterQuery(InnerQuery);
select * from Employee_ScalarFunction where Salary = (select max(Salary) from Employee_ScalarFunction);





--Example :- Write a query to display employee details from the table whose department is same as the department of the employee Name2 or Name3?

select * from Employee_ScalarFunction;

alter table Employee_ScalarFunction add DepartmentName varchar(10);
select * from Employee_ScalarFunction;

--Writing subquery for returning Multi rows values :-

select DepartmentName from Employee_ScalarFunction where EName = 'Name3' or EName = 'Name4'


--Outer Query

--select * from Employee_ScalarFunction where DepartmentName = (select DepartmentName from Employee_ScalarFunction where EName = 'Name3' or EName = 'Name4');
--above line throws an error stating that subquery returns more than 1 value 

--hene using multiple row subquery :-
select * from Employee_ScalarFunction where DepartmentName in (select DepartmentName from Employee_ScalarFunction where EName = 'Name3' or EName = 'Name4');

--or

select * from Employee_ScalarFunction where DepartmentName in (select DepartmentName from Employee_ScalarFunction where EName in('Name3', 'Name4'));




create procedure storedProcedure_input(@EID int,@EName varchar(15),@Salary_stored money,@Depart_stored varchar(15))
as
begin 

insert into Employee_ScalarFunction values(@EID,@EName,@Salary_stored,@Depart_stored);
end

select * from Employee_ScalarFunction

execute storedProcedure_input 201,'Name201',25000,'Chemical';

select * from Employee_ScalarFunction



--working on views
create view v_naresh as select * from Employee_ScalarFunction;

--below both queries return same data 
select * from v_naresh;
select * from Employee_ScalarFunction;

insert v_naresh values(205,'Name205',30000,'ECE');
--below both queries return same data 
select * from v_naresh;
select * from Employee_ScalarFunction;


update v_naresh set EID=500 where EID=101 or EID=102;
select * from v_naresh;
select * from Employee_ScalarFunction;


--How to find "nth" highest/least salary employee details from table?
--Non co-related mechanism :-


--Non Co-related mechanism 
--1st Highest salary employee details:-
select * from Employee_ScalarFunction;


--Inner query 
select max(Salary) from Employee_ScalarFunction;

use parent_database;
select * from Employee_ScalarFunction;

select * from Employee_ScalarFunction where DepartmentName in (select DepartmentName from Employee_ScalarFunction where EID=500);


--Outer Query 
--1st Highest salary
select * from Employee_ScalarFunction where Salary = (select max(Salary) from Employee_ScalarFunction);

--2nd Highest salary 
select * from Employee_ScalarFunction where Salary = (select MAX(Salary) from Employee_ScalarFunction where Salary < (select max(Salary) from Employee_ScalarFunction))

--3rd Highest Salary 
select * from Employee_ScalarFunction where Salary = (select max(Salary) from Employee_ScalarFunction where Salary < (select MAX(Salary) from Employee_ScalarFunction where Salary < (select max(Salary) from Employee_ScalarFunction)));


----nth   (n+1)
	--1		2
	--2		3
	--3		4


	--40	41
	--as this is a tedious job to keep writing queries , hece we use co-related queries 
	
	
	--Co-related sub queries 
	--In this first outer query is executed and then iner query is executed
	

	--Syntax 
	--select * from <table name> <table alias name1> where n-1 = (select count(<column name>) from <table nam> <table alias name2> where <table alias name2>.<column name>(</>) < <table alias name1>.<column name>);


	--Co-related sub queries

	select count(Salary) from  Employee_ScalarFunction;
	select * from  Employee_ScalarFunction;

--1st Highest salary employee details (n=1) 
--now applying n-1 formula 1-1
select * from Employee_ScalarFunction e1 where 0 = (select count(Salary) from  Employee_ScalarFunction e2 where e2.Salary>e1.Salary);


--2nd Highest salary employee details (n=2) 
--now applying n-1 formula 2-1
select * from Employee_ScalarFunction e1 where 1 = (select count(Salary) from  Employee_ScalarFunction e2 where e2.Salary>e1.Salary);


--3rd Highest salary employee details (n=3) 
--now applying n-1 formula 3-1
select * from Employee_ScalarFunction e1 where 2 = (select count(Salary) from  Employee_ScalarFunction e2 where e2.Salary>e1.Salary);


--write a query to get employee details from the table who are getting highest salary in the table 
select * from Employee_ScalarFunction

--for this question it is possible with query only if highest salary is known . if salary is not known then it is not possible with query for fetching results 
select * from Employee_ScalarFunction where Salary=75000;

select * from Employee_ScalarFunction where Salary=(select max(Salary) from Employee_ScalarFunction);



create table emp_hyd(HYD_EID int,HYD_EName varchar(10),HYD_Salary money);
create table emp_Chennai(Chennai_EID int,Chennai_EName varchar(10),Chennai_Salary money);

select * from emp_hyd;
select * from emp_Chennai;


--Working on complex views 

create view HYD_Chennai_View1 as
select * from emp_hyd
union
select * from emp_Chennai;


select * from HYD_Chennai_View1;

--insert into HYD_Chennai_View1 values(100,'View_Name1',25000);//will throw an error 

--update HYD_Chennai_View1 set HYD_EName='Name changed' where HYD_EName='hyd_name4';//will throw an error

--delete from HYD_Chennai_View1 where HYD_EID=1;//will throw an error



--Working with Cursors

select * from Employee_ScalarFunction;

delete from Employee_ScalarFunction where DepartmentName='Electrical';

--Without cursor variables :-

declare cursor_c1 cursor scroll for select * from Employee_ScalarFunction;
open cursor_c1;
fetch first from cursor_c1;
fetch next from cursor_c1;
fetch last from cursor_c1;
--fetch prior from cursor_c1;
--fetch absolute 5 from cursor_c1;
--fetch relative -2 from cursor_c1;
close cursor_c1;
deallocate cursor_c1;



--With cursor variables 

declare cursor_c2 cursor scroll for select DepartmentName,EName from Employee_ScalarFunction;
declare @DepartmentName_cursor varchar(20),@EName_cursor varchar(20);
open cursor_c2;

fetch first from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using first method Last row department name = ' + @DepartmentName_cursor + '\n Last row Ename = ' + @EName_cursor;

fetch next from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using next method Last row department name = ' + @DepartmentName_cursor + ' Last row Ename = ' + cast(@EName_cursor as varchar);


fetch last from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using last method Last row department name = ' + @DepartmentName_cursor + ' Last row Ename = ' + @EName_cursor;

fetch prior from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using prior method Last-1 row department name = ' + @DepartmentName_cursor + ' Last-1 row Ename = ' + @EName_cursor;

fetch absolute 5 from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using absolute 5 method 5th position row department name = ' + @DepartmentName_cursor + ' 5th position row Ename = ' + @EName_cursor;

fetch relative -2 from cursor_c2 into @DepartmentName_cursor,@EName_cursor;
print 'Using relative -2 method 5th-2 =3rd position  department name = ' + @DepartmentName_cursor + ' 5th-2 =3rd position row Ename = ' + @EName_cursor;


close cursor_c2;
deallocate cursor_c2; 


select * from emp_hyd;

declare c cursor scroll for select HYD_EName from emp_hyd;
open c;

fetch first from c;

declare @NameVariable varchar(20);

fetch first from c into @NameVariable;

print '@NameVariable = ' + @NameVariable;

close c;
deallocate c;

select 'display some random text';



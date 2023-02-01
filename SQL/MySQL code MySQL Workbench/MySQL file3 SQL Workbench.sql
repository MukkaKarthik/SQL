#Joins - we can retrieve the data from both tables having common column 

drop table alias_table1;
drop table alias_table2;

create table alias_table1(ID int, firstName varchar(20));
create table alias_table2(ID int, lastName varchar(20));

insert into alias_table1 values(1,"first1");
insert into alias_table1 values(2,"first2");
insert into alias_table1 values(3,"first3");
insert into alias_table1 values(4,"first4");
insert into alias_table1 values(5,"first5");
insert into alias_table1 values(6,"first6");
insert into alias_table1 values(7,"first7");
insert into alias_table1 values(8,"first8");
insert into alias_table1 values(9,"first9");
insert into alias_table1 values(10,"first10");
select * from alias_table1;


insert into alias_table2 values(1,"last1");
insert into alias_table2 values(2,"last2");
insert into alias_table2 values(3,"last3");
insert into alias_table2 values(4,"last4");
insert into alias_table2 values(5,"last5");
insert into alias_table2 values(11,"last11");
insert into alias_table2 values(12,"last12");
insert into alias_table2 values(13,"last13");
insert into alias_table2 values(14,"last14");
insert into alias_table2 values(15,"last15");

select * from alias_table2;

#It is recommended to use on but not where 
select * from alias_table1 inner join alias_table2 where alias_table1.ID = alias_table2.ID;
select * from alias_table1 inner join alias_table2 on alias_table1.ID = alias_table2.ID;

select * from alias_table1 left join alias_table2 on alias_table1.ID = alias_table2.ID;

select * from alias_table1 right join alias_table2 on alias_table1.ID = alias_table2.ID;

# select * from alias_table1 full  join alias_table2 on alias_table1.ID = alias_table2.ID;//full join is not supported in MySQL 

#for self join don't use word self join as self join word is not there 
select * from alias_table1 as a,alias_table1 as b where a.ID = b.ID;


#Not null
create table integrity_table1(ID int not null,Name varchar(15),Location varchar(15));

insert into integrity_table1 values(1,"Name1","Location1");
insert into integrity_table1 values(1,"Name2","Location2");
#insert into integrity_table1(Name,Location) values("Name1","Location1");// will throw an error because ID values is not stored for this record as it can't be null
#insert into integrity_table1(ID,Name) values(3,"Name3");//won't throw an error as ID value is not null

select * from integrity_table1;



# Unique
drop table integrity_unique;
#using unique at column level
create table integrity_unique(ID int unique, Name varchar(15), Location varchar(15));

insert into integrity_unique values(1,"Name1","Location1");
insert into integrity_unique values(2,"Name2","Location2");
#insert into integrity_unique values(1,"Name1","Location1"); //Error :- Will thorw an error as ID contains unqiue values Duplicate entry '1' for ID's are not possible 
#insert into integrity_unique values(2,"Name2","Location3"); //Error :- Will thorw an error as ID contains unqiue values Duplicate entry '2' for ID's are not possible 
select * from integrity_unique;


#using unqiue at table level 
create table integrity_unique1(ID int, Name varchar(15), Location varchar(15),unique(ID,Name));#//uniqueness present on 2 columns together
insert into integrity_unique1 values(1,"Name1","Location1");
insert into integrity_unique1 values(2,"Name2","Location2");
insert into integrity_unique1 values(3,"Name2","Location2");
select * from integrity_unique1;



#insert into integrity_unique1 values(3,"Name2","Location2");//ID can't have duplicate values as it consists of unique values;
#insert into integrity_unique1 values(2,"Name2","Location2"); // 2 and Name2 together forms a duplicate value , 2 and something  or somethign and 2 won't form duplicate value 



# using primary key =  Null + Unique key 

create table integrity_primaryKey(ID int primary key,Name varchar(20),Location varchar(25));

insert into integrity_primaryKey values(1,"Name1","Location1");
insert into integrity_primaryKey values(2,"Name2","Location2");
insert into integrity_primaryKey values(1,"Name1","Location1");#//trying duplicate values , will throw an error as duplicate values are not accepted
insert into integrity_primaryKey(Name,Location) values("Name1","Location1");#//trying null values , will throw an error as null values are not accepted


create table integrity_primaryKey1(ID int,Name varchar(20),Location varchar(25),primary key(ID,Location));

insert into integrity_primaryKey1 values(1,"Name1","Location1");
insert into integrity_primaryKey1 values(2,"Name2","Location2");
insert into integrity_primaryKey1 values(1,"Name1","Location1");#//trying duplicate values , will throw an error as duplicate values are not accepted
insert into integrity_primaryKey1(Name,Location) values("Name1","Location1");#//trying null values , will throw an error as null values are not accepted

drop table integrity_primaryKey;
drop table integrity_primaryKey1;


create table integrity_primaryKey2(ID int,Name varchar(20),Location varchar(25),primary key(ID));

insert into integrity_primaryKey2 values(1,"Name1","Location1");
insert into integrity_primaryKey2 values(2,"Name2","Location2");
insert into integrity_primaryKey2 values(1,"Name1","Location1");#//trying duplicate values , will throw an error as duplicate values are not accepted
insert into integrity_primaryKey2(Name,Location) values("Name1","Location1");#//trying null values , will throw an error as null values are not accepted



#using foreign key
# Parent table - primary key
create table parent_table(ID int primary key, Name varchar(20), Location varchar(20));
select * from parent_table;

insert into parent_table values(1,"Name1","Location1");
insert into parent_table values(2,"Name2","Location2");
insert into parent_table values(3,"Name2","Location3");
insert into parent_table values(4,"Name4","Location4");
insert into parent_table values(5,"Name5","Location5");

#delete from parent_table where ID= 5;//can't delete records as child table consist of 5

# child table - foreign key
create table child_table(ID int, Salary int,foreign key(ID) references parent_table(ID) );
select * from child_table;

insert into child_table values(1,2400);
insert into child_table values(2,3400);
insert into child_table values(3,4400);
insert into child_table values(4,5500);
insert into child_table values(5,6500);
#insert into child_table values(6,2400);//will throw an error as parent table ID column doesn't have 6 as a record 

delete from child_table where ID = 5;
#delete from parent_table where ID = 5; // is possible now as child record is already deleted 


#Using cascade

create table parent_table_cascade(ID int primary key, Name varchar(20), Location varchar(20));

insert into parent_table_cascade values(1,"Name1","Location1");
insert into parent_table_cascade values(2,"Name2","Location2");
insert into parent_table_cascade values(3,"Name2","Location3");
insert into parent_table_cascade values(4,"Name4","Location4");
insert into parent_table_cascade values(5,"Name5","Location5");
select * from parent_table_cascade;



create table child_table_cascade(ID int, Salary int,foreign key(ID) references parent_table(ID) on delete cascade);

insert into child_table_cascade values(1,2400);
insert into child_table_cascade values(2,3400);
insert into child_table_cascade values(3,4400);
insert into child_table_cascade values(4,5500);
insert into child_table_cascade values(5,6500);
select * from child_table_cascade;



delete from parent_table_cascade where ID=5;

select * from parent_table_cascade;
select * from child_table_cascade;


#Using check integrity constraint

create table check_integrity(ID int, Name varchar(15),Experience int check (Experience> 10));

insert into check_integrity values(1,"Name1",15);
insert into check_integrity values(2,"Name2",20);
# insert into check_integrity values(1,"Name1",5);// will throw an error as experience is less than 10
# insert into check_integrity values(1,"Name1",10);// will throw an error as experience is less than 10

select * from check_integrity;

create table check_integrity_location(ID int, Location varchar(15) check(Location in ("India","UK","USA","Australia")),Experience int check (Experience> 10));

insert into check_integrity_location values(1,"India",12);
insert into check_integrity_location values(2,"UK",22);
insert into check_integrity_location values(3,"USA",32);
insert into check_integrity_location values(4,"Australia",32);
#insert into check_integrity_location values(5,"Pakistan",12);// will throw an error as check is violated as Pakistan doesn't come under countries mentioned in check 



create table default_table(Id int default 10 , location varchar(15) default "India");

insert into default_table values(12,"Name1");
insert into default_table values(15,"Name2");

insert into default_table(location) values("Name1");
insert into default_table(ID) values(20);

select * from default_table;

#Using primary key 
create table increment_function(ID int primary key auto_increment, Name varchar(15));
#create table increment_function1(ID int auto_increment, Name varchar(15));//will throw an error as auto increment won't work if primary key is not present 

select  * from increment_function;

insert into increment_function values(1,"Name1");
insert into increment_function values(2,"Name2");

insert into increment_function(Name) values("Name3");
insert into increment_function values(10,"Name10");
insert into increment_function(Name) values("Name10");


create table increment_function2(ID int primary key auto_increment , Name varchar(15));

#default value starts from 1 
insert into increment_function2(Name) values("Name1");
insert into increment_function2(Name) values("Name2");
insert into increment_function2 values(10,"Name10");
insert into increment_function2(Name) values("Name11");

select * from increment_function2;


create table increment_function3(ID int primary key auto_increment , Name varchar(15)) auto_increment = 100;

insert into increment_function3(Name) values("Name1");
insert into increment_function3(Name) values("Name2");
insert into increment_function3 values(10,"Name10");
insert into increment_function3(Name) values("Name11");
select * from increment_function3;


create table oldCity_table(ID int, City_Name varchar(20),Country_Name varchar(15));

insert into oldCity_table values(1,"City_Name1","Country_Name1");
insert into oldCity_table values(2,"City_Name2","Country_Name2");
insert into oldCity_table values(3,"City_Name3","Country_Name3");
insert into oldCity_table values(4,"City_Name4","Country_Name4");

select * from oldCity_table;


create table NewCity_table(ID int, City_Name_new varchar(20),Country_Name_new varchar(15));

insert into NewCity_table select * from oldCity_table;
select * from NewCity_table;


#creating 2 tables with different number of columns 

create table oldCity_table(ID int, City_Name varchar(20),Country_Name varchar(15),CurrencyName varchar(10),Developed_Nation boolean);

insert into oldCity_table values(1,"City_Name1","India","Rupee",false);
insert into oldCity_table values(2,"City_Name2","Pakistan","Pak-Rupee",false);
insert into oldCity_table values(3,"City_Name3","USA","dollars",true);
insert into oldCity_table values(4,"City_Name4","Singapore","pounds",true);

select * from oldCity_table;

create table NewCity_table(ID int, City_Name_new varchar(20),Country_Name_new varchar(15));

insert into NewCity_table(ID,City_Name_new) select ID,CurrencyName from oldCity_table;

select * from NewCity_table;

select * from alias_table1;

insert into alias_table1(ID,firstName) select ID,CurrencyName from oldCity_table where CurrencyName in ("Rupee","dollars","pounds");

select * from alias_table1;


#Using as keyword 
create table as_table as select * from alias_table1;
select * from as_table;

create table as_table1 as select firstName from as_table;
select * from as_table1;


#using IfNull() function works on null values

create table aspirant(ID int, Salary int );

insert into aspirant values(1,1000);
insert into aspirant values(2,2000);
insert into aspirant values(3,3000);
insert into aspirant(ID) values(3);


#select (Salary + 5) from aspirant;//salary 5 is not addedto a record associated with Null value from ID column 

select (ifnull(Salary,0) + 5) from aspirant;


select * from aspirant

Delimiter ]]
select * from aspirant ]]


Delimiter 67
select * from aspirant 67

Delimiter ;
select * from aspirant;



select * from aspirant;

Delimiter //
create procedure getValues_function()
Begin 
	select * from aspirant;
End //

call getValues_function();

Delimiter ;





# Using views 
create table view_table1(ID int , Name varchar(20) , Location varchar(20)) ;

insert into view_table1 values(1,"Name1","Location1");
insert into view_table1 values(2,"Name2","Location2");
insert into view_table1 values(3,"Name3","Location3");
insert into view_table1 values(4,"Name4","Location4");


create view tableView_view1 as select Name,Location from view_table1;

select * from tableView_view1;

create view tableView_view2 as select Name,Location from view_table1 where Name = "Name1";
select * from tableView_view2;


create table EmpOne (Id int, Name varchar(20), Experience int);

insert into EmpOne values(1,"Name1",5);
insert into EmpOne values(2,"Name2",15);
insert into EmpOne values(3,"Name3",25);
insert into EmpOne values(4,"Name4",35);
insert into EmpOne values(5,"Name5",45);


create table EmpTwo (Id int, Country varchar(20));

insert into EmpTwo values(1,"Country1");
insert into EmpTwo values(2,"Country2");
insert into EmpTwo values(3,"Country3");
insert into EmpTwo values(4,"Country4");


create view tableView_view3 as 
select Empone.ID,name,Country from Empone,EmpTwo where Empone.ID = EmpTwo.ID; 

select * from tableView_view3;
drop view tableView_view3;

select * from EmpTwo;


# Indexes 

create table index_table1(ID int, Name_Index varchar(20), Location varchar(20));
select * from index_table1;

insert into index_table1 values(1,"Name1","Location1");
insert into index_table1 values(2,"Name2","Location2");
insert into index_table1 values(3,"Name3","Location3");
insert into index_table1 values(4,"Name4","Location4");


show indexes from index_table1;

select * from index_table1 where ID = 4;

create index SearchingID on index_table1(ID);
show indexes from index_table1;

select * from index_table1 where ID = 4 ;

#Indexes can be found under a table name 

#When primary key is used for any column , index will be automatically assigned 
#When unique key is used for any column , index will be automatically assigned 
# defining multiple primary keys are not possible , it will throw an error

create table index_table2(ID int primary key,Name_IndexTable2 varchar(15) primary key,Location varchar(15));
create table index_table2(ID int primary key,Name_IndexTable2 varchar(15),Location varchar(15));

create table index_table3(ID int unique key,Name_IndexTable2 varchar(15),Location varchar(15));



show indexes from index_table2;

show indexes from index_table3;

grant select on view_table1 to user1;

grant select on view_table1 to user1,user1_qafox;#granting permissions to multiple users

grant insert,delete on view_table1 to user1;

revoke select,insert on view_table1 from user1;

revoke select,insert on view_table1 from user1,user1_qafox;# revoking permissions from multiple users


create table normalTable(Id int, Name varchar(20),Location varchar(15));
create temporary table TemporaryTable(Id int, Name varchar(20),Location varchar(15));

insert into TemporaryTable values(1,"Name1","Location1");
insert into TemporaryTable values(2,"Name2","Location2");
insert into TemporaryTable values(3,"Name3","Location3");
insert into TemporaryTable values(4,"Name4","Location4");

#select * from TemporaryTable;//will throw an error as session is closed


show columns from integrity_primarykey2;
show indexes from index_table1;


# Using Show columns, Show Indexes, Show Privileges, Show Grants 
show privileges;

show grants for user1;



# Inserting Null values 

create table table_null(ID int , name varchar(20), Location varchar(20));

insert into table_null values(1,"Name1","Location1");
insert into table_null values(2,"Name2","Location2");
select * from table_null;

# direct way 
insert into table_null values(3,"Name3",null);

#No values
insert into table_null(ID,Location) values(4,"Location4");

select * from table_null;


# Using trim function 

/*
select trim("a" from "Arun");//Arun
select trim("a" from "arun");//run
select trim("a" from "aruna");//run
*/

create table table_trim(ID int,Name varchar(20));
drop table table_trim;

create table table_trim(Name varchar(20));
insert into table_trim values("arun");
insert into table_trim values("naresh");
insert into table_trim values("nandan");

select * from table_trim;

select Name,trim("n" from Name) as "applyinhg trim() function" from table_trim;


# WildCards 

insert into table_trim values("dines_");
select * from table_trim;

select * from table_trim where Name like "%_";

#Use default symbol \ to convert wildcard _ into character _
select * from table_trim where Name like "%\_" ; #dines_ last character should be underscore but not anything as we have converted wild card to a character

select * from table_trim where Name like "%$_";# here we are not converting wildcard to a character , hence it won't return any input 


select * from table_trim where Name like "%$_" escape '$'; # now $ will convert wildcard _ to a character , ot default symbol \

#saving changes


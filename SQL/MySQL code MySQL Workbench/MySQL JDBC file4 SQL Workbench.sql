create table JDBC_table1(ID int, Name varchar(15),Location varchar(15));

insert into JDBC_table1 values(1,"Name1","Location1");
insert into JDBC_table1 values(2,"Name2","Location2");
insert into JDBC_table1 values(3,"Name3","Location3");
insert into JDBC_table1 values(4,"Name4","Location4");
insert into JDBC_table1 values(5,"Name5","Location5");

select * from JDBC_table1;

# so far we have 5 records , now let us insert 1 more record from Java program 

# 1 record has been inserted from java program
select * from JDBC_table1;

# 3 records have been deleted
select * from JDBC_table1;




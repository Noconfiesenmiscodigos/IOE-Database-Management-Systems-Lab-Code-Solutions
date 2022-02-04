########################################################################################################################################################################

-- 1. Create a table Student havinf two fields sid and batch with number datatype. 

-- CREATE OR REPLACE PROCEDURE p_student(sid IN NUMBER, batch IN NUMBER) 
-- AS 
-- BEGIN 

--    INSERT INTO student VALUES(sid, batch); 
--    DBMS_OUTPUT.PUT_LINE('One record inserted into Student.'); 

-- END;
-- /

-- drop database db_031;

create database db_031;

use db_031;

create table student(
s_id integer (2),
batch integer (4));

delimiter /

CREATE PROCEDURE p_student(IN sid Integer, IN batch integer) 
BEGIN 
 INSERT INTO student VALUES(sid, batch); 
 SELECT 'One record inserted into Student!' as 'Display Information';
END;

/
delimiter ;

call p_student (1,2070);
call p_student(2,2071);
call p_student (3,2072);
call p_student (4,2073);
call p_student (5,2070);
call p_student (6,2070);
select * from student;

########################################################################################################################################################################

-- 2. Create a function as shown below and understand it.

-- CREATE OR REPLACE FUNCTION fn_getbatch (id IN number) return number 
-- is bch number(5); 
-- begin 

-- select batch into bch from student where sid=id; 

-- return bch; 
-- end; 
-- /

#2.1 Procedure with in and out parameter

delimiter /

CREATE PROCEDURE proc_student_IO(IN bch Integer, OUT tot_student Integer)
BEGIN 
  SELECT count(*) into tot_student 
  from student
  where batch = bch;
END;

/

delimiter ;

call proc_student_IO(2070, @total);
select @total;
select count(*) from student
where batch=2070;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

#2.2

delimiter /

CREATE PROCEDURE proc_student_IO_same(IN bch Integer, INOUT test Integer)
BEGIN 
  SELECT count(*) into test 
  from student
  where batch = bch;
END;

/

delimiter ;
call proc_student_IO_same(2070, @test);
select @test;

########################################################################################################################################################################

-- 3. Destroy the created procedure and function using the syntax below
-- Syntax: 
-- DROP PROCEDURE/FUNCTION PROCEDURE/FUNCTION_NAME;

#3.1 Function_1

delimiter /

create function fn_getid (bch Integer) 
returns Integer Deterministic
begin
DECLARE id integer;  
select s_id into id from student where bch=batch;
return id;
end;

/

delimiter ;

select fn_getid(2071);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

#3.2 Function_2

delimiter /

create function fn_getbatch (id Integer) 
returns Integer Deterministic
begin
DECLARE bch integer;  
select batch into bch from student where s_id=id;
return bch;
end;

/

delimiter ;

select fn_getbatch(2); 
select id,batch, fn_getbatch(3) from student;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

#3.3

drop procedure p_student;
drop procedure proc_student_IO;
drop procedure proc_student_IO_same;
drop function fn_getid;
drop function fn_getbatch;

########################################################################################################################################################################

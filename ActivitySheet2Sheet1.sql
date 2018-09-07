
1) Modify table resource as per data below:				

query:-
	ALTER TABLE resource CHANGE location location_id INT;

	ALTER TABLE resource ADD FOREIGN KEY (location_id) REFERENCES location (location_id);

	ALTER TABLE resource ADD years_of_exp INT ;

	UPDATE resource SET years_of_exp=1,location_id=1 WHERE id=1;
	UPDATE resource SET years_of_exp=8,location_id=1 WHERE id=2;
	UPDATE resource SET years_of_exp=8,location_id=2 WHERE id=3;
	UPDATE resource SET years_of_exp=2,location_id=3 WHERE id=4;
	UPDATE resource SET years_of_exp=3,location_id=1 WHERE id=5;
	UPDATE resource SET years_of_exp=4,location_id=4 WHERE id=6;
	UPDATE resource SET years_of_exp=8,location_id=1 WHERE id=7;
	UPDATE resource SET years_of_exp=6,location_id=2 WHERE id=8;
	UPDATE resource SET years_of_exp=5,location_id=2 WHERE id=11;
	UPDATE resource SET years_of_exp=2,location_id=3 WHERE id=10;

	INSERT INTO resource VALUES(9,'vishal khandu kumkar','2012-05-25','1003178',1,7);

2) Create table location
query:-
	CREATE TABLE location (location_id INT PRIMARY KEY,
				location_name VARCHAR(200));
	
	INSERT INTO location VALUES(1,'indore');
	INSERT INTO location VALUES(2,'pune');
	INSERT INTO location VALUES(3,'banglore');
	INSERT INTO location VALUES(4,'mumbai');

3) Create table resource

query:-	CREATE TABLE resource_hours (resourcehrs_id INT PRIMARY KEY,
				  resource_id BIGINT, 
				  hours INT,
				  week_endDate DATE,
				  FOREIGN KEY (resource_id) REFERENCES resource(id));

	INSERT INTO resource_hours VALUE (1,1,8,'2014-12-26');
	INSERT INTO resource_hours VALUE (2,2,9,'2014-12-26');
	INSERT INTO resource_hours VALUE (3,3,2,'2014-12-26');
	INSERT INTO resource_hours VALUE (4,4,3,'2014-12-26');
	INSERT INTO resource_hours VALUE (5,5,5,'2014-06-26');
	INSERT INTO resource_hours VALUE (6,2,8,'2014-06-26');
	INSERT INTO resource_hours VALUE (7,1,7,'2014-06-26');

4) Create table project

query:-	CREATE TABLE project (project_id INT PRIMARY KEY,
				 project_name VARCHAR(500),
				 location_id INT,
				 FOREIGN KEY (location_id) REFERENCES location(location_id));
 
 	INSERT INTO project VALUES(1,'project1',1);
        INSERT INTO project VALUES(2,'project2',1);
        INSERT INTO project VALUES(3,'project3',3);
        INSERT INTO project VALUES(4,'project4',4);
    
        
5) List out resource name ,date_of_joining,location  od resource whose years_of_exp is more than 2 years						

query:-    SELECT rname, date_of_joining, location_id FROM resource WHERE years_of_exp>2;

6) Find the employee which maximum experience						

query:-    SELECT * FROM resource ORDER BY years_of_exp DESC LIMIT 1;

7) Find the resource with Indore location 						
 
query:-    SELECT  res.rname FROM resource res INNER JOIN location loc ON res.location_id=loc.location_id WHERE loc.location_name = 'indore'; 
 
8) Find the resource name,hours ,location ,week_end_date						
 
query:-  SELECT res.rname,reshr.hours, loc.location_name, reshr.week_endDate FROM location loc 
	 INNER JOIN resource res  ON res.location_id=loc.location_id 
	 INNER JOIN resource_hours reshr ON res.id=reshr.resource_id;

9) Delete record from location table with location name as Mumbai						

query:-  DELETE FROM location WHERE location_name='mumbai';
 
10) Make listing of all the records from all the tables using inner join 						

query:-  SELECT * FROM location loc 
         INNER JOIN resource res  ON res.location_id=loc.location_id 
         INNER JOIN resource_hours reshr ON res.id=reshr.resource_id;
 
11) Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)						

query:-	 ALTER TABLE project DROP PRIMARY KEY; 
query:-	 ALTER TABLE project DROP FOREIGN KEY resource_id;
 

///sheet 2

CREATE TABLE sales_people (snum INT PRIMARY KEY,
  			   sname VARCHAR(500),
			   city VARCHAR(500),
			   comm INT);

INSERT INTO sales_people VALUES (1001,'peel','london',12)			
INSERT INTO sales_people VALUES (1002,'SERRES','SANJOSE',14)			
INSERT INTO sales_people VALUES (1003,'AXCELROD','NEW YORK',10);		
INSERT INTO sales_people VALUES (1004,'MOTIKA','london',11);			
INSERT INTO sales_people VALUES (1005,'FRAN','london',26);						
INSERT INTO sales_people VALUES (1007,'RIKKLIN','BARCELONA',21);			
			
CREATE TABLE customer (cnum INT PRIMARY KEY,
			cname VARCHAR(500),
			city VARCHAR(500),
			snum INT,
			rating INT,
			CONSTRAINT fk_snum FOREIGN KEY (snum) REFERENCES sales_people(snum));
			
INSERT INTO Customer VALUE (2001,'KELVIN','SANJOSE',1007,200);
INSERT INTO Customer VALUE (2002,'GIOVANNI','ROME',1003,200);
INSERT INTO Customer VALUE (2003,'LIU','SANJOSE',1002,200);
INSERT INTO Customer VALUE (2004,'GRASS','BARLIN',1002,300);
INSERT INTO Customer VALUE (2006,'CLEMENS','LONDON',1001,100);
INSERT INTO Customer VALUE (2007,'PEREIRA','ROME',1004,100);
INSERT INTO Customer VALUE (2008,'CISNEROS','SANJOSE',1007,300);


		  
CREATE TABLE Orders(
onum INT NOT NULL,
amt DECIMAL(10,2) DEFAULT NULL ,
snum INT,
cnum INT,
odate INT,
PRIMARY KEY (onum),
FOREIGN KEY (snum) REFERENCES sales_people(snum),
FOREIGN KEY (cnum) REFERENCES customer(cnum)
);
	
					
			
INSERT INTO Orders VALUE (3001,18.69,1007,2008,35134);
INSERT INTO Orders VALUE (3003,890,1001,2001,35134);

INSERT INTO Orders VALUE (3002,1900.1,1004,2007,35134);

INSERT INTO Orders VALUE (3005,5160.45,1002,2003,35134);

INSERT INTO Orders VALUE (3006,1098.16,1007,2008,35134);

INSERT INTO Orders VALUE (3009,1713.23,1003,2002,35165);
INSERT INTO Orders VALUE (3007,75.75,1003,2002,35165);

INSERT INTO Orders VALUE (3008,4723,1001,2006,35195);
INSERT INTO Orders VALUE (3010,1309.95,1002,2004,35226);
INSERT INTO Orders VALUE (3011,9891.8,1001,2006,35226);




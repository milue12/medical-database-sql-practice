DROP DATABASE IF EXISTS  cancer;
CREATE DATABASE  cancer; 
USE cancer;

 CREATE TABLE pt_name (
	mrn int, 
    name varchar(10),
    cancertype varchar(20));
    
INSERT INTO pt_name (mrn, name, cancertype)  
VALUES (10301, '김진수', 'colon'),	
	(10303, '박만호', 'lung'),	
	(10304, '김수현', 'lung'),	 
	(10306, '임민영', 'cervical'),	
	(10307, '김수박', 'colon'),	
	(10310, '김수진', 'breast'),
    (10313, '김영미', 'rectal');
    
     select * from pt_name;
 
    CREATE TABLE pt_score(
	mrn int,
	Sex int,
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20),   
	FBS int,  
	Total_Cholesterol int,
	Newpossibility int);
INSERT INTO pt_score (mrn, sex,  initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol, Newpossibility)  
VALUES (10301, 1,'KJS', 76.1, 173.3, 25.34,'colon', 126, 145, 96),	
	(10302, 1, 'KHS',63.3,172.7,21.22, 'colon', 104, 204, 32),	
	(10303, 1, 'PMH', 66.55, 163.8, 24.8,'lung', 102,169, 0),	
	(10304, 1, 'KSH', 61.55, 176, 19.87,'lung', 78,96, 0),	
	(10305, 2, 'SMJ', 67.1, 173.1, 22.39,'lung',112,179, 44),	
	(10306, 2, 'IMY', 68.9, 156.6, 28.09,'cervical',101,249, 0),	
	(10307, 1, 'KSP', 69.5, 158.2, 27.76, 'colon',115,151, 0),	
	(10308, 2, 'PSH', 66.55, 168.5, 23.42, 'cervical',275,160,0),	
	(10309, 1, 'HKH', 70.9, 160.8, 27.42,'lung',94,209, 40),	
	(10310, 2, 'KSJ', 57.8, 164.3, 21.41,'breast', 100, 240, 44);
    
    select * from pt_score;
    
    
# Inner join 
SELECT * 
FROM Pt_name  
INNER JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn ;

#Left join
SELECT *
FROM Pt_name
LEFT JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn;

#Right join
SELECT *
FROM Pt_name
RIGHT JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn;

#Outer join
SELECT *
FROM Pt_name  LEFT JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn
UNION  
SELECT *
FROM Pt_name
RIGHT JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn;

#Cross join
SELECT *
FROM Pt_name  CROSS JOIN Pt_score;

# Self Join
SELECT t1.name AS patient_1,
       t2.name AS patient_2,
       t1.cancertype
FROM pt_name AS t1
JOIN pt_name AS t2
    ON t1.cancertype = t2.cancertype
   AND t1.mrn < t2.mrn;





 CREATE TABLE PT_table1(
	mrn int,
	Sex int,
    name varchar(20),
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20),   
	FBS int,  
	Total_Cholesterol int);
INSERT INTO PT_table1 (mrn, sex, name, initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol)  
VALUES (10301, 1, '김진수', 'KJS', 76.1, 173.3, 25.34,'colon', 126, 145),	
	(10302, 1, '김현수', 'KHS',63.3,172.7,21.22, 'colon', 104, 204),	
	(10303, 1, '박만호', 'PMH', 66.55, 163.8, 24.8,'lung', 102,169),	
	(10304, 1, '김수현', 'KSH', 61.55, 176, 19.87,'lung', 80, 106),	
	(10305, 2, '서민지', 'SMJ', 67.1, 173.1, 22.39,'lung',112,179),	
	(10306, 2, '임민영', 'IMY', 68.9, 156.6, 28.09,'cervical',101,249),	
	(10307, 1, '김수박', 'KSP', 69.5, 158.2, 27.76, 'colon',91,217);

    select * from PT_table1;
    

 CREATE TABLE PT_table2(
	mrn int,
	Sex int,
    name varchar(20),
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20),   
	FBS int,  
	Total_Cholesterol int);
INSERT INTO PT_table2 (mrn,  name, sex, initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol)  
VALUES 
	(10304,  '김수현', 1, 'KSH', 61.55, 176, 19.87,'lung', 78,96),
    (10318, '임성은', 2,'YSE', 78.6, 167.7, 27.95,'colon', 91, 249),	
	(10319, '성민호', 1,  'SMH', 54.75,153.4, 20.51, 'lung', 114, 190),	
	(10320, '김지나', 2, 'KJN', 56.9, 149, 25.63,'colon', 143,210),	
	(10321, '여민혁',  1, 'YMH', 60.9, 171.1, 20.80,'rectal', 98,106),	
	(10322, '김수진', 2, 'KSJ', 83.7, 176.4, 26.90,'breast',107,180),	
	(10323,  '이슬비', 2,'LSB', 64.9, 157.7, 26.09,'lung',101,249);

    select * from PT_table2;
    
select * from PT_table1;

#합칩합 Union All
SELECT name  FROM Pt_table1  
UNION ALL
SELECT name
FROM Pt_table2; 

#합칩합 Union 
SELECT name  FROM Pt_table1  
UNION 
SELECT name
FROM Pt_table2;

SELECT name, mrn, FBS 
FROM Pt_table1  
UNION
SELECT name, mrn, FBS 
FROM Pt_table2
ORDER BY mrn;

#교집합 쿼리 
SELECT A.name
FROM Pt_table1 AS A
INNER JOIN Pt_table2  AS B  
ON A.name = B.name;

#교집합 쿼리  1
SELECT A.name
FROM Pt_table1 AS A
INNER JOIN Pt_table2 AS B
ON A.mrn = B.mrn AND A.name = B.name AND A.cancertype = B.cancertype AND A.BMI = B.BMI AND  A.FBS = B.FBS;

# 차집합: Pt_table1에는 있지만 Pt_table2에는 없는 환자
SELECT A.name
FROM pt_table1 AS A
LEFT JOIN pt_table2 AS B
    ON A.name = B.name
WHERE B.name IS NULL;

#차집합
SELECT A.name, B.name
FROM Pt_table1 AS A
LEFT JOIN Pt_table2 AS B  ON A.name = B.name;

SELECT A.name, B.name
FROM Pt_table1 AS A
LEFT JOIN Pt_table2 AS B  ON A.name = B.name
WHERE B.name IS NULL;

#차집합 2
SELECT A.name, B.name
FROM Pt_table1 AS A
LEFT JOIN Pt_table2 AS B
ON A.mrn = B.mrn AND A.name = B.name AND  A.cancertype = B.cancertype AND A.BMI= B.BMI AND  A.FBS = B.FBS;


SELECT A.name, B.name
FROM Pt_table1 AS A
LEFT JOIN Pt_table2 AS B
ON A.mrn = B.mrn AND A.name = B.name AND  A.cancertype = B.cancertype AND A.BMI= B.BMI AND  A.FBS = B.FBS
WHERE B.name IS NULL;





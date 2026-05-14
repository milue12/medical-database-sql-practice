# 다양한 방식으로 테이블 합치기

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
    
use cancer;
/*MISSION (1)
기준 테이블 (Pt_name) 과 참조 테이블 (Pt_score)을 합쳐서 환자들의 이름, FBS, Total_cholesterol 값을 한번에 가져와 주세요.
이 때, Pt_name 테이블에 있는 모든 환자들의 데이터를 가져와 주세요. 만약, 암환자들의 Pt_score 테이블 아래의 Lab data를 구할  수 없다면, NULL을 가져와도  좋습니다. */
SELECT name, FBS, Total_cholesterol
FROM Pt_name
LEFT JOIN Pt_score
ON Pt_name.mrn = Pt_score.mrn;

/*MISSION (2)
기준 테이블 (Pt_name) 과 참조 테이블 (Pt_score)을 합쳐서 암환자 병록 번호와 이름을 한번에 가져와 주세요. 이 때, 암환자들의 Pt_score 테이블에 있는 모든 암환자들의 데이터를 가져와 주세요. 만약, 암환자들의 이름 데이터를 구할  수 없다면, NULL을 가져와도 좋습니다.
*/

SELECT pt_score.mrn, pt_name.name
FROM pt_name
RIGHT JOIN pt_score
    ON pt_name.mrn = pt_score.mrn;



    
#여러 테이블의 데이터 한번에 조회하기

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
    
/* MISSION (1)
Pt_table1 과 Pt_table2 에서 환자들의 암종이 어떤 암종들이 있는지 중복 제외하고 같은 암종은 한 번 씩만 가져와 주세요.*/
SELECT distinct cancertype
FROM Pt_table1
UNION
SELECT distinct cancertype
FROM Pt_table2;

SELECT  cancertype
FROM Pt_table1
UNION
SELECT cancertype
FROM Pt_table2;

SELECT distinct cancertype
FROM Pt_table1
UNION ALL
SELECT distinct cancertype
FROM Pt_table2;


/*MISSION (2)
Pt_table1 과 Pt_table2 에서 lung cancer 타입 환자들의 병록 번호와 이름을 중복 포함하여 전부 다  가져와 주세요. 
이때, Pt_table1으로 부터 온 환자에는 Table_num 이라는 변수를 만들어서 ‘Table1’ 이라고 이름을 붙여주고, , Pt_table2으로 부터 온 환자에는 Table_num 이라는 변수를 아래에 ‘Table2’ 라고 이름을 붙여주세요.*/
SELECT mrn, name, 'Table1' AS Table_num
FROM Pt_table1
WHERE cancertype = 'lung'
UNION ALL
SELECT mrn, name, "Table2" AS Table_num
FROM Pt_table2
WHERE cancertype = 'lung';

    
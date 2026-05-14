DROP DATABASE IF EXISTS  cancer;
CREATE DATABASE  cancer; 
USE cancer;
CREATE TABLE pt_list (
	mrn int,
	Sex int,
    name varchar(10),
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20),   
	FBS int,  
	Total_Cholesterol int,
	Newpossibility int,
    diff float);
INSERT INTO pt_list (mrn, sex, name, initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol, Newpossibility, diff)  
VALUES (10301, 1, '김진수', 'KJS', 76.1, 173.3, 25.34,'colon', 126, 145, 96, -45),	
	(10302, 1, '김현수','KHS',63.3,172.7,21.22, 'colon', 104, 204, 32, 38),	
	(10303, 1, '박만호','PMH', 66.55, 163.8, 24.8,'lung', 102,169, 0, -159),	
	(10304, 1, '김수현','KSH', 61.55, 176, 19.87,'lung', 78,96, 0, 96),	
	(10305, 2, '서민지','SMJ', 67.1, 173.1, 22.39,'lung',112,179, 44, 98),	
	(10306, 2, '임민영','IMY', 68.9, 156.6, 28.09,'cervical',101,249, 0, 249),	
	(10307, 1, '김수박','KSP', 69.5, 158.2, 27.76, 'colon',115,151, 0, 383),	
	(10308, 2, '박수현','PSH', 66.55, 168.5, 23.42, 'cervical',275,160,0, 298),	
	(10309, 1, '황기현','HKH', 70.9, 160.8, 27.42,'lung',94,209, 40, 168),	
	(10310, 2, '김수진','KSJ', 57.8, 164.3, 21.41,'breast', 100, 240, 44, -283);
    
SELECT mrn, name
FROM Pt_list -- 테이블 사용(USE) 명시 했다고 가정
ORDER BY mrn DESC;

SELECT mrn, name, weight, BMI
FROM Pt_list -- 테이블 사용(USE) 명시 했다고 가정
ORDER BY weight DESC, BMI;

SELECT mrn, name, weight, BMI
FROM Pt_list -- 테이블 사용(USE) 명시 했다고 가정
ORDER BY 3 DESC, 4;

SELECT name, weight,
RANK() OVER (ORDER BY weight DESC) AS weight_rank  FROM cancer.Pt_list;

SELECT name, weight,
DENSE_RANK() OVER (ORDER BY weight DESC) AS weight_rank
FROM cancer.Pt_list;

SELECT name, weight,
ROW_NUMBER() OVER (ORDER BY weight DESC) AS weight_rank
FROM cancer.Pt_list;

SELECT name, weight,
RANK() OVER (ORDER BY weight DESC) AS rank_rank,  
DENSE_RANK() OVER (ORDER BY weight DESC) AS rank_dense_rank,
ROW_NUMBER() OVER (ORDER BY weight DESC) AS rank_row_number  
FROM cancer.Pt_list;

DROP DATABASE IF EXISTS  bts;
CREATE DATABASE  bts; 
USE bts;
CREATE TABLE dynamite (
	part int,
	lyric varchar(120));
    INSERT INTO dynamite (part, lyric)  
VALUES (1, 'Shoes on, get up in the morn'),	
	(2, 'Cup of milk, let`s rock and roll'),	
	(3, 'King Kong, kick the drum'),
    (4, 'rolling on like a Rolling Stone'),
    (5, 'Sing song when I`m walking home'),
    (6, 'Jump up to the top, LeBron');
    
SELECT part, LOCATE('i', lyric)  
FROM bts.dynamite; 

SELECT part, SUBSTRING(lyric, 3) 
FROM bts.dynamite;

SELECT part, SUBSTRING(lyric, 100)
FROM bts.dynamite;

SELECT part, RIGHT(lyric, 3), LEFT(lyric, 3) 
FROM bts.dynamite;

SELECT part, UPPER(lyric), LOWER(lyric)  
FROM bts.dynamite;

SELECT part, LENGTH(lyric)  
FROM bts.dynamite;

SELECT part,
CONCAT(LEFT(lyric, 1), RIGHT(lyric, 1)) AS first_last  
FROM bts.dynamite;

SELECT part, REPLACE(lyric, ' ', '_')
FROM bts.dynamite;



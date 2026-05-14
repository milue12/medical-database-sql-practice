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
	Newpossibility int);
INSERT INTO pt_list (mrn, sex, name, initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol, Newpossibility)  
VALUES (10301, 1, '김진수', 'KJS', 76.1, 173.3, 25.34,'colon', 126, 145, 96),	
	(10302, 1, '김현수','KHS',63.3,172.7,21.22, 'colon', 104, 204, 32),	
	(10303, 1, '박만호','PMH', 66.55, 163.8, 24.8,'lung', 102,169, 0),	
	(10304, 1, '김수현','KSH', 61.55, 176, 19.87,'lung', 78,96, 0),	
	(10305, 2, '서민지','SMJ', 67.1, 173.1, 22.39,'lung',112,179, 44),	
	(10306, 2, '임민영','IMY', 68.9, 156.6, 28.09,'cervical',101,249, 0),	
	(10307, 1, '김수박','KSP', 69.5, 158.2, 27.76, 'colon',115,151, 0),	
	(10308, 2, '박수현','PSH', 66.55, 168.5, 23.42, 'cervical',275,160,0),	
	(10309, 1, '황기현','HKH', 70.9, 160.8, 27.42,'lung',94,209, 40),	
	(10310, 2, '김수진','KSJ', 57.8, 164.3, 21.41,'breast', 100, 240, 44);


SET GLOBAL log_bin_trust_function_creators = 1;	
DELIMITER // 

CREATE FUNCTION lab_total(total_cholesterol INT, fbs INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN total_cholesterol + fbs;
END
//
DELIMITER ;

SELECT name,
       lab_total(total_cholesterol, fbs) AS lab_total_score
FROM pt_list;



/*MISSION 0
FBS와 Total Cholesterol의 합이 300보다 크면 ‘very bad’, 270보다 크면 ‘bad’,
모두 해당 되지 않으면 ‘not bad’를 반환하는 함수 ‘isBad’을 만들고 사용해주세요.
조건1: FBS 과 Cholesterol 를 입력값으로 사용하세요.
조건2: 결과값 데이터 타입은 VARCHAR(20)로 해주세요.*/

SET GLOBAL log_bin_trust_function_creators = 1;	
DELIMITER // 

CREATE FUNCTION isBad(Total_Cholesterol INT, FBS INT)  
RETURNS  VARCHAR(20)
BEGIN
DECLARE a INT;  
DECLARE b INT;
DECLARE isBad VARCHAR(20);  
SET a = Total_Cholesterol;
SET b = FBS;
 SELECT CASE
			WHEN a + b > 300 THEN 'very bad'
            WHEN a + b > 270 THEN 'bad'
            ELSE 'not bad'
			END INTO isBad;
RETURN isBad;
END
//
DELIMITER ; -- 꼭 한 칸을 띄어주세요!!
 
SELECT name, isBad(Total_Cholesterol, FBS) AS isBad
FROM pt_list;
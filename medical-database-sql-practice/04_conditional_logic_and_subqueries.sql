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


/* MISSION (1)
환자의 병록 번호가 10306 보다 작으면 값을 ‘old’로 반환하고, 번호가 10307보다 크거나 같으면 값을 ‘new’로 반환해서 ‘new_mrn’이라는 별명으로 가져와 주세요. */
SELECT name, IF(mrn<10306, 'old', 'new') AS new_mrn  
FROM cancer.pt_list;



/* MISSION (2)
암환자들의 FBS와 Total_Cholesterol의 합이 260보다 작으면 값을 ‘good’로 반환하고, 260 보다 크거나 같으면  값을 ‘poor’로 반환해서 ‘lab’이라는 별명으로 가져와 주세요.*/
SELECT name, IF(FBS+Total_Cholesterol<260, 'good', 'poor') AS lab  
FROM cancer.pt_list;



/* MISSION (3)
암환자들의 암종 별 FBS 수치 평균이 110 이상이면 값을 True(1)로 반환하고, 110 보다 작으면 False(0)를  반환해 ‘is_bad_status’라는 별명으로 가져와 주세요.*/

SELECT cancertype, AVG(FBS)
FROM Pt_list 
GROUP BY cancertype;

SELECT cancertype, IF(AVG(FBS)>=110, 'TRUE', 'FALSE') AS is_bad_status
FROM Pt_list 
GROUP BY cancertype;

SELECT cancertype, IF(AVG(FBS)>=110, TRUE, FALSE) AS is_bad_status
FROM Pt_list 
GROUP BY cancertype;

/* MISSION (4)
암환자들의 Total_Cholesterol이 200보다 크고, FBS 126보다 크면 값을 True(1)로 반환하고, 
둘 중 하나라도 126보다 작으면 False(0)를 반환해 ‘Risk’라는 별명으로 가져와 주세요.*/

SELECT cancertype, IF(Total_cholesterol > 200 AND FBS >126, 'TRUE', 'FALSE') AS risk
FROM Pt_list 
GROUP BY cancertype;

SELECT name,
       total_cholesterol,
       fbs,
       IF(total_cholesterol > 200 AND fbs > 126, TRUE, FALSE) AS risk
FROM pt_list;


/* MISSION (5)
암환자들의 병록 번호가 10305보다 작으면 값을 ‘<10305’을 반환하고, 10308보다 작으면 값을 ‘< 10308’을 반환하고,  10312보다 작으면 값을 ‘< 10312’을 반환하는 규칙을 만들고,
 각 암환자 별 규칙 적용 값을 ‘mrn_bin’이라는 별명으로 가져와 주세요. */ 
SELECT name, 
CASE 
WHEN mrn<10305 THEN '<10305'
WHEN mrn<10308 THEN '<10308'
WHEN mrn<10312 THEN '<10312'
END AS mrn_bin
FROM Pt_list;


/* MISSION (6)
아래 표에 따른 값을 반환하는 규칙을 만들고, 각 암환자 별 규칙 적용 값을 ‘mrn_FBS’라는 별명으로  가져와 주세요. */
SELECT name,
CASE 
    WHEN mrn >= 10306 AND fbs >= 126 THEN 'new_risk'
    WHEN mrn >= 10306 AND fbs < 126 THEN 'new_normal'
    WHEN mrn < 10306 AND fbs >= 126 THEN 'old_risk'
    WHEN mrn < 10306 AND fbs < 126 THEN 'old_normal'
END AS mrn_fbs


/* MISSION (7)
암종 별 암환자의 명수가 1명이면 ‘solo’, 3명 미만이면 ‘minor’, 3명 이상이면 ‘major’를 반환하고,  ‘count_by_cancertype’이라는 별명으로 가져와 주세요.*/
SELECT cancertype,
CASE
WHEN COUNT(1) = 1 THEN 'solo'
WHEN COUNT(1) <3 THEN 'minor'
WHEN COUNT(1) >=3 THEN 'major' 
END AS count_by_cancertype
FROM Pt_list
GROUP BY cancertype;

SELECT cancertype,
CASE
WHEN COUNT(1) = 1 THEN 'solo'
WHEN COUNT(1) <3 THEN 'minor'
ELSE 'major' 
END AS count_by_cancertype
FROM Pt_list
GROUP BY cancertype;



 CREATE TABLE pt_name (
	mrn int, 
    name varchar(10));
    
INSERT INTO pt_name (mrn, name)  
VALUES (10301, '김진수'),	
	(10302, '김현수'),	
	(10303, '박만호'),	
	(10304, '김수현'),	
	(10305, '서민지'),	
	(10306, '임민영'),	
	(10307, '김수박'),	
	(10308, '박수현'),	
	(10309, '황기현'),	
	(10310, '김수진');
    
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
    
/*  MISSION (8)
암환자 리스트 중에 몸무게가 가장 많이 나가는 암환자의 병록 번호를 가져와 주세요. */
SELECT mrn
FROM Pt_score
WHERE weight = (SELECT MAX(weight) FROM Pt_score);

/*  MISSION (9)
FBS가 모든 대장암 환자의 Total Cholesterol보다 하나라도 작은 환자의 병록 번호를 가져와 주세요.*/
SELECT mrn
FROM Pt_score
WHERE FBS <ANY(SELECT Total_cholesterol FROM Pt_score WHERE cancertype = 'colon');


/* MISSION (10)
FBS 수치가 Total Cholesterol보다 큰 환자가 있다면 모든 암환자들의 이름을 가져와 주세요.*/
SELECT name
FROM Pt_name
WHERE EXISTS (SELECT * FROM Pt_score WHERE FBS>Total_cholesterol);

/* MISSION (11)
박만호의 MRN 10303을 활용하여, 박만호의 이름, 키, 몸무게를 가져와 주세요. 
이때, 키는 height, 몸무게는 weight  라는 별명으로 가져와 주세요. */
SELECT name, (SELECT height FROM Pt_score WHERE mrn=10303) AS 'height',
(SELECT weight FROM Pt_score WHERE mrn=10303) AS 'weight'
FROM Pt_name
WHERE mrn=10303;
SELECT (SELECT name FROM Pt_name WHERE mrn=10303) AS 'name', height, weight 
FROM PT_score
WHERE mrn=10303;

/* MISSION (12)
키가 두번째로 큰 환자의 병록번호와 키를 가져와 주세요.*/

SELECT mrn, height
FROM pt_score
ORDER BY height DESC
LIMIT 1 OFFSET 1;

/* MISSION (13)
Total Cholesterol 이 모든 cervical 환자의 키보다 큰 환자의 이름을 가져와 주세요.*/

SELECT n.name
FROM pt_name AS n
JOIN pt_score AS s
    ON n.mrn = s.mrn
WHERE s.total_cholesterol > ALL (
    SELECT height
    FROM pt_score
    WHERE cancertype = 'cervical'
);

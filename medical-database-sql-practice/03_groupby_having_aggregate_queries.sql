DROP DATABASE IF EXISTS  cancer;
CREATE DATABASE  cancer; 
USE cancer;
CREATE TABLE pt_list (
	mrn int,
	Sex int,
	baseline_dt date,
    followup_dt date,
    name varchar(10),
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20), 
    drug varchar(100),
	FBS int,  
	Total_Cholesterol int,
	Newpossibility int,
    diff float);
INSERT INTO pt_list (mrn, sex,  baseline_dt, followup_dt, name, initial, weight, height, BMI, cancertype, drug, FBS, Total_Cholesterol, Newpossibility, diff)  
VALUES (10301, 1, '2014-12-02', '2017-07-13', '김진수', 'KJS', 76.1, 173.3, 25.34,'colon', '큐마주(피록시캄칼륨)', 126, 145, 96, -45),	
	(10302, 1, '2014-04-11',  '2015-03-17', '김현수','KHS',63.3,172.7,21.22, 'colon', '암로비스정(암로디핀베실산염)', 126, 204, 32, 38),	
	(10303, 1, '2014-12-16',	'2016-01-20', '박만호','PMH', 66.55, 163.8, 24.8,'lung', '루카스정10mg(몬테루카스트나트륨)_(10.4mg/1정)', 102,169, 0, -159),	
	(10304, 1, '2014-01-18',	'2017-04-23', '김수현','KSH', 61.55, 176, 19.87,'lung', '카디나정(칼리디노게나제)', 78,96, 0, 96),	
	(10305, 2, '2014-05-18',	'2017-07-23', '서민지','SMJ', 67.1, 173.1, 22.39,'lung', '파비스에페리손정(에페리손염산염)', 112,179, 44, 98),	
	(10306, 2, '2014-06-18',	'2016-05-23', '임민영','IMY', 68.9, 156.6, 28.09,'cervical', '에이콜린연질캡슐(콜린알포세레이트)_(0.4g/1캡슐)', 101,249, 0, 249),	
	(10307, 1, '2014-06-26',	'2017-01-26', '김수박','KSP', 69.5, 158.2, 27.76, 'colon', '세레비스캡슐(세레콕시브)', 115,151, 0, 383),	
	(10308, 2, '2014-12-26',	'2018-02-28', '박수현','PSH', 66.55, 168.5, 23.42, 'cervical','로사디핀정10/50밀리그램', 275,160,0, 298),	
	(10309, 1, '2014-11-30',	'2017-06-25', '황기현','HKH', 70.9, 160.8, 27.42,'lung','예스오메정40mg(에스오메프라졸마그네슘이수화물)', 94,209, 40, 168),	
	(10310, 2, '2014-12-31',	'2017-08-07', '김수진','KSJ', 57.8, 164.3, 21.41,'breast', '심록스에프정', 100, 240, 44, -283);
 
/* MISSION (1)
환자들의 암 종별 키의 평균을 가져와 주세요. 둘째자리 까지 반올림해주세요.*/
SELECT cancertype, ROUND(AVG(height),2)
FROM Pt_list
GROUP BY cancertype;

/*MISSION (2)
환자들의 암 종별 몸무게의 평균을 가져와 주세요.둘째자리 까지 반올림해주세요.*/
SELECT cancertype, ROUND(AVG(weight),2)
FROM Pt_list
GROUP BY cancertype;

/*MISSION (3)
환자들의 암 종별 키의 평균과 몸무게의 평균을 함께 가져와 주세요.둘째자리 까지 반올림해주세요*/
SELECT cancertype, ROUND(AVG(height),2) as avg_height, ROUND(AVG(weight),2) as avg_weight
FROM Pt_list
GROUP BY cancertype;

/*MISSION (4)
키의 평균이 155cm 이상인 환자들의 cancer 타입을 가져와 주세요.*/
SELECT cancertype, ROUND(AVG(height),2)
FROM Pt_list
GROUP BY cancertype
Having AVG(height)>=155;

/*MISSION (5)
몸무게의 평균이 58 이상인 환자들의 cancer타입을 가져와 주세요.*/
SELECT cancertype, ROUND(AVG(weight),2)
FROM Pt_list
GROUP BY cancertype
Having AVG(weight)>=58;

/*MISSION (6)
환자들의 암 종별 병록번호(mrn)의 합을 가져와 주세요.*/
SELECT cancertype, sum(mrn)
FROM Pt_list
GROUP BY cancertype ;

/*MISSION (7)
키가 162 이상인 환자들이 환자들의 cancertype 별로 몇 명씩 있는지 가져와 주세요.*/
SELECT cancertype, COUNT(*) AS patient_count
FROM pt_list
WHERE height >= 162
GROUP BY cancertype;

/*MISSION (8)
환자들의 암 종별 키의 최솟값을 가져와 주세요.*/
SELECT cancertype, min(height)
FROM Pt_list
GROUP BY cancertype;

/*MISSION (9)
환자들의 암 종별 몸무게의 최댓값을 가져와 주세요*/
SELECT cancertype, MAX(weight) AS max_weight
FROM pt_list
GROUP BY cancertype;

/*MISSION (10)
키의 최솟값이 160보다 크고, 무게의 최댓값이 65보다 작은 환자들의 cancer타입을 가져와 주세요.*/
SELECT cancertype 
FROM Pt_list 
GROUP BY cancertype
HAVING MIN(height) >160 AND MAX(weight)<65;

/*MISSION (11)
Cancer database의 Pt_list 테이블에서 drug 이름(drug)의 길이가 12보다 큰 환자들을 cancer 타입(cancertype)을 기준으로 그룹화하고,  몸무게(weight)의 평균이 55 이상인 그룹의 타입과, 몸무게의 평균을 가져와 주세요. 이 때, 결과는  몸무게의 평균을 내림차순으로 정렬해 주세요.
 이때,  AVG(weight) 값은 둘째까지 반올림해서 ‘AVG(weight)’ 라는 이름으로 가져와 주세요.
 */

SELECT cancertype, ROUND(AVG(weight),2) as 'AVG(weight)' 
FROM cancer.Pt_list
WHERE LENGTH(drug) > 12
GROUP BY cancertype
HAVING AVG(weight) >= 55
ORDER BY 2 DESC;

/*MISSION (12)
Pt_list 테이블에서 병록번호(mrn)가 10305보다 작은 환자들을 cancer 타입(cancertype)을 기준으로 그룹화한 후에, 몸무게(weight)의 최댓값이 60보다 크거나 같고 최솟값은 52.6보다 크거나 같은 그룹의
Cancer 타입, 키(height)의 최솟값, 최댓값을 가져와 주세요. 
이 때, 결과는 키의 최솟값의 내림차순으로 정렬해  주시고, 만약 키의 최솟값이 같다면 키의 최댓값의 내림차순으로 정렬해주세요.
*/

SELECT cancertype, MIN(height), MAX(height)
FROM cancer.Pt_list
WHERE mrn < 10305
GROUP BY cancertype
HAVING MAX(weight) >= 60 AND MIN(weight) >= 52.6
ORDER BY MIN(height) DESC, MAX(height) DESC;

SELECT cancertype, MIN(height), MAX(height)
FROM cancer.Pt_list
WHERE mrn < 10305
GROUP BY cancertype
HAVING MAX(weight) >= 60 AND MIN(weight) >= 52.6
ORDER BY MIN(height) DESC, MAX(height) DESC;
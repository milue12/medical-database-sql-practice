# MISSION (1): 테이블 만들기 
/*쿼리 순서
STEP1. tumor 데이터베이스를 만들어 주세요. (데이터베이스 이름 : tumor)
STEP2. tumor 데이터베이스 안에 Pt_list 테이블을 만들어 주세요. (테이블 이름 : pt_list)
이 때, 컬럼은 (1) mrn, (2) sex, (3) baseline_dt, (4) followup_dt, (5) name, (6) initial, (7) weight, (8) height, (9) BMI, (10) cancertype, 
           (11) drug, (12) FBS, (13)Total_cholesterol, (14) Newpossibility   총 14가지로 하고, 이름과 데이터 타입을 지정해 주세요.
컬럼 이름 및 데이터 타입 : (1) mrn: INT, (2) sex: INT, (3) baseline_dt: date, (4) followup_dt: date, (5) name: varchar(10), (6) initial: varchar(20), 
                      (7) weight: float, (8) height: float, (9) BMI: float, (10) cancertype: varchar(20), (11) drug: varchar(100), (12) FBS: int, (13) Total_cholesterol: int, 
                      (14) Newpossibility: int 
# STEP1. tumor 데이터베이스를 만들어 주세요. (데이터베이스 이름 : tumor)*/ -- 1점 
CREATE DATABASE tumor; 

USE tumor;
# STEP2. tumor 데이터베이스 안에 patient 테이블을 만들어 주세요. (테이블 이름 : pt_list) -- 1점 
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
	Newpossibility int);
    
/*  STEP3. Pt_list 테이블 안에 cancer 환자 데이터를 각각의 로우로 넣어 주세요.*/  
INSERT INTO pt_list (mrn, sex,  baseline_dt, followup_dt, name, initial, weight, height, BMI, cancertype, drug, FBS, Total_Cholesterol, Newpossibility)  
VALUES (10301, 1, '2014-12-02', '2017-07-13', '김진수', 'KJS', 76.1, 173.3, 25.34,'colon', '큐마주(피록시캄칼륨)', 126, 145, 96),	
	(10302, 1, '2014-04-11',  '2015-03-17', '김현수','KHS',63.3,172.7,21.22, 'colon', '암로비스정(암로디핀베실산염)', 126, 204, 32),	
	(10303, 1, '2014-12-16',	'2016-01-20', '박만호','PMH', 66.55, 163.8, 24.8,'lung', '루카스정10mg(몬테루카스트나트륨)_(10.4mg/1정)', 102,169, 0),	
	(10304, 1, '2014-01-18',	'2017-04-23', '김수현','KSH', 61.55, 176, 19.87,'rectal', '카디나정(칼리디노게나제)', 78,96, 0),	
	(10305, 2, '2014-05-18',	'2017-07-23', '서민지','SMJ', 67.1, 173.1, 22.39,'lung', '파비스에페리손정(에페리손염산염)', 112,179, 44),	
	(10306, 2, '2014-06-18',	'2016-05-23', '임민영','IMY', 68.9, 156.6, 28.09,'cervical', '에이콜린연질캡슐(콜린알포세레이트)_(0.4g/1캡슐)', 101,249, 0),	
	(10307, 1, '2014-06-26',	'2017-01-26', '김수박','KSP', 69.5, 158.2, 27.76, 'rectal', '세레비스캡슐(세레콕시브)', 115,151, 0),	
	(10308, 2, '2014-12-26',	'2018-02-28', '박수현','PSH', 66.55, 168.5, 23.42, 'cervical','로사디핀정10/50밀리그램', 275,160,0),	
	(10309, 1, '2014-11-30',	'2017-06-25', '황기현','HKH', 70.9, 160.8, 27.42,'lung','예스오메정40mg(에스오메프라졸마그네슘이수화물)', 94,209, 40),	
	(10310, 2, '2014-12-31',	'2017-08-07', '김수진','KSJ', 57.8, 164.3, 21.41,'breast', '심록스에프정', 100, 240, 44);

/*MISSION (2)*/

# STEP1. ‘pt_list’ 테이블의 이름을 ‘old_patient’으로 변경해 주세요.
ALTER TABLE pt_list
RENAME old_patient;

# STEP2. ‘old_patient’ 테이블의 ‘name’ 컬럼의 이름을 ‘KOR_name’으로 변경해 주세요.  KOR_name 은 VARCHAR(20)
ALTER TABLE old_patient
CHANGE COLUMN name KOR_name VARCHAR(20);

SELECT * FROM tumor.old_patient; -- old_Pt_list 테이블 전체를 조회하는 쿼리를 짜보세요,

/* Mission (3) ‘tumor’ 데이터베이스 안에 있는 ‘old_patient’ 테이블은 값만 지워 주세요*/
TRUNCATE TABLE old_patient;

/* MISSION (4) ‘tumor’ 데이터베이스 안에 있는 ‘old_patient’ 테이블을 아예 삭제해주세요*/
DROP TABLE old_patient;

/*MISSION 1- Step 2-3 을 다시 실행해서, tumor 데이터 베이스 안에, pt_list  테이블을 다시 만들어줍니다. */
    
/* MISSION (5)                                                                                                            
 ‘initial’ 이라는 문자열을 ‘INT’ 라는 이름의 새로운 컬럼 이름으로 가져와 주세요.*/
SELECT initial as 'INT' FROM pt_list; -- 예약어 형태의 INT는 변수명으로 불러올 수가 없습니다. 따옴표를 사용하여 'INT' 형태로 새로운 이름을 부여해주세요.

/*MISSION (6)
Pt_list 테이블에서 모든  환자들의 성별을 중복 제거하고 가져와 주세요.*/
SELECT DISTINCT sex FROM Pt_list; 

/*MISSION (7)
Pt_list 테이블에서 모든 환자들의 키를 100으로 나누어‘height(m)’라는 별명으로 병록번호(mrn)과 함께 가져와 주세요. '
현재 Pt_list 테이블의 키 컬럼은 cm단위입니다. (1m = 100cm)
이 때, 'hight(m)은 숫자를 소숫점 둘째자리 까지 반올림하여 반환해줍니다. ROUND 를 써주세요*/
SELECT mrn, ROUND((height/100),2) as 'height(m)' FROM Pt_list; -- mrn 10304 의 hight(m) 을 스마트리드에 입력해주세요.

/*MISSION (8)
Pt_list 테이블에서 5개의 환자 데이터만 name은  ‘이름’ 이라는 별명으로,
키는 ‘키(cm)’라는 별명으로, 몸무게는 ‘몸무게(kg)’이라는 별명으로 가져와주세요.*/
SELECT name as '이름', height as '키(cm)', weight as '몸무게(kg)' FROM Pt_list LIMIT 5;

/*MISSION (9)
Pt_list 테이블에서 모든 환자들의 BMI 지수를 구해서 ‘BMI_2’ 라는 별명으로 가져오고, 기존의 BMI 지수와 비교해봅시다. 
이때, 환자들을 구분하기 위해 병력번호(mrn)도 함께 가져와주세요.
제곱은  POWER 를 사용해주세요. 
조건1. BMI지수= 몸무게(kg) ÷(키(m))²
조건2. Pt_list 테이블 데이터의 체중은kg 단위, 키는cm 단위입니다.
BMI_2 는 소수점 둘째자리까지 반올림해서 반환해 줍니다.*/
SELECT mrn, BMI, ROUND(weight/POWER((height/100),2),2) as BMI_2 FROM Pt_list; -- mrn 10304 의 BMI_2값을 입력해주세요. 

/*MISSION (10) 
환자 ‘김수박’ 의 mrn, 키와 몸무게, BMI를 가져와 주세요*/
SELECT mrn, height, weight, BMI
FROM Pt_list
WHERE name='김수박';  

/*MISSION (11)
몸무게가 65kg보다 크거나 같은 환자들의 FBS 평균을 정수로 반올림해서, ‘avg_of_FBS’이라는 별명으로 가져와 주세요.
TRUNCATE 함수를 사용해서 avg_of_FBS 값의 소수점 아래 수는 다 버려주세요*/
SELECT TRUNCATE(AVG(FBS), 0) AS avg_of_fbs
FROM pt_list
WHERE weight >= 65; -- avg_of_FBS 값을 스마트 리드에 입력해주세요.

/*MISSION (12)
키가 173.1cm 이상이거나, BMI가 24 이하이면서, cancertype 이 직장암(rectal) 이 아닌 환자들의 데이터를 전부 가져와 주세요.*/
# STEP1: 직장암이 아닌 환자를 뽑아 낼 때, ! 를 사용해주세요, 
SELECT * FROM 
pt_list 
WHERE sex=1 AND (height>=173.1 OR BMI<=24) AND cancertype!='rectal';
-- 해당하는 cancertype 을 쓰시오. 남자값

# STEP2: 직장암이 아닌 환자를 뽑아 낼 때, not을 사용해주세요, 
SELECT * 
FROM pt_list
WHERE sex=2 AND (height>=173.1 OR BMI<=24) AND NOT(cancertype='rectal');
-- 이 환자의 newpossibility점수를 스마트리드에 입력해주세요. 여자값

/*MISSION (13)
Cancertype이 (cervical, rectal, breast) 중에 하나인 환자들의 이름과 성별과 cancertype을 가져와 주세요.*/

# STEP1: IN 예약어 활용하세요.
SELECT name, sex, cancertype
FROM Pt_list
WHERE cancertype IN('cervical', 'rectal', 'breast');

# STEP2: OR 예약어 활용하세요.
SELECT name, sex, cancertype
FROM Pt_list
WHERE cancertype='cervical' or cancertype='rectal' or cancertype='breast' ;

-- 해당하는 환자가 몇명인지 스마트리드에 입력해주세요. (Step 1, 2 동일)

/*MISSION (14)
BMI 수치가 23과 25 사이인 환자들의 이름과 BMI, FBS를 가져와 주세요.*/
#STEP 1: BETWEEN 사용해주세요. 
SELECT name, BMI, FBS
FROM Pt_list
WHERE BMI BETWEEN 23 AND 25;

#STEP 2: 비교연산자를 사용해주세요.   
SELECT name, BMI, FBS
FROM Pt_list
WHERE BMI >= 23 AND BMI <= 25;

-- 이 쿼리를 통해 추출된 환자의 명수를 스마트 리드에 입력해주세요. (step 1, 2 동일)

/*MISSION (15)
이름 ‘현’이 포함되고, FBS수치가 110 이상인 환자 데이터 중, drug 에서 2번째 문자까지를 mrn, sex와 함께 반환해주세요.
이때 drug에서 2번째 문자까지의 값은 drug_2 라는 별명으로 가져와 주세요 .*/
SELECT mrn, sex, LEFT(drug, 2) as drug_2
FROM Pt_list
WHERE name like '%현%' AND FBS>=110;
-- 추출된 환자중, 성별이 1(남) 인 환자의 drug_2 를 스마트 리드에 입력해주세요. 
  
/*MISSION (16)
성이 김씨인 환자들의 이름 (LIKE 연산자 사용), 키, 몸무게, BMI를 가져와 주세요. 키는 m 단위로 계산해서 'height(m)' 라는 별명으로 가져와주세요.
height(m) 정수로 올림해서 가져와줍니다 */
SELECT name, ceiling(height/100) as 'height(m)', weight, BMI 
FROM Pt_list
WHERE name like '김%';

/*MISSION (17)
성이 박씨면서 '호'로 끝나는, 키가 160 이상인 환자들의 이름, cancertype을 가져와 주세요. LIKE 연산자 사용*/
SELECT name, cancertype, height
FROM Pt_list
WHERE name like '박%_호' AND height>=160; 
-- 스마트리드에 입력해주세요.

/*MISSION (18)
Total_cholesterol과 FBS 차이가 100 보다 큰 환자들의 이름, FBS, Total_cholesterol, Total_cholesterol-FBS 값을 가져와 주세요.  
이때, Total_cholesterol-FBS  값을 differ 라고 별명을 붙여 주세요.*/
SELECT name, FBS,  Total_cholesterol, Total_cholesterol-FBS as differ
FROM Pt_list
WHERE Total_cholesterol-FBS>100;

/*MISSION (19) Total_cholesterol과 FBS 차이가 120 보다 큰 환자들의 Total_cholesterol-FBS 평균 값을 avg_of_differ 라는 이름으로 계산해주세요.
정수로 내림해줍니다. */
SELECT floor(avg(Total_cholesterol-FBS)) as avg_of_differ
FROM Pt_list
WHERE Total_cholesterol-FBS>120; -- 스마트 리드에 입력해주세요. 

/*
MISSION (20)
Pt_list 테이블에서 FBS 수치의 순위를 보여주는 컬럼을 새로 만들어서	‘FBS_rank’라는 별명으로 가져와  주세요. 이 때, 환자들의 이름 데이터도 함께 가져와 주세요.
조건1: FBS 수치의 순위란 FBS 수치가 큰 순서대로 나열한 순위를 의미합니다.
조건2: 중복값이 있더라도 순차적인 순위를 매겨주세요. 
*/
SELECT name, ROW_NUMBER() OVER (ORDER by FBS DESC) AS FBS_rank
FROM Pt_list;
-- 7순위에 해당하는 환자를 스마트리드에 입력해주세요. 

/* MiSSION (21)
Pt_list 테이블에서 BMI가 25이상인 환자들의 baseline_dt에서 followup_dt까지 몇일이 차이가 나는지를 ‘days’라는 별명으로 가져와 주세요. 
days를 다시 내림차순으로 정렬해주세요.
이 때, 환자들의 이름도 함께 가져와 주세요. */
SELECT name,  DATEDIFF(followup_dt, baseline_dt) AS days 
 FROM Pt_list WHERE BMI>=25 ORDER BY days desc; 
 -- 위에서 3번째 환자의 days 값을 스마트 리드에 입력해주세요. 
 
/*MISSION (22)
약물의 가장 첫번째 글자 1자, 가장 마지막 글자 1자를 합친 후, 대문자로 변환해서  
‘drug_code’라는 별명으로 가져와 주세요. 이 때, 이름도 함께 가져와 주세요.*/
SELECT name, UPPER(CONCAT(LEFT(drug, 1), RIGHT(drug, 1))) AS drug_code
FROM Pt_list;
-- 박수현의 drug_code 를 입력해주세요.

/*MISSION (23)
모든 환자들의 FBS를 2로 나눈 나머지를 ‘fbs_left’라는 별명으로 가져와 주세요. 이 때, 이름도 함께 가져 와 주세요.
fbs_left 는 소수점 둘째자리에서 반올림 해주세요*/
SELECT name, ROUND(MOD(FBS, 2), 2) AS fbs_left
FROM pt_list;

/*MISSION (24)
김씨 성을 가지고 수로 끝나는 환자들의 이름과, followup_dt 의 연도, 월, 일을 각각 숫자로 가져와 주세요. 
김씨 성을 가지고 수로 끝나는 환자들의 이름을 뽑을 때는 LIKE 연산자 사용해주세요. 
연도는 year, 월은 month, 일은 day라  는 별명으로 가져와 주세요.*/
SELECT name, YEAR(followup_dt) as year, Month(followup_dt) as month, Dayofmonth(followup_dt) as day
FROM Pt_list
WHERE  name like'김%_수';
 
 
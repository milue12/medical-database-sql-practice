DROP DATABASE IF EXISTS  cancer;
CREATE DATABASE  cancer; 
USE cancer;


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
DELETE FROM cancer.Pt_table1  
WHERE BMI > 25;
select * from PT_table1;
    
UPDATE cancer.Pt_table1  SET cancertype = 'ovarian'
WHERE cancertype = 'cervical';
select * from PT_table1;

DROP Table IF EXISTS  Pt_name;
 CREATE TABLE pt_name (
	mrn int PRIMARY KEY NOT NULL, 
    name varchar(10) NOT NULL,
    cancertype varchar(20));
    
INSERT INTO pt_name (mrn, name, cancertype)  
VALUES (10301, '김진수', 'colon'),	
	(10303, '박만호', 'lung'),	
	(10304, '김수현', 'lung'),	 
	(10306, '임민영', 'cervical'),	
	(10307, '김수박', 'colon'),	
	(10310, '김수진', 'breast'),
    (10313, '김영미', 'rectal');
    
	DESCRIBE Pt_name;
    
DROP Table IF EXISTS  PT_table1;
 CREATE TABLE PT_table1(
	mrn int NOT NULL,
	Sex int,
    name varchar(20),
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20),   
	FBS int,  
	Total_Cholesterol int);
    ALTER TABLE Pt_table1
    ADD CONSTRAINT
    PRIMARY KEY (MRN) ;
DESCRIBE PT_table1;    
    
    
    
#외래키 제약 조건
DROP Table IF EXISTS  Pt_name;
 CREATE TABLE pt_name (
	mrn int PRIMARY KEY NOT NULL, 
    name varchar(10) NOT NULL,
    cancertype varchar(20));
    
INSERT INTO pt_name (mrn, name, cancertype)  
VALUES (10301, '김진수', 'colon'),	
	(10303, '박만호', 'lung'),	
	(10304, '김수현', 'lung'),	 
	(10306, '임민영', 'cervical'),	
	(10307, '김수박', 'colon'),	
	(10310, '김수진', 'breast');
    
    CREATE TABLE pt_score(
	mrn int NOT NULL PRIMARY KEY,
	Sex int,
	initial varchar(20),  
	weight float,  
	height float, 
	BMI float,  
	cancertype varchar(20) NOT NULL,   
	FBS int,  
	Total_Cholesterol int,
	Newpossibility int,
    FOREIGN KEY(mrn) REFERENCES Pt_name(mrn));
    
    
INSERT INTO pt_score (mrn, sex,  initial, weight, height, BMI, cancertype, FBS, Total_Cholesterol, Newpossibility)  
VALUES (10301, 1,'KJS', 76.1, 173.3, 25.34,'colon', 126, 145, 96),	 
	(10303, 1, 'PMH', 66.55, 163.8, 24.8,'lung', 102,169, 0),	
	(10304, 1, 'KSH', 61.55, 176, 19.87,'lung', 78,96, 0),	 	
	(10306, 2, 'IMY', 68.9, 156.6, 28.09,'cervical',101,249, 0),	
	(10307, 1, 'KSP', 69.5, 158.2, 27.76, 'colon',115,151, 0),
	(10310, 2, 'KSJ', 57.8, 164.3, 21.41,'breast', 100, 240, 44);
    
    DESCRIBE Pt_score;
select * from PT_name;
    select * from PT_score;
    
    
    DROP Table IF EXISTS  PT_sample;
CREATE TABLE PT_sample(
mrn INT NOT NULL PRIMARY KEY,   
initial VARCHAR(20) UNIQUE, 
BMI DECIMAL(5,2) DEFAULT 15.00
cancertype VARCHAR(10) NOT NULL, 
FBS INT DEFAULT 0);
ALTER TABLE Pt_sample
            ADD CONSTRAINT
            FOREIGN KEY(mrn) REFERENCES PT_name(mrn)
            ON UPDATE CASCADE
            ON DELETE CASCADE;
INSERT INTO  PT_sample (mrn, initial,  BMI, cancertype, FBS)  
VALUES (10301,  'KJS',  25.34,'colon', 126 ),	 
	(10303,  'PMH',  24.8,'lung', 102),	
	(10304,  'KSH', 19.87,'lung', 104),	 	
	(10306,  'IMY', 28.09,'cervical', 101),	
	(10307,  'KSP',  27.76, 'colon',115),
	(10310, 'KSJ',   21.41,'breast', 100);
    
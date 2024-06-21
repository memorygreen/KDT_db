/**************************객체*********************/

-- VIEW : 가상의 테이블, 테이블을 조회하는 SELECT문 자체를 저장한 객체

CREATE VIEW 네이버회원정보LITE AS 
SELECT 네이버ID, 이름
  FROM 네이버회원;
  
SELECT *
  FROM 네이버회원정보LITE;
  
DROP VIEW 네이버회원정보LITE;

-- 실습 문제
-- 1. 부서별(GROUP BY) 최고 급여(MAX)를 받는 직원의 부서ID와 최고급여를 출력하세요.
-- 2. 1번 SELECT 문을 부서별 최고급여라는 VIEW로 생성
-- 3. VIEW 출력

SELECT *
  FROM EMPLOYEES;

-- 자영 풀이
-- (X ->문제를...제대로..봐라...부서ID 잖아...)
-- (X ->GROUP BY 절을 쓰려면..SELECT절에 있는 컬럼이랑..일치시켜야 오류가..안난다 이자식아)
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 쌤풀이
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

CREATE VIEW 부서별최고급여 AS
SELECT DEPARTMENT_ID, MAX(SALARY) AS 최고급여
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT *
  FROM 부서별최고급여;
  
SELECT E.FIRST_NAME, DMAX.최고급여
  FROM EMPLOYEES E, 부서별최고급여 DMAX
 WHERE E.DEPARTMENT_ID = DMAX.DEPARTMENT_ID;
 
-- 시퀀스(SEQUENCE) : 특정 규칙에 맞는 연속 숫자를 생성하는 객체
-- 대기 순번표처럼 계속해서 다음 번호를 만들어주는 역할
-- INSERT 할 때 굳이 적지 않더라도 계속해서 자동으로 늘어나며 부여되는 번호
-- 주로 PK의 컬럼처럼 유일한 값을 만들 때 사용함
-- (자영 : ID 값에 적합! 절대 중복될 일 없다!)
 
CREATE SEQUENCE NUM1;
 
CREATE TABLE 출석부(
   이름 VARCHAR2(12),
   고유번호 NUMBER
 );
 
INSERT INTO 출석부 VALUES(
    '김자영', NUM1.NEXTVAL
);

INSERT INTO 출석부 VALUES(
   '백종호', NUM1.NEXTVAL);
   
INSERT INTO 출석부 VALUES(
    '안현지', NUM1.NEXTVAL
);
INSERT INTO 출석부 VALUES(
    '김현빈',NUM1.NEXTVAL);
    
INSERT INTO 출석부 VALUES(
    '김동혁', NUM1.NEXTVAL
);   
INSERT INTO 출석부 
    VALUES ('강민재',NUM1.NEXTVAL);
    
INSERT INTO 출석부 VALUES(
'이균호', NUM1.nextval);

INSERT INTO 출석부 VALUES(
    '김한빛', NUM1.NEXTVAL
    );
    
INSERT INTO 출석부 VALUES(
    '임지훈', NUMl.NEXTVAL
);
   
SELECT *
  FROM 출석부;
  
-- 시퀀스
CREATE SEQUENCE NUM3
START WITH 0
INCREMENT BY 2
MAXVALUE 20
MINVALUE 0
NOCYCLE; -- 반복되지 않음

CREATE TABLE 시퀀스테스트2(
    시퀀스 NUMBER
);
INSERT INTO 시퀀스테스트2 VALUES (NUM3.NEXTVAL);

SELECT *
 FROM 시퀀스테스트2;
 
-- ROWNUM : 임시행번호
-- 게시판번호, 임시로 필요한 번호를 정렬해야할 때 사용
-- (자영: 임시로발급해주는번호(EX. 게시판번호) 사용/ PK 불가!)
-- ROWNUM은 임시로 발급하는 번호이기 때문에 1을 무조건 사용

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM <=5;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM =5; --(X)테이블이 만들어진 후에 숫자가 부여됨! 처음부터 5번인애는 없으니까 !!

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM =1; --(BUT 최초의 번호는 1개만 출력가능!)


-- 급여가 높은 직원
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL
 ORDER BY SALARY DESC;  
 
-- (자영 : ROWNUM 사용해서 급여 상위 5명만 잘라낼수 있다!)
-- (자영 EX. 게시판 추천수별로 상위 5개만 보여준다!)
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL
   AND ROWNUM <= 5
 ORDER BY SALARY DESC;  
 
-- 게시판의 페이징 처리, 상위 데이터 추출, 하위 데이터 추출...
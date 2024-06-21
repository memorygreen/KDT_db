/*************** where *****************/

-- 우리가 이제까지 SELECT로 출력했던 데이터는 모든 데이터를 전부 가져왔어야 했음
-- 우리는 이제부터 필요한 데이터만 출력하기 위해서 WHERE 절을 사용

SELECT *
  FROM EMPLOYEES;
  
SELECT *
  FROM DEPARTMENTS;

-- 1. WHERE 절
--(주의 : 세미 콜론 쓰지 않기)

SELECT *
  FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';
  
-- 저는 직원 중에서 직원 ID가 105인 사람의 성과 이름을 출력하겠습니다.
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
 
 -- 2. 산술 연산자 (+, -, *, /)
 -- 컬럼(열)에 산술 연산자를 사용하면 그 컬럼에 해당하는 모든 행에 산술이 진행된다.
 -- SALARY * 12 => 모든 행이 가지고 있는 SALARY * 12
 
SELECT SALARY, SALARY*10
  FROM EMPLOYEES;
 
-- 3. 비교 연산자 (=, > ,>= , <, <=)
-- 1. 부서 ID(DEPARTMENT_ID)가 50인 사람의 직원 ID, 부서 ID 를 출력
-- 자영 틀림! 부서ID 는 DEPARTMENT_ID!!!! (문제를 잘 읽자)
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;

-- 2. 직원 테이블에서 급여가 5000이하인 사람들의 이름과 급여를 출력
SELECT LAST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;

-- 3. 직원 테이블에서 연봉(!!) 50000 이상인 사람들의 이름과 연봉을 출력
--  (단, 연봉은 'ANNSAL'로 출력)

-- 4.HINT : 위에서 사용되는 개념 비교연산자, 산술연산자, WHERE절, AS, SELECT문

SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 50000;
 
 
 -- 4. 등가 비교 연산자 (!=, ^=, <>, NOT)(같지 않다!)
 -- <> 기본적으로 해당 연사자를 가장 많이 사용함
 -- 기본적으로 성능 차이는 없고 동일한 연산자다
 
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID != 50;
 
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID ^= 50;
 
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID <> 50;

SELECT *
  FROM EMPLOYEES 
 WHERE NOT DEPARTMENT_ID = 50; 
 
 
-- 실습
-- 1) 급여가 10000 미만이 아닌 직원의 ID와 이름을 출력
 SELECT EMPLOYEE_ID, LAST_NAME
   FROM EMPLOYEES
  WHERE SALARY >= 10000;  

-- 2) JOB_ID가 IT_PROG이 아닌 직원의 이름과 JOB_ID를 출력해라
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID <> 'IT_PROG';
 

-- 5. 논리 연산자(AND, OR) : 조건식을 여러개 사용하고 싶을 때

-- 1) 부서 ID = 90 이고 급여가 5000 이상인 직원의 ID와 이름 출력 (AND)
-- 자영 몰랐던 것 : AND 줄바꿈!!!
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000;

-- 2) 부서 ID가 100 이거나, 입사일이 16년 02월 02일 이후에 입사한 직원의 이름
-- 자영 틀린 부분 : OR 줄바꾸기! & 날짜표현은 'YY/MM/DD'
SELECT LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE >='16/02/02';
-- 날짜 데이터는 20XX 가능, / - 변환 가능
-- 추가)SYSDATE 형태 따른다

-- 자영확인용으로 추가
SELECT *
  FROM EMPLOYEES; 


/*
    AND, OR 실습문제
    1. 부서 ID가 100이거나, 50인 직원 중에서
        연봉이 10000 이상인 직원의 ID, 이름, 그리고 연봉을 출력 (연봉 AnnSal로 출력)
        * 단, AND가 OR보다 힘이 세다. AND 먼저 진행이 됨
        만약에 OR를 먼저 진행하고 싶으면 괄호 안에 넣어야함
        
    2. 부서 ID가 100이거나 90인 직원 중, 직원 ID가 101인 사람의 이름과 연봉 출력 
*/

-- 6. IS NULL, IS NOT NULL
-- NULL은 존재하지 않는 값이기 때문에 (모든)비교가 불가능하다
-- NULL 값과 관련해서 사용할 수 있는 연산자는 IS NULL, IS NOT NULL 단 두개 뿐!

-- 핸드폰 번호가 NULL인 직원의 이름과 핸드폰번호를 출력
-- 자영 틀린부분 -> LAST_NAME 오타! & FROM절에서 세미콜론(;)해버림
SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NULL;

-- 핸드폰 번호가 NULL이 아닌 직원의 이름과 핸드폰번호를 출력
SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NOT NULL;
 
 -- 7. IN / NOT IN
 -- IN 연산자 : OR 연산자
 
 -- 부서 ID가 30, 50 ,90인 대상의 정보를 출력하겠습니다.
 -- (일반적으로 알고 있는 OR 문법)
  SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID = 30
     OR DEPARTMENT_ID = 50
     OR DEPARTMENT_ID = 90;

-- 위와 동일, IN 사용
 SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID IN(30, 50, 90);
  
-- NULL 값은 안된다!(오류는 안 나지만!)
-- ** IN연산자 안에서 NULL 은 무시된다.
 SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID IN(30, 50, 90, NULL);
  
-- NOT IN 연산자 : IN 뒤의 조건에 해당하지 않는 데이터를 출력 (AND)
-- NOT은 부정의 의미 => 부정은 반대로
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN (30, 50, 90);
-- NULL 값 포함 안됨! =>IS NULL, IS NOT NULL 이 아니니까!

-- NOT IN은 AND 연산자이기 때문에 하나라도 FALSE가 나오면 다른 행도 전부 FALSE가 되어버림
-- 그래서 NOT IN 안에 NULL 값을 넣으면 모든 값이 FALSE가 되어버려서 아무 값도 나오지 않는다.

/*
    실습 문제 
    1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
    2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
    3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
    
*/

-- 1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN(100, 120);

--  2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_NP', 'ST_MAN');

-- 3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(145,146,147,148,149);
 

/**********240105 금*************/
/* 
    AND, OR 실습문제(숙제) (논리연산자 숙제)

    1. 부서 ID가 100이거나, 50인 직원 중에서
        연봉이 10000 이상인 직원의 ID, 이름, 그리고 연봉을 출력 (연봉 AnnSal로 출력)
        * 단, AND가 OR보다 힘이 세다. AND 먼저 진행이 됨
        만약에 OR를 먼저 진행하고 싶으면 괄호 안에 넣어야함
*/

-- 1번 자영 작성
SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANNSAL
  FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 50) AND SALARY*12 >= 10000;

-- 1번 선생님 정답 (괄호 있고 없고 크게 다르지 않다)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 10000
   AND DEPARTMENT_ID = 100 
    OR DEPARTMENT_ID = 50;
    
--2. 부서 ID가 100이거나 90인 직원 중, 직원 ID가 101인 사람의 이름과 연봉 출력 (괄호 중요)

SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100 
    OR DEPARTMENT_ID = 90) 
   AND EMPLOYEE_ID = 101;

/*
    실습 문제 
    1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
    2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
    3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
    
*/

-- 1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN(100, 120);

--  2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_NP', 'ST_MAN');

-- 3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(145,146,147,148,149);
 
 -- 8. BETWEEN : 범위 조건 연산자
 -- 급여가 10000~20000사이의 직원을 출력하시오.
 SELECT LAST_NAME, SALARY
   FROM EMPLOYEES
  WHERE SALARY BETWEEN 10000 AND 19999;
 
 SELECT LAST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- 9. LIKE : 특정 조건을 검색할 때
-- 9-1) %

-- 이름이 S로 시작하는 직원 출력
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%';
 -- 자영 : 문자 대소문자 구별이된다
 
-- 이름이 s로 끝나는 직원 출력(소문자)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s';

-- 이름에 s가 포함된 직원 출력(소문자)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s%';
 
-- 이름에 s가 포함된 직원 출력(대,소문자)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s%'
    OR FIRST_NAME LIKE '%S%';
 
-- 9-2) _ 
-- 직원 아이디가 1로 시작하는 3글자로 되어있는 데이터 검색
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '1__';
 
 -- 자영 : 직원 아이디가 1로 끝나는 3글자로 되어있는 데이터 검색
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '__1';
 
 -- 자영 : 직원 아이디의 가운데 글자가 1로 되어있는 데이터 검색
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '_1_';

 
/* 실습 문제 

1. 핸드폰 번호에 650이 포함되어있는 번호/이름 출력 (직원 테이블) 
2. 이름에 두번째 글자가 e인 직원 찾기, 이름 출력 (FIRST_NAME)
    ex) Kelly , Renske  : 다섯글자든 여섯글자든 출력되어야함     
3. 이름이 S로 시작하고, n으로 끝나는 직원의 이름을 출력 (FIRST_NAME)

LIKE
& (길이관련X 포함)
_ (길이관련 포함)
*/


-- 1. 핸드폰 번호에 650이 포함되어있는 번호/이름 출력 (직원 테이블) 
SELECT PHONE_NUMBER, FIRST_NAME
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '%650%'; --(X)자영: 변수명 오타나지않도록 조심하자!!!!

-- 2. 이름에 두번째 글자가 e인 직원 찾기, 이름 출력 (FIRST_NAME)
--   ex) Kelly , Renske  : 다섯글자든 여섯글자든 출력되어야함 
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';

--3. 이름이 S로 시작하고, n으로 끝나는 직원의 이름을 출력 (FIRST_NAME)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
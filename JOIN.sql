-- 2024.01.12.
/*********************JOIN***********************/

-- JOIN : 여러 개의 테이블을 연결해서 사용하는 것
-- 필요한 데이터가 두 개 이상의 테이블에 나눠져 있을 때 데이터를 합쳐서 가져오고자 사용

-- 요청사항 :  직원 ID가 100인 직원의 부서이름을 출력
-- 직원 ID (직원 테이블 ) / 부서 이름 ( 부서테이블)

-- JOIN 문법을 모른다는 가정하에 진행
-- 1. 직원 ID가 100인 직원을 찾는다. => 부서 ID를 가져온다.

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;
 
-- 2. 부서 ID가 90인 부서의 이름
SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 90;

-- 만약 내가 JOIN 문법을 알고 있다면?(자영 : 오라클 문법)
SELECT D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.EMPLOYEE_ID = 100;
  
  /******************FROM**************/
  -- FROM 절에 테이블을 여러개 사용 가능 + 각 테입르의 별칭을 지정
  -- 내가사용할테이블1이름 테이블1별칭, 테이블2 테이블2별칭
  -- EX) EMPLOYEES E, DEPARTMENTS D (자영 : 따로 AS 쓰지 않음)
  -- 만약 테이블을 여러 개 사용하는 경우 꼭! 어떤 테이블을 이용할건지 명확하게 지정해줘야됨, 별칭으로!

--자영 :  에러나는 경우
SELECT DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;

-- 자영 : 테이블명 명시해줘야 에러 안 난다!(두 테이블에 같은 컬럼명 존재할 경우)
SELECT D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;


-- 만약 한 테이블에만 있는 컬럼이라면 굳이 별칭 없이도 사용 가능
SELECT EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
-- 단, 별칭을 주고나면 그 뒤에 오는 실행절들은 모두 그 별칭만 사용해야 함
SELECT DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
-- [CROSS JOIN] : 조건 없이 모든 행을 JOIN 해서 출력
-- 카티션 곱

-- 1. 직원테이블만 출력 -> 개수 확인(108개)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E;
  
-- 2. 부서 테이블만 출력 ->개수 확인(27개)
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;
  
-- 3. 두 테이블을 JOIN 해서 출력 ->개수 확인(108*27 = 2916개)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D;


-- [INNER JOIN] : 테이블 간의 교집합, JOIN 중에서 가장 일반적인 방법
-- JOIN 하세요 == INNER JOIN 하세요!

-- 직원ID가 114번인 사람의 직원 ID, 이름, 부서ID, 부서 이름을 출력하세요.

-- 내가 가져와야할 테이블이 두 개 이상일 경우

-- 1) WHERE 조건 절을 사용해서 INNER JOIN
-- ORACLE에서만 사용가능

-- 자영 :  CROSS JOIN(아무 조건X) (없는 값은 NULL로 채우고 다 가지고 옴)
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D;

-- 자영 : INNER JOIN(HWERE 절에 조건O) (조건 해당되는 것만)
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.EMPLOYEE_ID = 114;

-- 2) ANSI 문법을 사용
-- 미국국립표준협회 ANSI 에서 만든 문법, 모든 DB에서 사용 가능 => 권장

SELECT 컬럼
  FROM A테이블 INNER JOIN B테이블
    ON (조건) ; 
    
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME 
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.EMPLOYEE_ID = 114);
        
        
-- (INNER JOIN의 경우)두 테이블에 모두 데이터가 있어야만 결과가 나온다.
-- INNER JOIN 에서는 NULL 값이 나오지 않는다.(자영 : NULL값은 비교불가능하기때문에 FALSE로 인지됨)
-- WHY? 직원의 부서ID = 부서의 부서ID를 비교하는 작업 => NULL은 비교 연산이 진행되지 않음


-- 실습문제
-- 하나의 문제 당, 두 개의 답을 작성할 것 ORACLE 문법, 표준 문법(ANSI)

-- 자영 풀이
-- 1. 직원 테이블과 (EMPLOYEES) 직업 테이블(JOBS) INNER JOIN을 사용해서
--    직원 ID와 직업 ID와 직업 TITLE 출력
-- 1-1) ORACLE
SELECT E.EMPLOYEE_ID, J.JOB_TITLE
  FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 1-1) 쌤풀이
SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID = J.JOB_ID;
--(△) J.JOB_ID도 상관없다 똑같다!!
-- FROM 까지만 쓰면 CROSS JOIN이다!!

-- 1-2) ANSI
SELECT E.EMPLOYEE_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID);

-- 쌤풀이
SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID);
    
    
-- 직업 테이블
SELECT *
FROM JOBS;

-- 부서 테이블
SELECT *
FROM DEPARTMENTS;

-- 직원테이블
SELECT *
FROM EMPLOYEES;


-- 2. 각 부서의 매니저 직원을 출력
--    부서 테이블과 직원 테이블에서 INNER JOIN을 이용해서 부서 이름, 매니저ID, 직원ID를 출력
-- 2-1) ORACLE

SELECT D.DEPARTMENT_NAME, E.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
  AND D.MANAGER_ID = E.MANAGER_ID;
  
  
-- (X) 자영 틀림!! 조건이 틀렸다!!

-- 쌤풀이
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID;


-- 2-2) ANSI
SELECT D.DEPARTMENT_NAME, E.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID
  AND D.MANAGER_ID = E.MANAGER_ID);
  
-- 쌤풀이
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);


-- INNER JOIN !!!! 굉장히~~~중요함!!!!
-- 단, INNER JOIN은 NULL 값을 출력하지 못하기 때문에 NULL 값을 포함해서 출력하고 싶을 때는?

/*****************OUTER JOIN*****************/
-- LEFT OUTER JOIN : 왼쪽에 있는 A테이블을 기준으로 OUTER JOIN (자영 : NULL 값 가져오겠다!)
SELECT 컬럼
  FROM A테이블.별칭 LEFT OUTER JOIN B테이블.별칭
    ON (조인조건);

-- 직원 테이블에 잇는 직원ID, 부서ID, 부서 이름 출력
-- 부서 ID가 NULL인 직원까지도 출력

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- RIGHT OUTER JOIN : 오른쪽에 있는 B테이블을 기준으로 OUTER JOIN
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- FULL OUTER JOIN : 양쪽 테이블의 모든 값(NULL 포함)이 출력된다.
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);    

-- RIGHT OUTER JOIN
-- FULL OUTER JOIN


--------------------------------------------------------------
-- ORACLE 문법을 활용한 OUTER JOIN
-- 헷갈리면 이부분 버리기, 위에 있는 문법으로 외우는 게 더 쉽고 중요함!

SELECT *
  FROM DEPARTMENTS;
 
SELECT *
  FROM EMPLOYEES;
  
-- 1. LEFT OUTER JOIN => 오른쪽에 (+)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
 
-- 2. RIGHT OUTER JOIN => 오른쪽에 (+)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID (+)= D.DEPARTMENT_ID; 
 --비어있는 부서 NULL값

-- 3. FULL OUTER JOIN은 단순 기호 추가로는 불가능.
------------------------------------------

-- 실습

/***************************** JOIN ************************/
-- JOIN : 여러개의 테이블을 연결해서 사용하는 것 
-- 필요한 데이터가 두개 이상의 테이블에 나눠져 있을 때 데이터를 합쳐서 가져오고자 사용 

-- 요청사항 : 직원 ID가 100인 직원의 부서이름을 출력 
-- 직원 ID (직원 테이블) / 부서 이름 (부서테이블) 

-- JOIN 문법을 모른다는 가정하에 진행 
-- 1. 직원 ID가 100인 직원을 찾는다. => 부서 ID 를 가져온다 

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;
 
-- 2. 부서 id가 90인 부서의 이름 

SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 90;
 
-- 만약 내가 JOIN 문법을 알고 있다면? 

SELECT D.DEPARTMENT_NAME
 FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  AND E.EMPLOYEE_ID = 100; 
 
 
/**************** FROM ********************/
-- FROM 절에 테이블을 여러개 사용 가능 + 각 테이블의 별칭을 지정 
-- 내가 사용할 테이블1 이름 테이블1 별칭, 테이블2 테이블2별칭 
-- EX) EMPLOYEES E, DEPARTMENTS D 
-- 만약 테이블을 여러개 사용하는 경우 꼭! 어떤 테이블을 이용할건지
-- 명확하게 지정해줘야됨, 별칭으로 

SELECT D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 
  
-- 만약 한 테이블에만 있는 컬럼이라면 굳이 별칭 없이도 사용 가능 
SELECT EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 

-- 단 별칭을 주고나면, 그 뒤에 오는 실행절들은 모두 그 별칭만 사용해야함 
SELECT DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 
  

-- [CROSS JOIN] : 조건 없이 모든 행을 JOIN 해서 출력 
-- 카티션 곱 

-- 1. 직원테이블만 출력 (108)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID 
  FROM EMPLOYEES E;
  
-- 2. 부서테이블만 출력 (27) 
SELECT D.DEPARTMENT_ID , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;

-- 3. 두 테이블을 JOIN 해서 출력 (108*27 = 2916)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D ; 
  

-- [INNER JOIN] : 테이블 간의 교집합, JOIN 중에서 가장 일반적인 방법 
-- JOIN 하세요 == INNER JOIN 하세요! 

-- 직원 아이디가 114번인 사람의 직원 ID, 이름, 부서 ID, 부서이름을 출력하세요. 
-- 내가 가져와야할 테이블이 두개 이상일 경우 

-- 1) WHERE 조건 절을 사용해서 INNER JOIN  
-- ORACLE 에서만 사용 가능 

SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
  WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  AND EMPLOYEE_ID = 114;
  
-- 2) ANSI 문법을 사용 
-- 미국국립표준협회 ANSI 에서 만든 문법, 모든 DB에서 사용 가능 => 권장 

SELECT 컬럼 
  FROM A테이블 INNER JOIN B테이블 
    ON (조건) ; 
    
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND EMPLOYEE_ID = 114);

-- 두 테이블에 모두 데이터가 있어야만 결과가 나온다. 
-- INNER JOIN 에서는 NULL 값이 나오지 않는다.
-- WHY? 직원의 부서 아이디 = 부서의 부서아이디를 비교하는 작업=> NULL은 비교 연산이 진행되지 않음 

-- 실습문제 
-- 하나의 문제 당, 두개의 답을 작성할 것 ORACLE 문법, 표준문법 

-- 1. 직원 테이블과 (EMPLOYYES) 직업 테이블 (JOBS) INNER JOIN을 사용해서 
--      직원 ID와 직업 ID와 직업 TITLE 출력 

-- 1-1) ORACLE 

SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID = J.JOB_ID;



-- 1-2) ANSI 

SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
  ON (E.JOB_ID = J.JOB_ID);

-- 2. 각 부서의 매니저 직원들 출력
--     부서테이블과 직원 테이블에서 INNERJOIN을 이용해서 부서 이름, 매니저 ID,
--      직원 ID를 출력 

-- 2-1) ORACLE 
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

-- 2-2) ANSI 

SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);



-- INNER JOIN !!!!굉장히 ~~~ 중요함 
-- 단, INNERJOIN은 NULL 값을 출력하지 못하기 때문에 NULL 값을 포함해서 출력하고 싶을 때는?

/****************** OUTER JOIN ***********************/
-- LEFT OUTER JOIN  : 왼쪽에 있는 A테이블을 기준으로 OUTER JOIN 
-- RIGHT OUTER JOIN : 오른쪽에 있는 B테이블을 기준으로 OUTER JOIN 
SELECT 컬럼 
  FROM A테이블.별칭 LEFT OUTER JOIN B테이블.별칭 
    ON (조인조건); 
    
-- 직원 테이블에 있는 직원 아이디, 부서 아이디, 부서 이름 출력 
-- 부서 ID 가 NULL 인 직원까지도 출력 

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);    
    
-- FULL OUTER JOIN : 양쪽 테이블의 모든 값 (NULL 포함) 이 출력된다. 

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);

------------------------------------
-- ORACLE 문법을 활용한 OUTER JOIN 
-- 헷갈리면 이부분 버리기, 위에 있는 문법으로 외우는게 더 쉽고 중요함! 

-- 1. LEFT OUTER JOIN => 오른쪽에 (+) 
 
SELECT E.EMPLOYEE_ID , E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID (+)= D.DEPARTMENT_ID;
 
-- 2. RIGHT OUTER JOIN => 왼쪽에 (+)
-- 3. FULL OUTER JOIN은 단순 기호추가로는 불가능. 

------------------------------------ 

-- 실습 
-- 1. 각 부서의 매니저 직원들을 출력하되, 부서 테이블을 기준으로 LEFT OUTER JOIN을 사용해서
--      부서 NAME, 매니저 ID와 직원 ID를 출력해라 (ANSI 문법만 사용) 

-- 자영
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);


- 2024.01.15.
-- 쌤풀이 (INNER JOIN은 비교연산으로 생겨서 NULL 값이 생김, OUTER JOIN은 +기호로 만듦=>NULL 값 생김)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
    
-- 2. 각 부서의 매니저 직원들을 출력하되, 부서 테이블을 기준으로 RIGHT OUTER JOIN을 사용해서 
--      부서 NAME, 매니저 ID, 직원 ID를 출력해라 (ANSI 문법) 
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
-- 쌤풀이
SELECT DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
-- 3. 각 부서의 매니저 직원들을 출력하되, 부서테이블을 기준으로 FULL OUTER JOIN을 사용해서
--   부서 NAME, 매니저 ID, 직원 ID를 출력해라 (ANSI문법) 

-- *힌트 : A테이블을 기준으로? A테이블을 먼저 작성 
--      A테이블 LEFT OUTER JOIN B테이블 
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

-- 쌤풀이
SELECT DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

 -- 3개의 테이블 JOIN하기
 -- 부서 테이블, 위치 테이블, 나라 테이블 세 개를 INNER JOIN 해서
 -- 각 부서의 도시와 나라 이름을 출력
 
 -- ORACLE 문법
 SELECT D.DEPARTMENT_NAME, CITY, COUNTRY_NAME
   FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
  WHERE D.LOCATION_ID = L.LOCATION_ID
    AND L.COUNTRY_ID = C.COUNTRY_ID;

-- ANSI 문법
 SELECT D.DEPARTMENT_NAME, CITY, COUNTRY_NAME
   FROM DEPARTMENTS D INNER JOIN LOCATIONS L
     ON (D.LOCATION_ID = L.LOCATION_ID)
   INNER JOIN COUNTRIES C
     ON (L.COUNTRY_ID = C.COUNTRY_ID);


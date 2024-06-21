/*********함수(function*********

/*
Q. 함수란?
A. 특정한 결과값을 얻기 위해 데이터를 입력할 수 있는 특수 명령어
    (믹서기 - 오렌지주스)

내장함수 (built-in function)
사용자 정의 함수 (user-defined function)

*/

-- 1. 문자 함수
-- 1-1) UPPER : 대문자로 변환해주는 함수
-- 1-2) LOWER : 소문자로 변환해주는 함수
SELECT FIRST_NAME, UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES;
-- 자영 : NULL값은 여기에서도 안 바뀜!! 문자 NULL이 아니니 대문자로 바뀌지 않는다!!

-- 1-3)LENGTH : 문자열 길이
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;

-- 자영 : QnA) 함수를 WHERE절에 조건으로 넣을 수 있는지? =>가능
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 8;

-- 1-4) SUBSTR : 문자열 추출
-- SUBSTR(데이터, 시작위치) : 시작위치부터 끝까지 추출
-- SUBSTR(데이터, 시작위치, 추출할 길이 ) : 시작 위치부터 추출할 길이만큼 추출

-- EX) UBSTR(생년월일, 3, 2)
-- 1994.02.18
SELECT JOB_ID, SUBSTR(JOB_ID,1,2)
  FROM EMPLOYEES;

-- 입사일에서 입사일의 연도, 월, 일을 출력<- 직원테이블에서
-- 입사일 | 연도 | 월 | 일
-- (단, 명칭은 연도 월 일로 표현)
SELECT HIRE_DATE AS 입사일, SUBSTR(HIRE_DATE,1,2) AS 연도, SUBSTR(HIRE_DATE,4,2) AS 월, SUBSTR(HIRE_DATE,7,2) AS 일
  FROM EMPLOYEES;

-- 선생님 풀이
SELECT HIRE_DATE, 
       SUBSTR(HIRE_DATE,1,2) AS 연도, 
       SUBSTR(HIRE_DATE,4,2) AS 월, 
       SUBSTR(HIRE_DATE,7) AS 일 --7번째부터 끝까지니까 추출할 길이는 생략!
  FROM EMPLOYEES;

-- 1-5) REPLACE
-- REPLACE(데이터, 바꾸고 싶은 기준 문자열, 바꿀 새로운 문자열)

SELECT HIRE_DATE, 
       REPLACE(HIRE_DATE, '/', '-') AS 하이픈,
       REPLACE(HIRE_DATE, '/') AS 제거
  FROM EMPLOYEES;
  
-- 1-6) CONCAT : 문자열 합치기
-- 두 개 합치는 거
SELECT CONCAT('입사 날짜는 ', HIRE_DATE) AS 안내문구
  FROM EMPLOYEES;

-- 세 개 합치고 싶으면? CONCAT 안에 CONCAT
SELECT CONCAT('입사 날짜는 ', CONCAT(HIRE_DATE, '입니다')) AS 안내문구
  FROM EMPLOYEES;
  
-- 1-7) || : 문자열을 연결할 수 있는 연산자     
SELECT '입사 날짜는 '||HIRE_DATE|| '입니다.'AS 안내문구_문자열연결
  FROM EMPLOYEES;

-- 1-8) TRIM : 문자열을 삭제 OR 공백을 제거
-- DUAL 테이블 : 최고 권한 관리장니 SYS 소유의 테이블로, 임시 연산이나 
--              함수의 결과값을 확인할 용도로 사용되는 더미 테이블
SELECT *
  FROM DUAL;
  
SELECT 'HELLO' AS 인사말,
        TRIM('H' FROM 'HELLO') AS H제거후
  FROM DUAL;
  
SELECT '[' || ' '|| '공백' ||' ' || ']' AS "공백제거 전",
       '[' ||   TRIM(' '|| '공백' ||' ')   || ']' AS "공백제거 후"
FROM DUAL;

-- 문자열 제거 : TRIM (제거할 문자 FROM 문자열)

SELECT '1문자1' AS 제거전,
       TRIM(LEADING '1' FROM '1문자1') AS 왼쪽글자제거,
       TRIM(TRAILING '1' FROM '1문자1') AS 오른쪽글자제거,
       TRIM(BOTH '1' FROM '1문자1') AS 양쪽제거
  FROM DUAL;
  
-- 한빛님의 의도 : ke 인것들을 찾아서 he로 바꾸기
SELECT FIRST_NAME, REPLACE(FIRST_NAME, 'Ke', 'He')
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%Ke%' ; --he가 아닌 ke를 찾아야함! where 조건 실행후 ->select 로 검색하니까!
 
-- 240111(목)
-- 2. 숫자함수
-- 2-1) MOD : 나머지
--      MOD(나눗셈 될 숫자, 나눌 숫자)
--      홀짝을 구분할 때 많이 사용

SELECT MOD(15, 6), MOD(15,2), MOD(14,2)
  FROM DUAL;

-- 2-2)  ROUND : 반올림하는 함수
--       ROUND(숫자, 반올림 위치 - 선택)
-- 위치를 지정하지 않으면 소수점 첫ㅂ너째 자리에서 반올림을 수행

SELECT ROUND(15.65, 1), -- 자영 : 소수점 1번째자리까지 표시
       ROUND(12.12, 1),
       ROUND(12.12)
  FROM DUAL;

-- 2-3) TRUNC : 버림 함수
--      TRUNC(숫자, 반올림 위치 - 선택)
SELECT ROUND(15.65, 1), TRUNC(15.65,1),
       ROUND(12.12, 1), TRUNC(12.12, 1)
  FROM DUAL;
  
-- 3. 날짜함수
-- 3-1) SYSDATE
-- 날짜 형식 바꾸는 방법 : (이미 있떤 데이터 바꾸는 건 추천X) 도구 > 환경설정 > 데이터베이스 > NLS > 날짜 형식 변경

SELECT SYSDATE AS 지금,
       SYSDATE+1 AS 하루더함,
       SYSDATE + 1/24 AS 한시간더함,
       SYSDATE + 1/24/60 AS 일분더함,
       SYSDATE + 1/24/60/60 AS 일초더함,
       ADD_MONTHS(SYSDATE, 1) AS "1개월후",
       ADD_MONTHS(SYSDATE, -1) AS "1개월전"
       
  FROM DUAL;

-- 4. 형변환함수
-- 4-1) 문자 데이터로 변환 (많이 쓰임) : TO_CHAR
SELECT SYSDATE, 
       TO_CHAR(SYSDATE),
       TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
  FROM DUAL;

-- 4-2) 숫자 데이터로 변환 (많이 쓰임)
SELECT TO_NUMBER('1')+1
  FROM DUAL;
  
-- 4-3) 날짜 데이터로 변환
SELECT TO_DATE('20230504', 'YYYY/MM/DD')
  FROM DUAL;
  
/*
    형변환 함수 : 명시적 형변환
    암시적 형변환 : 내가 형변환 함수를 사용하지 않고도 자동으로 형변환 진행
    (자영 : 명시적 형변환이 더 힘이 세다!!)
    우선순위 : 날자형 > 숫자형 > 문자형
    (자영 : 문자로 되어있는데 안에 있는건 숫자인데??)
    우선순위가 낮은 문자형부터 형변환을 진행한다.
    (자영 : 현재 하는건 ? -> 형변환 작성 원리)
    
*/

-- 5. NULL 함수 : NULL에 다른 값을 대체
-- NULL에 산술연산 NULL 반환
-- NULL에 비교 연산 FALSE 반환 

-- 5-1) NVL(NULL검사, NULL일 때 바꿀 값)
-- 현업에서 많이 사용
SELECT FIRST_NAME, NVL(FIRST_NAME, '없음')
  FROM EMPLOYEES
 WHERE FIRST_NAME IS NULL;
 
-- 5-2) NVL2(NULL검사, NULL이 아닐 때 바꿀 값, NULL일때 바꿀 값)
SELECT FIRST_NAME, NVL2(FIRST_NAME, '있음' ,'없음')
  FROM EMPLOYEES;
  
-- 실습  
-- 직원 테이블에서 매니저가 있는 직원 => '직원'
--              매니저가 없는 직원 =>'매니저'

-- 자영 풀이
SELECT MANAGER_ID,  NVL2(MANAGER_ID, '직원', '매니저')
  FROM EMPLOYEES;

-- 쌤 풀이
SELECT MANAGER_ID,
       NVL2(MANAGER_ID, '직원', '매니저')
  FROM EMPLOYEES;
  
--6. DOCODE (현업에서 많이 쓰임)
/*
    
    DOCODE (검사대상,
            비교식1(비교해줄 식), 일치 시 반환값(비교식과 일치 시 반환값),
            비교식2, 일치 시 반환값,
            ...
            비교N, 일시 시 반환값)

*/

SELECT DEPARTMENT_ID,SALARY,
       DECODE(DEPARTMENT_ID,
            200, SALARY*2,
            90, SALARY*1.9,
            80, SALARY*1.8)
  FROM EMPLOYEES;
  
-- 7. 그룹함수
-- SUM : 합계
-- COUNT : 데이터 개수
-- MAX : 최대값
-- MIN : 최소값
-- AVG : 평균값

-- 직원들이 받는 급여의 총합
SELECT SUM(SALARY)
  FROM EMPLOYEES;
  
-- 직원의 숫자
SELECT COUNT(EMPLOYEE_ID), COUNT(*)
  FROM EMPLOYEES;
  
-- 가장 높은 급여, 가장 낮은 급여, 급여의 평균
SELECT MAX(SALARY), MIN(SALARY), ROUND(AVG(SALARY))
  FROM EMPLOYEES;

-- 만약 내가 그룹화를 진행했는데, 원본의 데이터가 보고싶다면?
-- x, 안되는 이유? 그룹화를 하게 되면 실제 출력되는 행이 감소
-- 출력될 수 있는 컬럼이 제한

-- 실행되는 순서 : FROM -> GROUP BY ->SELECT 
-- 2번째 실행되는 GROUP BY에서 행의 개수가 108개 => 12개

-- 이미 그룹화 시킨 행의 개수가 기존 행의 개수와 안 맞기 때문에 SELECT에 제한 생김

SELECT DEPARTMENT_ID, ROUND (AVG(SALARY)), EMPLOYEE_ID
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 단, 집계 함수는 사용 가능
SELECT DEPARTMENT_ID, ROUND (AVG(SALARY)), COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 실습
-- 직원 테이블에서 급여의 개수, 합계, 최소급여, 최대급여, 급여의 평균 값을 "부서별로" 구해보자

-- 자영 풀이
SELECT COUNT(SALARY), SUM(SALARY), MIN(SALARY), MAX(SALARY), AVG(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 쌤풀이
SELECT DEPARTMENT_ID,
        COUNT(SALARY),
        SUM(SALARY),
        MIN(SALARY),
        MAX(SALARY),
        ROUND(AVG(SALARY))
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
  
-- 단일행 함수 : 1->1(자영 : 1개의 데이터 입력->1개의 결과) 함수의 입력되는 행의 개수 1, 결과 값1
-- EX) UPPER, LOWER ..
-- 다중행 함수 : n -> 1 함수의 입력되는 행의 개수n, 결과 값 1
-- ex) SUM, AVG ...

-- COUNT(*) NULL 포함
-- COUNT(컬럼) NULL 제외
SELECT COUNT(DEPARTMENT_ID), COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

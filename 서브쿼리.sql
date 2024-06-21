/**********************서브쿼리******************/
-- SQL 내부에서 사용되는 SELECT 
--(SELECT 안에 있는 SELECT)

-- Q. 이름이 Shelli 인 직원보다 급여가 낮은 직원들을 출력

-- 1. 이름이 Shelli 인 직원의 급여를 출력
SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelli'; 

-- 2. 그 직원의 급여보다 낮은 급여를 받는 직원 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 2900;

--자영: AND조건..조건잡기 어렵고...OR도 그렇고.. 무엇보다 2900인걸 몰라...
--자영: 2900대신 서브쿼리 넣으면 됨!!

-- 서브쿼리 사용
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelli'
);

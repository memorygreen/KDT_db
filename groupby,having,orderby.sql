/********* GROUP BY ********/

-- GROUP BY : 특정 컬럼으로 할 때 사용

SELECT AVG(SALARY)
   FROM EMPLOYEES;

-- EX) 부서 별 평균 월급을 구하고 싶다
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
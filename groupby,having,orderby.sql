/********* GROUP BY ********/

-- GROUP BY : Ư�� �÷����� �� �� ���

SELECT AVG(SALARY)
   FROM EMPLOYEES;

-- EX) �μ� �� ��� ������ ���ϰ� �ʹ�
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
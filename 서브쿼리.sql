/**********************��������******************/
-- SQL ���ο��� ���Ǵ� SELECT 
--(SELECT �ȿ� �ִ� SELECT)

-- Q. �̸��� Shelli �� �������� �޿��� ���� �������� ���

-- 1. �̸��� Shelli �� ������ �޿��� ���
SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelli'; 

-- 2. �� ������ �޿����� ���� �޿��� �޴� ���� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 2900;

--�ڿ�: AND����..������� ��ư�...OR�� �׷���.. �������� 2900�ΰ� ����...
--�ڿ�: 2900��� �������� ������ ��!!

-- �������� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelli'
);

/*************** where *****************/

-- �츮�� �������� SELECT�� ����ߴ� �����ʹ� ��� �����͸� ���� �����Ծ�� ����
-- �츮�� �������� �ʿ��� �����͸� ����ϱ� ���ؼ� WHERE ���� ���

SELECT *
  FROM EMPLOYEES;
  
SELECT *
  FROM DEPARTMENTS;

-- 1. WHERE ��
--(���� : ���� �ݷ� ���� �ʱ�)

SELECT *
  FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';
  
-- ���� ���� �߿��� ���� ID�� 105�� ����� ���� �̸��� ����ϰڽ��ϴ�.
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
 
 -- 2. ��� ������ (+, -, *, /)
 -- �÷�(��)�� ��� �����ڸ� ����ϸ� �� �÷��� �ش��ϴ� ��� �࿡ ����� ����ȴ�.
 -- SALARY * 12 => ��� ���� ������ �ִ� SALARY * 12
 
SELECT SALARY, SALARY*10
  FROM EMPLOYEES;
 
-- 3. �� ������ (=, > ,>= , <, <=)
-- 1. �μ� ID(DEPARTMENT_ID)�� 50�� ����� ���� ID, �μ� ID �� ���
-- �ڿ� Ʋ��! �μ�ID �� DEPARTMENT_ID!!!! (������ �� ����)
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;

-- 2. ���� ���̺��� �޿��� 5000������ ������� �̸��� �޿��� ���
SELECT LAST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;

-- 3. ���� ���̺��� ����(!!) 50000 �̻��� ������� �̸��� ������ ���
--  (��, ������ 'ANNSAL'�� ���)

-- 4.HINT : ������ ���Ǵ� ���� �񱳿�����, ���������, WHERE��, AS, SELECT��

SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 50000;
 
 
 -- 4. � �� ������ (!=, ^=, <>, NOT)(���� �ʴ�!)
 -- <> �⺻������ �ش� �����ڸ� ���� ���� �����
 -- �⺻������ ���� ���̴� ���� ������ �����ڴ�
 
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
 
 
-- �ǽ�
-- 1) �޿��� 10000 �̸��� �ƴ� ������ ID�� �̸��� ���
 SELECT EMPLOYEE_ID, LAST_NAME
   FROM EMPLOYEES
  WHERE SALARY >= 10000;  

-- 2) JOB_ID�� IT_PROG�� �ƴ� ������ �̸��� JOB_ID�� ����ض�
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID <> 'IT_PROG';
 

-- 5. �� ������(AND, OR) : ���ǽ��� ������ ����ϰ� ���� ��

-- 1) �μ� ID = 90 �̰� �޿��� 5000 �̻��� ������ ID�� �̸� ��� (AND)
-- �ڿ� ������ �� : AND �ٹٲ�!!!
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000;

-- 2) �μ� ID�� 100 �̰ų�, �Ի����� 16�� 02�� 02�� ���Ŀ� �Ի��� ������ �̸�
-- �ڿ� Ʋ�� �κ� : OR �ٹٲٱ�! & ��¥ǥ���� 'YY/MM/DD'
SELECT LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE >='16/02/02';
-- ��¥ �����ʹ� 20XX ����, / - ��ȯ ����
-- �߰�)SYSDATE ���� ������

-- �ڿ�Ȯ�ο����� �߰�
SELECT *
  FROM EMPLOYEES; 


/*
    AND, OR �ǽ�����
    1. �μ� ID�� 100�̰ų�, 50�� ���� �߿���
        ������ 10000 �̻��� ������ ID, �̸�, �׸��� ������ ��� (���� AnnSal�� ���)
        * ��, AND�� OR���� ���� ����. AND ���� ������ ��
        ���࿡ OR�� ���� �����ϰ� ������ ��ȣ �ȿ� �־����
        
    2. �μ� ID�� 100�̰ų� 90�� ���� ��, ���� ID�� 101�� ����� �̸��� ���� ��� 
*/

-- 6. IS NULL, IS NOT NULL
-- NULL�� �������� �ʴ� ���̱� ������ (���)�񱳰� �Ұ����ϴ�
-- NULL ���� �����ؼ� ����� �� �ִ� �����ڴ� IS NULL, IS NOT NULL �� �ΰ� ��!

-- �ڵ��� ��ȣ�� NULL�� ������ �̸��� �ڵ�����ȣ�� ���
-- �ڿ� Ʋ���κ� -> LAST_NAME ��Ÿ! & FROM������ �����ݷ�(;)�ع���
SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NULL;

-- �ڵ��� ��ȣ�� NULL�� �ƴ� ������ �̸��� �ڵ�����ȣ�� ���
SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NOT NULL;
 
 -- 7. IN / NOT IN
 -- IN ������ : OR ������
 
 -- �μ� ID�� 30, 50 ,90�� ����� ������ ����ϰڽ��ϴ�.
 -- (�Ϲ������� �˰� �ִ� OR ����)
  SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID = 30
     OR DEPARTMENT_ID = 50
     OR DEPARTMENT_ID = 90;

-- ���� ����, IN ���
 SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID IN(30, 50, 90);
  
-- NULL ���� �ȵȴ�!(������ �� ������!)
-- ** IN������ �ȿ��� NULL �� ���õȴ�.
 SELECT *
   FROM EMPLOYEES 
  WHERE DEPARTMENT_ID IN(30, 50, 90, NULL);
  
-- NOT IN ������ : IN ���� ���ǿ� �ش����� �ʴ� �����͸� ��� (AND)
-- NOT�� ������ �ǹ� => ������ �ݴ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN (30, 50, 90);
-- NULL �� ���� �ȵ�! =>IS NULL, IS NOT NULL �� �ƴϴϱ�!

-- NOT IN�� AND �������̱� ������ �ϳ��� FALSE�� ������ �ٸ� �൵ ���� FALSE�� �Ǿ����
-- �׷��� NOT IN �ȿ� NULL ���� ������ ��� ���� FALSE�� �Ǿ������ �ƹ� ���� ������ �ʴ´�.

/*
    �ǽ� ���� 
    1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
    2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
    3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
    
*/

-- 1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN(100, 120);

--  2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_NP', 'ST_MAN');

-- 3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(145,146,147,148,149);
 

/**********240105 ��*************/
/* 
    AND, OR �ǽ�����(����) (�������� ����)

    1. �μ� ID�� 100�̰ų�, 50�� ���� �߿���
        ������ 10000 �̻��� ������ ID, �̸�, �׸��� ������ ��� (���� AnnSal�� ���)
        * ��, AND�� OR���� ���� ����. AND ���� ������ ��
        ���࿡ OR�� ���� �����ϰ� ������ ��ȣ �ȿ� �־����
*/

-- 1�� �ڿ� �ۼ�
SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANNSAL
  FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 50) AND SALARY*12 >= 10000;

-- 1�� ������ ���� (��ȣ �ְ� ���� ũ�� �ٸ��� �ʴ�)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 10000
   AND DEPARTMENT_ID = 100 
    OR DEPARTMENT_ID = 50;
    
--2. �μ� ID�� 100�̰ų� 90�� ���� ��, ���� ID�� 101�� ����� �̸��� ���� ��� (��ȣ �߿�)

SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100 
    OR DEPARTMENT_ID = 90) 
   AND EMPLOYEE_ID = 101;

/*
    �ǽ� ���� 
    1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
    2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
    3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
    
*/

-- 1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN(100, 120);

--  2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_NP', 'ST_MAN');

-- 3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN(145,146,147,148,149);
 
 -- 8. BETWEEN : ���� ���� ������
 -- �޿��� 10000~20000������ ������ ����Ͻÿ�.
 SELECT LAST_NAME, SALARY
   FROM EMPLOYEES
  WHERE SALARY BETWEEN 10000 AND 19999;
 
 SELECT LAST_NAME, HIRE_DATE
   FROM EMPLOYEES
  WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- 9. LIKE : Ư�� ������ �˻��� ��
-- 9-1) %

-- �̸��� S�� �����ϴ� ���� ���
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%';
 -- �ڿ� : ���� ��ҹ��� �����̵ȴ�
 
-- �̸��� s�� ������ ���� ���(�ҹ���)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s';

-- �̸��� s�� ���Ե� ���� ���(�ҹ���)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s%';
 
-- �̸��� s�� ���Ե� ���� ���(��,�ҹ���)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%s%'
    OR FIRST_NAME LIKE '%S%';
 
-- 9-2) _ 
-- ���� ���̵� 1�� �����ϴ� 3���ڷ� �Ǿ��ִ� ������ �˻�
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '1__';
 
 -- �ڿ� : ���� ���̵� 1�� ������ 3���ڷ� �Ǿ��ִ� ������ �˻�
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '__1';
 
 -- �ڿ� : ���� ���̵��� ��� ���ڰ� 1�� �Ǿ��ִ� ������ �˻�
SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID LIKE '_1_';

 
/* �ǽ� ���� 

1. �ڵ��� ��ȣ�� 650�� ���ԵǾ��ִ� ��ȣ/�̸� ��� (���� ���̺�) 
2. �̸��� �ι�° ���ڰ� e�� ���� ã��, �̸� ��� (FIRST_NAME)
    ex) Kelly , Renske  : �ټ����ڵ� �������ڵ� ��µǾ����     
3. �̸��� S�� �����ϰ�, n���� ������ ������ �̸��� ��� (FIRST_NAME)

LIKE
& (���̰���X ����)
_ (���̰��� ����)
*/


-- 1. �ڵ��� ��ȣ�� 650�� ���ԵǾ��ִ� ��ȣ/�̸� ��� (���� ���̺�) 
SELECT PHONE_NUMBER, FIRST_NAME
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '%650%'; --(X)�ڿ�: ������ ��Ÿ�����ʵ��� ��������!!!!

-- 2. �̸��� �ι�° ���ڰ� e�� ���� ã��, �̸� ��� (FIRST_NAME)
--   ex) Kelly , Renske  : �ټ����ڵ� �������ڵ� ��µǾ���� 
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';

--3. �̸��� S�� �����ϰ�, n���� ������ ������ �̸��� ��� (FIRST_NAME)
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
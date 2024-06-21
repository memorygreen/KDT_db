-- �ּ� ó�� ��ȣ
-- SQL ������ ��ҹ��ڸ� �������� �ʴ´�.
-- ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
-- SELECT * FROM EMPLOYEES;
-- SELECT * 
--    FROM EMPLOYEES;
-- SQL ���� ������ �� �����ݷ� (;) �� ���� �Ѵ�.
-- ������ CTRL + ENTER, F9
/* ���� �� �ּ�ó�� */ 

/*********SELECT**********/
-- �����͸� �˻��ϰų� ��ȸ�� �� ����ϴ� SQL QUERY ����

-- 1.��ü ��ȸ (���)
-- * : �ֽ��͸���ũ => '��ü'
-- (�޸� ȿ���� �� ���Ƽ�) ������ ����, � �÷������� �̿��ϴ��� �� ���� ���Ⱑ ��Ʊ� ������ �ǹ������� ���� ���X
SELECT * 
  FROM EMPLOYEES;
  
-- �ǽ� : �μ� ���̺� �ִ� ��ü ������ ����ϱ� (DEPARTMENTS)

SELECT *
  FROM DEPARTMENTS;
  
-- 2. ���ϴ� �÷��� ����ϱ�
/* 
    SELECT �÷�1, �÷�2, �÷�3 
      FROM ���̺�;
*/

SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES;
  
/*
     �ǽ�
     1) ���� ���̺��� ���� ID, �̸�, �Ի��� ���
     2) �μ� ���̺��� �μ� ID, �μ���, �ٹ��� ID ���
*/
    SELECT *
      FROM EMPLOYEES;

    SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
      FROM EMPLOYEES;
    
    SELECT *
      FROM DEPARTMENTS;
      
    SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
      FROM DEPARTMENTS;
      
-- 3. DISTINCT �� �̿��ؼ� �ߺ� ����
-- �÷��� 1���� ��� �ش� �÷��� �ߺ��� �������ش�.
-- �׷��� �÷��� ���� ���� ��� �÷�+�÷� ���� �ߺ��� ������ ��
-- �׷��� �� ���� �÷��� �ٸ� ���, �ߺ����� ��µǱ⵵ �Ѵ�.

    SELECT DISTINCT DEPARTMENT_ID
      FROM EMPLOYEES;
      
    SELECT DISTINCT DEPARTMENT_ID, JOB_ID
      FROM EMPLOYEES;
        
/* �ǽ�
 1. ���� ���̺��� �Ի����� ��� => ���� ������ Ȯ��, ���� �ּ�
 2. ���� ���̺��� �Ի��� �ߺ����� ��� => ���� ������ Ȯ��, ���� �ּ�
*/
SELECT * --107��
  FROM EMPLOYEES;
  
SELECT HIRE_DATE --107��
  FROM EMPLOYEES;

SELECT DISTINCT HIRE_DATE --98��
  FROM EMPLOYEES;
  
-- 4. ��Ī �����ϱ�

-- 4-1. �÷� �̸��� �ʹ� ��ų�, �ٸ��� ǥ���� ���
SELECT EMPLOYEE_ID ����������ȣ1
  FROM EMPLOYEES;

SELECT EMPLOYEE_ID "����������ȣ2"
  FROM EMPLOYEES;
  
SELECT EMPLOYEE_ID AS ����������ȣ3
  FROM EMPLOYEES;
  
SELECT EMPLOYEE_ID AS "����������ȣ4"
  FROM EMPLOYEES;
  
-- 4-2. ���� ���� �÷��� �����ؼ� ����� ���
SELECT SALARY AS "����"
       ,SALARY*12 AS ����
  FROM EMPLOYEES;
  
  
/* ���� ���̺��� �Ի���, �Ի� �������� ����� ��
�Ի����� "�Ի���"�� ǥ��
�Ի� �������� "��༭ �ۼ���"���� ǥ��
��Ī���� ���
��, 4���� ǥ�������� ��� �ۼ�
*/

SELECT HIRE_DATE  AS �Ի���
      ,HIRE_DATE+1 "��༭ �ۼ���"
  FROM EMPLOYEES;

SELECT HIRE_DATE  �Ի���
      ,HIRE_DATE+1 AS "��༭ �ۼ���"
  FROM EMPLOYEES;
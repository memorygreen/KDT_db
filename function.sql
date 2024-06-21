/*********�Լ�(function*********

/*
Q. �Լ���?
A. Ư���� ������� ��� ���� �����͸� �Է��� �� �ִ� Ư�� ��ɾ�
    (�ͼ��� - �������ֽ�)

�����Լ� (built-in function)
����� ���� �Լ� (user-defined function)

*/

-- 1. ���� �Լ�
-- 1-1) UPPER : �빮�ڷ� ��ȯ���ִ� �Լ�
-- 1-2) LOWER : �ҹ��ڷ� ��ȯ���ִ� �Լ�
SELECT FIRST_NAME, UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES;
-- �ڿ� : NULL���� ���⿡���� �� �ٲ�!! ���� NULL�� �ƴϴ� �빮�ڷ� �ٲ��� �ʴ´�!!

-- 1-3)LENGTH : ���ڿ� ����
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;

-- �ڿ� : QnA) �Լ��� WHERE���� �������� ���� �� �ִ���? =>����
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 8;

-- 1-4) SUBSTR : ���ڿ� ����
-- SUBSTR(������, ������ġ) : ������ġ���� ������ ����
-- SUBSTR(������, ������ġ, ������ ���� ) : ���� ��ġ���� ������ ���̸�ŭ ����

-- EX) UBSTR(�������, 3, 2)
-- 1994.02.18
SELECT JOB_ID, SUBSTR(JOB_ID,1,2)
  FROM EMPLOYEES;

-- �Ի��Ͽ��� �Ի����� ����, ��, ���� ���<- �������̺���
-- �Ի��� | ���� | �� | ��
-- (��, ��Ī�� ���� �� �Ϸ� ǥ��)
SELECT HIRE_DATE AS �Ի���, SUBSTR(HIRE_DATE,1,2) AS ����, SUBSTR(HIRE_DATE,4,2) AS ��, SUBSTR(HIRE_DATE,7,2) AS ��
  FROM EMPLOYEES;

-- ������ Ǯ��
SELECT HIRE_DATE, 
       SUBSTR(HIRE_DATE,1,2) AS ����, 
       SUBSTR(HIRE_DATE,4,2) AS ��, 
       SUBSTR(HIRE_DATE,7) AS �� --7��°���� �������ϱ� ������ ���̴� ����!
  FROM EMPLOYEES;

-- 1-5) REPLACE
-- REPLACE(������, �ٲٰ� ���� ���� ���ڿ�, �ٲ� ���ο� ���ڿ�)

SELECT HIRE_DATE, 
       REPLACE(HIRE_DATE, '/', '-') AS ������,
       REPLACE(HIRE_DATE, '/') AS ����
  FROM EMPLOYEES;
  
-- 1-6) CONCAT : ���ڿ� ��ġ��
-- �� �� ��ġ�� ��
SELECT CONCAT('�Ի� ��¥�� ', HIRE_DATE) AS �ȳ�����
  FROM EMPLOYEES;

-- �� �� ��ġ�� ������? CONCAT �ȿ� CONCAT
SELECT CONCAT('�Ի� ��¥�� ', CONCAT(HIRE_DATE, '�Դϴ�')) AS �ȳ�����
  FROM EMPLOYEES;
  
-- 1-7) || : ���ڿ��� ������ �� �ִ� ������     
SELECT '�Ի� ��¥�� '||HIRE_DATE|| '�Դϴ�.'AS �ȳ�����_���ڿ�����
  FROM EMPLOYEES;

-- 1-8) TRIM : ���ڿ��� ���� OR ������ ����
-- DUAL ���̺� : �ְ� ���� ������� SYS ������ ���̺��, �ӽ� �����̳� 
--              �Լ��� ������� Ȯ���� �뵵�� ���Ǵ� ���� ���̺�
SELECT *
  FROM DUAL;
  
SELECT 'HELLO' AS �λ縻,
        TRIM('H' FROM 'HELLO') AS H������
  FROM DUAL;
  
SELECT '[' || ' '|| '����' ||' ' || ']' AS "�������� ��",
       '[' ||   TRIM(' '|| '����' ||' ')   || ']' AS "�������� ��"
FROM DUAL;

-- ���ڿ� ���� : TRIM (������ ���� FROM ���ڿ�)

SELECT '1����1' AS ������,
       TRIM(LEADING '1' FROM '1����1') AS ���ʱ�������,
       TRIM(TRAILING '1' FROM '1����1') AS �����ʱ�������,
       TRIM(BOTH '1' FROM '1����1') AS ��������
  FROM DUAL;
  
-- �Ѻ����� �ǵ� : ke �ΰ͵��� ã�Ƽ� he�� �ٲٱ�
SELECT FIRST_NAME, REPLACE(FIRST_NAME, 'Ke', 'He')
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%Ke%' ; --he�� �ƴ� ke�� ã�ƾ���! where ���� ������ ->select �� �˻��ϴϱ�!
 
-- 240111(��)
-- 2. �����Լ�
-- 2-1) MOD : ������
--      MOD(������ �� ����, ���� ����)
--      Ȧ¦�� ������ �� ���� ���

SELECT MOD(15, 6), MOD(15,2), MOD(14,2)
  FROM DUAL;

-- 2-2)  ROUND : �ݿø��ϴ� �Լ�
--       ROUND(����, �ݿø� ��ġ - ����)
-- ��ġ�� �������� ������ �Ҽ��� ù����° �ڸ����� �ݿø��� ����

SELECT ROUND(15.65, 1), -- �ڿ� : �Ҽ��� 1��°�ڸ����� ǥ��
       ROUND(12.12, 1),
       ROUND(12.12)
  FROM DUAL;

-- 2-3) TRUNC : ���� �Լ�
--      TRUNC(����, �ݿø� ��ġ - ����)
SELECT ROUND(15.65, 1), TRUNC(15.65,1),
       ROUND(12.12, 1), TRUNC(12.12, 1)
  FROM DUAL;
  
-- 3. ��¥�Լ�
-- 3-1) SYSDATE
-- ��¥ ���� �ٲٴ� ��� : (�̹� �ֶ� ������ �ٲٴ� �� ��õX) ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥ ���� ����

SELECT SYSDATE AS ����,
       SYSDATE+1 AS �Ϸ����,
       SYSDATE + 1/24 AS �ѽð�����,
       SYSDATE + 1/24/60 AS �Ϻд���,
       SYSDATE + 1/24/60/60 AS ���ʴ���,
       ADD_MONTHS(SYSDATE, 1) AS "1������",
       ADD_MONTHS(SYSDATE, -1) AS "1������"
       
  FROM DUAL;

-- 4. ����ȯ�Լ�
-- 4-1) ���� �����ͷ� ��ȯ (���� ����) : TO_CHAR
SELECT SYSDATE, 
       TO_CHAR(SYSDATE),
       TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
  FROM DUAL;

-- 4-2) ���� �����ͷ� ��ȯ (���� ����)
SELECT TO_NUMBER('1')+1
  FROM DUAL;
  
-- 4-3) ��¥ �����ͷ� ��ȯ
SELECT TO_DATE('20230504', 'YYYY/MM/DD')
  FROM DUAL;
  
/*
    ����ȯ �Լ� : ����� ����ȯ
    �Ͻ��� ����ȯ : ���� ����ȯ �Լ��� ������� �ʰ� �ڵ����� ����ȯ ����
    (�ڿ� : ����� ����ȯ�� �� ���� ����!!)
    �켱���� : ������ > ������ > ������
    (�ڿ� : ���ڷ� �Ǿ��ִµ� �ȿ� �ִ°� �����ε�??)
    �켱������ ���� ���������� ����ȯ�� �����Ѵ�.
    (�ڿ� : ���� �ϴ°� ? -> ����ȯ �ۼ� ����)
    
*/

-- 5. NULL �Լ� : NULL�� �ٸ� ���� ��ü
-- NULL�� ������� NULL ��ȯ
-- NULL�� �� ���� FALSE ��ȯ 

-- 5-1) NVL(NULL�˻�, NULL�� �� �ٲ� ��)
-- �������� ���� ���
SELECT FIRST_NAME, NVL(FIRST_NAME, '����')
  FROM EMPLOYEES
 WHERE FIRST_NAME IS NULL;
 
-- 5-2) NVL2(NULL�˻�, NULL�� �ƴ� �� �ٲ� ��, NULL�϶� �ٲ� ��)
SELECT FIRST_NAME, NVL2(FIRST_NAME, '����' ,'����')
  FROM EMPLOYEES;
  
-- �ǽ�  
-- ���� ���̺��� �Ŵ����� �ִ� ���� => '����'
--              �Ŵ����� ���� ���� =>'�Ŵ���'

-- �ڿ� Ǯ��
SELECT MANAGER_ID,  NVL2(MANAGER_ID, '����', '�Ŵ���')
  FROM EMPLOYEES;

-- �� Ǯ��
SELECT MANAGER_ID,
       NVL2(MANAGER_ID, '����', '�Ŵ���')
  FROM EMPLOYEES;
  
--6. DOCODE (�������� ���� ����)
/*
    
    DOCODE (�˻���,
            �񱳽�1(������ ��), ��ġ �� ��ȯ��(�񱳽İ� ��ġ �� ��ȯ��),
            �񱳽�2, ��ġ �� ��ȯ��,
            ...
            ��N, �Ͻ� �� ��ȯ��)

*/

SELECT DEPARTMENT_ID,SALARY,
       DECODE(DEPARTMENT_ID,
            200, SALARY*2,
            90, SALARY*1.9,
            80, SALARY*1.8)
  FROM EMPLOYEES;
  
-- 7. �׷��Լ�
-- SUM : �հ�
-- COUNT : ������ ����
-- MAX : �ִ밪
-- MIN : �ּҰ�
-- AVG : ��հ�

-- �������� �޴� �޿��� ����
SELECT SUM(SALARY)
  FROM EMPLOYEES;
  
-- ������ ����
SELECT COUNT(EMPLOYEE_ID), COUNT(*)
  FROM EMPLOYEES;
  
-- ���� ���� �޿�, ���� ���� �޿�, �޿��� ���
SELECT MAX(SALARY), MIN(SALARY), ROUND(AVG(SALARY))
  FROM EMPLOYEES;

-- ���� ���� �׷�ȭ�� �����ߴµ�, ������ �����Ͱ� ����ʹٸ�?
-- x, �ȵǴ� ����? �׷�ȭ�� �ϰ� �Ǹ� ���� ��µǴ� ���� ����
-- ��µ� �� �ִ� �÷��� ����

-- ����Ǵ� ���� : FROM -> GROUP BY ->SELECT 
-- 2��° ����Ǵ� GROUP BY���� ���� ������ 108�� => 12��

-- �̹� �׷�ȭ ��Ų ���� ������ ���� ���� ������ �� �±� ������ SELECT�� ���� ����

SELECT DEPARTMENT_ID, ROUND (AVG(SALARY)), EMPLOYEE_ID
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ��, ���� �Լ��� ��� ����
SELECT DEPARTMENT_ID, ROUND (AVG(SALARY)), COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- �ǽ�
-- ���� ���̺��� �޿��� ����, �հ�, �ּұ޿�, �ִ�޿�, �޿��� ��� ���� "�μ�����" ���غ���

-- �ڿ� Ǯ��
SELECT COUNT(SALARY), SUM(SALARY), MIN(SALARY), MAX(SALARY), AVG(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ��Ǯ��
SELECT DEPARTMENT_ID,
        COUNT(SALARY),
        SUM(SALARY),
        MIN(SALARY),
        MAX(SALARY),
        ROUND(AVG(SALARY))
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
  
-- ������ �Լ� : 1->1(�ڿ� : 1���� ������ �Է�->1���� ���) �Լ��� �ԷµǴ� ���� ���� 1, ��� ��1
-- EX) UPPER, LOWER ..
-- ������ �Լ� : n -> 1 �Լ��� �ԷµǴ� ���� ����n, ��� �� 1
-- ex) SUM, AVG ...

-- COUNT(*) NULL ����
-- COUNT(�÷�) NULL ����
SELECT COUNT(DEPARTMENT_ID), COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

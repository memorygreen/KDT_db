-- 2024.01.12.
/*********************JOIN***********************/

-- JOIN : ���� ���� ���̺��� �����ؼ� ����ϴ� ��
-- �ʿ��� �����Ͱ� �� �� �̻��� ���̺� ������ ���� �� �����͸� ���ļ� ���������� ���

-- ��û���� :  ���� ID�� 100�� ������ �μ��̸��� ���
-- ���� ID (���� ���̺� ) / �μ� �̸� ( �μ����̺�)

-- JOIN ������ �𸥴ٴ� �����Ͽ� ����
-- 1. ���� ID�� 100�� ������ ã�´�. => �μ� ID�� �����´�.

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;
 
-- 2. �μ� ID�� 90�� �μ��� �̸�
SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 90;

-- ���� ���� JOIN ������ �˰� �ִٸ�?(�ڿ� : ����Ŭ ����)
SELECT D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.EMPLOYEE_ID = 100;
  
  /******************FROM**************/
  -- FROM ���� ���̺��� ������ ��� ���� + �� ���Ը��� ��Ī�� ����
  -- ������������̺�1�̸� ���̺�1��Ī, ���̺�2 ���̺�2��Ī
  -- EX) EMPLOYEES E, DEPARTMENTS D (�ڿ� : ���� AS ���� ����)
  -- ���� ���̺��� ���� �� ����ϴ� ��� ��! � ���̺��� �̿��Ұ��� ��Ȯ�ϰ� ��������ߵ�, ��Ī����!

--�ڿ� :  �������� ���
SELECT DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;

-- �ڿ� : ���̺�� �������� ���� �� ����!(�� ���̺� ���� �÷��� ������ ���)
SELECT D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;


-- ���� �� ���̺��� �ִ� �÷��̶�� ���� ��Ī ���̵� ��� ����
SELECT EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
-- ��, ��Ī�� �ְ��� �� �ڿ� ���� ���������� ��� �� ��Ī�� ����ؾ� ��
SELECT DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
-- [CROSS JOIN] : ���� ���� ��� ���� JOIN �ؼ� ���
-- īƼ�� ��

-- 1. �������̺� ��� -> ���� Ȯ��(108��)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E;
  
-- 2. �μ� ���̺� ��� ->���� Ȯ��(27��)
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;
  
-- 3. �� ���̺��� JOIN �ؼ� ��� ->���� Ȯ��(108*27 = 2916��)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D;


-- [INNER JOIN] : ���̺� ���� ������, JOIN �߿��� ���� �Ϲ����� ���
-- JOIN �ϼ��� == INNER JOIN �ϼ���!

-- ����ID�� 114���� ����� ���� ID, �̸�, �μ�ID, �μ� �̸��� ����ϼ���.

-- ���� �����;��� ���̺��� �� �� �̻��� ���

-- 1) WHERE ���� ���� ����ؼ� INNER JOIN
-- ORACLE������ ��밡��

-- �ڿ� :  CROSS JOIN(�ƹ� ����X) (���� ���� NULL�� ä��� �� ������ ��)
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D;

-- �ڿ� : INNER JOIN(HWERE ���� ����O) (���� �ش�Ǵ� �͸�)
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.EMPLOYEE_ID = 114;

-- 2) ANSI ������ ���
-- �̱�����ǥ����ȸ ANSI ���� ���� ����, ��� DB���� ��� ���� => ����

SELECT �÷�
  FROM A���̺� INNER JOIN B���̺�
    ON (����) ; 
    
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME 
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.EMPLOYEE_ID = 114);
        
        
-- (INNER JOIN�� ���)�� ���̺� ��� �����Ͱ� �־�߸� ����� ���´�.
-- INNER JOIN ������ NULL ���� ������ �ʴ´�.(�ڿ� : NULL���� �񱳺Ұ����ϱ⶧���� FALSE�� ������)
-- WHY? ������ �μ�ID = �μ��� �μ�ID�� ���ϴ� �۾� => NULL�� �� ������ ������� ����


-- �ǽ�����
-- �ϳ��� ���� ��, �� ���� ���� �ۼ��� �� ORACLE ����, ǥ�� ����(ANSI)

-- �ڿ� Ǯ��
-- 1. ���� ���̺�� (EMPLOYEES) ���� ���̺�(JOBS) INNER JOIN�� ����ؼ�
--    ���� ID�� ���� ID�� ���� TITLE ���
-- 1-1) ORACLE
SELECT E.EMPLOYEE_ID, J.JOB_TITLE
  FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 1-1) ��Ǯ��
SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID = J.JOB_ID;
--(��) J.JOB_ID�� ������� �Ȱ���!!
-- FROM ������ ���� CROSS JOIN�̴�!!

-- 1-2) ANSI
SELECT E.EMPLOYEE_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID);

-- ��Ǯ��
SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID);
    
    
-- ���� ���̺�
SELECT *
FROM JOBS;

-- �μ� ���̺�
SELECT *
FROM DEPARTMENTS;

-- �������̺�
SELECT *
FROM EMPLOYEES;


-- 2. �� �μ��� �Ŵ��� ������ ���
--    �μ� ���̺�� ���� ���̺��� INNER JOIN�� �̿��ؼ� �μ� �̸�, �Ŵ���ID, ����ID�� ���
-- 2-1) ORACLE

SELECT D.DEPARTMENT_NAME, E.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
  AND D.MANAGER_ID = E.MANAGER_ID;
  
  
-- (X) �ڿ� Ʋ��!! ������ Ʋ�ȴ�!!

-- ��Ǯ��
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID;


-- 2-2) ANSI
SELECT D.DEPARTMENT_NAME, E.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID
  AND D.MANAGER_ID = E.MANAGER_ID);
  
-- ��Ǯ��
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);


-- INNER JOIN !!!! ������~~~�߿���!!!!
-- ��, INNER JOIN�� NULL ���� ������� ���ϱ� ������ NULL ���� �����ؼ� ����ϰ� ���� ����?

/*****************OUTER JOIN*****************/
-- LEFT OUTER JOIN : ���ʿ� �ִ� A���̺��� �������� OUTER JOIN (�ڿ� : NULL �� �������ڴ�!)
SELECT �÷�
  FROM A���̺�.��Ī LEFT OUTER JOIN B���̺�.��Ī
    ON (��������);

-- ���� ���̺� �մ� ����ID, �μ�ID, �μ� �̸� ���
-- �μ� ID�� NULL�� ���������� ���

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- RIGHT OUTER JOIN : �����ʿ� �ִ� B���̺��� �������� OUTER JOIN
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- FULL OUTER JOIN : ���� ���̺��� ��� ��(NULL ����)�� ��µȴ�.
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);    

-- RIGHT OUTER JOIN
-- FULL OUTER JOIN


--------------------------------------------------------------
-- ORACLE ������ Ȱ���� OUTER JOIN
-- �򰥸��� �̺κ� ������, ���� �ִ� �������� �ܿ�� �� �� ���� �߿���!

SELECT *
  FROM DEPARTMENTS;
 
SELECT *
  FROM EMPLOYEES;
  
-- 1. LEFT OUTER JOIN => �����ʿ� (+)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
 
-- 2. RIGHT OUTER JOIN => �����ʿ� (+)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID (+)= D.DEPARTMENT_ID; 
 --����ִ� �μ� NULL��

-- 3. FULL OUTER JOIN�� �ܼ� ��ȣ �߰��δ� �Ұ���.
------------------------------------------

-- �ǽ�

/***************************** JOIN ************************/
-- JOIN : �������� ���̺��� �����ؼ� ����ϴ� �� 
-- �ʿ��� �����Ͱ� �ΰ� �̻��� ���̺� ������ ���� �� �����͸� ���ļ� ���������� ��� 

-- ��û���� : ���� ID�� 100�� ������ �μ��̸��� ��� 
-- ���� ID (���� ���̺�) / �μ� �̸� (�μ����̺�) 

-- JOIN ������ �𸥴ٴ� �����Ͽ� ���� 
-- 1. ���� ID�� 100�� ������ ã�´�. => �μ� ID �� �����´� 

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;
 
-- 2. �μ� id�� 90�� �μ��� �̸� 

SELECT DEPARTMENT_NAME
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 90;
 
-- ���� ���� JOIN ������ �˰� �ִٸ�? 

SELECT D.DEPARTMENT_NAME
 FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  AND E.EMPLOYEE_ID = 100; 
 
 
/**************** FROM ********************/
-- FROM ���� ���̺��� ������ ��� ���� + �� ���̺��� ��Ī�� ���� 
-- ���� ����� ���̺�1 �̸� ���̺�1 ��Ī, ���̺�2 ���̺�2��Ī 
-- EX) EMPLOYEES E, DEPARTMENTS D 
-- ���� ���̺��� ������ ����ϴ� ��� ��! � ���̺��� �̿��Ұ���
-- ��Ȯ�ϰ� ��������ߵ�, ��Ī���� 

SELECT D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 
  
-- ���� �� ���̺��� �ִ� �÷��̶�� ���� ��Ī ���̵� ��� ���� 
SELECT EMPLOYEE_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 

-- �� ��Ī�� �ְ���, �� �ڿ� ���� ���������� ��� �� ��Ī�� ����ؾ��� 
SELECT DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D; 
  

-- [CROSS JOIN] : ���� ���� ��� ���� JOIN �ؼ� ��� 
-- īƼ�� �� 

-- 1. �������̺� ��� (108)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID 
  FROM EMPLOYEES E;
  
-- 2. �μ����̺� ��� (27) 
SELECT D.DEPARTMENT_ID , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;

-- 3. �� ���̺��� JOIN �ؼ� ��� (108*27 = 2916)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D ; 
  

-- [INNER JOIN] : ���̺� ���� ������, JOIN �߿��� ���� �Ϲ����� ��� 
-- JOIN �ϼ��� == INNER JOIN �ϼ���! 

-- ���� ���̵� 114���� ����� ���� ID, �̸�, �μ� ID, �μ��̸��� ����ϼ���. 
-- ���� �����;��� ���̺��� �ΰ� �̻��� ��� 

-- 1) WHERE ���� ���� ����ؼ� INNER JOIN  
-- ORACLE ������ ��� ���� 

SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
  WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  AND EMPLOYEE_ID = 114;
  
-- 2) ANSI ������ ��� 
-- �̱�����ǥ����ȸ ANSI ���� ���� ����, ��� DB���� ��� ���� => ���� 

SELECT �÷� 
  FROM A���̺� INNER JOIN B���̺� 
    ON (����) ; 
    
SELECT E.EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND EMPLOYEE_ID = 114);

-- �� ���̺� ��� �����Ͱ� �־�߸� ����� ���´�. 
-- INNER JOIN ������ NULL ���� ������ �ʴ´�.
-- WHY? ������ �μ� ���̵� = �μ��� �μ����̵� ���ϴ� �۾�=> NULL�� �� ������ ������� ���� 

-- �ǽ����� 
-- �ϳ��� ���� ��, �ΰ��� ���� �ۼ��� �� ORACLE ����, ǥ�ع��� 

-- 1. ���� ���̺�� (EMPLOYYES) ���� ���̺� (JOBS) INNER JOIN�� ����ؼ� 
--      ���� ID�� ���� ID�� ���� TITLE ��� 

-- 1-1) ORACLE 

SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID = J.JOB_ID;



-- 1-2) ANSI 

SELECT EMPLOYEE_ID, E.JOB_ID, JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
  ON (E.JOB_ID = J.JOB_ID);

-- 2. �� �μ��� �Ŵ��� ������ ���
--     �μ����̺�� ���� ���̺��� INNERJOIN�� �̿��ؼ� �μ� �̸�, �Ŵ��� ID,
--      ���� ID�� ��� 

-- 2-1) ORACLE 
SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

-- 2-2) ANSI 

SELECT DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);



-- INNER JOIN !!!!������ ~~~ �߿��� 
-- ��, INNERJOIN�� NULL ���� ������� ���ϱ� ������ NULL ���� �����ؼ� ����ϰ� ���� ����?

/****************** OUTER JOIN ***********************/
-- LEFT OUTER JOIN  : ���ʿ� �ִ� A���̺��� �������� OUTER JOIN 
-- RIGHT OUTER JOIN : �����ʿ� �ִ� B���̺��� �������� OUTER JOIN 
SELECT �÷� 
  FROM A���̺�.��Ī LEFT OUTER JOIN B���̺�.��Ī 
    ON (��������); 
    
-- ���� ���̺� �ִ� ���� ���̵�, �μ� ���̵�, �μ� �̸� ��� 
-- �μ� ID �� NULL �� ���������� ��� 

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);
    
SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);    
    
-- FULL OUTER JOIN : ���� ���̺��� ��� �� (NULL ����) �� ��µȴ�. 

SELECT EMPLOYEE_ID, E.DEPARTMENT_ID, DEPARTMENT_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);

------------------------------------
-- ORACLE ������ Ȱ���� OUTER JOIN 
-- �򰥸��� �̺κ� ������, ���� �ִ� �������� �ܿ�°� �� ���� �߿���! 

-- 1. LEFT OUTER JOIN => �����ʿ� (+) 
 
SELECT E.EMPLOYEE_ID , E.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID (+)= D.DEPARTMENT_ID;
 
-- 2. RIGHT OUTER JOIN => ���ʿ� (+)
-- 3. FULL OUTER JOIN�� �ܼ� ��ȣ�߰��δ� �Ұ���. 

------------------------------------ 

-- �ǽ� 
-- 1. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ� ���̺��� �������� LEFT OUTER JOIN�� ����ؼ�
--      �μ� NAME, �Ŵ��� ID�� ���� ID�� ����ض� (ANSI ������ ���) 

-- �ڿ�
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);


- 2024.01.15.
-- ��Ǯ�� (INNER JOIN�� �񱳿������� ���ܼ� NULL ���� ����, OUTER JOIN�� +��ȣ�� ����=>NULL �� ����)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.EMPLOYEE_ID
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
    
-- 2. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ� ���̺��� �������� RIGHT OUTER JOIN�� ����ؼ� 
--      �μ� NAME, �Ŵ��� ID, ���� ID�� ����ض� (ANSI ����) 
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
-- ��Ǯ��
SELECT DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
-- 3. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ����̺��� �������� FULL OUTER JOIN�� ����ؼ�
--   �μ� NAME, �Ŵ��� ID, ���� ID�� ����ض� (ANSI����) 

-- *��Ʈ : A���̺��� ��������? A���̺��� ���� �ۼ� 
--      A���̺� LEFT OUTER JOIN B���̺� 
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

-- ��Ǯ��
SELECT DEPARTMENT_NAME, D.MANAGER_ID, EMPLOYEE_ID
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

 -- 3���� ���̺� JOIN�ϱ�
 -- �μ� ���̺�, ��ġ ���̺�, ���� ���̺� �� ���� INNER JOIN �ؼ�
 -- �� �μ��� ���ÿ� ���� �̸��� ���
 
 -- ORACLE ����
 SELECT D.DEPARTMENT_NAME, CITY, COUNTRY_NAME
   FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
  WHERE D.LOCATION_ID = L.LOCATION_ID
    AND L.COUNTRY_ID = C.COUNTRY_ID;

-- ANSI ����
 SELECT D.DEPARTMENT_NAME, CITY, COUNTRY_NAME
   FROM DEPARTMENTS D INNER JOIN LOCATIONS L
     ON (D.LOCATION_ID = L.LOCATION_ID)
   INNER JOIN COUNTRIES C
     ON (L.COUNTRY_ID = C.COUNTRY_ID);


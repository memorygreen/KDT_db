/**************************��ü*********************/

-- VIEW : ������ ���̺�, ���̺��� ��ȸ�ϴ� SELECT�� ��ü�� ������ ��ü

CREATE VIEW ���̹�ȸ������LITE AS 
SELECT ���̹�ID, �̸�
  FROM ���̹�ȸ��;
  
SELECT *
  FROM ���̹�ȸ������LITE;
  
DROP VIEW ���̹�ȸ������LITE;

-- �ǽ� ����
-- 1. �μ���(GROUP BY) �ְ� �޿�(MAX)�� �޴� ������ �μ�ID�� �ְ�޿��� ����ϼ���.
-- 2. 1�� SELECT ���� �μ��� �ְ�޿���� VIEW�� ����
-- 3. VIEW ���

SELECT *
  FROM EMPLOYEES;

-- �ڿ� Ǯ��
-- (X ->������...�����..����...�μ�ID �ݾ�...)
-- (X ->GROUP BY ���� ������..SELECT���� �ִ� �÷��̶�..��ġ���Ѿ� ������..�ȳ��� ���ڽľ�)
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ��Ǯ��
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

CREATE VIEW �μ����ְ�޿� AS
SELECT DEPARTMENT_ID, MAX(SALARY) AS �ְ�޿�
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT *
  FROM �μ����ְ�޿�;
  
SELECT E.FIRST_NAME, DMAX.�ְ�޿�
  FROM EMPLOYEES E, �μ����ְ�޿� DMAX
 WHERE E.DEPARTMENT_ID = DMAX.DEPARTMENT_ID;
 
-- ������(SEQUENCE) : Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü
-- ��� ����ǥó�� ����ؼ� ���� ��ȣ�� ������ִ� ����
-- INSERT �� �� ���� ���� �ʴ��� ����ؼ� �ڵ����� �þ�� �ο��Ǵ� ��ȣ
-- �ַ� PK�� �÷�ó�� ������ ���� ���� �� �����
-- (�ڿ� : ID ���� ����! ���� �ߺ��� �� ����!)
 
CREATE SEQUENCE NUM1;
 
CREATE TABLE �⼮��(
   �̸� VARCHAR2(12),
   ������ȣ NUMBER
 );
 
INSERT INTO �⼮�� VALUES(
    '���ڿ�', NUM1.NEXTVAL
);

INSERT INTO �⼮�� VALUES(
   '����ȣ', NUM1.NEXTVAL);
   
INSERT INTO �⼮�� VALUES(
    '������', NUM1.NEXTVAL
);
INSERT INTO �⼮�� VALUES(
    '������',NUM1.NEXTVAL);
    
INSERT INTO �⼮�� VALUES(
    '�赿��', NUM1.NEXTVAL
);   
INSERT INTO �⼮�� 
    VALUES ('������',NUM1.NEXTVAL);
    
INSERT INTO �⼮�� VALUES(
'�̱�ȣ', NUM1.nextval);

INSERT INTO �⼮�� VALUES(
    '���Ѻ�', NUM1.NEXTVAL
    );
    
INSERT INTO �⼮�� VALUES(
    '������', NUMl.NEXTVAL
);
   
SELECT *
  FROM �⼮��;
  
-- ������
CREATE SEQUENCE NUM3
START WITH 0
INCREMENT BY 2
MAXVALUE 20
MINVALUE 0
NOCYCLE; -- �ݺ����� ����

CREATE TABLE �������׽�Ʈ2(
    ������ NUMBER
);
INSERT INTO �������׽�Ʈ2 VALUES (NUM3.NEXTVAL);

SELECT *
 FROM �������׽�Ʈ2;
 
-- ROWNUM : �ӽ����ȣ
-- �Խ��ǹ�ȣ, �ӽ÷� �ʿ��� ��ȣ�� �����ؾ��� �� ���
-- (�ڿ�: �ӽ÷ι߱����ִ¹�ȣ(EX. �Խ��ǹ�ȣ) ���/ PK �Ұ�!)
-- ROWNUM�� �ӽ÷� �߱��ϴ� ��ȣ�̱� ������ 1�� ������ ���

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM <=5;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM =5; --(X)���̺��� ������� �Ŀ� ���ڰ� �ο���! ó������ 5���ξִ� �����ϱ� !!

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM =1; --(BUT ������ ��ȣ�� 1���� ��°���!)


-- �޿��� ���� ����
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL
 ORDER BY SALARY DESC;  
 
-- (�ڿ� : ROWNUM ����ؼ� �޿� ���� 5�� �߶󳾼� �ִ�!)
-- (�ڿ� EX. �Խ��� ��õ������ ���� 5���� �����ش�!)
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL
   AND ROWNUM <= 5
 ORDER BY SALARY DESC;  
 
-- �Խ����� ����¡ ó��, ���� ������ ����, ���� ������ ����...
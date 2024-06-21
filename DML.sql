/***************************DML****************************/

-- DML : ���̺� �ȿ� ����ִ� �����Ϳ� ������ ���ϴ� ��ɾ�

-- [1] INSERT : ������ �߰�
INSERT INTO ���̺�(�÷�����Ʈ)
    VALUES (�÷�����Ʈ �ȿ� ���� ������ ����);

INSERT INTO ���̺�(�÷�1, �÷�2)
    VALUES (��1, ��2);

SELECT *
  FROM ���̹�ȸ��;

INSERT INTO ���̹�ȸ��
    VALUES('smart123', '������', '1234', '2005-02-04', '��');
-- ����1)SQL ����: ORA-00947: not enough values
-- �÷��� ������ �� �¾Ƽ� ����� ����. �÷��� ������ ���� ���� ���� ������ ��Ī�غ���!

INSERT INTO ���̹�ȸ��(���̹�ID, ��й�ȣ)
    VALUES ('juhee', '1234');
-- ����2) SQL ORA-01400: cannot insert NULL into ("HR"."���̹�ȸ��"."�̸�")
-- ���� �������� ���� �÷����� (�̸�, �������, ����)�ڵ����� null ���� ��
-- �̸� �÷����� NOT NULL ���������� �ɾ�ξ��� ������ ������ �߻�
-- �ڿ� : ȸ������ �ʼ�,���� (������ NULL�� ��. �ʼ��� NOT NULL ����������)
INSERT INTO ���̹�ȸ��(���̹�ID, ��й�ȣ, �̸�)
    VALUES ('jugee', '1234', '������');

INSERT INTO ���̹�ȸ��(���̹�ID, ��й�ȣ, �̸�)
    VALUES ('hodoodaddy', '1234', '�ں���', '2005-01-25');
-- ����3) SQL ORA-00913: too many values 00913. 00000 -  "too many values"
-- �÷�����Ʈ�� �÷����� ������ ���� �ʾƼ� ���� �߻�

INSERT INTO ���̹�ȸ��
    VALUES ('yaho', '1234', '����ȣ', 040125, '��');
-- ����4) SQL ����: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
-- ������� �ڸ����� DATE �־��ֱ�� �ߴµ� ���ڰ� ���� ���� �߻�

-- ����5) ORA-00001: unique constraint (HR.ȸ��2_ID_PK) violated
-- ���̵�� �ߺ����� �� �� ���µ�, �̹� �ִ� ���̵� �� �߰��Ϸ��� �ؼ� ���� �߻�

INSERT INTO ���̹�ȸ��
    VALUES ('beom', '�Ź���','1234', '2023-09-08', '��');
-- ����6)ORA-02290: check constraint (HR.ȸ��_����_CK) violated
-- CHECH ���� ���ϳ� ��߳��� ���� �߻�

INSERT INTO ���̹�ȸ��
    VALUES ('hongju', '��ȫ�ֺ������Դϴٸ������ݰ����ϴ�', '1234', '2024-01-01', '��');
-- ����7)SQL ����: ORA-12899: value too large for column "HR"."���̹�ȸ��"."�̸�"
-- �̸� �ִ� ũ�⸦ 12 ����Ʈ�� ����
-- �ѱ� 3����Ʈ, ���� 2����Ʈ => �ִ� ũ�⸦ �ѱ� ��
-- actual : ���� ���� ����� ũ��, maximum : ������ �ִ� ũ��

-- �÷��� ũ�� ����
ALTER TABLE ���̹�ȸ�� MODIFY �̸� VARCHAR2(52);
-- �ڿ� : ���� 7�� �ذ��� ����!


-- INSERT �ǽ�
-- 1. �μ�(�ѱ�) ���̺� 5���� �μ��� �߰��Ѵ�.
-- ����������(1), �������(2), ��ȹ��(3), ȫ����(4), �ܺΰ���(5)
-- ���������� ���� ������ NULL�� ó��

SELECT *
  FROM �μ�;
  
INSERT INTO �μ�(�μ�ID, �μ��̸�) 
    VALUES (1, '����������');
INSERT INTO �μ�(�μ�ID, �μ��̸�) 
    VALUES (2, '�������');
INSERT INTO �μ�(�μ�ID, �μ��̸�) 
    VALUES (3, '��ȹ��');
INSERT INTO �μ�(�μ�ID, �μ��̸�) 
    VALUES (4, 'ȫ����');
INSERT INTO �μ�(�μ�ID, �μ��̸�) 
    VALUES (5, '�ܺΰ���');


-- ��Ǯ��
INSERT INTO �μ�
    VALUES (1, '����������', NULL, NULL);
INSERT INTO �μ�
    VALUES (2, '�������', NULL, NULL);
INSERT INTO �μ�
    VALUES (3, '��ȹ��', NULL, NULL);
INSERT INTO �μ�
    VALUES (4, 'ȫ����', NULL, NULL);
INSERT INTO �μ�
    VALUES (5, '�ܺΰ���', NULL, NULL);
    
    
-- 2. ����(�ѱ�) ���̺� ���� ���� ��
-- ���� ���̺��� ������ �� �м��ؼ� NULL�� ������ �÷����� NULL ����,
-- NULL�� �Ұ����� �÷����� ������ ������ ä���

SELECT *
  FROM ����;
  
SELECT *
  FROM EMPLOYEES;
  
INSERT INTO ����(����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (5, '�ڿ�', '��', 'setterdayz0720@gamil.com', '2023-12-29','DB');

-- ��Ǯ��
INSERT INTO ���� (����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (1,'��ǥ','��','seonzeroticket@gmail.com',SYSDATE,'ABC');
  
-- 3. 2������ �� ������� ���� '��' ����濡 ����

-- 4. ���� �� �����͵� ä���ֱ�
INSERT INTO ����(����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (102, '���', '��', 'dleorlf1@gmail.com', '2023-12-29','DB');
INSERT INTO ����(����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (103, '����', '��', 'hyunbi@naver.com', '2023-12-29','JAVA');
INSERT INTO ����(����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (104, '����', '��', 'lde150@hanmail.net', '2023-12-29','JAVA');
INSERT INTO ����(����ID, �̸�, ��, �̸���, �Ի���, ����ID)
    VALUES (105, '����', '��', 'gangminji74@hamil.com', '2023-12-29','JAVA');

-- ��Ǯ��
INSERT INTO ���� VALUES (2, '����', '��', 'EUNBEE@gmail.com', '010-0000-0000', sysdate, 'JAVA', 10000, NULL, NULL, 5);
INSERT INTO ���� VALUES (3, '��ȣ', '��', '1HO@gmail.com', '010-1111-1111', sysdate, 'JAVA', 10000, NULL, NULL, 2);
INSERT INTO ���� VALUES (4, '����', '��', 'SUE@gmail.com', '010-2222-2222', sysdate, 'DB', 10000, NULL, NULL, 1);

-- 3������ �Ǽ����� '���� �Ϸ�'�� üũ
-- 4������ �Ǽ����� '�� �Ϸ�' �� üũ

-- Ŀ��
COMMIT; --���ݱ��� ���� ����

-- [2] ����� ������ ���� : UPDATE SET WHERE
UPDATE ���̺�
   SET �������÷� = �����ҵ�����
 WHERE ��������;

SELECT *
  FROM ����;

-- ���� ������ ���� �����ϴ� �������� ����
UPDATE ����
  SET ����ID = 'DB'
WHERE ����ID = 1;

ROLLBACK; -- �����ʹ� �ѹ� ����, ���̺��� �ȵ�//COMMIT �� �ϰ� ROLLBACK�ϸ� �� ���ư�

-- [3] ������ ���� : DELETE 
-- 3-1) DELETE FROM ���̺�; : ���̺� ���� ��� ������ ����(��, �ѹ� ����)
DELETE FROM ����; -- �ڿ� : ���̺� ���� �� �����

SELECT *
  FROM ����;

ROLLBACK;

-- 3-2) DELETE FROM ���̺� WHERE ����; : ���ǿ� �ش��ϴ� �����͸� ���� (��, �ѹ� ����)
DELETE FROM ����
 WHERE ����ID = 1;

-- 3-3) TRUNCATE TABLE ���̺� : ���̺� ���� ��� ������ ���� (�Ϲ� �Ұ�)
TRUNCATE TABLE ����;

ROLLBACK;

SELECT *
  FROM ����; -- ������ �ϴ� ���ư� BUT ���̺� ���´� ��������
  
-- 3-4) DROP TABLE ���̺� : ���̺� ��ü�� ������ ���� (�ѹ� �Ұ�)

  
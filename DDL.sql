-- 2024.01.15.
/**********************DDL*******************/
-- DDL : ������ ���Ǿ�
-- ���̺�� ���� ������ ������ �����ϴµ� ����ϴ� ��ɾ�
-- CREATE : ���ο� ��ü�� ������ �� ����ϴ� ��ɾ�

-- CREATE�� ���̺�(TABLE ) �����ϴ� ���
CREATE TABLE ���̺� �̸�(
    �÷��̸� �ڷ���(ũ��) [�⺻��] [NULL����]
);

-- �ڿ� : EMPLOYEES ���̺� ->�ѱ۷� �����
-- �Ҽ��� ����, NULLABLE Ȯ��, 
-- CTRL+ENTER �������� ���� �ϼ��� �ڵ� ĸ���ؼ� ����濡 �ø���

CREATE TABLE ����(
    ����ID NUMBER(6) NOT NULL,
    �̸� VARCHAR2(20),
    �� VARCHAR(25) NOT NULL,
    �̸��� VARCHAR(25) NOT NULL,
    �ڵ��� VARCHAR2(20),
    �Ի��� DATE NOT NULL,
    ����ID VARCHAR(10) NOT NULL,
    �޿� NUMBER(8,2),
    ��������� NUMBER(2),
    �Ŵ���ID NUMBER(6),
    �μ�ID NUMBER(4) 
    );

-- CREATE �ǽ�2
-- �ڿ� :  �μ� ���̺� �ѱ۷� �����
CREATE TABLE �μ�(
    �μ�ID NUMBER(4) NOT NULL,
    �μ��̸� VARCHAR(30) NOT NULL,
    �Ŵ���ID NUMBER(6),
    ��ġID NUMBER(4)
);

-- ��������
-- PK (PRIMARY KEY) : �ߺ��Ұ� + NULL�Ұ� = >���� �ĺ��� �� �ִ� �÷�(�ڿ� : �ĺ��� ����)
-- UK ( UNIQUE KEY) : �ߺ��Ұ� + NULL ����
-- NOT NULL
-- CHECK : ������ �����͸� �Է� ����
-- FK (FOREIGN KEY) : �ܷ�Ű, �� ���̺��� �����ϴ� Ű

-- ���������� �߰��ϴ� ����!
-- �ڿ� : ���������� �ٲ� ���ɼ� �־ �������Ǹ� ���߿� �߰���!!
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������(�÷�);

-- 1. PK �߰� ����
ALTER TABLE ���� ADD CONSTRAINT ����_����ID_PK PRIMARY KEY(����ID);
--�ڿ� : �������Ǹ��� ������� �ᵵ ������ ���� ���� ����������

-- 2. UK �߰� ���� (�̸���)
ALTER TABLE ���� ADD CONSTRAINT ����_�̸���_UK UNIQUE(�̸���);

-- 3. CHECK ���� (�޿��� 0�ʰ�)
ALTER TABLE ���� ADD CONSTRAINT ����_�޿�_CK CHECK(�޿�>0);

-- ���̺� ������ Ȯ���ϴ� ���: ���̺� �巡�� + SHIFT + F4

-- 4. FK �߰� ����(�ܷ�Ű)
-- �ڿ� : �ߺ��� ���� Ű�� ������ �� ����(PK, UK)
-- FK�� �ٸ� ���̺��� UK�� PK�϶��� ���� ����
-- ���� ���� ������ ���̺��� �÷��� PK, UK�� ������ �Ǿ��־�߸� FK�� ���� ����
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������(�÷�) REFERENCES ���������̺�(�������÷�);

-- ���� ���̺� �ִ� �μ� ID�� FK�� ���
-- ��� �����ؿðųĸ� �μ� ���̺� �ִ� �μ�ID�� ����

-- 4-1) �μ�ID�� PK�� ���� (�ڿ� : ���������̺��� �������÷��� PK �Ǵ� UK�� �����ؾ� FK ��밡��)
ALTER TABLE �μ� ADD CONSTRAINT �μ�_�μ�ID_PK PRIMARY KEY(�μ�ID);

-- 4-2) ���� ���̺��� �μ�ID - �μ� ���̺� �μ�ID ����
ALTER TABLE ���� ADD CONSTRAINT ����_�μ�ID_FK FOREIGN KEY(�μ�ID)
    REFERENCES �μ�(�μ�ID);
-- �ڿ� : PK�� ���̺� 1��. ���� Ȯ���غ��� PK�̹� ������? UK�� �����ؼ� �����ؾ���!

-- 5. NOT NULL ����
ALTER TABLE ���� MODIFY �̸� NOT NULL;
-- �ڿ� :  NULLABLE�� �������� ������ YES�� ���⶧���� �߰� �ƴ� ����!

-- 6. �������� ����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
ALTER TABLE ���� DROP CONSTRAINT ����_�޿�_CK;

-- 7. �������� ��ȸ
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = '����';
 
-- 8. ���������� ���̺� ���� �ÿ� �߰�
CREATE TABLE ���������׽�Ʈ(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NN�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(CK�׽�Ʈ > 0)
);
-- ���̺� -> ������ ���콺 -> ���ΰ�ħ
-- ���������׽�Ʈ �巡�� -> SHIFT + F4 -> ���̺� ���� Ȯ��

-- 9. ���̺� ����
-- DROP TABLE ���̺��; : ���̺� ���� ���� (+ �ȿ� �ִ� �����ͱ��� ����)
-- �ڿ� : DROP �ϸ� ��������! ���� ���� �ص� �� �츲!

DROP TABLE ���������׽�Ʈ;

DROP TABLE �μ�;
-- DROP TABLE ���̺�� CASCADE CONSTRAINT : ���̺�, ������, FK���� ���� ����
-- (�ڿ� : �����Ұǵ� �����ϰ��ִ�, �������� ���� �ͱ��� �� �� ������!! �����ϸ� �����õX)
-- ������ζ�� �������� ������ ������ -> DROP TABLE

-- �ǽ�(����)
CREATE TABLE ���̹���α�(
    ��α׹�ȣ NUMBER,
    ��α����� VARCHAR(100) NOT NULL,
    ��α׳��� VARCHAR(4000),
    ID VARCHAR(15)
);

CREATE TABLE ���̹�ȸ��(
    ID VARCHAR(15),
    �̸� VARCHAR(12) NOT NULL,
    ��й�ȣ VARCHAR(16),
    ������� DATE,
    ���� VARCHAR(3)
);

ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ȸ��_ID_PK PRIMARY KEY(ID);
ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ȸ��_����_CK CHECK(���� = "��" OR ���� = "��"); --�ڿ� �𸣰��� �Ф�

ALTER TABLE ���̹���α� ADD CONSTRAINT ��α�_��ȣ_CK PRIMARY KEY(��α׹�ȣ);

ALTER TABLE ���̹���α� ADD CONSTRAINT ��α�_ȸ��_ID_FK FOREIGN KEY(ID) REFERENCES ���̹�ȸ��(ID);

-- 2024.01.16.
-- �� Ǯ��

-- 1.
CREATE TABLE ���̹���α�(
    ��α׹�ȣ NUMBER(4),
    ��α����� VARCHAR2(100) NOT NULL, --�ڿ� Ʋ�� VARCHAR2
    ��α׳��� VARCHAR2(4000), --�ڿ� Ʋ�� VARCHAR2
    ���̹�ID VARCHAR2(15)
);

-- 2.
CREATE TABLE ���̹�ȸ��(
    ���̹�ID VARCHAR2(15),
    �̸� VARCHAR2(12) NOT NULL, 
    ��й�ȣ VARCHAR2(16),
    ������� DATE,
    ���� VARCHAR2(3)
);

-- 3.
-- ���̹�ȸ�� TABLE -> PK : ���̹�ID
ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ȸ��_ID_PK PRIMARY KEY(���̹�ID) ;

-- CHECK : ���� (��,��)
ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ȸ��_����_CK CHECK(���� IN('��','��'));

-- PK : ��α� ID
ALTER TABLE ���̹���α� ADD CONSTRAINT ��α�_��ȣ_PK PRIMARY KEY(��α׹�ȣ);

-- FK : ��α� ���̺� ID - ȸ�� ���̺� ID ����
ALTER TABLE ���̹���α� ADD CONSTRAINT ��α�_ȸ��ID_FK FOREIGN KEY(���̹�ID) 
    REFERENCES ���̹�ȸ��(���̹�ID);
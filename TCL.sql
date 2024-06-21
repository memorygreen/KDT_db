/*********************** TCL ********************/

-- TCL : Ʈ����� �����
-- Ʈ�����(TRANSACTION) : ������ �����ϱ� ���� �ּ� ���� ����

-- Ʈ������� 4���� Ư�� : ���ϰ���
-- 1. ���ڼ�(Automicity) : ALL or Noting (�۱� ����/ ����)
-- 2. �ϰ���(Consistency) : ������ �ϰ����ְ� ����
-- 3. ����(Isolation) : Ʈ����� ���� �� �ٸ� Ʈ����ǿ� ���� X
-- 4. ���Ӽ�(Durability) : �� �� COMMIT �� Ʈ������� ������ �ݿ�

-- COMMIT : DB�� ���������� ����
-- ROLLBACK : Ʈ����� ���, ������ COMMIT ���������� ���� ����

CREATE TABLE īī����ũ(
    ���¹�ȣ VARCHAR2(50) PRIMARY KEY,
    �̸� VARCHAR2(12),
    �ܾ� NUMBER    
);
    
INSERT INTO īī����ũ
    VALUES ('3333-01-010-0102', 'ȫ�浿', 200);

SELECT *
 FROM īī����ũ;
 
ROLLBACK;

-- �ѹ��ߴ��� INSERT �ߴ� ���°� �����
-- DML(INSERT, UPDATE, DELETE)�� COMMIT ���̴� ���̺� �����ݿ����� �ʴ´�.
--  => ROLLBACK ����
-- DROP, TRUNCATE�� ROLLBACK �Ұ�
INSERT INTO īī����ũ
    VALUES ('3333-01-010-0102', 'ȫ�浿', 200);
    
INSERT INTO īī����ũ
     VALUES ('3333-92-912-0423', '���Ѻ�', 200);

INSERT INTO īī����ũ
     VALUES ('3333-01-010-0000','������',100);

COMMIT;


SELECT *
 FROM īī����ũ;
 
ROLLBACK; --��������


-- �۱� Ʈ����� ���� (���Ѻ�- > ������ 100�� �۱�)

-- 1. ���Ѻ����� ���¿� �ܾ��� 100�� �̻� �ִ��� (SELECT)
SELECT *
  FROM īī����ũ
WHERE �̸� = '���Ѻ�' AND �ܾ� >= 100;

-- ��Ǯ��
SELECT *
  FROM īī����ũ
WHERE �̸� = '���Ѻ�' 
  AND �ܾ� >= 100;

-- 2. ���Ѻ����� ���¿��� 100�� ���� (UPDATE SET)
UPDATE īī����ũ
   SET �ܾ� = �ܾ� - 100
WHERE �̸� = '���Ѻ�';

-- ��Ǯ��
UPDATE īī����ũ
   SET �ܾ� = 100 --(�ܾ� -100)�� ����
 WHERE �̸� = '���Ѻ�';
 
-- 3. �������� ���¿� 100�� �߰� (UPDATE SET)
UPDATE īī����ũ
   SET �ܾ� = �ܾ� + 100
WHERE �̸� = '������';

-- ��Ǯ��
UPDATE īī����ũ
   SET �ܾ� = �ܾ� + 100
 WHERE �̸� = '������';
 
-- 4. COMMIT ���� ����
COMMIT;
-- 5. īī����ũ ��ü ���
SELECT *
  FROM īī����ũ;

-- 5-1. Ʈ����� ����X ����
INSERT INTO īī����ũ
     VALUES ('3333-01-010-0122','�ں���',999999); 
     
    
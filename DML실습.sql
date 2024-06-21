
/* 
   DML ���� ������ Ǯ���մϴ� 
   !!���ǻ��� 
   ==> �� ������ ���������� Ǯ���� �ݵ�� COMMIT; ����� �������ּ���.
       �׷��� �����Ͱ� ���������� ���̺� �ݿ��� �˴ϴ�. 
       ���� �����͸� �߸� ó���ߴٸ� ROLLBACK; ��ɾ�� �ǵ��� �� �ֽ��ϴ�.
       �ش� ���� Ǯ������ ������Ŭ��¡ (sampleData.sql �����) �� �������ּ���.
       
   ==> ���� Ǯ�� ���� sampleData.sql �� ������ �ʱ�ȭ�� ���·� �����սô�

*/ 


/*
1. �߰�ŷ��÷��� N-TH-NEW�� ���ο� ȸ���� ȸ�������� �߽��ϴ�.
   �Ʒ� �Էµ� �����Ͱ� TB_CUST ���̺� ��ϵ� �� �ֵ��� ���ּ���. 
   ������ �÷��� ����ڷκ��� �Է¹��� ���� �����͸� �ǹ��մϴ�. 

������ => [  
CUST_ID      : 'NICE123' 
CUST_NAME    : '���̽�'
PASSWD       : '12345' 
JOIN_DT      : ���� ������ �Ͻð� ������ SYSDATE 
DEL_YN       : 'N' 
MONEY        : 0 
STOP_YN      : 'N'
STOP_REL_DY  : NULL 
ACT_POINT    : 0 
PHONE_NO     : '010-1111-2222'
]
*/ 

INSERT INTO TB_CUST
    VALUES('NICE123' ,'���̽�','12345' , NULL, SYSDATE,'N' ,0 ,'N', NULL ,0,'010-1111-2222', NULL);
COMMIT;

-- ��Ǯ��
INSERT INTO TB_CUST ( 
       CUST_ID
     , CUST_NAME
     , PASSWD
     , JOIN_DT
     , DEL_YN
     , MONEY 
     , STOP_YN
     , STOP_REL_DY  --Ȥ�� �Ƚᵵ�� / Ȥ�� �Ʒ� ���� NULL�� �Է� 
     , ACT_POINT 
     , PHONE_NO 
) VALUES ( 
       'NICE123'
     , '���̽�'
     , '12345'
     , SYSDATE
     , 'N'
     , 0
     , 'N'
     , NULL 
     , 0
     , '010-1111-1111'
); 

COMMIT; 

/*
2. ȸ��ID�� 'C0004' �� ȸ���� �����ݾ��� 10000�� �����߽��ϴ�.  
   ������ DML�� �̿��Ͽ� �����͸� �������ּ���. 
   ���� C0004 ȸ���� �����ݾ��� 15000���Դϴ�. �̸� 25000������ ������ּ���. 
*/ 

--SELECT *
--  FROM TB_CUST ;
  
UPDATE TB_CUST 
   SET MONEY = 25000
 WHERE CUST_ID = 'C0004';
COMMIT;

-- �� Ǯ��
UPDATE TB_CUST 
   SET MONEY = MONEY + 10000 
 WHERE CUST_ID = 'C0004';  

COMMIT; 

/*
3. ȸ�� 'C0002' �� ������ ���� �߿��� ����ID��  'B003' �� �����͸� �������ּ���.
   (ȸ���� ������ ���������� TB_CUST_BADGE ���̺� �ֽ��ϴ�) 
*/ 

--SELECT *
--  FROM TB_CUST_BADGE ;
  
DELETE FROM TB_CUST_BADGE
 WHERE CUST_ID = 'C0002'
   AND BADGE_ID = 'B003';
COMMIT;


-- ��Ǯ��
DELETE FROM TB_CUST_BADGE
 WHERE CUST_ID = 'C0002'
   AND BADGE_ID = 'B003' ; 
  
COMMIT; 
/*
4. 2023���� ������ ���ο� �̺�Ʈ�� �����Ϸ��� �մϴ�. (TB_CUST)
   ȸ���� �߿� MONEY 0 �� ��� ���� 1000���� ���׷��̵��Ϸ��� �մϴ�. 
   �̿� �´� ������ �ۼ����ּ���. 
*/

--SELECT *
--  FROM TB_CUST;
  
UPDATE TB_CUST SET MONEY  = 1000
WHERE MONEY  = 0;

COMMIT;

-- ��Ǯ��
UPDATE TB_CUST 
   SET MONEY = 1000 
 WHERE MONEY = 0 ;

COMMIT; 

/*
5. ȸ������ó ���̺��� A0002 ȸ���� ������ ���� �����Ͱ� ���Խ��ϴ�. 

   �޴��� : '010-9999-9999'
   ����ȭ : '062-999-9999' 

   ȸ������ó ���̺��� Ȯ���ؼ� �̹� �����ϴ� ����ó��� UPDATE �� , �������� �ʴ� ����ó��� INSERT �� �������ּ���. 
   �����ڵ�
   (��Ʈ: SELECT * FROM ȸ������ó WHERE ȸ��ID = 'A0002' )
*/ 
SELECT *
  FROM ȸ������ó
 WHERE ȸ��ID = 'A0002';

UPDATE ȸ������ó SET ����ó = '062-999-9999'
 WHERE ȸ��ID = 'A0002';

INSERT INTO ȸ������ó
    VALUES ('A0002','�޴���', '010-9999-9999');

COMMIT;


-- ��Ǯ��

SELECT * 
  FROM ȸ������ó 
 WHERE ȸ��ID = 'A0002';  --����ȭ�� �����Ƿ� ������Ʈ , �޴����� �����Ƿ� �μ�Ʈ 

UPDATE ȸ������ó
   SET ����ó = '062-999-9999'
 WHERE ȸ��ID = 'A0002'
   AND �����ڵ� = '����ȭ'; 

--�޴��� ����ó�� ���� �����Ƿ� INSERT �� ���ش�. 
INSERT INTO ȸ������ó ( 
       ȸ��ID
     , �����ڵ�
     , ����ó 
) VALUES ( 
       'A0002'
     , '�޴���'
     , '010-9999-9999' 
);
COMMIT; 


/*
6. TB_IMG ���̺��� �پ��� �̹��� ��ΰ� ����Ǿ� �ִ� ���̺��Դϴ�.
   �߰�ŷ��÷����� ������ ���ܼ� Ȯ���ڰ� 'png' �� �̹����� ��� ������ �ϱ�� �Ͽ����ϴ�.
   ������ ������ �̿��� IMG_PATH ���� .png �� ������ ��� �����͸� �������ּ���. 
   ���� ����� 5�Ǹ� ������ ��� .jpg Ȯ���ڸ� ���� �˴ϴ�. 
*/ 

--��, ���ϵ� ī�� %

SELECT *
  FROM TB_IMG
 WHERE IMG_PATH LIKE '%.png'; -- (x) ' ' �� ��������!!!

DELETE FROM TB_IMG
WHERE IMG_PATH LIKE '%.png';

COMMIT;

-- ��Ǯ��
DELETE FROM TB_IMG 
 WHERE IMG_PATH LIKE '%.png';

COMMIT ;



/* 
7.  TB_DEAL ���̺��� ��� �����͸� �������ּ���.  (DELETE)
*/ 

SELECT *
  FROM TB_DEAL;

DELETE FROM TB_DEAL;

COMMIT;

-- ��Ǯ��
DELETE FROM TB_DEAL ;
COMMIT; 


--�������̽��ϴ�.
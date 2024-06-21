
/* 
   DML 문법 문제를 풀이합니다 
   !!주의사항 
   ==> 각 문항을 정상적으로 풀고나면 반드시 COMMIT; 명령을 실행해주세요.
       그래야 데이터가 영구적으로 테이블에 반영이 됩니다. 
       만약 데이터를 잘못 처리했다면 ROLLBACK; 명령어로 되돌릴 수 있습니다.
       해당 문제 풀이전에 데이터클렌징 (sampleData.sql 재실행) 을 진행해주세요.
       
   ==> 문제 풀이 전에 sampleData.sql 을 실행해 초기화한 상태로 진행합시다

*/ 


/*
1. 중고거래플랫폼 N-TH-NEW에 새로운 회원이 회원가입을 했습니다.
   아래 입력된 데이터가 TB_CUST 테이블에 등록될 수 있도록 해주세요. 
   누락된 컬럼은 사용자로부터 입력받지 않은 데이터를 의미합니다. 

데이터 => [  
CUST_ID      : 'NICE123' 
CUST_NAME    : '나이스'
PASSWD       : '12345' 
JOIN_DT      : 현재 시점의 일시가 들어가도록 SYSDATE 
DEL_YN       : 'N' 
MONEY        : 0 
STOP_YN      : 'N'
STOP_REL_DY  : NULL 
ACT_POINT    : 0 
PHONE_NO     : '010-1111-2222'
]
*/ 

INSERT INTO TB_CUST
    VALUES('NICE123' ,'나이스','12345' , NULL, SYSDATE,'N' ,0 ,'N', NULL ,0,'010-1111-2222', NULL);
COMMIT;

-- 쌤풀이
INSERT INTO TB_CUST ( 
       CUST_ID
     , CUST_NAME
     , PASSWD
     , JOIN_DT
     , DEL_YN
     , MONEY 
     , STOP_YN
     , STOP_REL_DY  --혹은 안써도됨 / 혹은 아래 값에 NULL을 입력 
     , ACT_POINT 
     , PHONE_NO 
) VALUES ( 
       'NICE123'
     , '나이스'
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
2. 회원ID가 'C0004' 인 회원이 보유금액을 10000원 충전했습니다.  
   적절한 DML을 이용하여 데이터를 변경해주세요. 
   현재 C0004 회원은 보유금액이 15000원입니다. 이를 25000원으로 만들어주세요. 
*/ 

--SELECT *
--  FROM TB_CUST ;
  
UPDATE TB_CUST 
   SET MONEY = 25000
 WHERE CUST_ID = 'C0004';
COMMIT;

-- 쌤 풀이
UPDATE TB_CUST 
   SET MONEY = MONEY + 10000 
 WHERE CUST_ID = 'C0004';  

COMMIT; 

/*
3. 회원 'C0002' 가 보유한 배지 중에서 배지ID가  'B003' 인 데이터를 삭제해주세요.
   (회원이 보유한 배지정보는 TB_CUST_BADGE 테이블에 있습니다) 
*/ 

--SELECT *
--  FROM TB_CUST_BADGE ;
  
DELETE FROM TB_CUST_BADGE
 WHERE CUST_ID = 'C0002'
   AND BADGE_ID = 'B003';
COMMIT;


-- 쌤풀이
DELETE FROM TB_CUST_BADGE
 WHERE CUST_ID = 'C0002'
   AND BADGE_ID = 'B003' ; 
  
COMMIT; 
/*
4. 2023년을 맞이해 새로운 이벤트를 진행하려고 합니다. (TB_CUST)
   회원들 중에 MONEY 0 인 대상에 대해 1000으로 업그레이드하려고 합니다. 
   이에 맞는 쿼리를 작성해주세요. 
*/

--SELECT *
--  FROM TB_CUST;
  
UPDATE TB_CUST SET MONEY  = 1000
WHERE MONEY  = 0;

COMMIT;

-- 쌤풀이
UPDATE TB_CUST 
   SET MONEY = 1000 
 WHERE MONEY = 0 ;

COMMIT; 

/*
5. 회원연락처 테이블에서 A0002 회원에 다음과 같이 데이터가 들어왔습니다. 

   휴대폰 : '010-9999-9999'
   집전화 : '062-999-9999' 

   회원연락처 테이블을 확인해서 이미 존재하는 연락처라면 UPDATE 를 , 존재하지 않는 연락처라면 INSERT 를 진행해주세요. 
   구분코드
   (힌트: SELECT * FROM 회원연락처 WHERE 회원ID = 'A0002' )
*/ 
SELECT *
  FROM 회원연락처
 WHERE 회원ID = 'A0002';

UPDATE 회원연락처 SET 연락처 = '062-999-9999'
 WHERE 회원ID = 'A0002';

INSERT INTO 회원연락처
    VALUES ('A0002','휴대폰', '010-9999-9999');

COMMIT;


-- 쌤풀이

SELECT * 
  FROM 회원연락처 
 WHERE 회원ID = 'A0002';  --집전화는 있으므로 업데이트 , 휴대폰은 없으므로 인서트 

UPDATE 회원연락처
   SET 연락처 = '062-999-9999'
 WHERE 회원ID = 'A0002'
   AND 구분코드 = '집전화'; 

--휴대폰 연락처는 따로 없으므로 INSERT 를 해준다. 
INSERT INTO 회원연락처 ( 
       회원ID
     , 구분코드
     , 연락처 
) VALUES ( 
       'A0002'
     , '휴대폰'
     , '010-9999-9999' 
);
COMMIT; 


/*
6. TB_IMG 테이블은 다양한 이미지 경로가 저장되어 있는 테이블입니다.
   중고거래플랫폼이 사정이 생겨서 확장자가 'png' 인 이미지는 모두 삭제를 하기로 하였습니다.
   적절한 조건을 이용해 IMG_PATH 값이 .png 로 끝나는 모든 데이터를 삭제해주세요. 
   실행 결과는 5건만 남으며 모두 .jpg 확장자만 남게 됩니다. 
*/ 

--헷갈, 와일드 카드 %

SELECT *
  FROM TB_IMG
 WHERE IMG_PATH LIKE '%.png'; -- (x) ' ' 로 감싸주자!!!

DELETE FROM TB_IMG
WHERE IMG_PATH LIKE '%.png';

COMMIT;

-- 쌤풀이
DELETE FROM TB_IMG 
 WHERE IMG_PATH LIKE '%.png';

COMMIT ;



/* 
7.  TB_DEAL 테이블의 모든 데이터를 삭제해주세요.  (DELETE)
*/ 

SELECT *
  FROM TB_DEAL;

DELETE FROM TB_DEAL;

COMMIT;

-- 쌤풀이
DELETE FROM TB_DEAL ;
COMMIT; 


--수고많으셨습니다.
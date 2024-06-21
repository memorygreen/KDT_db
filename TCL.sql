/*********************** TCL ********************/

-- TCL : 트랜잭션 제어어
-- 트랜잭션(TRANSACTION) : 업무를 수행하기 위한 최소 수행 단위

-- 트랜잭션의 4가지 특성 : 원일고지
-- 1. 원자성(Automicity) : ALL or Noting (송금 성공/ 실패)
-- 2. 일관성(Consistency) : 언제나 일관성있게 유지
-- 3. 고립성(Isolation) : 트랜잭션 실행 시 다른 트랜잭션에 영향 X
-- 4. 지속성(Durability) : 한 번 COMMIT 한 트랜잭션은 영원히 반영

-- COMMIT : DB에 영구적으로 저장
-- ROLLBACK : 트랜잭션 취소, 마지막 COMMIT 시점까지는 복구 가능

CREATE TABLE 카카오뱅크(
    계좌번호 VARCHAR2(50) PRIMARY KEY,
    이름 VARCHAR2(12),
    잔액 NUMBER    
);
    
INSERT INTO 카카오뱅크
    VALUES ('3333-01-010-0102', '홍길동', 200);

SELECT *
 FROM 카카오뱅크;
 
ROLLBACK;

-- 롤백했더니 INSERT 했던 계좌가 사라짐
-- DML(INSERT, UPDATE, DELETE)은 COMMIT 없이는 테이블에 영구반영되지 않는다.
--  => ROLLBACK 가능
-- DROP, TRUNCATE는 ROLLBACK 불가
INSERT INTO 카카오뱅크
    VALUES ('3333-01-010-0102', '홍길동', 200);
    
INSERT INTO 카카오뱅크
     VALUES ('3333-92-912-0423', '김한빛', 200);

INSERT INTO 카카오뱅크
     VALUES ('3333-01-010-0000','김현빈',100);

COMMIT;


SELECT *
 FROM 카카오뱅크;
 
ROLLBACK; --안지워짐


-- 송금 트랜잭션 실행 (긴한빛- > 김현빈 100원 송금)

-- 1. 김한빛씨의 계좌에 잔액이 100원 이상 있는지 (SELECT)
SELECT *
  FROM 카카오뱅크
WHERE 이름 = '김한빛' AND 잔액 >= 100;

-- 쌤풀이
SELECT *
  FROM 카카오뱅크
WHERE 이름 = '김한빛' 
  AND 잔액 >= 100;

-- 2. 김한빛씨의 계좌에서 100원 차감 (UPDATE SET)
UPDATE 카카오뱅크
   SET 잔액 = 잔액 - 100
WHERE 이름 = '김한빛';

-- 쌤풀이
UPDATE 카카오뱅크
   SET 잔액 = 100 --(잔액 -100)도 가능
 WHERE 이름 = '김한빛';
 
-- 3. 김현빈씨의 계좌에 100원 추가 (UPDATE SET)
UPDATE 카카오뱅크
   SET 잔액 = 잔액 + 100
WHERE 이름 = '김현빈';

-- 쌤풀이
UPDATE 카카오뱅크
   SET 잔액 = 잔액 + 100
 WHERE 이름 = '김현빈';
 
-- 4. COMMIT 으로 저장
COMMIT;
-- 5. 카카오뱅크 전체 출력
SELECT *
  FROM 카카오뱅크;

-- 5-1. 트랜잭션 저장X 상태
INSERT INTO 카카오뱅크
     VALUES ('3333-01-010-0122','박병관',999999); 
     
    
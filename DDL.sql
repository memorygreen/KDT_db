-- 2024.01.15.
/**********************DDL*******************/
-- DDL : 데이터 정의어
-- 테이블과 같은 데이터 구조를 정의하는데 사용하는 명령어
-- CREATE : 새로운 객체를 생성할 때 사용하는 명령어

-- CREATE로 테이블(TABLE ) 생성하는 방법
CREATE TABLE 테이블 이름(
    컬럼이름 자료형(크기) [기본값] [NULL여부]
);

-- 자영 : EMPLOYEES 테이블 ->한글로 만들기
-- 소수점 무시, NULLABLE 확인, 
-- CTRL+ENTER 실행하지 말고 완성된 코드 캡쳐해서 단톡방에 올리기

CREATE TABLE 직원(
    직원ID NUMBER(6) NOT NULL,
    이름 VARCHAR2(20),
    성 VARCHAR(25) NOT NULL,
    이메일 VARCHAR(25) NOT NULL,
    핸드폰 VARCHAR2(20),
    입사일 DATE NOT NULL,
    직업ID VARCHAR(10) NOT NULL,
    급여 NUMBER(8,2),
    수수료비율 NUMBER(2),
    매니저ID NUMBER(6),
    부서ID NUMBER(4) 
    );

-- CREATE 실습2
-- 자영 :  부서 테이블 한글로 만들기
CREATE TABLE 부서(
    부서ID NUMBER(4) NOT NULL,
    부서이름 VARCHAR(30) NOT NULL,
    매니저ID NUMBER(6),
    위치ID NUMBER(4)
);

-- 제약조건
-- PK (PRIMARY KEY) : 중복불가 + NULL불가 = >행을 식별할 수 있는 컬럼(자영 : 식별자 역할)
-- UK ( UNIQUE KEY) : 중복불가 + NULL 가능
-- NOT NULL
-- CHECK : 지정된 데이터만 입력 가능
-- FK (FOREIGN KEY) : 외래키, 두 테이블을 연결하는 키

-- 제약조건을 추가하는 문법!
-- 자영 : 현업에서도 바뀔 가능성 있어서 제약조건만 나중에 추가함!!
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼);

-- 1. PK 추가 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_직원ID_PK PRIMARY KEY(직원ID);
--자영 : 제약조건명은 마음대로 써도 되지만 보통 형식 정해져있음

-- 2. UK 추가 지정 (이메일)
ALTER TABLE 직원 ADD CONSTRAINT 직원_이메일_UK UNIQUE(이메일);

-- 3. CHECK 지정 (급여를 0초과)
ALTER TABLE 직원 ADD CONSTRAINT 직원_급여_CK CHECK(급여>0);

-- 테이블 상세정보 확인하는 방법: 테이블 드래그 + SHIFT + F4

-- 4. FK 추가 지정(외래키)
-- 자영 : 중복이 없는 키만 가져올 수 있음(PK, UK)
-- FK는 다른 테이블의 UK와 PK일때만 참조 가능
-- 따라서 내가 참조할 테이블의 컬럼이 PK, UK로 설정이 되어있어야만 FK로 참조 가능
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼) REFERENCES 참조할테이블(참조할컬럼);

-- 직원 테이블에 있는 부서 ID를 FK로 사용
-- 어디서 참조해올거냐면 부서 테이블에 있는 부서ID를 참조

-- 4-1) 부서ID를 PK로 지정 (자영 : 참조할테이블의 참조할컬럼을 PK 또는 UK로 지정해야 FK 사용가능)
ALTER TABLE 부서 ADD CONSTRAINT 부서_부서ID_PK PRIMARY KEY(부서ID);

-- 4-2) 직원 테이블의 부서ID - 부서 테이블 부서ID 참조
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_FK FOREIGN KEY(부서ID)
    REFERENCES 부서(부서ID);
-- 자영 : PK는 테이블에 1개. 만약 확인해보고 PK이미 있으면? UK로 지정해서 연결해야함!

-- 5. NOT NULL 변경
ALTER TABLE 직원 MODIFY 이름 NOT NULL;
-- 자영 :  NULLABLE은 안적으면 무조건 YES로 들어가기때문에 추가 아닌 수정!

-- 6. 제약조건 삭제
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
ALTER TABLE 직원 DROP CONSTRAINT 직원_급여_CK;

-- 7. 제약조건 조회
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = '직원';
 
-- 8. 제약조건을 테이블 생성 시에 추가
CREATE TABLE 제약조건테스트(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NN테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(CK테스트 > 0)
);
-- 테이블 -> 오른쪽 마우스 -> 새로고침
-- 제약조건테스트 드래그 -> SHIFT + F4 -> 테이블 상태 확인

-- 9. 테이블 삭제
-- DROP TABLE 테이블명; : 테이블 영구 삭제 (+ 안에 있는 데이터까지 삭제)
-- 자영 : DROP 하면 영구삭제! 무슨 일을 해도 못 살림!

DROP TABLE 제약조건테스트;

DROP TABLE 부서;
-- DROP TABLE 테이블명 CASCADE CONSTRAINT : 테이블, 데이터, FK관계 전부 삭제
-- (자영 : 삭제할건데 참조하고있는, 제약조건 딸린 것까지 싹 다 지워줘!! 웬만하면 사용추천X)
-- 원래대로라면 제약조건 삭제한 다음에 -> DROP TABLE

-- 실습(숙제)
CREATE TABLE 네이버블로그(
    블로그번호 NUMBER,
    블로그제목 VARCHAR(100) NOT NULL,
    블로그내용 VARCHAR(4000),
    ID VARCHAR(15)
);

CREATE TABLE 네이버회원(
    ID VARCHAR(15),
    이름 VARCHAR(12) NOT NULL,
    비밀번호 VARCHAR(16),
    생년월일 DATE,
    성별 VARCHAR(3)
);

ALTER TABLE 네이버회원 ADD CONSTRAINT 회원_ID_PK PRIMARY KEY(ID);
ALTER TABLE 네이버회원 ADD CONSTRAINT 회원_성별_CK CHECK(성별 = "남" OR 성별 = "여"); --자영 모르겠음 ㅠㅠ

ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_번호_CK PRIMARY KEY(블로그번호);

ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_회원_ID_FK FOREIGN KEY(ID) REFERENCES 네이버회원(ID);

-- 2024.01.16.
-- 쌤 풀이

-- 1.
CREATE TABLE 네이버블로그(
    블로그번호 NUMBER(4),
    블로그제목 VARCHAR2(100) NOT NULL, --자영 틀림 VARCHAR2
    블로그내용 VARCHAR2(4000), --자영 틀림 VARCHAR2
    네이버ID VARCHAR2(15)
);

-- 2.
CREATE TABLE 네이버회원(
    네이버ID VARCHAR2(15),
    이름 VARCHAR2(12) NOT NULL, 
    비밀번호 VARCHAR2(16),
    생년월일 DATE,
    성별 VARCHAR2(3)
);

-- 3.
-- 네이버회원 TABLE -> PK : 네이버ID
ALTER TABLE 네이버회원 ADD CONSTRAINT 회원_ID_PK PRIMARY KEY(네이버ID) ;

-- CHECK : 성별 (남,여)
ALTER TABLE 네이버회원 ADD CONSTRAINT 회원_성별_CK CHECK(성별 IN('남','여'));

-- PK : 블로그 ID
ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_번호_PK PRIMARY KEY(블로그번호);

-- FK : 블로그 테이블 ID - 회원 테이블 ID 참조
ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_회원ID_FK FOREIGN KEY(네이버ID) 
    REFERENCES 네이버회원(네이버ID);
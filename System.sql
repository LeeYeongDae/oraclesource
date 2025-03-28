-- 오라클 관리자
-- system, sys(최고권한)

-- 사용자이름 : sys as sysdba
-- 비밀번호 :	-> 대소문자 구분

-- 코드에서 ctrl + enter 한줄 실행

-- 오라클 12c 버전 부터 사용자 계정 생성시 접두어(c##) 요구
-- c##을 사용하지 않을 때 아래 명령어
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- @경로 : 경로의 파일 실행

-- 비밀번호 변경
--ALTER USER hr IDENTIFIED BY hr;

-- 계정 잠금 해제
--ALTER USER hr account unlock;

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; --C##을 사용자명 앞에 적는걸로 대체됨

CREATE USER JAVA IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

GRANT CONNECT, RESOURCE TO JAVA;

CREATE USER TEST2 IDENTIFIED BY 12345;
DROP USER TEST1 CASCADE;
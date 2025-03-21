SELECT e.FIRST_NAME, e.LAST_NAME, e.JOB_ID FROM EMPLOYEES e;

SELECT * FROM EMPLOYEES e ORDER BY e.JOB_ID DESC ; --ASC

SELECT e.LAST_NAME, e.SALARY FROM EMPLOYEES e WHERE e.SALARY NOT BETWEEN 5000 AND 12000;

SELECT e.LAST_NAME, e.DEPARTMENT_ID FROM EMPLOYEES e WHERE (e.DEPARTMENT_ID IN 20 OR e.DEPARTMENT_ID IN 50) ORDER BY e.LAST_NAME ASC;

SELECT e.LAST_NAME ,e.DEPARTMENT_ID FROM EMPLOYEES e WHERE e.SALARY NOT IN (2500, 3500 , 7000) AND e.JOB_ID NOT IN ('INSA_REP', 'ST_CLERK');

SELECT * FROM EMPLOYEES e WHERE e.HIRE_DATE BETWEEN '2014-01-01' AND '2014-12-31';

SELECT e.EMPLOYEE_ID, e.LAST_NAME FROM EMPLOYEES e WHERE e.LAST_NAME LIKE '%u%';

SELECT e.EMPLOYEE_ID, e.LAST_NAME FROM EMPLOYEES e WHERE e.LAST_NAME LIKE '___a%';

SELECT e.EMPLOYEE_ID, e.LAST_NAME FROM EMPLOYEES e WHERE e.LAST_NAME LIKE '%a%' OR E.LAST_NAME LIKE '%e%' ORDER BY e.LAST_NAME DESC;

SELECT e.EMPLOYEE_ID, e.LAST_NAME FROM EMPLOYEES e WHERE e.LAST_NAME LIKE '%a%' AND E.LAST_NAME LIKE '%e%' ORDER BY e.LAST_NAME DESC;

SELECT e.LAST_NAME, e.JOB_ID FROM EMPLOYEES e WHERE e.MANAGER_ID IS NULL;

SELECT DISTINCT e.DEPARTMENT_ID FROM EMPLOYEES e WHERE NOT (e.JOB_ID = 'ST_CLERK') AND e.DEPARTMENT_ID IS NOT NULL;

SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.JOB_ID, (e.COMMISSION_PCT * e.SALARY) as COMMISSION 
FROM EMPLOYEES e 
WHERE e.COMMISSION_PCT IS NOT NULL ;

--FIRST_NAME이 'Curtis'인 사람의 first,last,email,phone,job_id 조회 / job_id는  소문자로
SELECT e.FIRST_NAME, e.LAST_NAME, e.EMAIL, e.PHONE_NUMBER, LOWER(e.JOB_ID)AS job_id 
FROM EMPLOYEES e;
--부서번호 60,70,80,90인 사원들의 사번,first,last,hire,job_id 조회 / job_id가 IT_PROG면 프로그래머로 변경
SELECT e.FIRST_NAME, e.LAST_NAME, e.EMAIL, e.HIRE_DATE, REPLACE(e.JOB_ID,'IT_PROG','프로그래머') 
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (60, 70, 80, 90);

--job_id가 'AD_PRESS' 'PU_CLERK'인 사원들의 사번,first,last, 부서번호,job_id 조회 / 사원명은 first last로 출력
SELECT e.FIRST_NAME||' ' ||e.LAST_NAME, e.EMAIL, e.DEPARTMENT_ID, e.JOB_ID
FROM EMPLOYEES e
WHERE e.JOB_ID IN ('AD_PRESS', 'PU_CLERK');

SELECT e.EMPLOYEE_ID, e.HIRE_DATE, ADD_MONTHS(e.HIRE_DATE, 120)
FROM EMPLOYEES e;

SELECT * FROM EMP e WHERE e.DEPTNO(10,20);

SELECT e.empno, e.ENAME, e.SAL FROM EMP e WHERE e.DEPTNO = 10;
UNION
SELECT e.empno, e.ENAME, e.SAL FROM EMP e WHERE e.DEPTNO = 20;

SELECT e.ENAME FROM EMP e WHERE LENGTH(e.ENAME) >= 5;

--dual sys 소유 테이블(임시연산, 함수의 결과값 확인 용도)
SELECT LENGTH('한글'), LENGTHB('한글') FROM dual;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM dual;

SELECT * FROM EMP e WHERE INSTR(e.ename, 'S')>0;

SELECT CONCAT(e.EMPNO, CONCAT(' : ', e.ENAME)) AS N FROM EMP e;
SELECT e.EMPNO||' : '||e.ENAME  FROM EMP e ;
SELECT 
	'[' || TRIM(' __ORACLE__ ')||']' AS trim,
	'[' || TRIM(LEADING FROM ' __ORACLE__ ')||']' AS trim_leading,
	'[' || TRIM(TRAILING FROM ' __ORACLE__ ')||']' AS trim_trailing,
	'[' || TRIM(BOTH FROM ' __ORACLE__ ')||']' AS trim_both,
	'[' || RTRIM(' __ORACLE__ ',' _')||']' AS trim2
	FROM dual;


SELECT 
	ROUND(12.34), ROUND(12.34, 0), ROUND(12.34, 1), round(12.34, -1),
	TRUNC(12.34), trunc(12.34, 0), trunc(12.34, 1), TRUNC(12.34, -1),
	ceil(12.3), ceil(-12.3), floor(12.3), floor(-12.3),
	mod(12,5), mod(32, 7)
FROM dual;

SELECT e.EMPNO , e.ENAME, e.HIREDATE
FROM EMP e
WHERE ADD_MONTHS(e.hiredate, 480) < SYSDATE;

SELECT MAX(e.SALARY)-MIN(e.SALARY) AS "DIST_SAL" FROM EMPLOYEES e;
SELECT COUNT(DISTINCT e.MANAGER_ID) AS "MANAGER_COUNT" FROM EMPLOYEES e;

--부서별직원수, 부서번호 오름차순
SELECT e.DEPARTMENT_ID, COUNT(e.EMPLOYEE_ID) FROM EMPLOYEES e GROUP BY e.DEPARTMENT_ID ORDER BY e.DEPARTMENT_ID ASC;

--부서별 평균 연봉 조회 오름차순 소수점 반올림
SELECT e.DEPARTMENT_ID, ROUND(AVG(e.SALARY),0) FROM EMPLOYEES e GROUP BY e.DEPARTMENT_ID ORDER BY e.DEPARTMENT_ID ASC;

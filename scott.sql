
SELECT * FROM EMP e;

SELECT e.EMPNO, e.ENAME, e.job FROM EMP e; 

SELECT e.EMPNO, e.DEPTNO FROM EMP e;

SELECT DISTINCT e.EMPNO, e.DEPTNO FROM EMP e;

SELECT  * FROM EMP e ORDER BY e.DEPTNO DESC, e.ENAME ASC;

SELECT * FROM EMP e WHERE e.sal BETWEEN 2000 AND 3000;

SELECT * FROM EMP e WHERE e.ENAME LIKE '_L%';

SELECT * FROM EMP e WHERE e.ENAME LIKE '%AM%';

SELECT * FROM EMP e WHERE e.ENAME NOT LIKE '%AM%';

SELECT * FROM EMP e WHERE e.MGR IS not NULL;

SELECT sysdate AS now, sysdate-1 AS yesterday, sysdate+1 AS tomorrow,
	CURRENT_DATE AS curdate, CURRENT_TIMESTAMP AS curtime
FROM dual;

SELECT sysdate, ADD_MONTHS(sysdate, 3)
FROM dual;

SELECT e.EMPNO, e.ENAME, e.HIREDATE, TRUNC(MONTHS_BETWEEN(sysdate, e.HIREDATE))
FROM EMP e;

SELECT sysdate, NEXT_DAY(sysdate,'월요일'), LAST_DAY(sysdate)
FROM dual;
 	--자동 형변환
SELECT e.EMPNO, e.ENAME, e.EMPNO+'500'
FROM EMP e 
WHERE e.ENAME = 'SMITH';

SELECT TO_CHAR(sysdate,'YYYY/MM/DD, YY MON MONTH DY DAY HH:MI:SS HH12 HH24 AM PM')
FROM dual;
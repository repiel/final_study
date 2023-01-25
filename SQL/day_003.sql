-- 형(data type)변환 함수 : 숫자, 문자, 날짜 데이터형을 다른 데이터형으로 변환하는 함수
-- 종류 : to_number, to_char, to_date
-- number - character - date 

-- to_char : 날짜형 또는 숫자형을 문자형으로 변환하는 함수
select sysdate from dual;

--format(서식) : yy/yyyy, mm, dd
select sysdate, to_char(sysdate, 'yyyy-mm-dd')
from dual;

-- 사원들의 입사일을 출력하되, 요일을 함께 출력하시오.
-- day : 요일
select hiredate, to_char(hiredate, 'yyyy-mm-dd day')
from emp;

-- 현재 시스템의 날짜와 시간을 출력하는 쿼리문을 기술하시오
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss')
from dual;


-- L : 각 지역별 통화 기호가 붙는다.
-- 숫자대신사용되는 기호 : 0과 9
-- 자릿수가 맞지 않을 경우 0은 0으로 채우고, 9는 채우지 않는다.
-- ex)데이터의 값이 8 => 서식기호 00점 : 08점 or 99점 : 8점
-- 1000 => 서식기호 0,000원 : 1,000원
-- 800 => 서식기호 0,000원 : 0,800원
select ename, sal, to_char(sal,'L999,999')
from emp;

-- to_date : 문자형을 날짜형으로 변환하는 함수
-- 기본 날짜 형식 : yy/mm/dd 
select ename, hiredate
from emp
where hiredate = to_date(19810220,'yyyy/mm/dd');

-- to_number : 문자나 날짜 형식의 데이터를 숫자형으로 변환하는 함수
--20,000과 10,000 값 사이의 차를 알아보는 쿼리문을 기술하시오
select to_number('20,000','99,999') - to_number('10,000','99,999')
from dual;

select 20000 - 10000 
from dual;

select *
from emp;

-- NVL함수 : NULL을 다른 값으로 변환하는 함수

-- 직원의 연봉을 계산해서 출력하는 쿼리문을 기술하시오.
-- 연봉 = 직원의 급여 * 12 + comm

select ename, sal, sal * 12 + nvl(comm,0) as "연봉"
from emp;

-- 그룹함수(Group Function) : 하나 이상의 행을 그룹으로 묶어서 연산을 수행하는 함수
-- sum : 해당 컬럼에 총합을 구하는 함수
-- 사원들의 급여의 총합을 출력하는 쿼리문을 기술하시오.
select sum(sal) from emp;

-- comm의 총합을 구하시오.
-- 그룹함수는 다른 연산자와 달리 해당 컬럼값이 NULL인 것은 제외하고 계산한다.
select sum(comm) from emp;

-- avg : 해당 컬럼 값의 평균을 구하는 함수
-- 직원 급여의 평균을 계산하는 쿼리문을 기술하시오.
select round(avg(sal)) from emp;

-- max/min : 최댓값과 최솟값을 구하는 함수
-- 가장 높은 급여과 낮은 급여를 추출하는 쿼리문을 기술하시오.
select max(sal) "최대급여", min(sal) "최소급여" 
from emp;

-- 가장 높은 급여를 받는 직원의 이름과 급여를 추출하는 쿼리문을 기술하시오.
-- 필드명으로 들어가는 것이 아니라 조건문으로 max가 들어간다
select ename, sal
from emp
where sal = max(sal);

-- count : 조건에 만족하는 행의 개수를 반환하는 함수
-- count 함수에 특정 컬럼을 담으면 해당 컬럼에 값을 담고 있는 행의 개수를 반환
-- count 함수는 NULL 값에 대한 개수를 세지 않는다.
-- 직원의 수를 추출하는 쿼리문을 기술하시오.
select count(ename) 
from emp;

-- 직원들이 담당하는 업무의 건수를 계산하여 추출하는 쿼리문을 기술하시오.
select count(distinct job) 
from emp;

-- group by 절
-- 특정 칼럼을 기준으로 그룹화하여 해당 그룹에 존재하는 레코드를 대상으로 연산수행하는 함수
-- 그룹함수를 사용하되, 특정 컬럼을 대상으로 적용할지를 기술할 때 사용

-- 직원의 급여의 합을 추출하는 쿼리문을 기술하시오.
-- 단, 각 부서별 직원의 급여의 합이 출력되도록 기술할 것.
-- 부서별 급여의 합을 출력하는 쿼리문을 기술하시오

select deptno, sum(sal)
from emp
group by deptno; 

-- 소속부서별 급여의 총합과 평균급여를 추출하는 쿼리문을 기술하시오.
-- 단, 부서번호, 총급여, 평균급여 라는 컬럼명을 표시하시오.
select deptno "부서번호", sum(sal)"총급여" ,round(avg(sal),2) "평균급여"
from emp
group by deptno;

-- 부서별 사원수와 커미션을 받는 사원의 수를 추출하는 쿼리문을 기술하시오.
-- 직원의 수
select count(*)
from emp;

select deptno, count(*) "부서별 사원수" , count(comm) "커미션을 받는 사원수"
from emp
group by deptno;
-- 10번, 20번, 30번

-- having 절 : group by 절에 의해 생성된 결과 값에 원하는 조건식을 담는 절
-- 조건절 : where절과 having절(그룹절과 함께 쓴다)
-- 부서별 평균급여를 출력하는 쿼리문을 기술하시오.
select deptno, round(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000;

-- 부서별 직급단위 급여의 평균을 추출하는 쿼리문을 기술하시오.
select deptno, job, round(avg(sal))
from emp
group by deptno, job
order by deptno;

select ename, deptno, avg(sal)
from emp
group by deptno;
-- ename을 넣으면 14개의 결과가 나와야 하므로 그룹으로 묶을 수 없어서 에러가 난다. 

-- 조인(join) : 하나 이상의 테이블을 연결하여 조건에 만족하는 자료를 추출하는 기능
-- 직원이름, 부서번호, 부서명을 추출하는 쿼리문을 기술하시오.
select * from emp;
select * from dept;

-- 직접연결연산자(direct 연산자 : .)

select ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

-- cartesian product :  카티션 곱
-- 두 개 이상의 테이블에 존재하는 모든 데이터를 검색 결과르 갖는다.
-- 두 개 이상의 테이블에 공통에 컬럼이 존재하지 않을 경우

select *
from emp, dept;


select *
from emp;

select *
from dept;

-- equal join : 공통의 컬럼을 대상으로 테이블을 연결하는 기능
-- 사원정보를 출력하되, 해당 사원의 부서에 대한 상세정보가 함께 출력되도록 구현
select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

-- 이름이 scott인 사원의 부서명을 찾아 이름과 부서명이 출력되는 쿼리문을 기술하시오
select deptno
from emp
where ename ='SCOTT';

select dname 
from dept
where deptno = 20;

-- 서브쿼리 : 쿼리안에 또 다른 쿼리를 담아서 표현하는 것

select dname 
from dept
where deptno = (select deptno
from emp
where ename ='SCOTT');

select dname 
from dept
where deptno = (select deptno
from emp
where ename ='SCOTT');

select name, dname
from emp, dept
where ename = 'SCOTT' and emp.deptno = dept.deptno;

select *
from emp, dept
where emp.deptno = dept.deptno;

select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno and ename='SCOTT';

--테이블명에 별칭을 사용할 수 있다.
select ename, dname, e.deptno
from emp e, dept d
where e.deptno = d.deptno and ename='SCOTT';

-- 급여가 2500이하 이고, 사원번호가 9999 이하인 사원의 정보를 출력하시오.
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999 and e.deptno = d.deptno;

-- equi-join : 동일한 값을 가진 컬럼을 대상으로 연결(=)
-- non-equi join : 동일한 컬럼의 값이 없고 크거나 작거나 하는 경우

select * from tab;

select * from salgrade;

select * from emp;

select ename, sal, grade
from emp e ,salgrade s
where sal between losal and hisal;

select ename , dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno and sal between losal and hisal;

-- self-join : 자기 자신과 조인을 하는 기법
-- 일반적으로 조인은 여러개의 테이블을 연결하는 기법이지만 하나의 테이블 안에서
-- 조인을 해야 정보를 얻어내는 경우에 사용한다.
-- 직원테이블을 이용하여 해당 직원의 상사에 이름을 추출
select * from emp;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno;

-- outer join : 외부조인
-- Left outer join, Right outer join
-- 조인 조건에 맞지 않는 행도 나타내는 조인 기법
select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno(+); -- Left outer join;

-- 서브쿼리
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;

select dname 
from dept 
where deptno = (select deptno from emp where ename = 'SCOTT');

-- 단일행 서브 쿼리 : 수행 결과가 오직 하나의 행으로만 반환하는 것.
-- 단일행 비교 연산자: =,<>,>,>=,<,<=
-- 사원들의 평균 급여보다 더 많은 급여를 받는 사원 추출
select ename, sal 
from emp
where sal > (select avg(sal)
from emp) ;

select avg(sal)
from emp;

-- scott의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 추출하시오
select ename, sal 
from emp
where sal >=(select sal 
from emp
where ename = 'SCOTT');

-- scott의 급여
select sal 
from emp
where ename = 'SCOTT';

-- 다중행 서브 쿼리 : 서브쿼리의 결과가 두 개 이상인 것
-- 다중행 연산자 : in, any, some, all 
-- in : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 하나라도 일치하면 참
-- 급여가 3000 이상 받는 직원의 부서와 동일한 부서에 근무하는 직원의 정보를 추출
select ename, sal, deptno
from emp
where deptno in (select distinct deptno
from emp
where sal >= 3000);


--급여가 3000 이상 받는 직원의 부서
select distinct deptno
from emp
where sal >= 3000;

select ename, sal, deptno
from emp 
where deptno in (10,20);

select ename, sal, deptno
from emp 
where deptno = 10 or deptno = 20;

-- any, some : 메인 쿼리의 비교조건이 서브쿼리의 결과와 하나 이상 일치하면 참
-- < any : 찾은 값에 대하여 하나라도 크면 참
-- > any : 찾은 값에 대하여 하나라도 작으면 참
-- 부서 번호가 30번인 사원의 급여 중 가장 작은 값(950) 보다 
-- 높은 급여를 받는 사원의 정보를 추출
select sal 
from emp
where deptno = 30;

select ename, sal 
from emp
where sal > any(select sal 
from emp
where deptno = 30);

-- all : 메인 궈리의 비교 조건이 서브쿼리의 결과와 모두 일치하면 참
-- < all : 최솟값 반환
-- > all : 최댓값 반환

-- 부서 번호가 30번인 사원의 급여 중 가장 많이 받는 사원 보다 
-- 높은 급여를 받는 사원의 정보를 추출

select sal 
from emp
where deptno = 30;

select ename, sal 
from emp
where sal > all(select sal 
from emp
where deptno = 30);

-- exists : 메인쿼리의 비교 조건이 서브쿼리의 결과중에 만족하는 값이 하나라도
-- 존재하면 참
-- dept의 deptno가 10, 20인 데이터가 존재한다면, emp 에 해당 퀄리 추출
select ename, deptno
from emp
where deptno = 10 or deptno = 20;

select ename, deptno
from emp
where deptno in(10,20);

select ename, deptno
from emp
where deptno = 50;

select ename, deptno, sal
from emp
where ( select 1 from dept d where d.deptno in(12,20));
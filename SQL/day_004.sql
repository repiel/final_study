-- DDL : create - 새로운 테이블을 생성하는 sql 명령어
create TABLE emp01(
  empno number(4),
  ename varchar2(20),
  sal number(7,2)
);

-- 테이블 구조 확인 : desc
desc emp01

-- 테이블 삭제
drop table emp02;

--기존 데이터 확인
select * from emp;


-- 새로운 테이블을 생성할 때 기존의 테이블과 동일한 구조로 이루어진 테이블 생성시
-- 구조와 내용을 함께 복사해서 새로운 테이블이 생성된다.
create table emp02 as select * from emp;

select * from emp02;

-- 기존 테이블의 일부 필드를 복사해서 새로운 테이블 생성
create table emp03 as select empno, ename from emp;  
select * from emp03;


-- 기존 테이블의 구조만 이용하여 새로운 테이블 생성
-- where 절 : 조건절 주어진 조건이 참 인것만
create table emp05 as select * from emp where 1=0;
desc emp05
select * from emp05;


-- 부서번호가 10번인 직원에 정보를 확인
select * from emp where deptno = 10;

-- 조건에 만족하는 자료만 복사해서 테이블 생성
create table emp04 as select * from emp where deptno =10;
select * from emp04;

-- DDL: alter table - 테이블 구조를 변경하는 SQL 명령어
-- 컬럼의 추가, 수정, 삭제시 사용
-- alter tabel ~ add : 기존 테이블에 새로운 컬럼을 추가하는 명령어
desc emp01 
alter table emp01 add(job varchar2(9)); --add()형식

-- add(), modify()
-- alter modify : 기존 테이블에 컬럼을 수정하는 명령어
-- 수정할 컬럼에 자료가 없는 경우 : 데이터 타입 변경 가능, 컬럼의 크기 변경 가능
-- 수정할 컬럼에 자료가 있는 경우 : 데이터 타입 변경 불가능, 컬럼의 크기 축소 불가능
-- *예외: 수정할 컬럼에 자료가 있더라도 char와 varchar2 사이의 타입은 변경이 가능.

select * from emp01;
alter table emp01 modify(job varchar2(30));

-- alter table ~ drop column : 테이블에 존재하는 컬러을 삭제하는 명령어
-- 여러값을 나열할 경우 drop column 뒤에 ,로 열거하면 된다.
alter table emp01 drop column job;

-- DDL - drop table : 테이블을 제거하는 명령어
-- 한 번 제거된 테이블을 복구 할 수 없다.
desc emp01
drop table emp01;

-- 테이블 삭제 시 주의할 사항
-- 무결성 제약 조건에 있는 테이블을 삭제할 수 없다.
-- 삭제하고자 하는 테이블의 기본키나 고유키를 다른 테이블에서 참조하고 있는 경우

-- DDL - rename : 테이블명을 변경하는 명령어
-- 기존에 사용하는 테이블의 이름을 변경할 때 사용
select * from emp05;
rename emp05 to test;

select * from test;

-- DML : 조작어, 실제 일반 개발자에 의해서 사용되는 명령어 집합
-- 레코드 단위로 조작을 한다.
-- DML - select (필드명) from (테이블명) where(조건식)
-- DML - select : 테이블의 내용(레코드)을 확인, 조건에 만족하는 레코드를 추출
select * -- * : all의 의미
from emp;

-- 조건식 : 참 또는 거짓으로 판정이 되는 식
-- 참 또는 거짓 : 관계식(비교식, 대소관계식), 논리식
-- 관계식 : =(같다),<>(같지않다),!=(같지않다),>,>=,<,<=
-- 논리식 : and(교집합, 논리곱, 모두 참일때 참), or(합집합, 논리합, 어느하나라도 참이면 참)
--         not(여집합, 논리부정, 참이면 거짓으로, 거짓이면 참으로)

select * 
from emp 
where sal >= 2000;

select * 
from emp
where job = 'MANAGER';

select *
from emp
where sal >= 2000 and job ='MANAGER';

select empno, job, sal
from emp
where sal >= 2000 and job = 'MANAGER';

-- DML : insert into ~ values()
-- 새로운 레코드를 추가할 때 사용하는 SQL 명령어
create table dept01 as select * from dept where 1=0; --구조만 가져오는 것
desc dept01

insert into dept01 values(10,'ACCOUNTING','NEW YORK'); 
-- dept 01 뒤에 레코드명을 따로 지정하지 않았을 경우 values 뒤 
-- ()에 레코드 값을 전부 넣어 주어야 한다.

select * from dept01;

insert into dept01(deptno, dname) values(20, 'RESEARCH');
-- values 뒤 ()와 컬럼 dept01()의 ()의 매칭되는 것을 연결해주어야 한다.

insert into dept01(deptno,dname,loc)
values(30,'SALES','CHICAGO');

create table sample(
    h_no number primary key, -- 기본키(개체무결성) :  NULL(x), 중복불가
    h_name varchar2(10) not null,
    score number 
); 

insert into sample(h_no, h_name, score)
values(1234,'AAA',88);
insert into sample(h_no, h_name, score)
values(1234,'BBB',99);
insert into sample(h_no, h_name, score)
values(2345,'BBB',89);
insert into sample(h_no, h_name, score)
values(3456,'CCC',97);
select * from sample;

insert into sample(h_no,h_name,score) values(7777,'ddd',100);

-- DML : update ~ set
-- 테이블에 저장된 레코드를 수정하는 SQL 명령어
-- where 절을 사용하지 않을 경우 모든 레코드의 값이 변경된다.

drop table emp01;
create table emp01 as select * from emp;

-- 모든 사원의 부서번호를 30번으로 수정
update emp01 set deptno = 30;
select * from emp01;

-- 사원의 급여를 10% 인상하는 쿼리문을 기술하시오.
update emp01 set sal = sal * 1.1;

-- 모든 직원의 입사일을 오늘로 변경하시오.
update emp01 set hiredate = sysdate;

-- 테이블 삭제
drop table emp01;
create table emp01 as select * from emp;

-- 부서번호가 10번인 직원의 부서번호를 40으로 변경하시오
update emp01 set deptno = 40 where deptno = 10;
select * from emp01;

-- Q. job이 MANAGER인 직원만 급여를 10%인상하시오.
update emp01 set sal = sal * 1.1 where job = 'MANAGER';

-- Q. 1981년도에 입사한 직원의 입사일을 오늘로 변경하시오.
update emp01 set hiredate= sysdate where substr(hiredate,1,2) = '81';

drop table emp01;
create table emp01 as select * from emp;

--scott 사원의 부서번호는 20, job은 MANAGER로 변경하는 쿼리문
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SCOTT';

--scott 사원의 입사날짜를 오늘로, 급여는 50으로 커미션은 4000으로 변경
update emp01 set hiredate =sysdate, sal = 50, comm =4000 where ename = 'SCOTT';

select * from emp01 where ename = 'SCOTT';

drop table dept01;
create table dept01 as select * from dept;

-- 부서번호가 20번인 부서의 지역명을 부서번호가 40번인 부서의 지역명으로 변경
select * from dept01;

select loc from dept01 where deptno = 40;

update dept01 
set loc = (select loc from dept01 where deptno = 40)  
where deptno = 20;

-- DML : delete ~ from ~ where
-- 테이블에 저장된 레코드를 삭제하는 명령문
-- 특정 행을 삭제할 경우 where 조건절을 담는다.

select * from dept01;

delete from dept01;

-- 부서번호가 30번인 레코드를 삭제하는 쿼리문
delete from dept01 where deptno = 30;

drop table emp01;
create table emp01 as select * from emp;

-- 사원테이블에 부서명이 'SALES'인 부서에 근무하는 모든 사원들을 삭제하는 쿼리문

select * from emp01; -- 사원정보를 담고 있는 사원테이블

select * from dept01; -- 부서정보를 담고 있는 부서테이블

select deptno from dept01 where dname = 'SALES';

delete 
from emp01 
where deptno = (select deptno from dept01 where dname = 'SALES');

-- DCL - 무결성, 병행수행, 권한, 트랜잭션처리
-- commit : 변경 내용을 데이터베이스에 영구 저장
-- rollback : 되돌리는 작업
-- 자동 commit 되는 경우 : DDL ,DCL, 명령문이 수행되는 경우, 정상종료
-- 자동 rollback 되는 경우 : 비정상종료, 정전 혹은 컴퓨터 다운

drop table dept01;
create table dept01 as select * from dept;

delete from dept01;
select * from dept01;
rollback; -- 되돌리기

delete from dept01 where deptno = 20;
commit; -- 영구 삭제

-- 무결성 제약 조건 : 유효성 검사 규칙
-- 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해 테이블을 생성할 때 사용하는 규칙
-- 무결성 : 정확성 유지
-- 제약 조건 : 바람직하지 않은 데이터의 저장을 방지하는 것

select * from emp;
desc emp
select * from dept;
desc dept

-- primary key(기본키) : 반드시 입력(NOT NULL), 유일한 값을 가져야 한다.
drop table dept01;
create table dept01 as select * from dept;

select * from dept01;
insert into dept01 values(10,'TEST','BUSAN');

drop table dept02;
create table dept02(
    deptno number(2) primary key, 
    dname varchar2(20),
    loc varchar2(20)
    );

insert into dept02 values(10,'ACCOUNTING','NEW YORK');

insert into dept02 values(10,'TEST','BUSAN');


-- 기본키와 외래키 설정
drop table emp06;
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept02(deptno)
    ); --references : 참조 설정
    
insert into emp06 values(1111, 'aaa', 'a', 10);
insert into emp06 values(2222, 'bbb', 'b', 10);
insert into emp06 values(3333, 'bbb', 'b', 30);
insert into emp06 values(4444, 'aaa', 'a', 50);
    
select * from emp06;

SELECT * FroM dept02;
    insert into dept02 values(10,'ACCOUNTING','NEW YORK');
    insert into dept02 values(10,'TEST','BUSAN');
    insert into dept02 values(20,'RESEARCH','DALLAS');
    insert into dept02 values(30,'SALES','CHICAGO');
    insert into dept02 values(40,'ACCOUNTING','NEW YORK');
insert into dept02 values(50,'ANALYST','SEOUL');
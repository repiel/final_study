-- comment(�ּ�) : ����� ������� ������ ���� �� ����ϴ� ����
/*
�����ٿ� ���� �ּ��� ���� �� ����ϴ� ���� 
*/

show user -- ���� ���Ӱ����� Ȯ���ϴ� sql plus ��ɾ�

-- ���� ���ӵ� ������ ���Ե� ���̺� Ȯ��
-- tab == tables
select * from tab;

--Ư�� ���̺��� ������ Ȯ���ϴ� ���
--desc: �ϳ��� ����Ȯ��, ���Ľ� ��������
desc emp
--emp�� employee�� ���ڷ� Ư�� ȸ���� ���������� ��� �ִ� ���̺�

desc dept   -- dept ���̺��� ������ �����ִ� ���(sql plus ��ɾ�)
select * from dept;  -- dept ���̺��� ������ �����ִ� ���(sql ��ɾ�)

--sql ��� : ���Ǿ�(DDL), ���۾�(DML), �����(DCL)
--���Ǿ�: create(����), alter(����), drop(����)
--���۾�: select(����), insert(����), update(����), delete(����)
--�����: ���Ἲ, �������, ���Ѻο� �� 
--       grant, revoke, commit, roll back


alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

-- scott ������ ������ �ִ� ���̺��� ����� Ȯ��
select * from tab;

--salgrade ���̺� ���(����)�� Ȯ��
select * from salgrade;

--Q1. dept ���̺��� �μ������� ������ �ִ� ���̺��̴�. �μ������� ������ Ȯ���Ϸ���?
select * from dept;
-- �μ����̺�(dept)�� �μ��̸�(dname)�� ����
select dname from dept;

-- �μ����̺�(dept)�� �μ��̸�(dname),��ġ(loc)����
select dname,loc from dept;

-- emp ���̺��� ��� Ȯ��, �������� 14���ΰ� Ȯ��
select * from emp;

select empno, ename, job from emp;

--�����(keyworld): �ǹ̿� �뵵�� ������ ��ɾ�� �ٸ� �뵵�� ����� �� ����

-- �������̺��� �����̸��� �޿��� �����Ͻÿ�.
select ename, sal from emp;

select ename, sal, sal+100 from emp;

select ename, sal, sal+100 as "�λ�޿�" from emp;


--�޿��� 2500�� �ʰ��ϴ� ������ ����� �����Ͻÿ�.

select * from emp where sal > 2500;

--�������̺� ���� �� �μ���ȣ�� 20�� ����� ���� ������ �����Ͻÿ�.

select * from emp where deptno = 20;

--Q. �̸� (ename)�� FORD�� ����� ���(empno),�̸�(ename),�޿�(sal) ����

select empno, ename, sal from emp where ename = 'FORD';

--����, ��¥, �ð����� ����ǥ('',"") �ȿ� ��ƾ� �Ѵ�.
--�ʵ���� ��ҹ��ڸ� �������� ������, ���ڵ�� �ݵ�� ��ҹ��ڸ� �����ؾ� �Ѵ�.

--Q. �Ի����� 1982�� 1�� 1�� ������ ����� ������ �����Ͻÿ�.
select * from emp where hiredate>='82/01/01';

-- ������ �μ���ȣ�� 10�� ������ ������ ����
select * from emp where deptno = '10';

-- ������ �μ���ȣ�� 10�� �ƴ� ������ ������ ����
select * from emp where not deptno = 10;
select * from emp where deptno != 10;
select * from emp where deptno <> 10;

--�μ���ȣ�� 10�� �����߿���(�̰�) ����(job)�� 'MANAGER'�� ������ ���� ����
select * from emp where deptno=10 and job='MANAGER';

--�μ���ȣ�� 10�̰ų� ����(job)�� 'MANAGER'�� ������ ���� ����
select * from emp where deptno=10 or job='MANAGER';

-- �޿��� 2000�̻� (�̰�) 3000������ ����� ���� ����(2000~3000)
select * from emp where sal>=2000 and sal<=3000;

-- ���뱸 between and(�̻�, ����) , not between and (�̸�, �ʰ�)
-- between: ������, ������, ��¥�� ��� ����� �����ϴ�.
select * from emp where sal between 2000 and 3000;

--Q. �޿��� 2000 �̸��̰ų� 3000�� �ʰ��� ���
select * from emp where sal not between 2000 and 3000;

-- ���뱸 in (�����ϴ�), not in
-- Ŀ�̼�(comm)�� 300 Ȥ�� 1400�� ����� ������ �����Ͻÿ�.
select * from emp where comm=300 or comm=1400;

select * from emp where comm in (300, 1400);

--Ŀ�̼�(comm)�� 300 Ȥ�� 1400�� �ƴ� ����� ������ �����Ͻÿ�.
select * from emp where comm not in (300, 1400);


--���뱸 like, ~ ����, ó�� 
--���ϵ�ī�� ���� or ���� ���� : %,_
select ename from emp;
-- ����� �̸��� ù���ڰ� 'C'�� �����ϴ� ����� �̸��� �����Ͻÿ�.
select ename from emp where ename like 'C%';
select ename from emp where ename not like 'C%';

select ename from emp where ename like '%E';
select ename from emp where ename like '%E%';

--����� �̸��� �� ��° ���ڰ� 'A'�� ����� ������ �����Ͻÿ�.
select ename from emp where ename like '_A%';
select ename from emp where ename not like '_A%';

-- NULL �ǹ� : ��Ȯ��, �� �� ���� ��
-- NULL�� ����, �Ҵ�, �񱳰� �Ұ���
-- is null/ is not null
-- is : ��, ��, ��/��

select * from emp;


--������̺� Ŀ�̼��� NULL�� ����� ������ �����Ͻÿ�.
select empno, ename , comm from emp where comm is null;

select empno, ename , comm from emp where comm is not null;

-- select�� �Բ� Ȯ���ؼ� ����ϴ� order by��
-- ���� : Ư�� �ʵ忡 ���� ������� �����ϴ� ��
-- ���Ĺ�� : �⺻��(��������, asc), ��������(desc)
-- ����, ����, ��¥, NULL 

--����� �޿��� �������� �������� �����Ͽ� �����Ͻÿ�.
select * from emp order by sal asc;
select * from emp order by sal;

--���� �ֱٿ� �Ի��� ��������� ����
select * from emp order by hiredate desc;


--����� �޿��� �������� �������� �ϵ�, ������ �޿��� �޴� ����� �̸����� ���������Ͻÿ�.
select * from emp order by sal, ename;
select * from emp order by sal, ename desc;


--DISTINCT : �ߺ��� �����ϰ� ������ �� ���
-- ������̺��� �μ���ȣ�� ����
select deptno from emp;
select distinct deptno from emp;

-- ��Ī(Nick name) : �ʵ�� ������ �ο� 
select ename, sal *12 as "����" from emp;
select ename, sal *12 "����" from emp;

--���Ῥ���� : select�� ���ο� "||", ������ �÷��� Ư�� ���ڿ��� �߰��� ��

select ename || '���� ������' || job || ' �Դϴ�.' from emp;
select ename, job from emp;

--dual ���̺� : �� ���� ����� ����ϱ� ���� ����ϴ� �ӽ����̺�
-- ������ ����: 30 * 50
select 30 * 50
from dual;

desc dual

select*
from dual;

select sysdate
from dual;

--�����Լ�: ���� �����͸� ó���ϱ� ���� ����ϴ� �Լ�
--abs: ���밪
select -10, abs(-10)
from dual;

--floor : �Ҽ��� �Ʒ��� ������ �Լ�
select 42.195, floor(42.195)
from dual;

--round: Ư�� �ڸ������� �ݿø��ϴ� �Լ�
--round(����, �ڸ���)
select 34.5678,round(34.5678)
from dual;

select 34.5678,round(34.5678,2)
from dual;

select 34.5678,round(34.5678,-1)
from dual;

-- trunc: Ư�� �ڸ������� �߶󳻴� �Լ�
-- trunc(����, �ڸ���)
-- �ڸ����� 2�� ��� : �Ҽ������� ����° �ڸ����� ���� ���� ����

select trunc(34.5678,2), trunc(34.5678,-1),trunc(34.5678),
trunc(34.5678,0)
from dual;

--mod : �������� �ǵ��� �ִ� �Լ�
--mod(����, ������ ��)
select mod(27,2), mod(27,5),mod(27,7)
from dual;

--���� ó�� �Լ� : ���� �����͸� ó���ϴ� �Լ�, ���ڿ�
--upper(): �빮�ڷ� ��ȯ
select 'Welcom to Oracle' "������", 
upper('Welcome to Oracle') "UPPER������"
from dual;

--lower(): �ҹ��ڷ� ��ȯ
select 'WELCOME TO ORACLE' "������", 
lower('WELCOME TO ORACLE') "LOWER������"
from dual;

--initcap(): ù���ڸ� �빮�ڷ� ��ȯ
select 'WELCOME TO ORACLE' "������", 
initcap('WELCOME TO ORACLE') "INITCAP������"
from dual;


--length(): ���� ���̸� ���ϴ� �Լ�
select length('Oracle'), length('����Ŭ')
from dual;


--lengthb(): ���� ���̸� ����Ʈ ���� �˷��ִ� �Լ�
select lengthb('Oracle'), lengthb('����Ŭ')
from dual;

--instr(): Ư�� ������ ��ġ�� ���ϴ� �Լ�
select instr('Welcome to Oracle','O')
from dual;

--substr(���ڿ�, ������ġ, ���ڼ�): ���ڿ����� ������ġ���� ���ڼ���ŭ ����
select substr('Welcome to Oracle',4,4)
from dual;

--substrb(): ��õ� ������ŭ�� ���ڰ� �ƴ϶� ����Ʈ ���� �߶󳽴�.
--substr() �Լ��� �ѱ�/���ڸ� 1����Ʈ�� ������, substrb()�� 2����Ʈ�� ����.
select substr('����������Ŭ',3,4),
substrb('����Ŭ����Ŭ',3,4)
from dual;


--����������̺��� ������� �Ի��Ͽ��� �Ի�⵵�� �Ի��� ���� �����Ͻÿ�.
--��, ����� ����� �÷����� �����̸�, �⵵, ���� ����ǵ��� �Ͻÿ�.
select ename,hiredate from emp;

select ename "�����̸�",
19||substr(hiredate,1,2) "�⵵",
substr(hiredate,4,2)"��"
from emp;

--Q.9���� �Ի��� ����� ������ ����
select * 
from emp where substr(hiredate,4,2)='09';

select * from emp;

--trim(): �¿� ������ �����ϴ� �Լ�
--ltrim()/rtrim()
select ltrim('  ORACLE')from dual;

--�������Լ� : ��¥�Լ�, ����ȯ�Լ�, �Ϲ��Լ�
--��¥�Լ�: date(��¥������)
--��¥ + ���� : �־��� ��¥���� ������ �Ⱓ��ŭ ���� ��¥�� ���
--��¥ - ���� : �־��� ��¥���� ������ �Ⱓ��ŭ ���� ��¥�� ���
--��¥ - ��¥ : �� ��¥ ������ �Ⱓ�� ����
--sysdate : ���� �ý��ۿ� ��ϵ� ��¥�� ��ȯ
--sysdate + 1: ����
--sysdate - 1: ����
--months_between : �� ��¥ ������ ���� ���� ���ϴ� �Լ�
--Q. ���� ���� ���̺��� �Ի糯¥�� �̿��Ͽ� �������� �ٹ��� �������� �����Ͻÿ�
select ename, sysdate, hiredate, 
months_between(sysdate, hiredate) "�ٹ�������"
from emp;

select * from emp;

--add_months : Ư�� �������� ���� ��¥�� ���ϴ� �Լ�
--�Ի糯¥���� 4���� �߰��� ��¥�� �����Ͻÿ�.
select ename, hiredate, add_months(hiredate,4) from emp;

--next_day : �ش� ��¥�������� ������ ��õ� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ���ִ� �Լ�
select sysdate,next_day(sysdate,'������')from dual;

--last_day : �ش� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
--�������� �Ի��� ���� ������ ���� �����Ͻÿ�.
select ename, hiredate, last_day(hiredate)
from emp;

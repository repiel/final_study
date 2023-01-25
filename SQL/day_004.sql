-- DDL : create - ���ο� ���̺��� �����ϴ� sql ��ɾ�
create TABLE emp01(
  empno number(4),
  ename varchar2(20),
  sal number(7,2)
);

-- ���̺� ���� Ȯ�� : desc
desc emp01

-- ���̺� ����
drop table emp02;

--���� ������ Ȯ��
select * from emp;


-- ���ο� ���̺��� ������ �� ������ ���̺�� ������ ������ �̷���� ���̺� ������
-- ������ ������ �Բ� �����ؼ� ���ο� ���̺��� �����ȴ�.
create table emp02 as select * from emp;

select * from emp02;

-- ���� ���̺��� �Ϻ� �ʵ带 �����ؼ� ���ο� ���̺� ����
create table emp03 as select empno, ename from emp;  
select * from emp03;


-- ���� ���̺��� ������ �̿��Ͽ� ���ο� ���̺� ����
-- where �� : ������ �־��� ������ �� �ΰ͸�
create table emp05 as select * from emp where 1=0;
desc emp05
select * from emp05;


-- �μ���ȣ�� 10���� ������ ������ Ȯ��
select * from emp where deptno = 10;

-- ���ǿ� �����ϴ� �ڷḸ �����ؼ� ���̺� ����
create table emp04 as select * from emp where deptno =10;
select * from emp04;

-- DDL: alter table - ���̺� ������ �����ϴ� SQL ��ɾ�
-- �÷��� �߰�, ����, ������ ���
-- alter tabel ~ add : ���� ���̺� ���ο� �÷��� �߰��ϴ� ��ɾ�
desc emp01 
alter table emp01 add(job varchar2(9)); --add()����

-- add(), modify()
-- alter modify : ���� ���̺� �÷��� �����ϴ� ��ɾ�
-- ������ �÷��� �ڷᰡ ���� ��� : ������ Ÿ�� ���� ����, �÷��� ũ�� ���� ����
-- ������ �÷��� �ڷᰡ �ִ� ��� : ������ Ÿ�� ���� �Ұ���, �÷��� ũ�� ��� �Ұ���
-- *����: ������ �÷��� �ڷᰡ �ִ��� char�� varchar2 ������ Ÿ���� ������ ����.

select * from emp01;
alter table emp01 modify(job varchar2(30));

-- alter table ~ drop column : ���̺� �����ϴ� �÷��� �����ϴ� ��ɾ�
-- �������� ������ ��� drop column �ڿ� ,�� �����ϸ� �ȴ�.
alter table emp01 drop column job;

-- DDL - drop table : ���̺��� �����ϴ� ��ɾ�
-- �� �� ���ŵ� ���̺��� ���� �� �� ����.
desc emp01
drop table emp01;

-- ���̺� ���� �� ������ ����
-- ���Ἲ ���� ���ǿ� �ִ� ���̺��� ������ �� ����.
-- �����ϰ��� �ϴ� ���̺��� �⺻Ű�� ����Ű�� �ٸ� ���̺��� �����ϰ� �ִ� ���

-- DDL - rename : ���̺���� �����ϴ� ��ɾ�
-- ������ ����ϴ� ���̺��� �̸��� ������ �� ���
select * from emp05;
rename emp05 to test;

select * from test;

-- DML : ���۾�, ���� �Ϲ� �����ڿ� ���ؼ� ���Ǵ� ��ɾ� ����
-- ���ڵ� ������ ������ �Ѵ�.
-- DML - select (�ʵ��) from (���̺��) where(���ǽ�)
-- DML - select : ���̺��� ����(���ڵ�)�� Ȯ��, ���ǿ� �����ϴ� ���ڵ带 ����
select * -- * : all�� �ǹ�
from emp;

-- ���ǽ� : �� �Ǵ� �������� ������ �Ǵ� ��
-- �� �Ǵ� ���� : �����(�񱳽�, ��Ұ����), ����
-- ����� : =(����),<>(�����ʴ�),!=(�����ʴ�),>,>=,<,<=
-- ���� : and(������, ����, ��� ���϶� ��), or(������, ����, ����ϳ��� ���̸� ��)
--         not(������, ������, ���̸� ��������, �����̸� ������)

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
-- ���ο� ���ڵ带 �߰��� �� ����ϴ� SQL ��ɾ�
create table dept01 as select * from dept where 1=0; --������ �������� ��
desc dept01

insert into dept01 values(10,'ACCOUNTING','NEW YORK'); 
-- dept 01 �ڿ� ���ڵ���� ���� �������� �ʾ��� ��� values �� 
-- ()�� ���ڵ� ���� ���� �־� �־�� �Ѵ�.

select * from dept01;

insert into dept01(deptno, dname) values(20, 'RESEARCH');
-- values �� ()�� �÷� dept01()�� ()�� ��Ī�Ǵ� ���� �������־�� �Ѵ�.

insert into dept01(deptno,dname,loc)
values(30,'SALES','CHICAGO');

create table sample(
    h_no number primary key, -- �⺻Ű(��ü���Ἲ) :  NULL(x), �ߺ��Ұ�
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
-- ���̺� ����� ���ڵ带 �����ϴ� SQL ��ɾ�
-- where ���� ������� ���� ��� ��� ���ڵ��� ���� ����ȴ�.

drop table emp01;
create table emp01 as select * from emp;

-- ��� ����� �μ���ȣ�� 30������ ����
update emp01 set deptno = 30;
select * from emp01;

-- ����� �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�.
update emp01 set sal = sal * 1.1;

-- ��� ������ �Ի����� ���÷� �����Ͻÿ�.
update emp01 set hiredate = sysdate;

-- ���̺� ����
drop table emp01;
create table emp01 as select * from emp;

-- �μ���ȣ�� 10���� ������ �μ���ȣ�� 40���� �����Ͻÿ�
update emp01 set deptno = 40 where deptno = 10;
select * from emp01;

-- Q. job�� MANAGER�� ������ �޿��� 10%�λ��Ͻÿ�.
update emp01 set sal = sal * 1.1 where job = 'MANAGER';

-- Q. 1981�⵵�� �Ի��� ������ �Ի����� ���÷� �����Ͻÿ�.
update emp01 set hiredate= sysdate where substr(hiredate,1,2) = '81';

drop table emp01;
create table emp01 as select * from emp;

--scott ����� �μ���ȣ�� 20, job�� MANAGER�� �����ϴ� ������
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SCOTT';

--scott ����� �Ի糯¥�� ���÷�, �޿��� 50���� Ŀ�̼��� 4000���� ����
update emp01 set hiredate =sysdate, sal = 50, comm =4000 where ename = 'SCOTT';

select * from emp01 where ename = 'SCOTT';

drop table dept01;
create table dept01 as select * from dept;

-- �μ���ȣ�� 20���� �μ��� �������� �μ���ȣ�� 40���� �μ��� ���������� ����
select * from dept01;

select loc from dept01 where deptno = 40;

update dept01 
set loc = (select loc from dept01 where deptno = 40)  
where deptno = 20;

-- DML : delete ~ from ~ where
-- ���̺� ����� ���ڵ带 �����ϴ� ��ɹ�
-- Ư�� ���� ������ ��� where �������� ��´�.

select * from dept01;

delete from dept01;

-- �μ���ȣ�� 30���� ���ڵ带 �����ϴ� ������
delete from dept01 where deptno = 30;

drop table emp01;
create table emp01 as select * from emp;

-- ������̺� �μ����� 'SALES'�� �μ��� �ٹ��ϴ� ��� ������� �����ϴ� ������

select * from emp01; -- ��������� ��� �ִ� ������̺�

select * from dept01; -- �μ������� ��� �ִ� �μ����̺�

select deptno from dept01 where dname = 'SALES';

delete 
from emp01 
where deptno = (select deptno from dept01 where dname = 'SALES');

-- DCL - ���Ἲ, �������, ����, Ʈ�����ó��
-- commit : ���� ������ �����ͺ��̽��� ���� ����
-- rollback : �ǵ����� �۾�
-- �ڵ� commit �Ǵ� ��� : DDL ,DCL, ��ɹ��� ����Ǵ� ���, ��������
-- �ڵ� rollback �Ǵ� ��� : ����������, ���� Ȥ�� ��ǻ�� �ٿ�

drop table dept01;
create table dept01 as select * from dept;

delete from dept01;
select * from dept01;
rollback; -- �ǵ�����

delete from dept01 where deptno = 20;
commit; -- ���� ����

-- ���Ἲ ���� ���� : ��ȿ�� �˻� ��Ģ
-- ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���� ���̺��� ������ �� ����ϴ� ��Ģ
-- ���Ἲ : ��Ȯ�� ����
-- ���� ���� : �ٶ������� ���� �������� ������ �����ϴ� ��

select * from emp;
desc emp
select * from dept;
desc dept

-- primary key(�⺻Ű) : �ݵ�� �Է�(NOT NULL), ������ ���� ������ �Ѵ�.
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


-- �⺻Ű�� �ܷ�Ű ����
drop table emp06;
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept02(deptno)
    ); --references : ���� ����
    
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
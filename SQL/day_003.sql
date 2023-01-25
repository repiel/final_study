-- ��(data type)��ȯ �Լ� : ����, ����, ��¥ ���������� �ٸ� ������������ ��ȯ�ϴ� �Լ�
-- ���� : to_number, to_char, to_date
-- number - character - date 

-- to_char : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �Լ�
select sysdate from dual;

--format(����) : yy/yyyy, mm, dd
select sysdate, to_char(sysdate, 'yyyy-mm-dd')
from dual;

-- ������� �Ի����� ����ϵ�, ������ �Բ� ����Ͻÿ�.
-- day : ����
select hiredate, to_char(hiredate, 'yyyy-mm-dd day')
from emp;

-- ���� �ý����� ��¥�� �ð��� ����ϴ� �������� ����Ͻÿ�
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss')
from dual;


-- L : �� ������ ��ȭ ��ȣ�� �ٴ´�.
-- ���ڴ�Ż��Ǵ� ��ȣ : 0�� 9
-- �ڸ����� ���� ���� ��� 0�� 0���� ä���, 9�� ä���� �ʴ´�.
-- ex)�������� ���� 8 => ���ı�ȣ 00�� : 08�� or 99�� : 8��
-- 1000 => ���ı�ȣ 0,000�� : 1,000��
-- 800 => ���ı�ȣ 0,000�� : 0,800��
select ename, sal, to_char(sal,'L999,999')
from emp;

-- to_date : �������� ��¥������ ��ȯ�ϴ� �Լ�
-- �⺻ ��¥ ���� : yy/mm/dd 
select ename, hiredate
from emp
where hiredate = to_date(19810220,'yyyy/mm/dd');

-- to_number : ���ڳ� ��¥ ������ �����͸� ���������� ��ȯ�ϴ� �Լ�
--20,000�� 10,000 �� ������ ���� �˾ƺ��� �������� ����Ͻÿ�
select to_number('20,000','99,999') - to_number('10,000','99,999')
from dual;

select 20000 - 10000 
from dual;

select *
from emp;

-- NVL�Լ� : NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�

-- ������ ������ ����ؼ� ����ϴ� �������� ����Ͻÿ�.
-- ���� = ������ �޿� * 12 + comm

select ename, sal, sal * 12 + nvl(comm,0) as "����"
from emp;

-- �׷��Լ�(Group Function) : �ϳ� �̻��� ���� �׷����� ��� ������ �����ϴ� �Լ�
-- sum : �ش� �÷��� ������ ���ϴ� �Լ�
-- ������� �޿��� ������ ����ϴ� �������� ����Ͻÿ�.
select sum(sal) from emp;

-- comm�� ������ ���Ͻÿ�.
-- �׷��Լ��� �ٸ� �����ڿ� �޸� �ش� �÷����� NULL�� ���� �����ϰ� ����Ѵ�.
select sum(comm) from emp;

-- avg : �ش� �÷� ���� ����� ���ϴ� �Լ�
-- ���� �޿��� ����� ����ϴ� �������� ����Ͻÿ�.
select round(avg(sal)) from emp;

-- max/min : �ִ񰪰� �ּڰ��� ���ϴ� �Լ�
-- ���� ���� �޿��� ���� �޿��� �����ϴ� �������� ����Ͻÿ�.
select max(sal) "�ִ�޿�", min(sal) "�ּұ޿�" 
from emp;

-- ���� ���� �޿��� �޴� ������ �̸��� �޿��� �����ϴ� �������� ����Ͻÿ�.
-- �ʵ������ ���� ���� �ƴ϶� ���ǹ����� max�� ����
select ename, sal
from emp
where sal = max(sal);

-- count : ���ǿ� �����ϴ� ���� ������ ��ȯ�ϴ� �Լ�
-- count �Լ��� Ư�� �÷��� ������ �ش� �÷��� ���� ��� �ִ� ���� ������ ��ȯ
-- count �Լ��� NULL ���� ���� ������ ���� �ʴ´�.
-- ������ ���� �����ϴ� �������� ����Ͻÿ�.
select count(ename) 
from emp;

-- �������� ����ϴ� ������ �Ǽ��� ����Ͽ� �����ϴ� �������� ����Ͻÿ�.
select count(distinct job) 
from emp;

-- group by ��
-- Ư�� Į���� �������� �׷�ȭ�Ͽ� �ش� �׷쿡 �����ϴ� ���ڵ带 ������� ��������ϴ� �Լ�
-- �׷��Լ��� ����ϵ�, Ư�� �÷��� ������� ���������� ����� �� ���

-- ������ �޿��� ���� �����ϴ� �������� ����Ͻÿ�.
-- ��, �� �μ��� ������ �޿��� ���� ��µǵ��� ����� ��.
-- �μ��� �޿��� ���� ����ϴ� �������� ����Ͻÿ�

select deptno, sum(sal)
from emp
group by deptno; 

-- �ҼӺμ��� �޿��� ���հ� ��ձ޿��� �����ϴ� �������� ����Ͻÿ�.
-- ��, �μ���ȣ, �ѱ޿�, ��ձ޿� ��� �÷����� ǥ���Ͻÿ�.
select deptno "�μ���ȣ", sum(sal)"�ѱ޿�" ,round(avg(sal),2) "��ձ޿�"
from emp
group by deptno;

-- �μ��� ������� Ŀ�̼��� �޴� ����� ���� �����ϴ� �������� ����Ͻÿ�.
-- ������ ��
select count(*)
from emp;

select deptno, count(*) "�μ��� �����" , count(comm) "Ŀ�̼��� �޴� �����"
from emp
group by deptno;
-- 10��, 20��, 30��

-- having �� : group by ���� ���� ������ ��� ���� ���ϴ� ���ǽ��� ��� ��
-- ������ : where���� having��(�׷����� �Բ� ����)
-- �μ��� ��ձ޿��� ����ϴ� �������� ����Ͻÿ�.
select deptno, round(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000;

-- �μ��� ���޴��� �޿��� ����� �����ϴ� �������� ����Ͻÿ�.
select deptno, job, round(avg(sal))
from emp
group by deptno, job
order by deptno;

select ename, deptno, avg(sal)
from emp
group by deptno;
-- ename�� ������ 14���� ����� ���;� �ϹǷ� �׷����� ���� �� ��� ������ ����. 

-- ����(join) : �ϳ� �̻��� ���̺��� �����Ͽ� ���ǿ� �����ϴ� �ڷḦ �����ϴ� ���
-- �����̸�, �μ���ȣ, �μ����� �����ϴ� �������� ����Ͻÿ�.
select * from emp;
select * from dept;

-- �������Ῥ����(direct ������ : .)

select ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

-- cartesian product :  īƼ�� ��
-- �� �� �̻��� ���̺� �����ϴ� ��� �����͸� �˻� ����� ���´�.
-- �� �� �̻��� ���̺� ���뿡 �÷��� �������� ���� ���

select *
from emp, dept;


select *
from emp;

select *
from dept;

-- equal join : ������ �÷��� ������� ���̺��� �����ϴ� ���
-- ��������� ����ϵ�, �ش� ����� �μ��� ���� �������� �Բ� ��µǵ��� ����
select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

-- �̸��� scott�� ����� �μ����� ã�� �̸��� �μ����� ��µǴ� �������� ����Ͻÿ�
select deptno
from emp
where ename ='SCOTT';

select dname 
from dept
where deptno = 20;

-- �������� : �����ȿ� �� �ٸ� ������ ��Ƽ� ǥ���ϴ� ��

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

--���̺�� ��Ī�� ����� �� �ִ�.
select ename, dname, e.deptno
from emp e, dept d
where e.deptno = d.deptno and ename='SCOTT';

-- �޿��� 2500���� �̰�, �����ȣ�� 9999 ������ ����� ������ ����Ͻÿ�.
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where sal <= 2500 and empno <= 9999 and e.deptno = d.deptno;

-- equi-join : ������ ���� ���� �÷��� ������� ����(=)
-- non-equi join : ������ �÷��� ���� ���� ũ�ų� �۰ų� �ϴ� ���

select * from tab;

select * from salgrade;

select * from emp;

select ename, sal, grade
from emp e ,salgrade s
where sal between losal and hisal;

select ename , dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno and sal between losal and hisal;

-- self-join : �ڱ� �ڽŰ� ������ �ϴ� ���
-- �Ϲ������� ������ �������� ���̺��� �����ϴ� ��������� �ϳ��� ���̺� �ȿ���
-- ������ �ؾ� ������ ���� ��쿡 ����Ѵ�.
-- �������̺��� �̿��Ͽ� �ش� ������ ��翡 �̸��� ����
select * from emp;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno;

-- outer join : �ܺ�����
-- Left outer join, Right outer join
-- ���� ���ǿ� ���� �ʴ� �൵ ��Ÿ���� ���� ���
select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno(+); -- Left outer join;

-- ��������
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;

select dname 
from dept 
where deptno = (select deptno from emp where ename = 'SCOTT');

-- ������ ���� ���� : ���� ����� ���� �ϳ��� �����θ� ��ȯ�ϴ� ��.
-- ������ �� ������: =,<>,>,>=,<,<=
-- ������� ��� �޿����� �� ���� �޿��� �޴� ��� ����
select ename, sal 
from emp
where sal > (select avg(sal)
from emp) ;

select avg(sal)
from emp;

-- scott�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� �����Ͻÿ�
select ename, sal 
from emp
where sal >=(select sal 
from emp
where ename = 'SCOTT');

-- scott�� �޿�
select sal 
from emp
where ename = 'SCOTT';

-- ������ ���� ���� : ���������� ����� �� �� �̻��� ��
-- ������ ������ : in, any, some, all 
-- in : ���� ������ �� ������ ���� ������ ��� �߿��� �ϳ��� ��ġ�ϸ� ��
-- �޿��� 3000 �̻� �޴� ������ �μ��� ������ �μ��� �ٹ��ϴ� ������ ������ ����
select ename, sal, deptno
from emp
where deptno in (select distinct deptno
from emp
where sal >= 3000);


--�޿��� 3000 �̻� �޴� ������ �μ�
select distinct deptno
from emp
where sal >= 3000;

select ename, sal, deptno
from emp 
where deptno in (10,20);

select ename, sal, deptno
from emp 
where deptno = 10 or deptno = 20;

-- any, some : ���� ������ �������� ���������� ����� �ϳ� �̻� ��ġ�ϸ� ��
-- < any : ã�� ���� ���Ͽ� �ϳ��� ũ�� ��
-- > any : ã�� ���� ���Ͽ� �ϳ��� ������ ��
-- �μ� ��ȣ�� 30���� ����� �޿� �� ���� ���� ��(950) ���� 
-- ���� �޿��� �޴� ����� ������ ����
select sal 
from emp
where deptno = 30;

select ename, sal 
from emp
where sal > any(select sal 
from emp
where deptno = 30);

-- all : ���� �Ÿ��� �� ������ ���������� ����� ��� ��ġ�ϸ� ��
-- < all : �ּڰ� ��ȯ
-- > all : �ִ� ��ȯ

-- �μ� ��ȣ�� 30���� ����� �޿� �� ���� ���� �޴� ��� ���� 
-- ���� �޿��� �޴� ����� ������ ����

select sal 
from emp
where deptno = 30;

select ename, sal 
from emp
where sal > all(select sal 
from emp
where deptno = 30);

-- exists : ���������� �� ������ ���������� ����߿� �����ϴ� ���� �ϳ���
-- �����ϸ� ��
-- dept�� deptno�� 10, 20�� �����Ͱ� �����Ѵٸ�, emp �� �ش� ���� ����
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
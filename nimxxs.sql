-- ��ɾ� �� �� ����
create table member (
    id          varchar2(100),
    name        varchar2(100),
    password    varchar2(100)
);                  -- ����
drop table member;  -- ����

insert into member (id,name,password) values ('nimxxs','�ּ���','1234');
insert into member (id,name,password) values ('hong','ȫ�浿','1234');
commit;

select * from member;
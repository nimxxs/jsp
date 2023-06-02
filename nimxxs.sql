-- 명령어 쓸 수 있음
create table member (
    id          varchar2(100),
    name        varchar2(100),
    password    varchar2(100)
);                  -- 생성
drop table member;  -- 삭제

insert into member (id,name,password) values ('nimxxs','최수민','1234');
insert into member (id,name,password) values ('hong','홍길동','1234');
commit;

select * from member;
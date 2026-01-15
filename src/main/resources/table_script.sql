설정 완료된 파일 ex06_3.zip
https://github.com/globaljavateacher/ex06_3

LOG
c:\upload\temp
log4j.xml <priority value="debug" />

DB
alter session set "_oracle_script"=true;
create user book_ex identified by book_ex;
grant create session, create table, unlimited tablespace to book_ex;
grant create sequence to book_ex;

TABLE
create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);
alter table tbl_board add constraint pk_board primary key (bno);
alter table tbl_board add replycnt number(3,0);
alter table tbl_board modify replycnt default 0
update tbl_board set replycnt = 0;

create table tbl_reply (
  rno number(10,0), 
  bno number(10,0) not null,
  reply varchar2(1000) not null,
  replyer varchar2(50) not null, 
  replydate date default sysdate, 
  updatedate date default sysdate
);
alter table tbl_reply add constraint pk_reply primary key (rno);
alter table tbl_reply  add constraint fk_reply_board foreign key (bno)  references  tbl_board (bno); 

create table tbl_attach ( 
  uuid varchar2(100) not null,
  uploadpath varchar2(200) not null,
  filename varchar2(100) not null, 
  filetype char(1) default 'i',
  bno number(10,0)
);
alter table tbl_attach add constraint pk_attach primary key (uuid); 
alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

create table tbl_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) not null,
      username varchar2(100) not null,
      regdate date default sysdate, 
      updatedate date default sysdate,
      enabled char(1) default '1'
);

create table tbl_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) not null,
     constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

create table persistent_logins (
  username varchar(64) not null,
  series varchar(64) primary key,
  token varchar(64) not null,
  last_used timestamp not null
);

SEQUENCE
create sequence seq_board;

create sequence seq_reply;

MEMBER
insert into tbl_member (userid, userpw, username) values ('hong', '1234', '홍길동');
insert into tbl_member_auth (userid, auth) values ('hong', 'ROLE_USER');

bcryptpasswordencoder passwordencoder = new bcryptpasswordencoder();
string encoded = passwordencoder.encode("1234");
system.out.println(encoded);

update tbl_member set userpw = '$2a$10$csgmv/i6c7z7bceqbkxgreq9pctew/m5uwma.n9psx0wburkz9vuk' where userid = ‘hong';


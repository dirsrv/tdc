create table tdc_users (
   id number not null,
   name varchar2(100 byte) not null,
   surname varchar2(100 byte) not null,
   email varchar2(100 byte) not null,
   role varchar2(10 byte) not null,
   password varchar2(100 byte) not null,
   constraint tdc_users_pk primary key (id),
   constraint tdc_users_chk1 check (role in ('BASE', 'ADMIN')),
   constraint tdc_users_uk1 unique (email)
);
 
create sequence tdc_users_seq;
 
create or replace trigger bir_tdc_users_trg
   before insert on tdc_users
   for each row
begin
   if :new.id is null
   then
      :new.id := tdc_users_seq.nextval;
   end if;
end bir_tdc_users_trg;
/

insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('jan@kowalski.com','ADMIN','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Jan','Kowalski');

create table tdc_posts (
   content varchar2(512 byte) not null
);
 

insert into tdc_posts (content) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
insert into tdc_posts (content) values ('Morbi interdum, justo a commodo gravida, magna tortor scelerisque nisl, vitae iaculis odio nisi vel risus.');
insert into tdc_posts (content) values ('Fusce ac dui ullamcorper, dignissim purus sit amet, consequat dolor.');
insert into tdc_posts (content) values ('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris porttitor tincidunt magna nec pharetra. ');
insert into tdc_posts (content) values ('Vestibulum mi purus, ornare ut sem sed, porttitor fermentum erat.');
 
create table tdc_todos(
author number not null,
title varchar2(200 byte) not null,
description varchar2(512 byte) not null,
priority varchar2(200 byte) not null
);

commit;

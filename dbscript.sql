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
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('karol@abacki.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Karol','Abacki');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('stefan@cabacki.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Stefan','Cabacki');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('wojciech@nowak.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Wojciech','Nowak');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('brzeczyszczykiewicz@onet.pl.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Grzegorz','Brzęczyszczykiewicz');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('franek.guzio@gmail.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Franciszek','Guzio');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('marcin.kozak@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Marcin','Kozak');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('justyna.kowalczewska@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Justyna','Kowalczewska');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('rafal.skirzynski@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Rafał','Skirzyński');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('jaroslaw.stepien@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Jarosław','Stępień');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('tomasz.zeglen@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Tomasz','Żegleń');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('jan.palica@oracle.com','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Jan','Palica');
insert into tdc_users (EMAIL,ROLE,PASSWORD,NAME,SURNAME) values ('ostatnia@securemail.pl','BASE','$2a$10$Y2P4Gqmr8plOMX4pF2fbb.tvE.iIsRV.Z2WlglrjCx8YVU31ZVT6W','Elżbieta','Ostatnia');

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



DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'HR',
                       p_object => 'TDC_USERS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'users',
                       p_auto_rest_auth => FALSE);

    commit;
END;

DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'HR',
                       p_object => 'TDC_POSTS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'posts',
                       p_auto_rest_auth => FALSE);

    commit;
END;

DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'HR',
                       p_object => 'TDC_TODOS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'todos',
                       p_auto_rest_auth => FALSE);

    commit;
END;


commit;

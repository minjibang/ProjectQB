create table room
(
   roomno number,
   roomname varchar2(100)
);
create sequence room_seq;

create table chatusers(
  userid varchar2(50),
  pwd varchar2(50)
);
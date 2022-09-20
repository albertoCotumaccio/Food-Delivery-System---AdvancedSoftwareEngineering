-- User [User]
create table `user_2` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `balance`  double precision,
   `phone`  varchar(255),
  primary key (`oid`)
);



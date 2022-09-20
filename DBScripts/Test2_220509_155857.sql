-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Customer [ent1]
create table `customer` (
   `user_oid`  integer  not null,
   `attribute12`  varchar(255),
  primary key (`user_oid`)
);


-- Rider [ent2]
create table `rider` (
   `user_oid`  integer  not null,
   `mezzo`  varchar(255),
   `attribute47`  varchar(255),
   `attribute48`  varchar(255),
  primary key (`user_oid`)
);


-- Restaurant [ent3]
create table `restaurant` (
   `user_oid`  integer  not null,
   `rest_attrb`  varchar(255),
  primary key (`user_oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- GEN FK: Customer --> User
alter table `customer`   add index fk_customer_user (`user_oid`), add constraint fk_customer_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Rider --> User
alter table `rider`   add index fk_rider_user (`user_oid`), add constraint fk_rider_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Restaurant --> User
alter table `restaurant`   add index fk_restaurant_user (`user_oid`), add constraint fk_restaurant_user foreign key (`user_oid`) references `user` (`oid`);



-- Group [Group]
create table `group_2` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_2` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_2` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Customer [ent1]
create table `customer_2` (
   `user_2_oid`  integer  not null,
   `attribute12`  varchar(255),
  primary key (`user_2_oid`)
);


-- Rider [ent2]
create table `rider_2` (
   `user_2_oid`  integer  not null,
   `mezzo`  varchar(255),
  primary key (`user_2_oid`)
);


-- Restaurant [ent3]
create table `restaurant_2` (
   `user_2_oid`  integer  not null,
   `rest_attrb`  varchar(255),
  primary key (`user_2_oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_2`  add column  `module_2_oid`  integer;
alter table `group_2`   add index fk_group_2_module_2 (`module_2_oid`), add constraint fk_group_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_2` (
   `group_2_oid`  integer not null,
   `module_2_oid`  integer not null,
  primary key (`group_2_oid`, `module_2_oid`)
);
alter table `group_module_2`   add index fk_group_module_2_group_2 (`group_2_oid`), add constraint fk_group_module_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);
alter table `group_module_2`   add index fk_group_module_2_module_2 (`module_2_oid`), add constraint fk_group_module_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_2`  add column  `group_2_oid`  integer;
alter table `user_2`   add index fk_user_2_group_2 (`group_2_oid`), add constraint fk_user_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_2` (
   `user_2_oid`  integer not null,
   `group_2_oid`  integer not null,
  primary key (`user_2_oid`, `group_2_oid`)
);
alter table `user_group_2`   add index fk_user_group_2_user_2 (`user_2_oid`), add constraint fk_user_group_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);
alter table `user_group_2`   add index fk_user_group_2_group_2 (`group_2_oid`), add constraint fk_user_group_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- GEN FK: Customer --> User
alter table `customer_2`   add index fk_customer_2_user_2 (`user_2_oid`), add constraint fk_customer_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- GEN FK: Rider --> User
alter table `rider_2`   add index fk_rider_2_user_2 (`user_2_oid`), add constraint fk_rider_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- GEN FK: Restaurant --> User
alter table `restaurant_2`   add index fk_restaurant_2_user_2 (`user_2_oid`), add constraint fk_restaurant_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);



-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `module`  add column  `oid`  integer;
alter table `module`   add index fk_module_group_4 (`oid`), add constraint fk_module_group_4 foreign key (`oid`) references `group` (`oid_group`);


-- Group_Module [Group2Module_Module2Group]
alter table `module`  add column  `group_oid`  integer;
alter table `module`   add index fk_module_group_3 (`group_oid`), add constraint fk_module_group_3 foreign key (`group_oid`) references `group` (`oid_group`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_2`  add column  `group_oid`  integer;
alter table `user_2`   add index fk_user_2_group_3 (`group_oid`), add constraint fk_user_2_group_3 foreign key (`group_oid`) references `group` (`oid_group`);


-- User_Group [User2Group_Group2User]
alter table `user_2`  add column  `group_oid_2`  integer;
alter table `user_2`   add index fk_user_2_group_4 (`group_oid_2`), add constraint fk_user_2_group_4 foreign key (`group_oid_2`) references `group` (`oid_group`);


-- RiderUser_Entity4 [rel1]
alter table `rider`  add column  `mean_of_transport_name`  varchar(255);
alter table `rider`   add index fk_rider_mean_of_transport_2 (`mean_of_transport_name`), add constraint fk_rider_mean_of_transport_2 foreign key (`mean_of_transport_name`) references `mean_of_transport` (`name`);


-- RiderUser_City [rel3]
alter table `rider`  add column  `city_name`  varchar(255);
alter table `rider`   add index fk_rider_city_2 (`city_name`), add constraint fk_rider_city_2 foreign key (`city_name`) references `city` (`name`);


-- RestaurantUser_City [rel5]
alter table `restaurant`  add column  `city_name`  varchar(255);
alter table `restaurant`   add index fk_restaurant_city_2 (`city_name`), add constraint fk_restaurant_city_2 foreign key (`city_name`) references `city` (`name`);



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
create table `user_2` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `balance`  double precision,
  primary key (`oid`)
);


-- CustomerUser [ent1]
create table `customer` (
   `user_2_oid`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `address`  varchar(255),
  primary key (`user_2_oid`)
);


-- RiderUser [ent2]
create table `rider` (
   `user_2_oid`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `rating`  double precision,
   `busy`  bit,
  primary key (`user_2_oid`)
);


-- RestaurantUser [ent3]
create table `restaurant` (
   `user_2_oid`  integer  not null,
   `address`  varchar(255),
   `logo`  varchar(255),
   `bio`  longtext,
   `rating`  double precision,
   `name`  varchar(255),
   `delivery_fee`  double precision,
   `delivery_time`  integer,
   `delivery_range`  integer,
   `minimum_spend`  integer,
  primary key (`user_2_oid`)
);


-- Mean of transport [ent4]
create table `mean_of_transport` (
   `name`  varchar(255)  not null,
  primary key (`name`)
);


-- Ordine [ent5]
create table `ordine` (
   `oid`  integer  not null,
   `quantity`  varchar(255),
   `total`  integer,
  primary key (`oid`)
);


-- Slot [ent6]
create table `slot` (
   `oid`  integer  not null,
   `day`  varchar(255),
   `start`  time,
   `finish`  time,
  primary key (`oid`)
);


-- City [ent7]
create table `city` (
   `name`  varchar(255)  not null,
  primary key (`name`)
);


-- Cuisine type [ent8]
create table `cuisine_type` (
   `name`  varchar(255)  not null,
  primary key (`name`)
);


-- Item [ent9]
create table `item` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `description`  longtext,
   `category`  varchar(255),
   `price`  double precision,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `module`  add column  `oid`  integer;
alter table `module`   add index fk_module_group (`oid`), add constraint fk_module_group foreign key (`oid`) references `group` (`oid`);


-- Group_Module [Group2Module_Module2Group]
alter table `module`  add column  `group_oid`  integer;
alter table `module`   add index fk_module_group_2 (`group_oid`), add constraint fk_module_group_2 foreign key (`group_oid`) references `group` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_2`  add column  `group_oid`  integer;
alter table `user_2`   add index fk_user_2_group (`group_oid`), add constraint fk_user_2_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
alter table `user_2`  add column  `group_oid_2`  integer;
alter table `user_2`   add index fk_user_2_group_2 (`group_oid_2`), add constraint fk_user_2_group_2 foreign key (`group_oid_2`) references `group` (`oid`);


-- RiderUser_Entity4 [rel1]
alter table `rider`  add column  `mean_of_transport_name`  varchar(255);
alter table `rider`   add index fk_rider_mean_of_transport (`mean_of_transport_name`), add constraint fk_rider_mean_of_transport foreign key (`mean_of_transport_name`) references `mean_of_transport` (`name`);


-- Ordine_Item [rel11]
create table `ordine_item` (
   `ordine_oid`  integer not null,
   `item_oid`  integer not null,
  primary key (`ordine_oid`, `item_oid`)
);
alter table `ordine_item`   add index fk_ordine_item_ordine (`ordine_oid`), add constraint fk_ordine_item_ordine foreign key (`ordine_oid`) references `ordine` (`oid`);
alter table `ordine_item`   add index fk_ordine_item_item (`item_oid`), add constraint fk_ordine_item_item foreign key (`item_oid`) references `item` (`oid`);


-- RiderUser_Slot [rel2]
create table `rideruser_slot` (
   `rider_oid`  integer not null,
   `slot_oid`  integer not null,
  primary key (`rider_oid`, `slot_oid`)
);
alter table `rideruser_slot`   add index fk_rideruser_slot_rider (`rider_oid`), add constraint fk_rideruser_slot_rider foreign key (`rider_oid`) references `rider` (`user_2_oid`);
alter table `rideruser_slot`   add index fk_rideruser_slot_slot (`slot_oid`), add constraint fk_rideruser_slot_slot foreign key (`slot_oid`) references `slot` (`oid`);


-- RiderUser_City [rel3]
alter table `rider`  add column  `city_name`  varchar(255);
alter table `rider`   add index fk_rider_city (`city_name`), add constraint fk_rider_city foreign key (`city_name`) references `city` (`name`);


-- RestaurantUser_City [rel5]
alter table `restaurant`  add column  `city_name`  varchar(255);
alter table `restaurant`   add index fk_restaurant_city (`city_name`), add constraint fk_restaurant_city foreign key (`city_name`) references `city` (`name`);


-- Slot_RestaurantUser [rel6]
alter table `slot`  add column  `restaurant_oid`  integer;
alter table `slot`   add index fk_slot_restaurant (`restaurant_oid`), add constraint fk_slot_restaurant foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid`);


-- RestaurantUser_Cuisine type [rel7]
create table `restaurantuser_cuisine_type` (
   `restaurant_oid`  integer not null,
   `cuisine_type_name`  varchar(255) not null,
  primary key (`restaurant_oid`, `cuisine_type_name`)
);
alter table `restaurantuser_cuisine_type`   add index fk_restaurantuser_cuisine_type (`restaurant_oid`), add constraint fk_restaurantuser_cuisine_type foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid`);
alter table `restaurantuser_cuisine_type`   add index fk_restaurantuser_cuisine_ty_2 (`cuisine_type_name`), add constraint fk_restaurantuser_cuisine_ty_2 foreign key (`cuisine_type_name`) references `cuisine_type` (`name`);


-- RestaurantUser_Item [rel8]
alter table `item`  add column  `restaurant_oid`  integer;
alter table `item`   add index fk_item_restaurant (`restaurant_oid`), add constraint fk_item_restaurant foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid`);


-- CustomerUser_Ordine [rel9]
alter table `ordine`  add column  `customer_oid`  integer;
alter table `ordine`   add index fk_ordine_customer (`customer_oid`), add constraint fk_ordine_customer foreign key (`customer_oid`) references `customer` (`user_2_oid`);


-- GEN FK: CustomerUser --> User
alter table `customer`   add index fk_customer_user_2 (`user_2_oid`), add constraint fk_customer_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- GEN FK: RiderUser --> User
alter table `rider`   add index fk_rider_user_2 (`user_2_oid`), add constraint fk_rider_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- GEN FK: RestaurantUser --> User
alter table `restaurant`   add index fk_restaurant_user_2 (`user_2_oid`), add constraint fk_restaurant_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- Group [Group]
create table `group` (
   `oid_group`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid_group`)
);


-- Module [Module]
create table `module` (
   `oid_module`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid_module`)
);


-- User [User]
create table `user_2` (
   `oid_user`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `balance`  double precision,
  primary key (`oid_user`)
);


-- CustomerUser [ent1]
create table `customer` (
   `user_2_oid_user`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `address`  varchar(255),
  primary key (`user_2_oid_user`)
);


-- OrderItem [ent10]
create table `orderitem` (
   `quantity`  integer
);


-- RiderUser [ent2]
create table `rider` (
   `user_2_oid_user`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `busy`  bit,
  primary key (`user_2_oid_user`)
);


-- RestaurantUser [ent3]
create table `restaurant` (
   `user_2_oid_user`  integer  not null,
   `address`  varchar(255),
   `logo`  varchar(255),
   `bio`  longtext,
   `name`  varchar(255),
   `delivery_fee`  double precision,
   `delivery_time`  integer,
   `delivery_range`  integer,
   `minimum_spend`  integer,
  primary key (`user_2_oid_user`)
);


-- Mean of transport [ent4]
create table `mean_of_transport` (
   `name`  varchar(255)  not null,
  primary key (`name`)
);


-- Order [ent5]
create table `ordine` (
   `oid`  integer  not null,
   `total`  double precision,
   `accepted`  bit,
   `delivered`  bit,
   `feedback_to_rider`  integer,
   `feedback_to_restaurant`  integer,
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
alter table `module`   add index fk_module_group_2 (`oid`), add constraint fk_module_group_2 foreign key (`oid`) references `group` (`oid_group`);


-- Group_Module [Group2Module_Module2Group]
alter table `module`  add column  `group_oid`  integer;
alter table `module`   add index fk_module_group (`group_oid`), add constraint fk_module_group foreign key (`group_oid`) references `group` (`oid_group`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_2`  add column  `group_oid`  integer;
alter table `user_2`   add index fk_user_2_group (`group_oid`), add constraint fk_user_2_group foreign key (`group_oid`) references `group` (`oid_group`);


-- User_Group [User2Group_Group2User]
alter table `user_2`  add column  `group_oid_2`  integer;
alter table `user_2`   add index fk_user_2_group_2 (`group_oid_2`), add constraint fk_user_2_group_2 foreign key (`group_oid_2`) references `group` (`oid_group`);


-- RiderUser_Entity4 [rel1]
alter table `rider`  add column  `mean_of_transport_name`  varchar(255);
alter table `rider`   add index fk_rider_mean_of_transport (`mean_of_transport_name`), add constraint fk_rider_mean_of_transport foreign key (`mean_of_transport_name`) references `mean_of_transport` (`name`);


-- OrderItem_Item [rel10]
alter table `orderitem`  add column  `item_oid`  integer;
alter table `orderitem`   add index fk_orderitem_item (`item_oid`), add constraint fk_orderitem_item foreign key (`item_oid`) references `item` (`oid`);


-- RiderUser_Order [rel12]
alter table `ordine`  add column  `rider_oid_user`  integer;
alter table `ordine`   add index fk_ordine_rider (`rider_oid_user`), add constraint fk_ordine_rider foreign key (`rider_oid_user`) references `rider` (`user_2_oid_user`);


-- RiderUser_Slot [rel2]
create table `rideruser_slot` (
   `rider_oid`  integer not null,
   `slot_oid`  integer not null,
  primary key (`rider_oid`, `slot_oid`)
);
alter table `rideruser_slot`   add index fk_rideruser_slot_rider (`rider_oid`), add constraint fk_rideruser_slot_rider foreign key (`rider_oid`) references `rider` (`user_2_oid_user`);
alter table `rideruser_slot`   add index fk_rideruser_slot_slot (`slot_oid`), add constraint fk_rideruser_slot_slot foreign key (`slot_oid`) references `slot` (`oid`);


-- RiderUser_City [rel3]
alter table `rider`  add column  `city_name`  varchar(255);
alter table `rider`   add index fk_rider_city (`city_name`), add constraint fk_rider_city foreign key (`city_name`) references `city` (`name`);


-- OrderItem_Ordine [rel4]
alter table `orderitem`  add column  `ordine_oid`  integer;
alter table `orderitem`   add index fk_orderitem_ordine (`ordine_oid`), add constraint fk_orderitem_ordine foreign key (`ordine_oid`) references `ordine` (`oid`);


-- RestaurantUser_City [rel5]
alter table `restaurant`  add column  `city_name`  varchar(255);
alter table `restaurant`   add index fk_restaurant_city (`city_name`), add constraint fk_restaurant_city foreign key (`city_name`) references `city` (`name`);


-- Slot_RestaurantUser [rel6]
alter table `slot`  add column  `restaurant_oid`  integer;
alter table `slot`   add index fk_slot_restaurant (`restaurant_oid`), add constraint fk_slot_restaurant foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid_user`);


-- RestaurantUser_Cuisine type [rel7]
create table `restaurantuser_cuisine_type` (
   `restaurant_oid`  integer not null,
   `cuisine_type_name`  varchar(255) not null,
  primary key (`restaurant_oid`, `cuisine_type_name`)
);
alter table `restaurantuser_cuisine_type`   add index fk_restaurantuser_cuisine_type (`restaurant_oid`), add constraint fk_restaurantuser_cuisine_type foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid_user`);
alter table `restaurantuser_cuisine_type`   add index fk_restaurantuser_cuisine_ty_2 (`cuisine_type_name`), add constraint fk_restaurantuser_cuisine_ty_2 foreign key (`cuisine_type_name`) references `cuisine_type` (`name`);


-- RestaurantUser_Item [rel8]
alter table `item`  add column  `restaurant_oid`  integer;
alter table `item`   add index fk_item_restaurant (`restaurant_oid`), add constraint fk_item_restaurant foreign key (`restaurant_oid`) references `restaurant` (`user_2_oid_user`);


-- CustomerUser_Ordine [rel9]
alter table `ordine`  add column  `customer_oid`  integer;
alter table `ordine`   add index fk_ordine_customer (`customer_oid`), add constraint fk_ordine_customer foreign key (`customer_oid`) references `customer` (`user_2_oid_user`);


-- GEN FK: CustomerUser --> User
alter table `customer`   add index fk_customer_user_2 (`user_2_oid_user`), add constraint fk_customer_user_2 foreign key (`user_2_oid_user`) references `user_2` (`oid_user`);


-- GEN FK: RiderUser --> User
alter table `rider`   add index fk_rider_user_2 (`user_2_oid_user`), add constraint fk_rider_user_2 foreign key (`user_2_oid_user`) references `user_2` (`oid_user`);


-- GEN FK: RestaurantUser --> User
alter table `restaurant`   add index fk_restaurant_user_2 (`user_2_oid_user`), add constraint fk_restaurant_user_2 foreign key (`user_2_oid_user`) references `user_2` (`oid_user`);


-- RiderUser.rating [ent2#att9]
create view `rideruser_rating_view` as
select AL1.`user_2_oid_user` as `user_2_oid_user`, avg(AL2.`feedback_to_rider`) as `der_attr`
from  `rider` AL1 
               left outer join `ordine` AL2 on AL1.`user_2_oid_user`=AL2.`rider_oid_user`
group by AL1.`user_2_oid_user`;


-- RestaurantUser.rating [ent3#att22]
create view `restaurantuser_rating_view` as
select AL1.`user_2_oid_user` as `user_2_oid_user`, avg(AL4.`feedback_to_restaurant`) as `der_attr`
from  `restaurant` AL1 
               left outer join `item` AL2 on AL1.`user_2_oid_user`=AL2.`restaurant_oid`
               left outer join `orderitem` AL3 on AL2.`oid`=AL3.`item_oid`
               left outer join `ordine` AL4 on AL3.`ordine_oid`=AL4.`oid`
group by AL1.`user_2_oid_user`;



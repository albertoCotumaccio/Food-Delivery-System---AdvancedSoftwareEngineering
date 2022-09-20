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
   `balance`  double precision,
   `phone`  varchar(255),
  primary key (`oid`)
);


-- CustomerUser [ent1]
create table `customeruser` (
   `user_oid`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `address`  varchar(255),
  primary key (`user_oid`)
);


-- OrderItem [ent10]
create table `orderitem` (
   `quantity`  integer,
   `oid`  integer  not null,
  primary key (`oid`)
);


-- RiderUser [ent2]
create table `rideruser` (
   `user_oid`  integer  not null,
   `name`  varchar(255),
   `surname`  varchar(255),
   `busy`  bit,
  primary key (`user_oid`)
);


-- RestaurantUser [ent3]
create table `restaurantuser` (
   `user_oid`  integer  not null,
   `address`  varchar(255),
   `logo`  varchar(255),
   `bio`  longtext,
   `name`  varchar(255),
   `delivery_fee`  double precision,
   `delivery_time`  integer,
   `minimum_spend`  integer,
  primary key (`user_oid`)
);


-- Mean of transport [ent4]
create table `mean_of_transport` (
   `name`  varchar(255)  not null,
  primary key (`name`)
);


-- Order [ent5]
create table `order` (
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
alter table `module`  add column  `group_oid`  integer;
alter table `module`   add index fk_module_group_2 (`group_oid`), add constraint fk_module_group_2 foreign key (`group_oid`) references `group` (`oid`);


-- Group_Module [Group2Module_Module2Group]
alter table `module`  add column  `group_oid_2`  integer;
alter table `module`   add index fk_module_group (`group_oid_2`), add constraint fk_module_group foreign key (`group_oid_2`) references `group` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group_2 (`group_oid`), add constraint fk_user_group_2 foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
alter table `user`  add column  `group_oid_2`  integer;
alter table `user`   add index fk_user_group (`group_oid_2`), add constraint fk_user_group foreign key (`group_oid_2`) references `group` (`oid`);


-- RiderUser_Entity4 [rel1]
alter table `rideruser`  add column  `mean_of_transport_name`  varchar(255);
alter table `rideruser`   add index fk_rideruser_mean_of_transport (`mean_of_transport_name`), add constraint fk_rideruser_mean_of_transport foreign key (`mean_of_transport_name`) references `mean_of_transport` (`name`);


-- OrderItem_Item [rel10]
alter table `orderitem`  add column  `item_oid`  integer;
alter table `orderitem`   add index fk_orderitem_item (`item_oid`), add constraint fk_orderitem_item foreign key (`item_oid`) references `item` (`oid`);


-- User_City [rel11]
alter table `user`  add column  `city_name`  varchar(255);
alter table `user`   add index fk_user_city (`city_name`), add constraint fk_user_city foreign key (`city_name`) references `city` (`name`);


-- RiderUser_Order [rel12]
alter table `order`  add column  `rideruser_oid`  integer;
alter table `order`   add index fk_order_rideruser (`rideruser_oid`), add constraint fk_order_rideruser foreign key (`rideruser_oid`) references `rideruser` (`user_oid`);


-- RiderUser_Slot [rel2]
create table `rideruser_slot` (
   `rideruser_oid`  integer not null,
   `slot_oid`  integer not null,
  primary key (`rideruser_oid`, `slot_oid`)
);
alter table `rideruser_slot`   add index fk_rideruser_slot_rideruser (`rideruser_oid`), add constraint fk_rideruser_slot_rideruser foreign key (`rideruser_oid`) references `rideruser` (`user_oid`);
alter table `rideruser_slot`   add index fk_rideruser_slot_slot (`slot_oid`), add constraint fk_rideruser_slot_slot foreign key (`slot_oid`) references `slot` (`oid`);


-- Order_CustomerUser [rel3]
alter table `order`  add column  `customeruser_oid`  integer;
alter table `order`   add index fk_order_customeruser (`customeruser_oid`), add constraint fk_order_customeruser foreign key (`customeruser_oid`) references `customeruser` (`user_oid`);


-- Order_OrderItem [rel4]
alter table `orderitem`  add column  `order_oid`  integer;
alter table `orderitem`   add index fk_orderitem_order (`order_oid`), add constraint fk_orderitem_order foreign key (`order_oid`) references `order` (`oid`);


-- Slot_RestaurantUser [rel6]
alter table `slot`  add column  `restaurantuser_oid`  integer;
alter table `slot`   add index fk_slot_restaurantuser (`restaurantuser_oid`), add constraint fk_slot_restaurantuser foreign key (`restaurantuser_oid`) references `restaurantuser` (`user_oid`);


-- RestaurantUser_Cuisine type [rel7]
alter table `restaurantuser`  add column  `cuisine_type_name`  varchar(255);
alter table `restaurantuser`   add index fk_restaurantuser_cuisine_type (`cuisine_type_name`), add constraint fk_restaurantuser_cuisine_type foreign key (`cuisine_type_name`) references `cuisine_type` (`name`);


-- RestaurantUser_Item [rel8]
alter table `item`  add column  `restaurantuser_oid`  integer;
alter table `item`   add index fk_item_restaurantuser (`restaurantuser_oid`), add constraint fk_item_restaurantuser foreign key (`restaurantuser_oid`) references `restaurantuser` (`user_oid`);


-- GEN FK: CustomerUser --> User
alter table `customeruser`   add index fk_customeruser_user (`user_oid`), add constraint fk_customeruser_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: RiderUser --> User
alter table `rideruser`   add index fk_rideruser_user (`user_oid`), add constraint fk_rideruser_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: RestaurantUser --> User
alter table `restaurantuser`   add index fk_restaurantuser_user (`user_oid`), add constraint fk_restaurantuser_user foreign key (`user_oid`) references `user` (`oid`);


-- RiderUser.rating [ent2#att9]
create view `rideruser_rating_view` as
select AL1.`user_oid` as `user_oid`, avg(AL2.`feedback_to_rider`) as `der_attr`
from  `rideruser` AL1 
               left outer join `order` AL2 on AL1.`user_oid`=AL2.`rideruser_oid`
group by AL1.`user_oid`;


-- RestaurantUser.rating [ent3#att22]
-- Unable to compute the view for the derived element 'rating [ent3#att22]'
-- com.webratio.ide.derivation.DerivationException: Unable to generate view for attribute: rating [ent3#att22] (avg(Self.rel8#role15(as Var1).rel10#role20(as Var2).rel4#role7(as Var3).ent5#att26))
-- 	at com.webratio.ide.derivation.DerivationPlugin.getAttributeQueryDoc(DerivationPlugin.java:261)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getQueryDoc(DerivationPlugin.java:203)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getQuery(DerivationPlugin.java:126)
-- 	at com.webratio.ide.ui.dbsync.SQLGenerator.getAddView(SQLGenerator.java:884)
-- 	at com.webratio.ide.ui.dbsync.SQLGenerator.generateSQL(SQLGenerator.java:320)
-- 	at com.webratio.ide.ui.dbsync.wizards.SQLPage$3.run(SQLPage.java:223)
-- 	at org.eclipse.jface.operation.ModalContext$ModalContextThread.run(ModalContext.java:121)
-- Caused by: com.webratio.ide.derivation.internal.parser.ParseException: Relationship rel4#role7 does not originate from previous entity in OQL path [ent3, rel8#role15, rel10#role20, rel4#role7, ent5#att26]
-- 	at com.webratio.ide.derivation.internal.parser.ParserHelper.translatePath(ParserHelper.java:159)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.PathExpression(OQLParser.java:282)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeExpression(OQLParser.java:402)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeValue(OQLParser.java:474)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeQuery(OQLParser.java:1497)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getAttributeQueryDoc(DerivationPlugin.java:259)
-- 	... 6 more



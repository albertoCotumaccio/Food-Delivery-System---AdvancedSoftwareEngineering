-- OrderItem [ent10]
create table `orderitem` (
   `quantity`  integer
);


-- Order [ent5]
alter table `ordine`  add column  `accepted`  bit;
alter table `ordine`  add column  `delivered`  bit;
alter table `ordine`  add column  `feedback_to_rider`  integer;
alter table `ordine`  add column  `feedback_to_restaurant`  integer;


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


-- OrderItem_Item [rel10]
alter table `orderitem`  add column  `item_oid`  integer;
alter table `orderitem`   add index fk_orderitem_item (`item_oid`), add constraint fk_orderitem_item foreign key (`item_oid`) references `item` (`oid`);


-- RiderUser_Order [rel12]
alter table `ordine`  add column  `rider_oid_user`  integer;
alter table `ordine`   add index fk_ordine_rider (`rider_oid_user`), add constraint fk_ordine_rider foreign key (`rider_oid_user`) references `rider` (`user_2_oid_user`);


-- RiderUser_City [rel3]
alter table `rider`  add column  `city_name`  varchar(255);
alter table `rider`   add index fk_rider_city_2 (`city_name`), add constraint fk_rider_city_2 foreign key (`city_name`) references `city` (`name`);


-- OrderItem_Ordine [rel4]
alter table `orderitem`  add column  `ordine_oid`  integer;
alter table `orderitem`   add index fk_orderitem_ordine (`ordine_oid`), add constraint fk_orderitem_ordine foreign key (`ordine_oid`) references `ordine` (`oid`);


-- RestaurantUser_City [rel5]
alter table `restaurant`  add column  `city_name`  varchar(255);
alter table `restaurant`   add index fk_restaurant_city_2 (`city_name`), add constraint fk_restaurant_city_2 foreign key (`city_name`) references `city` (`name`);


-- RiderUser.rating [ent2#att9]
create view `rideruser_rating_view` as
select AL1.`user_2_oid_user` as `user_2_oid_user`, avg(AL3.`feedback_to_rider`) as `der_attr`
from  `rider` AL1 
               left outer join `ordine` AL2 on AL1.`user_2_oid_user`=AL2.`rider_oid_user`
               left outer join `ordine` AL3 on AL2.`oid`=AL3.`oid`
group by AL1.`user_2_oid_user`;


-- RestaurantUser.rating [ent3#att22]
create view `restaurantuser_rating_view` as
select AL1.`user_2_oid_user` as `user_2_oid_user`, avg(AL4.`feedback_to_restaurant`) as `der_attr`
from  `restaurant` AL1 
               left outer join `item` AL2 on AL1.`user_2_oid_user`=AL2.`restaurant_oid`
               left outer join `orderitem` AL3 on AL2.`oid`=AL3.`item_oid`
               left outer join `ordine` AL4 on AL3.`ordine_oid`=AL4.`oid`
group by AL1.`user_2_oid_user`;



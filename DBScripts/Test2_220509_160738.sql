-- User [User]
create table `user_2` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- rel1 [rel1]
create table `rel1` (
   `rider_oid`  integer not null,
   `restaurant_oid`  integer not null,
  primary key (`rider_oid`, `restaurant_oid`)
);
alter table `rel1`   add index fk_rel1_rider (`rider_oid`), add constraint fk_rel1_rider foreign key (`rider_oid`) references `rider` (`user_oid`);
alter table `rel1`   add index fk_rel1_restaurant (`restaurant_oid`), add constraint fk_rel1_restaurant foreign key (`restaurant_oid`) references `restaurant` (`user_oid`);


-- GEN FK: Customer --> User
alter table `customer`   add index fk_customer_user_2 (`user_oid`), add constraint fk_customer_user_2 foreign key (`user_oid`) references `user_2` (`oid`);


-- GEN FK: Rider --> User
alter table `rider`   add index fk_rider_user_2 (`user_oid`), add constraint fk_rider_user_2 foreign key (`user_oid`) references `user_2` (`oid`);


-- GEN FK: Restaurant --> User
alter table `restaurant`   add index fk_restaurant_user_2 (`user_oid`), add constraint fk_restaurant_user_2 foreign key (`user_oid`) references `user_2` (`oid`);



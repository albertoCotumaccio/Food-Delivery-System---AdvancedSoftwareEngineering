-- RestaurantUser_City [rel5]
alter table `restaurant`  add column  `city_name`  varchar(255);
alter table `restaurant`   add index fk_restaurant_city_2 (`city_name`), add constraint fk_restaurant_city_2 foreign key (`city_name`) references `city` (`name`);



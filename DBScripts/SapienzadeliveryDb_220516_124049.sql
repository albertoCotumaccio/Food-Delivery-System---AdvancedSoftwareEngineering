-- User_City [rel11]
alter table `user`  add column  `city_name`  varchar(255);
alter table `user`   add index fk_user_city (`city_name`), add constraint fk_user_city foreign key (`city_name`) references `city` (`name`);



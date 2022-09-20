-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `module`  add column  `oid`  integer;
alter table `module`   add index fk_module_group_3 (`oid`), add constraint fk_module_group_3 foreign key (`oid`) references `group` (`oid_group`);



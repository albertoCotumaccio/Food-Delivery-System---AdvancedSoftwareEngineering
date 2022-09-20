-- Group_Module [Group2Module_Module2Group]
alter table `module`  add column  `group_oid`  integer;
alter table `module`   add index fk_module_group_3 (`group_oid`), add constraint fk_module_group_3 foreign key (`group_oid`) references `group` (`oid_group`);



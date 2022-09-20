-- Order [ent5]
create table `order_2` (
   `oid`  integer  not null,
   `total`  double precision,
   `accepted`  bit,
   `delivered`  bit,
   `feedback_to_rider`  integer,
   `feedback_to_restaurant`  integer,
  primary key (`oid`)
);


-- Item [ent9]
create table `item_2` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `description`  longtext,
   `category`  varchar(255),
   `price`  double precision,
  primary key (`oid`)
);


-- RestaurantUser [ent3]
alter table `restaurantuser`  add column  `name_2`  varchar(255);
alter table `restaurantuser`  add column  `delivery_fee_2`  double precision;
alter table `restaurantuser`  add column  `delivery_time_2`  integer;
alter table `restaurantuser`  add column  `minimum_spend_2`  integer;


-- OrderItem_Item [rel10]
alter table `orderitem`  add column  `item_2_oid`  integer;
alter table `orderitem`   add index fk_orderitem_item_2 (`item_2_oid`), add constraint fk_orderitem_item_2 foreign key (`item_2_oid`) references `item_2` (`oid`);


-- Order_OrderItem [rel4]
alter table `orderitem`  add column  `order_2_oid`  integer;
alter table `orderitem`   add index fk_orderitem_order_2 (`order_2_oid`), add constraint fk_orderitem_order_2 foreign key (`order_2_oid`) references `order_2` (`oid`);


-- RestaurantUser_Item [rel8]
alter table `item_2`   add index fk_item_2_restaurantuser (), add constraint fk_item_2_restaurantuser foreign key () references `restaurantuser` ();


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
-- Caused by: java.lang.IndexOutOfBoundsException: Index: 0, Size: 0
-- 	at java.util.ArrayList.rangeCheck(ArrayList.java:635)
-- 	at java.util.ArrayList.get(ArrayList.java:411)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeQuery(OQLParser.java:1476)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getAttributeQueryDoc(DerivationPlugin.java:259)
-- 	... 6 more



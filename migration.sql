BEGIN;
--
-- Create model PromotionEvent
--
CREATE TABLE "inventory_promotionevent" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL UNIQUE, "start_date" datetime NOT NULL, "end_date" datetime NOT NULL, "price_reduction" integer NOT NULL);
--
-- Create model User
--
CREATE TABLE "inventory_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "username" varchar(50) NOT NULL UNIQUE, "email" varchar(255) NOT NULL UNIQUE, "password" varchar(60) NOT NULL);
--
-- Create model Category
--
CREATE TABLE "inventory_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL UNIQUE, "slug" varchar(55) NOT NULL UNIQUE, "is_active" bool NOT NULL, "level" smallint NOT NULL, "parent_id" bigint NULL REFERENCES "inventory_category" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Product
--
CREATE TABLE "inventory_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL UNIQUE, "slug" varchar(55) NOT NULL UNIQUE, "description" text NULL, "is_digital" bool NOT NULL, "is_active" bool NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NULL, "price" decimal NOT NULL, "category_id" bigint NOT NULL REFERENCES "inventory_category" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model StockManagement
--
CREATE TABLE "inventory_stockmanagement" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer NOT NULL, "last_checked_at" datetime NOT NULL, "product_id" bigint NOT NULL UNIQUE REFERENCES "inventory_product" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Order
--
CREATE TABLE "inventory_order" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" bigint NOT NULL REFERENCES "inventory_user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model OrderProduct
--
CREATE TABLE "inventory_orderproduct" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer NOT NULL, "order_id" bigint NOT NULL REFERENCES "inventory_order" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "inventory_product" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model ProductPromotionEvent
--
CREATE TABLE "inventory_productpromotionevent" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "product_id" bigint NOT NULL REFERENCES "inventory_product" ("id") DEFERRABLE INITIALLY DEFERRED, "promotion_event_id" bigint NOT NULL REFERENCES "inventory_promotionevent" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "inventory_category_parent_id_557e1977" ON "inventory_category" ("parent_id");
CREATE INDEX "inventory_product_category_id_c907876e" ON "inventory_product" ("category_id");
CREATE INDEX "inventory_order_user_id_39b1194f" ON "inventory_order" ("user_id");
CREATE UNIQUE INDEX "inventory_orderproduct_product_id_order_id_e301c159_uniq" ON "inventory_orderproduct" ("product_id", "order_id");
CREATE INDEX "inventory_orderproduct_order_id_8821f0e8" ON "inventory_orderproduct" ("order_id");
CREATE INDEX "inventory_orderproduct_product_id_e64b865e" ON "inventory_orderproduct" ("product_id");
CREATE UNIQUE INDEX "inventory_productpromotionevent_product_id_promotion_event_id_a47c1bed_uniq" ON "inventory_productpromotionevent" ("product_id", "promotion_event_id");
CREATE INDEX "inventory_productpromotionevent_product_id_1ee78feb" ON "inventory_productpromotionevent" ("product_id");
CREATE INDEX "inventory_productpromotionevent_promotion_event_id_56ef8a92" ON "inventory_productpromotionevent" ("promotion_event_id");
COMMIT;

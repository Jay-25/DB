-- ----------------------------
-- Table structure for tab_second_house
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house";
CREATE TABLE "public"."tab_second_house" (
"id" int4 DEFAULT nextval('tab_second_house_id_seq'::regclass) NOT NULL,
"release_time" timestamp(6),
"price" float8,
"price_unit" float8,
"house_property" varchar(64) COLLATE "default",
"house_style" varchar(64) COLLATE "default",
"house_struct" varchar(64) COLLATE "default",
"house_decoration" varchar(64) COLLATE "default",
"house_class" varchar(64) COLLATE "default",
"build_class" varchar(64) COLLATE "default",
"usage_area" float8,
"build_area" float8,
"build_name" varchar(128) COLLATE "default",
"build_time_year" int4,
"build_face" varchar(64) COLLATE "default",
"build_layer" int4,
"build_max_layer" int4,
"address_city" varchar(128) COLLATE "default",
"address" varchar(128) COLLATE "default",
"develop_company" text COLLATE "default",
"property_costs" varchar(20) COLLATE "default",
"property_company" text COLLATE "default",
"mortgage_down_payment" float8,
"monthly" float8,
"url" text COLLATE "default",
"url_cofrom" varchar(128) COLLATE "default" NOT NULL,
"web_in_uid" varchar(64) COLLATE "default" NOT NULL,
"postcode" varchar(16) COLLATE "default",
"coordinate" point DEFAULT point((0.0)::double precision, (0.0)::double precision) NOT NULL,
"elevation" numeric DEFAULT 0.0,
"cofrom" varchar(20) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table tab_second_house
-- ----------------------------
CREATE INDEX "tab_second_house_gps" ON "public"."tab_second_house" USING gist (coordinate);
CREATE INDEX "tab_second_house_time" ON "public"."tab_second_house" USING btree (release_time);

-- ----------------------------
-- Primary Key structure for table tab_second_house
-- ----------------------------
ALTER TABLE "public"."tab_second_house" ADD PRIMARY KEY ("url_cofrom", "web_in_uid") WITH (fillfactor=100);

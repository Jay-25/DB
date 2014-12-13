
CREATE SEQUENCE public.tab_address_id_seq
  START 783697
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  CACHE 1;

ALTER TABLE public.tab_address_id_seq
  OWNER TO postgres;

CREATE SEQUENCE public.tab_caishichang_market_id_seq
  START 79
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  CACHE 1;

ALTER TABLE public.tab_caishichang_market_id_seq
  OWNER TO postgres;

CREATE SEQUENCE public.tab_second_house_id_seq
  START 4264445
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  CACHE 1;

ALTER TABLE public.tab_second_house_id_seq
  OWNER TO postgres;
  
-- ----------------------------
-- Table structure for tab_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_address";
CREATE TABLE "public"."tab_address" (
"id" int4 DEFAULT nextval('tab_address_id_seq'::regclass) NOT NULL,
"position" text COLLATE "default",
"address" text COLLATE "default" NOT NULL,
"postcode" varchar(10) COLLATE "default",
"coordinate" point DEFAULT point((0.0)::double precision, (0.0)::double precision) NOT NULL,
"elevation" numeric DEFAULT 0.0,
"cofrom" varchar(20) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."tab_address"."position" IS '地点名称';
COMMENT ON COLUMN "public"."tab_address"."address" IS '地址';
COMMENT ON COLUMN "public"."tab_address"."postcode" IS '邮编';
COMMENT ON COLUMN "public"."tab_address"."coordinate" IS '平面坐标（经度，纬度）';
COMMENT ON COLUMN "public"."tab_address"."elevation" IS '海拔';

-- ----------------------------
-- Table structure for tab_caishichang_market
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_caishichang_market";
CREATE TABLE "public"."tab_caishichang_market" (
"id" int8 DEFAULT nextval('tab_caishichang_market_id_seq'::regclass) NOT NULL,
"district" varchar(64) COLLATE "default" NOT NULL,
"type" varchar(64) COLLATE "default" NOT NULL,
"name" varchar(64) COLLATE "default" NOT NULL,
"updated" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_caishichang_nutrition
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_caishichang_nutrition";
CREATE TABLE "public"."tab_caishichang_nutrition" (
"food" varchar(64) COLLATE "default" NOT NULL,
"name" varchar(64) COLLATE "default" NOT NULL,
"unit" varchar(64) COLLATE "default",
"value" numeric,
"nrv" int4,
"per" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_caishichang_price
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_caishichang_price";
CREATE TABLE "public"."tab_caishichang_price" (
"updatetime" timestamp(6) NOT NULL,
"market" varchar(64) COLLATE "default" NOT NULL,
"type" varchar(64) COLLATE "default" NOT NULL,
"name" varchar(64) COLLATE "default" NOT NULL,
"avgprice" numeric,
"maxprice" numeric,
"minprice" numeric,
"average" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_china_city
-- ----------------------------
DROP TABLE tab_china_city;
CREATE TABLE tab_china_city
(
  id integer,
  state character varying(64) NOT NULL,
  city character varying(64) NOT NULL,
  sz_code integer,
  city_py character varying(64),
  zm_code character varying(64),
  state_py character varying(64)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tab_china_city
  OWNER TO postgres;

-- ----------------------------
-- Table structure for tab_gps_base
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_gps_base";
CREATE TABLE "public"."tab_gps_base" (
"gps_from" varchar(30) COLLATE "default" NOT NULL,
"coordinate" point,
"base_address" varchar(64) COLLATE "default",
"source" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_house_city_gps
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_house_city_gps";
CREATE TABLE "public"."tab_house_city_gps" (
"state" varchar(64) COLLATE "default" NOT NULL,
"city" varchar(64) COLLATE "default" NOT NULL,
"region" varchar(64) COLLATE "default" NOT NULL,
"coordinate" point NOT NULL
)
WITH (OIDS=FALSE)

;

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
-- Table structure for tab_second_house_anhui
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_anhui";
CREATE TABLE "public"."tab_second_house_anhui" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_beijing
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_beijing";
CREATE TABLE "public"."tab_second_house_beijing" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_chongqiang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_chongqiang";
CREATE TABLE "public"."tab_second_house_chongqiang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_fujia
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_fujia";
CREATE TABLE "public"."tab_second_house_fujia" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_gansu
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_gansu";
CREATE TABLE "public"."tab_second_house_gansu" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_guangdong
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_guangdong";
CREATE TABLE "public"."tab_second_house_guangdong" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_guangxi
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_guangxi";
CREATE TABLE "public"."tab_second_house_guangxi" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_guizhou
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_guizhou";
CREATE TABLE "public"."tab_second_house_guizhou" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_haina
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_haina";
CREATE TABLE "public"."tab_second_house_haina" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_hebei
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_hebei";
CREATE TABLE "public"."tab_second_house_hebei" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_heilongjiang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_heilongjiang";
CREATE TABLE "public"."tab_second_house_heilongjiang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_hena
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_hena";
CREATE TABLE "public"."tab_second_house_hena" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_hubei
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_hubei";
CREATE TABLE "public"."tab_second_house_hubei" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_huna
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_huna";
CREATE TABLE "public"."tab_second_house_huna" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_jiangsu
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_jiangsu";
CREATE TABLE "public"."tab_second_house_jiangsu" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_jiangxi
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_jiangxi";
CREATE TABLE "public"."tab_second_house_jiangxi" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_jili
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_jili";
CREATE TABLE "public"."tab_second_house_jili" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_jinghai
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_jinghai";
CREATE TABLE "public"."tab_second_house_jinghai" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_liaoning
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_liaoning";
CREATE TABLE "public"."tab_second_house_liaoning" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_neimenggu
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_neimenggu";
CREATE TABLE "public"."tab_second_house_neimenggu" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_ningjia
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_ningjia";
CREATE TABLE "public"."tab_second_house_ningjia" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_shaanxi
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_shaanxi";
CREATE TABLE "public"."tab_second_house_shaanxi" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_shandong
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_shandong";
CREATE TABLE "public"."tab_second_house_shandong" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_shanghai
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_shanghai";
CREATE TABLE "public"."tab_second_house_shanghai" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_shanxi
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_shanxi";
CREATE TABLE "public"."tab_second_house_shanxi" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_sichua
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_sichua";
CREATE TABLE "public"."tab_second_house_sichua" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_taiwan
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_taiwan";
CREATE TABLE "public"."tab_second_house_taiwan" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_tianji
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_tianji";
CREATE TABLE "public"."tab_second_house_tianji" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_xianggang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_xianggang";
CREATE TABLE "public"."tab_second_house_xianggang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_xinjiang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_xinjiang";
CREATE TABLE "public"."tab_second_house_xinjiang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_xizang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_xizang";
CREATE TABLE "public"."tab_second_house_xizang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_yunna
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_yunna";
CREATE TABLE "public"."tab_second_house_yunna" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tab_second_house_zhejiang
-- ----------------------------
DROP TABLE IF EXISTS "public"."tab_second_house_zhejiang";
CREATE TABLE "public"."tab_second_house_zhejiang" (
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
"coordinate" point,
"elevation" numeric,
"cofrom" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Uniques structure for table tab_address
-- ----------------------------
ALTER TABLE "public"."tab_address" ADD UNIQUE ("id");

-- ----------------------------
-- Indexes structure for table tab_caishichang_market
-- ----------------------------
CREATE INDEX "idx_tab_caishichang_market" ON "public"."tab_caishichang_market" USING btree (district, type, name);

-- ----------------------------
-- Primary Key structure for table tab_caishichang_market
-- ----------------------------
ALTER TABLE "public"."tab_caishichang_market" ADD PRIMARY KEY ("district", "type", "name");

-- ----------------------------
-- Indexes structure for table tab_caishichang_nutrition
-- ----------------------------
CREATE INDEX "idx_tab_caishichang_nutrition" ON "public"."tab_caishichang_nutrition" USING btree (food, name);

-- ----------------------------
-- Primary Key structure for table tab_caishichang_nutrition
-- ----------------------------
ALTER TABLE "public"."tab_caishichang_nutrition" ADD PRIMARY KEY ("food", "name");

-- ----------------------------
-- Indexes structure for table tab_caishichang_price
-- ----------------------------
CREATE INDEX "idx_tab_caishichang_price" ON "public"."tab_caishichang_price" USING btree (updatetime, name);

-- ----------------------------
-- Primary Key structure for table tab_caishichang_price
-- ----------------------------
ALTER TABLE "public"."tab_caishichang_price" ADD PRIMARY KEY ("updatetime", "market", "type", "name");

-- ----------------------------
-- Primary Key structure for table tab_gps_base
-- ----------------------------
ALTER TABLE "public"."tab_gps_base" ADD PRIMARY KEY ("gps_from");

-- ----------------------------
-- Primary Key structure for table tab_house_city_gps
-- ----------------------------
ALTER TABLE "public"."tab_house_city_gps" ADD PRIMARY KEY ("state", "city", "region");

-- ----------------------------
-- Indexes structure for table tab_second_house
-- ----------------------------
CREATE INDEX "tab_second_house_gps" ON "public"."tab_second_house" USING gist (coordinate);
CREATE INDEX "tab_second_house_time" ON "public"."tab_second_house" USING btree (release_time);

-- ----------------------------
-- Primary Key structure for table tab_second_house
-- ----------------------------
ALTER TABLE "public"."tab_second_house" ADD PRIMARY KEY ("url_cofrom", "web_in_uid") WITH (fillfactor=100);

-- ----------------------------
-- Primary Key structure for table tab_second_house_anhui
-- ----------------------------
ALTER TABLE "public"."tab_second_house_anhui" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_beijing
-- ----------------------------
ALTER TABLE "public"."tab_second_house_beijing" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_chongqiang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_chongqiang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_fujia
-- ----------------------------
ALTER TABLE "public"."tab_second_house_fujia" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_gansu
-- ----------------------------
ALTER TABLE "public"."tab_second_house_gansu" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_guangdong
-- ----------------------------
ALTER TABLE "public"."tab_second_house_guangdong" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_guangxi
-- ----------------------------
ALTER TABLE "public"."tab_second_house_guangxi" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_guizhou
-- ----------------------------
ALTER TABLE "public"."tab_second_house_guizhou" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_haina
-- ----------------------------
ALTER TABLE "public"."tab_second_house_haina" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_hebei
-- ----------------------------
ALTER TABLE "public"."tab_second_house_hebei" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_heilongjiang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_heilongjiang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_hena
-- ----------------------------
ALTER TABLE "public"."tab_second_house_hena" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_hubei
-- ----------------------------
ALTER TABLE "public"."tab_second_house_hubei" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_huna
-- ----------------------------
ALTER TABLE "public"."tab_second_house_huna" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_jiangsu
-- ----------------------------
ALTER TABLE "public"."tab_second_house_jiangsu" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_jiangxi
-- ----------------------------
ALTER TABLE "public"."tab_second_house_jiangxi" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_jili
-- ----------------------------
ALTER TABLE "public"."tab_second_house_jili" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_jinghai
-- ----------------------------
ALTER TABLE "public"."tab_second_house_jinghai" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_liaoning
-- ----------------------------
ALTER TABLE "public"."tab_second_house_liaoning" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_neimenggu
-- ----------------------------
ALTER TABLE "public"."tab_second_house_neimenggu" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_ningjia
-- ----------------------------
ALTER TABLE "public"."tab_second_house_ningjia" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_shaanxi
-- ----------------------------
ALTER TABLE "public"."tab_second_house_shaanxi" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_shandong
-- ----------------------------
ALTER TABLE "public"."tab_second_house_shandong" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_shanghai
-- ----------------------------
ALTER TABLE "public"."tab_second_house_shanghai" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_shanxi
-- ----------------------------
ALTER TABLE "public"."tab_second_house_shanxi" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_sichua
-- ----------------------------
ALTER TABLE "public"."tab_second_house_sichua" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_taiwan
-- ----------------------------
ALTER TABLE "public"."tab_second_house_taiwan" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_tianji
-- ----------------------------
ALTER TABLE "public"."tab_second_house_tianji" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_xianggang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_xianggang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_xinjiang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_xinjiang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_xizang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_xizang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_yunna
-- ----------------------------
ALTER TABLE "public"."tab_second_house_yunna" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");

-- ----------------------------
-- Primary Key structure for table tab_second_house_zhejiang
-- ----------------------------
ALTER TABLE "public"."tab_second_house_zhejiang" ADD PRIMARY KEY ("url_cofrom", "web_in_uid");


-- ----------------------------
-- TYPE
-- ----------------------------

CREATE TYPE public.t_vertex_4 AS (
  p  point[]
);

ALTER TYPE public.t_vertex_4
  OWNER TO postgres;

CREATE TYPE public.t_clip_map_box_base AS (
  u                       numeric,
  horizontal_part         numeric,
  horizontal_unit_degree  numeric,
  vertical_part           numeric,
  vertical_unit_degree    numeric
);

ALTER TYPE public.t_clip_map_box_base
  OWNER TO postgres;
  
  
CREATE TYPE public.t_vertex_6 AS (
  p  point[]
);

ALTER TYPE public.t_vertex_6
  OWNER TO postgres;
  
  
CREATE TYPE public.t_clip_map_bee_base AS (
  u                       numeric,
  horizontal_part         numeric,
  horizontal_unit_degree  numeric,
  vertical_part           numeric,
  vertical_unit_degree    numeric
);

ALTER TYPE public.t_clip_map_bee_base
  OWNER TO postgres;  
  
  

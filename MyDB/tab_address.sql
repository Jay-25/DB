/*
Navicat PGSQL Data Transfer

Source Server         : Postgres
Source Server Version : 90302
Source Host           : localhost:5432
Source Database       : Mydb
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90302
File Encoding         : 65001

Date: 2014-04-06 21:04:54
*/


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
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Uniques structure for table tab_address
-- ----------------------------
ALTER TABLE "public"."tab_address" ADD UNIQUE ("id");

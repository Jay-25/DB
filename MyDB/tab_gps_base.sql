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

Date: 2014-04-06 21:06:42
*/


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
-- Records of tab_gps_base
-- ----------------------------
INSERT INTO "public"."tab_gps_base" VALUES ('BaiDu API', '(116.488565,39.917538)', '北京市建国路89号院', 'http://api.map.baidu.com/geocoder?address=%s&output=xml&key=aVA53MLrilAbsnFCmugLQYVA');
INSERT INTO "public"."tab_gps_base" VALUES ('BaiDu Map', '(116.486143,39.91781)', '北京市建国路89号院', 'http://www.gpsspg.com/maps.htm');
INSERT INTO "public"."tab_gps_base" VALUES ('GaoDe API', '(116.480085,39.911152)', '北京市建国路89号院', 'http://api.amap.com:9090/geocode/simple?resType=xml&encode=utf-8&range=300&roadnum=3&crossnum=2&poinum=2&retvalue=1&key=undefined&sid=7000&address=%s&rid=89616');
INSERT INTO "public"."tab_gps_base" VALUES ('Google API', '(116.434409,39.914861)', '北京市建国路89号院', 'http://ditu.google.cn/maps/api/geocode/xml?address=%s&sensor=false&language=zh-CN');
INSERT INTO "public"."tab_gps_base" VALUES ('Google Earth', '(116.4735416739,39.9105978091)', '北京市建国路89号院', 'http://www.gpsspg.com/maps.htm');
INSERT INTO "public"."tab_gps_base" VALUES ('Google Map', '(116.4796410172,39.9118939569)', '北京市建国路89号院', 'http://www.gpsspg.com/maps.htm');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tab_gps_base
-- ----------------------------
ALTER TABLE "public"."tab_gps_base" ADD PRIMARY KEY ("gps_from");

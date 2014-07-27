CREATE VIEW public.vw_x_x_price_unit
(
  price_unit,
  cnt,
  gid,
  p
)
AS
SELECT 
  fun_clip_map_gridset.price_unit, 
  fun_clip_map_gridset.cnt, 
  fun_clip_map_gridset.gid, 
  fun_clip_map_gridset.p 
FROM fun_clip_map_gridset('bee'::character varying, 'beijing'::character varying, (2)::numeric, '2014-1-1'::character varying, '2014-2-1'::character varying, point((116.28)::double precision, (39.88)::double precision), point((116.38)::double precision, (39.99)::double precision)) fun_clip_map_gridset(price_unit numeric, cnt numeric, gid numeric, p point[]);

ALTER TABLE public.vw_x_x_price_unit
  OWNER TO postgres;
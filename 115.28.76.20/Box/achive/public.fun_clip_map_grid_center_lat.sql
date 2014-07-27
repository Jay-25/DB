--Function: public.fun_clip_map_grid_center_lat(double precision, double precision)

--DROP FUNCTION public.fun_clip_map_grid_center_lat(double precision, double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid_center_lat
(
  IN   double precision,
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN(FUN_CLIP_MAP_GRID_Y($1, $2)) * FUN_CLIP_MAP_GRID_VERTICAL_UNIT($2) - 90.0;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid_center_lat(double precision, double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid_center_lat(double precision, double precision)
  IS '根据格子ID计算格子中心纬度';
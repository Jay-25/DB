--Function: public.fun_clip_map_grid_x(double precision, double precision)

--DROP FUNCTION public.fun_clip_map_grid_x(double precision, double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid_x
(
  IN   double precision,
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN MOD($1::NUMERIC, FUN_CLIP_MAP_GRID_HORIZONTAL_P($2));
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid_x(double precision, double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid_x(double precision, double precision)
  IS '根据格子ID计算二维数组的X坐标';
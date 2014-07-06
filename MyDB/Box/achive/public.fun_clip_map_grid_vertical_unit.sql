--Function: public.fun_clip_map_grid_vertical_unit(double precision)

--DROP FUNCTION public.fun_clip_map_grid_vertical_unit(double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid_vertical_unit
(
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN 360.0 / FUN_CLIP_MAP_GRID_VERTICAL_P($1);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid_vertical_unit(double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid_vertical_unit(double precision)
  IS '根据精度获取格子的单位（度）';
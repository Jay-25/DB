--Function: public.fun_clip_map_grid(double precision, double precision, double precision)

--DROP FUNCTION public.fun_clip_map_grid(double precision, double precision, double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid
(
  IN   double precision,
  IN   double precision,
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE
V_P NUMERIC;
V_X NUMERIC;
V_Y NUMERIC;
BEGIN
  V_P := FUN_CLIP_MAP_GRID_HORIZONTAL_P($3);
  V_X := FLOOR(V_P * ($1 + 180.0) / 360.0);
  V_Y := FLOOR(V_P * ($2 + 90.0) / 360.0);
  RETURN V_X + V_Y * V_P;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid(double precision, double precision, double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid(double precision, double precision, double precision)
  IS '根据经纬度计算格子ID';
--Function: public.fun_clip_map_grid_vertical_p(double precision)

--DROP FUNCTION public.fun_clip_map_grid_vertical_p(double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid_vertical_p
(
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN CEIL(40075.7 / SQRT($1));
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid_vertical_p(double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid_vertical_p(double precision)
  IS '获取格子单位，参数：平方公里';
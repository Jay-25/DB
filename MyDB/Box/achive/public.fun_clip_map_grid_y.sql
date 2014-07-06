--Function: public.fun_clip_map_grid_y(double precision, double precision)

--DROP FUNCTION public.fun_clip_map_grid_y(double precision, double precision);

CREATE OR REPLACE FUNCTION public.fun_clip_map_grid_y
(
  IN   double precision,
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN FLOOR($1 / FUN_CLIP_MAP_GRID_VERTICAL_P($2));
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_grid_y(double precision, double precision)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_grid_y(double precision, double precision)
  IS '���ݸ���ID�����ά�����Y����';
--Function: public.fun_clip_map_bee_horizontal_unit_degree(area numeric)

--DROP FUNCTION public.fun_clip_map_bee_horizontal_unit_degree(area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_horizontal_unit_degree
(
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN 360.0 / FUN_CLIP_MAP_BEE_HORIZONTAL_PART(area);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_horizontal_unit_degree(area numeric)
  OWNER TO postgres;
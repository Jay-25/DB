--Function: public.fun_clip_map_bee_vertical_unit_degree(area numeric)

--DROP FUNCTION public.fun_clip_map_bee_vertical_unit_degree(area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_vertical_unit_degree
(
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN 180.0 / fun_clip_map_bee_vertical_part(area);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_vertical_unit_degree(area numeric)
  OWNER TO postgres;
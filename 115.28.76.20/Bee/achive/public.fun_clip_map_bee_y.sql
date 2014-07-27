--Function: public.fun_clip_map_bee_y(lat numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_y(lat numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_y
(
  IN  lat   numeric,
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE

BEGIN
  RETURN FLOOR((lat + 90.0) / fun_clip_map_bee_vertical_unit_degree(area));
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_y(lat numeric, area numeric)
  OWNER TO postgres;
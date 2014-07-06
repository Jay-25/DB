--Function: public.fun_clip_map_bee_x(lng numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_x(lng numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_x
(
  IN  lng   numeric,
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE
BEGIN
  RETURN FLOOR((lng + 180.0) / fun_clip_map_bee_horizontal_unit_degree(area));
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_x(lng numeric, area numeric)
  OWNER TO postgres;
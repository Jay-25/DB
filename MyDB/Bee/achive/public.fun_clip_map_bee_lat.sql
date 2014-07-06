--Function: public.fun_clip_map_bee_lat(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_lat(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_lat
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE
V_Px NUMERIC;
V_Pn NUMERIC;
V_Off NUMERIC;
BEGIN
  V_Px := fun_clip_map_bee_horizontal_part(area);
  V_Pn := (V_Px + 1) / 2;
  V_Off := FLOOR(gid / V_Pn);
  return V_Off * fun_clip_map_bee_vertical_unit_degree(area) - 90.0;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_lat(gid numeric, area numeric)
  OWNER TO postgres;
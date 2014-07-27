--Function: public.fun_clip_map_bee_lng(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_lng(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_lng
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE
V_N NUMERIC;
V_Px NUMERIC;
V_Pn NUMERIC;
V_Off NUMERIC;
V_Lm  NUMERIC;
BEGIN
  V_Px := fun_clip_map_bee_horizontal_part(area);
  V_Pn := (V_Px + 1) / 2;
  V_Off := FLOOR(gid / V_Pn);
  V_Lm := MOD(gid, V_Pn);
  return ( V_Off + 2 * V_Lm)* fun_clip_map_bee_horizontal_unit_degree(area) - 180.0;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_lng(gid numeric, area numeric)
  OWNER TO postgres;
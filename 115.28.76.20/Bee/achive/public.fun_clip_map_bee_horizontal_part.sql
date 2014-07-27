--Function: public.fun_clip_map_bee_horizontal_part(area numeric)

--DROP FUNCTION public.fun_clip_map_bee_horizontal_part(area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_horizontal_part
(
  IN  area  numeric
)
RETURNS numeric AS
$$
DECLARE
--V_DEG NUMERIC DEFAULT 30*3.14159/180;
V_U NUMERIC;
V_CLIP NUMERIC;
BEGIN
  V_U := SQRT(area/3.46410162); --SQRT(area/(6 * tan(V_DEG)));
  V_CLIP := CEIL(40075.7 / V_U);
  return V_CLIP + MOD(V_CLIP + 1, 2);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_horizontal_part(area numeric)
  OWNER TO postgres;
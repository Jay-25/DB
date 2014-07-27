-- 根据面积计算切分基本参数

--Function: public.fun_clip_map_bee_base(area numeric)

--DROP FUNCTION public.fun_clip_map_bee_base(area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_base
(
  IN  area  numeric
)
RETURNS T_CLIP_MAP_BEE_BASE AS
$$
DECLARE
V_BASE T_CLIP_MAP_BEE_BASE;
--V_DEG NUMERIC DEFAULT 30*3.14159/180;
V_CLIP NUMERIC;
BEGIN
  V_BASE.u := SQRT(area/3.46410162); --SQRT(area/(6 * tan(V_DEG)));
  V_CLIP := CEIL(40075.7 / V_BASE.u);
  V_BASE.horizontal_part := V_CLIP + MOD(V_CLIP + 1, 2);
  V_BASE.horizontal_unit_degree := 360.0 / V_BASE.horizontal_part;
  V_BASE.vertical_part := CEIL(40075.7 / (V_BASE.u * 3.46410162));
  V_BASE.vertical_unit_degree := 180.0 / V_BASE.vertical_part;
  
  RETURN V_BASE;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_base(area numeric)
  OWNER TO postgres;
-- 根据六边形中心点编号和切分的单位面积计算中心点的坐标

--Function: public.fun_clip_map_bee_point(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_point(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_point
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS point AS
$$
DECLARE
V_BASE t_clip_map_bee_base;
V_Px NUMERIC;
V_Pn NUMERIC;
V_Off NUMERIC;
V_Lm  NUMERIC;
BEGIN
  V_BASE := fun_clip_map_bee_base(area);
  
  V_Px := V_BASE.horizontal_part;
  V_Pn := (V_Px + 1) / 2;
  V_Off := FLOOR(gid / V_Pn);
  V_Lm := MOD(gid, V_Pn);
  
  return POINT((V_Off + 2 * V_Lm)* V_BASE.horizontal_unit_degree - 180.0,
               V_Off * V_BASE.vertical_unit_degree - 90.0);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_point(gid numeric, area numeric)
  OWNER TO postgres;
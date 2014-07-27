--Function: public.fun_clip_map_box(pointx point, area numeric)

--DROP FUNCTION public.fun_clip_map_box(pointx point, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_box
(
  IN  pointx  point,
  IN  area    numeric
)
RETURNS numeric AS
$$
DECLARE
V_BASE T_CLIP_MAP_BOX_BASE;
V_X numeric;
V_Y numeric;
BEGIN
  V_BASE := fun_clip_map_box_base(area);
  V_X := FLOOR((pointx[0] + 180.0) / V_BASE.horizontal_unit_degree);
  V_Y := FLOOR((pointx[1] + 90.0) / V_BASE.vertical_unit_degree);
  RETURN V_X + V_Y * V_BASE.horizontal_part;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_box(pointx point, area numeric)
  OWNER TO postgres;
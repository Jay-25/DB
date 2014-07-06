--Function: public.fun_clip_map_box_base(area numeric)

--DROP FUNCTION public.fun_clip_map_box_base(area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_box_base
(
  IN  area  numeric
)
RETURNS T_CLIP_MAP_BOX_BASE AS
$$
DECLARE
V_BASE T_CLIP_MAP_BOX_BASE;
BEGIN
  V_BASE.u = SQRT(area);
  V_BASE.horizontal_part := CEIL(40075.7 / V_BASE.u);
  V_BASE.horizontal_unit_degree := 360.0 / V_BASE.horizontal_part;
  V_BASE.vertical_part := CEIL(40075.7 / 2 / V_BASE.u);
  V_BASE.vertical_unit_degree := 180.0 / V_BASE.vertical_part;
  RETURN V_BASE;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_box_base(area numeric)
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_clip_map_box_base(area numeric)
  IS '获取格子单位，参数：平方公里';
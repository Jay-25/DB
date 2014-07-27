--Function: public.fun_clip_map_box_point(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_box_point(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_box_point
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS point AS
$$
DECLARE
V_BASE T_CLIP_MAP_BOX_BASE;
V_X numeric;
V_Y numeric;
BEGIN
  V_BASE := fun_clip_map_box_base(area);
  V_X := MOD(gid, V_BASE.horizontal_part);
  V_Y := FLOOR(gid / V_BASE.horizontal_part);
  RETURN POINT((V_X + 0.5) * V_BASE.horizontal_unit_degree - 180.0,
               (V_Y + 0.5) * V_BASE.vertical_unit_degree - 90.0);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_box_point(gid numeric, area numeric)
  OWNER TO postgres;
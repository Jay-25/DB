--Function: public.fun_clip_map_box_vertex(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_box_vertex(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_box_vertex
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS T_VERTEX_4 AS
$$
DECLARE
V_BASE T_CLIP_MAP_BOX_BASE;
V_vertex T_VERTEX_4;
V_center point;
BEGIN
  V_BASE := fun_clip_map_box_base(area);
  V_center := fun_clip_map_box_point(gid, area);
  V_vertex.p[0] := POINT(V_center[0] - V_BASE.horizontal_unit_degree / 2,
                         V_center[1] - V_BASE.vertical_unit_degree / 2 );
  V_vertex.p[1] := POINT(V_center[0] - V_BASE.horizontal_unit_degree / 2,
                         V_center[1] + V_BASE.vertical_unit_degree / 2 );
  V_vertex.p[2] := POINT(V_center[0] + V_BASE.horizontal_unit_degree / 2,
                         V_center[1] + V_BASE.vertical_unit_degree / 2 );
  V_vertex.p[3] := POINT(V_center[0] + V_BASE.horizontal_unit_degree / 2,
                         V_center[1] - V_BASE.vertical_unit_degree / 2 );
  RETURN V_vertex;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_box_vertex(gid numeric, area numeric)
  OWNER TO postgres;
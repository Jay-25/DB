-- 根据六边形中心点编号和切分的单位面积计算六个顶点的坐标

--Function: public.fun_clip_map_bee_vertex(gid numeric, area numeric)

--DROP FUNCTION public.fun_clip_map_bee_vertex(gid numeric, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee_vertex
(
  IN  gid   numeric,
  IN  area  numeric
)
RETURNS T_VERTEX_6 AS
$$
declare
  V_BASE t_clip_map_bee_base;
  v_vertex T_VERTEX_6;
  --v_Dh numeric;
  v_center point;
begin
  V_BASE := fun_clip_map_bee_base(area);
  v_center := fun_clip_map_bee_point(gid, area);
  
  -- 原始公式
  --v_Dh := 2 * V_BASE.horizontal_unit_degree;
  --v_vertex.p[0] = POINT( v_center_lng - v_Dh / 2, v_center_lat + (v_Dh / 4) );
  --v_vertex.p[1] = POINT( v_center[0], v_center[1] + (v_Dh / 4) + tan(30 * 3.14159 / 180) * v_Dh / 2 );
  --v_vertex.p[2] = POINT( v_center_lng + v_Dh / 2, v_center_lat + (v_Dh / 4) );
  --v_vertex.p[3] = POINT( v_center[0] + v_Dh / 2, v_center[1] + v_Dh / 4 - v_Dh / (2 * cos(30 * 3.14159 / 180)));
  --v_vertex.p[4] = POINT( v_center[0], v_center[1] + v_Dh / 4 - 3 * v_Dh / (4 * cos(30 * 3.14159 / 180)));
  --v_vertex.p[5] = POINT( v_center[0] - v_Dh / 2, v_center[1] + v_Dh / 4 - v_Dh / (2 * cos(30 * 3.14159 / 180)));

  -- 简化后
  v_vertex.p[0] := POINT( v_center[0] - V_BASE.horizontal_unit_degree, v_center[1] + V_BASE.horizontal_unit_degree * 0.5 );
  v_vertex.p[1] := POINT( v_center[0], v_center[1] + V_BASE.horizontal_unit_degree * 1.07735027 );
  v_vertex.p[2] := POINT( v_center[0] + V_BASE.horizontal_unit_degree, v_center[1] + V_BASE.horizontal_unit_degree * 0.5 );
  v_vertex.p[3] := POINT( v_center[0] + V_BASE.horizontal_unit_degree, v_center[1] - V_BASE.horizontal_unit_degree * 0.65470054342517);
  v_vertex.p[4] := POINT( v_center[0], v_center[1] - V_BASE.horizontal_unit_degree * 1.23205081513775);
  v_vertex.p[5] := POINT( v_center[0] - V_BASE.horizontal_unit_degree, v_center[1] - V_BASE.horizontal_unit_degree * 0.65470054342517);
  
  return v_vertex;
  
end
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee_vertex(gid numeric, area numeric)
  OWNER TO postgres;
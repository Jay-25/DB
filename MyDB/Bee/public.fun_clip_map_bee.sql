-- 根据某点的经纬度计算该点所在六边形的编号

--Function: public.fun_clip_map_bee(pointx point, area numeric)

--DROP FUNCTION public.fun_clip_map_bee(pointx point, area numeric);

CREATE OR REPLACE FUNCTION public.fun_clip_map_bee
(
  IN  pointx  point,
  IN  area    numeric
)
RETURNS numeric AS
$$
DECLARE
--V_DEG NUMERIC DEFAULT 30*3.14159/180;
V_BASE t_clip_map_bee_base;
V_N NUMERIC;
V_Pn NUMERIC;
V_X NUMERIC;
V_Y NUMERIC;
V_Pd NUMERIC;
V_Pu NUMERIC;
V_Pd_point point;
V_Pz_lat NUMERIC;
BEGIN
  V_BASE := fun_clip_map_bee_base(area);
  V_X := FLOOR((pointx[0] + 180.0) / V_BASE.horizontal_unit_degree);
  V_Y := FLOOR((pointx[1] + 90.0) / V_BASE.vertical_unit_degree);
  V_N := V_X + V_Y * (V_BASE.horizontal_part - 1);
  V_Pn := (V_BASE.horizontal_part + 1) / 2;
  
  IF(MOD(MOD(V_N, V_BASE.horizontal_part), 2) = 0) THEN
     V_Pd := (V_N + V_Y) / 2;
     V_Pu := V_Pd + V_Pn;
     V_Pd_point := fun_clip_map_bee_point(V_Pd, area);
   --V_Pz_lat = V_Pd_lat + 2 * fun_clip_map_bee_vertical_unit_degree(area) / 3 - ( pointx[0] - V_Pd_lng ) * tan(V_DEG);
     V_Pz_lat = V_Pd_point[1] + 2 * V_BASE.vertical_unit_degree / 3 - ( pointx[0] - V_Pd_point[0] ) * 0.57735027;
  ELSE
     V_Pd := (V_N + 1 + V_Y) / 2;
     V_Pu := V_Pd + V_Pn - 1;
     V_Pd_point := fun_clip_map_bee_point(V_Pd, area);
     --V_Pz_lat = V_Pd_lat + 2 * fun_clip_map_bee_vertical_unit_degree(area) / 3 - ( V_Pd_lng - pointx[0] ) * tan(V_DEG);
     V_Pz_lat = V_Pd_point[1] + 2 * V_BASE.vertical_unit_degree / 3 - ( V_Pd_point[0] - pointx[0] ) * 0.57735027;
  END IF;

  IF ( pointx[1] >= V_Pz_lat ) THEN
		return V_Pu;
	ELSE	
		return V_Pd;
  END IF;
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_clip_map_bee(pointx point, area numeric)
  OWNER TO postgres;
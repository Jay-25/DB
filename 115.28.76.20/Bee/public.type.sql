--Composite Type: public.t_vertex_6

--DROP TYPE public.t_vertex_6;

CREATE TYPE public.t_vertex_6 AS (
  p  point[6] -- 六边形六个顶点
);

ALTER TYPE public.t_vertex_6
  OWNER TO postgres;
  
--------------------------------------------------------------------

--Composite Type: public.t_clip_map_bee_base

--DROP TYPE public.t_clip_map_bee_base;

CREATE TYPE public.t_clip_map_bee_base AS (
  u                       numeric, -- 由面积计算所得的单位长度
  horizontal_part         numeric, -- 由赤道长度和U计算所得的横向切分份数
  horizontal_unit_degree  numeric, -- 由横向切分份数计算所得每份单位角度
  vertical_part           numeric, -- 由南北极距离和U计算所得的纵向切分份数
  vertical_unit_degree    numeric  -- 由纵向切分份数计算所得每份单位角度
);

ALTER TYPE public.t_clip_map_bee_base
  OWNER TO postgres;
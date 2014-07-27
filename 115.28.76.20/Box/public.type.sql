--Composite Type: public.t_vertex_4

--DROP TYPE public.t_vertex_4;

CREATE TYPE public.t_vertex_4 AS (
  p  point[4] -- �ı����ĸ�����
);

ALTER TYPE public.t_vertex_4
  OWNER TO postgres;
  
--------------------------------------------------------------------

--Composite Type: public.t_clip_map_box_base

--DROP TYPE public.t_clip_map_box_base;

CREATE TYPE public.t_clip_map_box_base AS (
  u                       numeric, -- ������������õĵ�λ����
  horizontal_part         numeric, -- �ɳ�����Ⱥ�U�������õĺ����зַ���
  horizontal_unit_degree  numeric, -- �ɺ����зַ�����������ÿ�ݵ�λ�Ƕ�
  vertical_part           numeric, -- ���ϱ��������U�������õ������зַ���
  vertical_unit_degree    numeric  -- �������зַ�����������ÿ�ݵ�λ�Ƕ�
);

ALTER TYPE public.t_clip_map_box_base
  OWNER TO postgres;
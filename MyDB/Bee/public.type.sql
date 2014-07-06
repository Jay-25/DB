--Composite Type: public.t_vertex_6

--DROP TYPE public.t_vertex_6;

CREATE TYPE public.t_vertex_6 AS (
  p  point[6] -- ��������������
);

ALTER TYPE public.t_vertex_6
  OWNER TO postgres;
  
--------------------------------------------------------------------

--Composite Type: public.t_clip_map_bee_base

--DROP TYPE public.t_clip_map_bee_base;

CREATE TYPE public.t_clip_map_bee_base AS (
  u                       numeric, -- ������������õĵ�λ����
  horizontal_part         numeric, -- �ɳ�����Ⱥ�U�������õĺ����зַ���
  horizontal_unit_degree  numeric, -- �ɺ����зַ�����������ÿ�ݵ�λ�Ƕ�
  vertical_part           numeric, -- ���ϱ��������U�������õ������зַ���
  vertical_unit_degree    numeric  -- �������зַ�����������ÿ�ݵ�λ�Ƕ�
);

ALTER TYPE public.t_clip_map_bee_base
  OWNER TO postgres;
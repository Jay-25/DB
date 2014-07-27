--View: public.vw_all_second_house_tablename

--DROP VIEW public.vw_all_second_house_tablename;

CREATE VIEW public.vw_all_second_house_tablename
(
  tname
)
AS
SELECT DISTINCT 
  (
    'tab_second_house_'::text || lower((tab_china_city.state_py)::text)
  ) AS tname 
FROM tab_china_city;

ALTER TABLE public.vw_all_second_house_tablename
  OWNER TO postgres;
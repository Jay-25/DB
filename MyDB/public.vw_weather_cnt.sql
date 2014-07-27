--View: public.vw_weather_cnt

--DROP VIEW public.vw_weather_cnt;

CREATE VIEW public.vw_weather_cnt
(
  city,
  cnt,
  from_t,
  to_t
)
AS
SELECT 
  tab_weather.city, 
  count(1) AS cnt, 
  min(tab_weather.date) AS from_t, 
  max(tab_weather.date) AS to_t 
FROM tab_weather 
GROUP BY 
  tab_weather.city;

ALTER TABLE public.vw_weather_cnt
  OWNER TO postgres;
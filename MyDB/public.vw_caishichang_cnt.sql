--View: public.vw_caishichang_cnt

--DROP VIEW public.vw_caishichang_cnt;

CREATE VIEW public.vw_caishichang_cnt
(
  market,
  cnt,
  from_t,
  to_t
)
AS
SELECT 
  t.market, 
  count(*) AS cnt, 
  min(t.updatetime) AS from_t, 
  max(t.updatetime) AS to_t 
FROM tab_caishichang_price t 
GROUP BY 
  t.market 
ORDER BY 
  t.market;

ALTER TABLE public.vw_caishichang_cnt
  OWNER TO postgres;
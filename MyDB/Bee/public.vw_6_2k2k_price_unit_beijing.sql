--View: public.vw_6_2k2k_price_unit_beijing

--DROP VIEW public.vw_6_2k2k_price_unit_beijing;

CREATE VIEW public.vw_6_2k2k_price_unit_beijing
(
  price_unit,
  cnt,
  gid,
  p0,
  p1,
  p2,
  p3,
  p4,
  p5
)
AS
SELECT g.price_unit,
    g.cnt,
    g.gid,
    g.p[0] AS p0,
    g.p[1] AS p1,
    g.p[2] AS p2,
    g.p[3] AS p3,
    g.p[4] AS p4,
    g.p[5] AS p5
FROM (
    SELECT round(avg(a.price_unit)) AS price_unit,
            count(1) AS cnt,
            a.gid,
            ( SELECT v.p
              FROM fun_clip_map_bee_vertex(a.gid, (2)::numeric) v(p)
             ) AS p
    FROM (
        SELECT sh.price_unit,
            fun_clip_map_bee(sh.coordinate, (2)::numeric) AS gid
        FROM tab_second_house_beijing sh
        WHERE ((sh.release_time >= '2014-04-01 00:00:00'::timestamp without
            time zone) AND (sh.release_time <= '2014-04-15 00:00:00'::timestamp
            without time zone))
        ) a
    GROUP BY a.gid
    ) g;

ALTER TABLE public.vw_6_2k2k_price_unit_beijing
  OWNER TO postgres;
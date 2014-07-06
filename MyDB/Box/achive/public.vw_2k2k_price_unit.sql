--View: public.vw_2k2k_price_unit

--DROP VIEW public.vw_2k2k_price_unit;

CREATE VIEW public.vw_2k2k_price_unit
(
  price_unit,
  cnt,
  gid,
  l_lng,
  l_lat,
  r_lng,
  r_lat
)
AS
SELECT g.price_unit,
    g.cnt,
    g.gid,
    (g.center_lng -
    (fun_clip_map_grid_horizontal_unit((2)::double precision) / (2)::numeric))
    AS l_lng,
    (g.center_lat + (fun_clip_map_grid_vertical_unit((2)::double
    precision) / (2)::numeric)) AS l_lat,
    (g.center_lng +
    (fun_clip_map_grid_horizontal_unit((2)::double precision) / (2)::numeric))
    AS r_lng,
    (g.center_lat - (fun_clip_map_grid_vertical_unit((2)::double
    precision) / (2)::numeric)) AS r_lat
FROM (
    SELECT t.price_unit,
            t.cnt,
            t.gid,
        fun_clip_map_grid_center_lng((t.gid)::double precision, (2)::double
        precision) AS center_lng,
        fun_clip_map_grid_center_lat((t.gid)::double precision, (2)::double
        precision) AS center_lat
    FROM (
        SELECT round(avg(a.price_unit)) AS price_unit,
            count(1) AS cnt,
                    a.gid
        FROM (
            SELECT tab_second_house.price_unit,
                fun_clip_map_grid(tab_second_house.coordinate[0],
                tab_second_house.coordinate[1], (2)::double precision) AS gid
            FROM tab_second_house
            ) a
        GROUP BY a.gid
        ) t
    ) g;

ALTER TABLE public.vw_2k2k_price_unit
  OWNER TO postgres;
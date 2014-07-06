CREATE OR REPLACE FUNCTION public.fun_clip_map_gridset
(
  IN  style    varchar,
  IN  city     varchar,
  IN  area     numeric,
  IN  begin_t  varchar,
  IN  end_t    varchar,
  IN  p0       point,
  IN  p1       point  
)
RETURNS SETOF record AS
$$
DECLARE
result record;
usage_all_lnglat boolean;
begin
	usage_all_lnglat := p0[0] = p1[0] OR p0[1] = p1[1];
	FOR result in EXECUTE 'SELECT g.price_unit::numeric, g.cnt::numeric, g.gid::numeric, g.p
	FROM (
			SELECT round(avg(a.price_unit)) AS price_unit, count(1) AS cnt, a.gid,
						 (SELECT v.p FROM fun_clip_map_'||style||'_vertex(a.gid, ('||area||')::numeric) v(p)) AS p
			FROM (
					SELECT sh.price_unit, fun_clip_map_'||style||'(sh.coordinate, ('||area||')::numeric) AS gid
					FROM tab_second_house_'||city||' sh
					WHERE (sh.release_time >= '''||begin_t||'''::timestamp without time zone) 
						AND (sh.release_time <= '''||end_t||'''::timestamp without time zone)
						AND ('||usage_all_lnglat||' OR sh.coordinate <@ box''(('||p0[0]||','||p0[1]||'),('||p1[0]||','||p1[1]||'))'')
					) a
			GROUP BY a.gid
			) g' loop
	return next result; 
	end loop;
	return;
end
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER;

ALTER FUNCTION public.fun_clip_map_gridset(style varchar, city varchar, area numeric, begin_t varchar, end_t varchar, p0 point, p1 point)
  OWNER TO postgres;
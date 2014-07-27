--Function: public.fun_second_house_invalid_address(city varchar, rate numeric)

--DROP FUNCTION public.fun_second_house_invalid_address(city varchar, rate numeric);

CREATE OR REPLACE FUNCTION public.fun_second_house_invalid_address
(
  IN  city  varchar,
  IN  rate  numeric
)
RETURNS SETOF record AS
$$
DECLARE
result record;
begin
	FOR result in EXECUTE 'select distinct k."id", k.address from(
	select tt."id", tt.address
	from tab_second_house_'||city||' tt, (select x.lng 
										  from (select count(1) cnt 
                                                from tab_second_house_'||city||' t) a,
											   (select round(t.coordinate[0]) lng, count(1) cnt 
                                                from tab_second_house_'||city||' t 
                                                group by round(t.coordinate[0])) x
									      where round(100*x.cnt::numeric/a.cnt::numeric,4) < '||rate||') v
	where round(tt.coordinate[0]) = v.lng
	union
	select tt."id", tt.address
	from tab_second_house_'||city||' tt, (select y.lat 
										  from (select count(1) cnt 
                                                from tab_second_house_'||city||' t) a,
                                               (select round(t.coordinate[1]) lat, count(1) cnt 
                                                from tab_second_house_'||city||' t 
                                                group by round(t.coordinate[1])) y
									      where round(100*y.cnt::numeric/a.cnt::numeric,4) < '||rate||') v
	where round(tt.coordinate[1]) = v.lat
	union
	select tt."id", tt.address
	from tab_second_house_'||city||' tt
	where tt.coordinate[0] = 0.0 or tt.coordinate[1] = 0.0
) k' loop
	return next result; 
	end loop;
	return;
end
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER;

ALTER FUNCTION public.fun_second_house_invalid_address(city varchar, rate numeric)
  OWNER TO postgres;
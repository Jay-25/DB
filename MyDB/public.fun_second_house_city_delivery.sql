--Function: public.fun_second_house_city_delivery()

--DROP FUNCTION public.fun_second_house_city_delivery();

CREATE OR REPLACE FUNCTION public.fun_second_house_city_delivery()
RETURNS text AS
$$
DECLARE
    curs refcursor;
    state_cn text DEFAULT '';
		state_py text DEFAULT '';
BEGIN
    BEGIN
				OPEN curs FOR EXECUTE 'SELECT DISTINCT SUBSTR(t.state,1,2) state, t.state_py FROM tab_china_city t ORDER BY t.state_py';
				FETCH curs INTO state_cn, state_py;
				WHILE FOUND LOOP
						EXECUTE 'INSERT INTO tab_second_house_'||state_py||' SELECT * FROM tab_second_house t WHERE SUBSTR(t.address,1,2) = '''||state_cn||'''';
						FETCH curs INTO state_cn, state_py;
				END LOOP;
				CLOSE curs;
		EXCEPTION   
				WHEN OTHERS THEN  
					RETURN 'Err: '||state_py;
    END;
    RETURN "DO_STR_NULL"(state_py, 'OK');
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_second_house_city_delivery()
  OWNER TO postgres;

COMMENT ON FUNCTION public.fun_second_house_city_delivery()
  IS '从tab_second_house中分发数据到各省数据包表中';
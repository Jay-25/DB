--Function: public.fun_distance(double precision, double precision, double precision, double precision)

--DROP FUNCTION public.fun_distance(double precision, double precision, double precision, double precision);

CREATE OR REPLACE FUNCTION public.fun_distance
(
  IN   double precision,
  IN   double precision,
  IN   double precision,
  IN   double precision
)
RETURNS numeric AS
$$
DECLARE
  num NUMERIC;
BEGIN
  num:=12756.274*ASIN(SQRT(POW(SIN(PI()*($1-$3)/360),2)+COS(PI()*$1/180)*COS($3*PI()/180)*POW(SIN(PI()*($2-$4)/360),2)));
  RETURN round(num,4);
END
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.fun_distance(double precision, double precision, double precision, double precision)
  OWNER TO postgres;
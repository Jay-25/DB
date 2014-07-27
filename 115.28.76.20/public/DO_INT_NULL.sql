--Function: public.DO_INT_NULL(text, numeric)

--DROP FUNCTION public."DO_INT_NULL"(text, numeric);

CREATE OR REPLACE FUNCTION public."DO_INT_NULL"
(
  IN   text,
  IN   numeric
)
RETURNS numeric AS
$$
SELECT CASE
WHEN $1='' OR $1 IS NULL THEN $2
ELSE CAST($1 as NUMERIC)
END;
$$
LANGUAGE 'sql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public."DO_INT_NULL"(text, numeric)
  OWNER TO postgres;
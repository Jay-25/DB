--Function: public.DO_NULL(text)

--DROP FUNCTION public."DO_NULL"(text);

CREATE OR REPLACE FUNCTION public."DO_NULL"
(
  IN   text
)
RETURNS integer AS
$$
SELECT CASE
WHEN $1='' THEN null
ELSE CAST($1 as integer)
END;
$$
LANGUAGE 'sql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public."DO_NULL"(text)
  OWNER TO postgres;
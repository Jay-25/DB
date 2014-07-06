--Function: public.TO_DAYS(time1 timestamp_with_time_zone, time2 timestamp_with_time_zone)

--DROP FUNCTION public."TO_DAYS"(time1 timestamp WITH TIME ZONE, time2 timestamp WITH TIME ZONE);

CREATE OR REPLACE FUNCTION public."TO_DAYS"
(
  IN  time1  timestamp WITH TIME ZONE,
  IN  time2  timestamp WITH TIME ZONE
)
RETURNS numeric AS
$$
BEGIN
  RETURN EXTRACT(EPOCH FROM (time1- time2))/24/3600;
END;
$$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public."TO_DAYS"(time1 timestamp WITH TIME ZONE, time2 timestamp WITH TIME ZONE)
  OWNER TO postgres;
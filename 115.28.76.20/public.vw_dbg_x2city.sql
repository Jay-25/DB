--View: public.vw_dbg_x2city

--DROP VIEW public.vw_dbg_x2city;

CREATE VIEW public.vw_dbg_x2city
(
  str1,
  str2
)
AS
SELECT (((((((('insert into tab_second_house_'::text ||
    lower((c.state_py)::text)) ||
    '(release_time,price,price_unit,house_property,house_style,
house_struct,house_decoration,house_class,build_class,usage_area,build_area,build_name,build_time_year,build_face,build_layer,
build_max_layer,address_city,address,develop_company,property_costs,property_company,mortgage_down_payment,monthly,url,
url_cofrom,web_in_uid,postcode,coordinate,elevation,cofrom)
    select h.release_time,h.price,h.price_unit,h.house_property,h.house_style,
    h.house_struct,h.house_decoration,h.house_class,h.build_class,h.usage_area,h.build_area,
    h.build_name,h.build_time_year,h.build_face,h.build_layer,h.build_max_layer,h.address_city,
    '''::text
    ) || (c.state)::text) || ' '::text) || (h.address)::text) ||
        ''',h.develop_company,h.property_costs,h.property_company,
h.mortgage_down_payment,h.monthly,h.url,h.url_cofrom,h.web_in_uid,h.postcode,h.coordinate,h.elevation,h.cofrom
from tab_second_house h
where
h.id='::text) || h.id) || ';'::text) AS str1,
    (('delete
from tab_second_house
where id='::text || h.id) || ';'::text) AS str2
FROM (
    SELECT tab_china_city.id,
            tab_china_city.state,
        tab_china_city.city,
            tab_china_city.sz_code,
        tab_china_city.city_py,
            tab_china_city.zm_code,
        tab_china_city.state_py
    FROM tab_china_city
    WHERE (strpos((tab_china_city.city)::text, 'ÊÐ'::text) > 0)
    ) c,
    tab_second_house h
WHERE (substr((c.city)::text, 1, 2) = substr((h.address)::text, 1, 2));

ALTER TABLE public.vw_dbg_x2city
  OWNER TO postgres;
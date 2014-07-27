--View: public.vw_second_house_cnt

--DROP VIEW public.vw_second_house_cnt;

CREATE VIEW public.vw_second_house_cnt
(
  state_cn,
  state_py,
  cnt,
  from_t,
  to_t
)
AS
(        (        (        (        (        (        (        (        (
    (        (        (        (        (        (        (        (        (
    (        (        (        (        (        (        (        (        (
    (        (        (        (
SELECT '����ʡ'::text AS state_cn,
    'AnHui'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_anhui.release_time) AS
from_t,
    max(tab_second_house_anhui.release_time) AS to_t
FROM tab_second_house_anhui
UNION
SELECT '������'::text AS state_cn,
    'BeiJing'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_beijing.release_time) AS
from_t,
    max(tab_second_house_beijing.release_time) AS to_t
FROM tab_second_house_beijing)
UNION
SELECT '������'::text AS state_cn,
    'ChongQiang'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_chongqiang.release_time) AS
from_t,
    max(tab_second_house_chongqiang.release_time) AS to_t
FROM tab_second_house_chongqiang)
UNION
SELECT '����ʡ'::text AS state_cn,
    'FuJia'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_fujia.release_time) AS
from_t,
    max(tab_second_house_fujia.release_time) AS to_t
FROM tab_second_house_fujia)
UNION
SELECT '����ʡ'::text AS state_cn,
    'GanSu'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_gansu.release_time) AS
from_t,
    max(tab_second_house_gansu.release_time) AS to_t
FROM tab_second_house_gansu)
UNION
SELECT '�㶫ʡ'::text AS state_cn,
    'GuangDong'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_guangdong.release_time) AS
from_t,
    max(tab_second_house_guangdong.release_time) AS to_t
FROM tab_second_house_guangdong)
UNION
SELECT '����׳��������'::text AS state_cn,
    'GuangXi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_guangxi.release_time) AS
from_t,
    max(tab_second_house_guangxi.release_time) AS to_t
FROM tab_second_house_guangxi)
UNION
SELECT '����ʡ'::text AS state_cn,
    'GuiZhou'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_guizhou.release_time) AS
from_t,
    max(tab_second_house_guizhou.release_time) AS to_t
FROM tab_second_house_guizhou)
UNION
SELECT '����ʡ'::text AS state_cn,
    'HaiNa'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_haina.release_time) AS
from_t,
    max(tab_second_house_haina.release_time) AS to_t
FROM tab_second_house_haina)
UNION
SELECT '�ӱ�ʡ'::text AS state_cn,
    'HeBei'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_hebei.release_time) AS
from_t,
    max(tab_second_house_hebei.release_time) AS to_t
FROM tab_second_house_hebei)
UNION
SELECT '������ʡ'::text AS state_cn,
    'HeiLongJiang'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_heilongjiang.release_time) AS
from_t,
    max(tab_second_house_heilongjiang.release_time) AS to_t
FROM tab_second_house_heilongjiang)
UNION
SELECT '����ʡ'::text AS state_cn,
    'HeNa'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_hena.release_time) AS
from_t,
    max(tab_second_house_hena.release_time) AS to_t
FROM tab_second_house_hena)
UNION
SELECT '����ʡ'::text AS state_cn,
    'HuBei'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_hubei.release_time) AS
from_t,
    max(tab_second_house_hubei.release_time) AS to_t
FROM tab_second_house_hubei)
UNION
SELECT '����ʡ'::text AS state_cn,
    'HuNa'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_huna.release_time) AS
from_t,
    max(tab_second_house_huna.release_time) AS to_t
FROM tab_second_house_huna)
UNION
SELECT '����ʡ'::text AS state_cn,
    'JiangSu'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_jiangsu.release_time) AS
from_t,
    max(tab_second_house_jiangsu.release_time) AS to_t
FROM tab_second_house_jiangsu)
UNION
SELECT '����ʡ'::text AS state_cn,
    'JiangXi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_jiangxi.release_time) AS
from_t,
    max(tab_second_house_jiangxi.release_time) AS to_t
FROM tab_second_house_jiangxi)
UNION
SELECT '����ʡ'::text AS state_cn,
    'JiLi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_jili.release_time) AS
from_t,
    max(tab_second_house_jili.release_time) AS to_t
FROM tab_second_house_jili)
UNION
SELECT '�ຣʡ'::text AS state_cn,
    'JingHai'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_jinghai.release_time) AS
from_t,
    max(tab_second_house_jinghai.release_time) AS to_t
FROM tab_second_house_jinghai)
UNION
SELECT '����ʡ'::text AS state_cn,
    'LiaoNing'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_liaoning.release_time) AS
from_t,
    max(tab_second_house_liaoning.release_time) AS to_t
FROM tab_second_house_liaoning)
UNION
SELECT '���ɹ�������'::text AS state_cn,
    'NeiMengGu'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_neimenggu.release_time) AS
from_t,
    max(tab_second_house_neimenggu.release_time) AS to_t
FROM tab_second_house_neimenggu)
UNION
SELECT '���Ļ���������'::text AS state_cn,
    'NingJia'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_ningjia.release_time) AS
from_t,
    max(tab_second_house_ningjia.release_time) AS to_t
FROM tab_second_house_ningjia)
UNION
SELECT '����ʡ'::text AS state_cn,
    'ShaanXi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_shaanxi.release_time) AS
from_t,
    max(tab_second_house_shaanxi.release_time) AS to_t
FROM tab_second_house_shaanxi)
UNION
SELECT 'ɽ��ʡ'::text AS state_cn,
    'ShanDong'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_shandong.release_time) AS
from_t,
    max(tab_second_house_shandong.release_time) AS to_t
FROM tab_second_house_shandong)
UNION
SELECT '�Ϻ���'::text AS state_cn,
    'ShangHai'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_shanghai.release_time) AS
from_t,
    max(tab_second_house_shanghai.release_time) AS to_t
FROM tab_second_house_shanghai)
UNION
SELECT 'ɽ��ʡ'::text AS state_cn,
    'ShanXi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_shanxi.release_time) AS
from_t,
    max(tab_second_house_shanxi.release_time) AS to_t
FROM tab_second_house_shanxi)
UNION
SELECT '�Ĵ�ʡ'::text AS state_cn,
    'SiChua'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_sichua.release_time) AS
from_t,
    max(tab_second_house_sichua.release_time) AS to_t
FROM tab_second_house_sichua)
UNION
SELECT '̨��ʡ'::text AS state_cn,
    'TaiWan'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_taiwan.release_time) AS
from_t,
    max(tab_second_house_taiwan.release_time) AS to_t
FROM tab_second_house_taiwan)
UNION
SELECT '�����'::text AS state_cn,
    'TianJi'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_tianji.release_time) AS
from_t,
    max(tab_second_house_tianji.release_time) AS to_t
FROM tab_second_house_tianji)
UNION
SELECT '����ر�������'::text AS state_cn,
    'XiangGang'::text AS state_py,
    count(*) AS cnt,
    min(tab_second_house_xianggang.release_time) AS
from_t,
    max(tab_second_house_xianggang.release_time) AS to_t
FROM tab_second_house_xianggang)
UNION
SELECT '�½�ά���������'::text AS state_cn,
    'XinJiang'::text AS state_py,
                                    count(*)
    AS cnt,
    min(tab_second_house_xinjiang.release_time) AS
from_t,
    max(tab_second_house_xinjiang.release_time) AS to_t
FROM tab_second_house_xinjiang)
UNION
SELECT '����������'::text AS state_cn,
    'XiZang'::text AS state_py,
                            count(*) AS cnt,
    min(tab_second_house_xizang.release_time) AS
from_t,
                            max(tab_second_house_xizang.release_time) AS to_t
FROM tab_second_house_xizang)
UNION
SELECT '����ʡ'::text AS state_cn,
                    'YunNa'::text AS
    state_py,
                    count(*) AS cnt,
    min(tab_second_house_yunna.release_time) AS
from_t,
                    max(tab_second_house_yunna.release_time) AS to_t
FROM tab_second_house_yunna)
UNION
SELECT '�㽭ʡ'::text AS state_cn,
            'ZheJiang'::text AS state_py,
    count(*) AS cnt,
            min(tab_second_house_zhejiang.release_time) AS
from_t,
            max(tab_second_house_zhejiang.release_time) AS to_t
FROM tab_second_house_zhejiang;

ALTER TABLE public.vw_second_house_cnt
  OWNER TO postgres;
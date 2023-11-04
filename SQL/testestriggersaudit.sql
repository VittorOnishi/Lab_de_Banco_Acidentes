SELECT * FROM GRAVIDADE;

update gravidade set grv_descricao = 'ILESOS' where grv_id = 1; 

update gravidade set grv_descricao = 'ilesos' where grv_id = 1; 

SELECT * FROM HGRAVIDADE;

update hgravidade set hgrv_descricao = 'ILESOS' where hgrv_id = 1; 

delete from hgravidade where hgrv_id = 1;

-------------------------------------------------------------------------

select * from tipo_de_acidente;

update tipo_de_acidente set tda_descricao = 'Acidentes de outra natureza 1' where tda_id = 151; 

select * from htipo_de_acidente;

update htipo_de_acidente set htda_descricao = 'Acidentes de outra natureza 123' where htda_id = 151; 

delete from htipo_de_acidente where htda_id = 151;

update tipo_de_acidente set tda_descricao = 'Acidentes de outra natureza' where tda_id = 151; 

--------------------------------------------------------------------------------------------------------

select * from local;

update local set lcl_km = '70,7' where lcl_id = 1580; 

select * from hlocal;

update hlocal set hlcl_km = 70 where hlcl_id = 1580; 

delete from hlocal where hlcl_id = 1580;

update local set lcl_km = '70,6' where lcl_id = 1580; 

-----------------------------------------------------------------

select * from sentido;

update sentido set snt_descricao = 'CRESCENTE' WHERE SNT_ID = 1;

SELECT * FROM HSENTIDO;

update Hsentido set Hsnt_descricao = 'cRESCENTE' WHERE HSNT_ID = 1;

delete from Hsentido where Hsnt_id = 1;

update sentido set snt_descricao = 'Crescente' WHERE SNT_ID = 1;

------------------------------------------------------------------------------------

select * from GRAVIDADE_OCORRENCIAS;

update GRAVIDADE_OCORRENCIAS set goc_qtde_vitimas = 1 WHERE goc_grv_id = 1 and goc_ocr_id = 108377;

select * from hGRAVIDADE_OCORRENCIAS;

update hGRAVIDADE_OCORRENCIAS set hgoc_qtde_vitimas = 10 WHERE hgoc_grv_id = 1 and hgoc_ocr_id = 108377;

delete from hGRAVIDADE_OCORRENCIAS WHERE hgoc_grv_id = 1 and hgoc_ocr_id = 108377;

update GRAVIDADE_OCORRENCIAS set goc_qtde_vitimas = 2 WHERE goc_grv_id = 1 and goc_ocr_id = 108377;

-------------------------------------------------------------------------------------------------------------------

SELECT * FROM TIPO_DE_OCORRENCIA;

update TIPO_DE_OCORRENCIA set TDO_DESCRICAO = 'COM DANOS' WHERE TDO_id = 7;

SELECT * FROM HTIPO_DE_OCORRENCIA;

update HTIPO_DE_OCORRENCIA set HTDO_DESCRICAO = 'COM DANOS MORAIS' WHERE HTDO_id = 7;

delete from HTIPO_DE_OCORRENCIA WHERE HTDO_id = 7;

update TIPO_DE_OCORRENCIA set TDO_DESCRICAO = 'com danos materiais' WHERE TDO_id = 7;

----------------------------------------------------------------------------------------------

SELECT * FROM VEICULOS_OCORRENCIAS;

update VEICULOS_OCORRENCIAS set VOC_QTDE_VEICULOS = 10 WHERE VOC_VEI_ID = 11 AND VOC_OCR_ID = 130632;

SELECT * FROM HVEICULOS_OCORRENCIAS;

update HVEICULOS_OCORRENCIAS set HVOC_QTDE_VEICULOS = 11 WHERE HVOC_VEI_ID = 11 AND HVOC_OCR_ID = 130632;

delete from HVEICULOS_OCORRENCIAS WHERE HVOC_VEI_ID = 11 AND HVOC_OCR_ID = 130632;

--------------------------------------------------------------------------------------------------------------

SELECT * FROM TRECHO;

update TRECHO SET TRC_DESCRICAO = 'BR-381/mg' WHERE TRC_ID = 1;

SELECT * FROM HTRECHO;

update HTRECHO SET HTRC_DESCRICAO = 'BR' WHERE HTRC_ID = 1;

delete from HTRECHO WHERE HTRC_ID = 1;

update TRECHO SET TRC_DESCRICAO = 'BR-381/MG' WHERE TRC_ID = 1;

--------------------------------------------------------------------------


SELECT * FROM OCORRENCIAS;

update OCORRENCIAS SET OCR_NR_OCORRENCIA = 666 WHERE OCR_ID = 108608;

SELECT * FROM HOCORRENCIAS;

update HOCORRENCIAS SET HOCR_NR_OCORRENCIA = 777 WHERE HOCR_ID = 108608;

DELETE FROM HOCORRENCIAS WHERE HOCR_ID = 108608;

update OCORRENCIAS SET OCR_NR_OCORRENCIA = 81 WHERE OCR_ID = 108608;

------------------------------------------------------------------------------------------------------
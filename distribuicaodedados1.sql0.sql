DELETE FROM VEICULOS_OCORRENCIAS;

select count(*) from dataset_acidentes where automovel !=0;

select count(*) from VEICULOS_OCORRENCIAS where VOC_VEI_ID =1;

select count(*) from dataset_acidentes where automovel !=0;

select * from select count(*) from dataset_acidentes where automovel !=0;
 order by veiculos_ocorrencias.voc_ocr_id;

delete from VEICULOS_OCORRENCIAS where voc_vei_id =1; 

select count(*) from dataset_acidentes where bicicleta != 0;

select count(*) from dataset_acidentes where caminhao != 0;

select count(*) from veiculos_ocorrencias where voc_vei_id = 3;

select count(*) from veiculos_ocorrencias where voc_vei_id = 4;
SELECT ocr_id, ocr_data_hora, vei_tipo, voc_qtde_veiculos 
FROM ocorrencias 
INNER JOIN veiculos_ocorrencias ON ocr_id = voc_ocr_id 
INNER JOIN veiculos ON voc_vei_id = vei_id 
WHERE ocr_data_hora = TO_DATE('19/08/22', 'DD/MM/YY');

SELECT ocr_id, ocr_data_hora, vei_tipo, voc_qtde_veiculos, TDA_DESCRICAO 
FROM ocorrencias 
INNER JOIN veiculos_ocorrencias ON ocr_id = voc_ocr_id 
INNER JOIN veiculos ON voc_vei_id = vei_id 
INNER JOIN TIPO_DE_ACIDENTE ON OCR_TDA_ID = TDA_ID
WHERE voc_qtde_veiculos > 3 ORDER BY OCR_DATA_HORA;

SELECT * FROM DATASET_ACIDENTES
WHERE DATA = '02/09/2022';
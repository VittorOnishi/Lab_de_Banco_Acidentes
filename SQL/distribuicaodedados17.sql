SELECT
    ocr_id,
    ocr_nr_ocorrencia,
    tdo_id,
    tdo_descricao,
    ocr_data_hora,
    voc_vei_id,
    voc_ocr_id,
    tda_descricao,
    voc_qtde_veiculos,
    goc_qtde_vitimas,

    vei_tipo
FROM
         ocorrencias
    INNER JOIN veiculos_ocorrencias ON ocr_id = voc_ocr_id
    inner join veiculos on vei_id = voc_vei_id
    INNER JOIN tipo_de_acidente ON tda_id = ocr_tda_id
    inner join tipo_de_ocorrencia on ocr_tdo_id = tdo_id
    INNER JOIN gravidade_ocorrencias on ocr_id = goc_ocr_id
    INNER JOIN gravidade on grv_id = goc_grv_id
ORDER BY
    voc_ocr_id;
    
    SELECT COUNT(*) FROM OCORRENCIAS;
    
    select * from dataset_acidentes3 where ID = 2197;
    
    select voc_ocr_id, voc_vei_id, voc_qtde_veiculos from veiculos_ocorrencias where voc_vei_id = 5 and voc_ocr_id = 29;
    select voc_ocr_id, voc_vei_id, voc_qtde_veiculos from veiculos_ocorrencias where voc_ocr_id = 29;
    
     select goc_ocr_id, goc_grv_id, goc_qtde_vitimas from gravidade_acidentes where goc_ocr_id = 29;
    
    
    
select * from dataset_acidentes2 inner join tipo_de_acidente on tipo_de_acidente = tipo_de_acidente.tda_id where n_da_ocorrencia = 350 order by id;




SELECT
    ocr_id,
    ocr_nr_ocorrencia,
    tdo_id,
    tdo_descricao,
    ocr_data_hora,
    voc_vei_id,
    voc_ocr_id,
    tda_descricao,
    voc_qtde_veiculos,
    goc_qtde_vitimas,
    vei_tipo
FROM
    ocorrencias
INNER JOIN veiculos_ocorrencias ON ocr_id = voc_ocr_id
INNER JOIN veiculos ON vei_id = voc_vei_id
INNER JOIN tipo_de_acidente ON tda_id = ocr_tda_id
INNER JOIN tipo_de_ocorrencia ON ocr_tdo_id = tdo_id
INNER JOIN gravidade_acidentes ON ocr_id = goc_ocr_id
INNER JOIN gravidade ON grv_id = goc_grv_id
WHERE
    EXTRACT(YEAR FROM ocr_data_hora) = 2022
ORDER BY
    voc_ocr_id;


SELECT *
FROM OCORRENCIAS
WHERE OCR_DATA_HORA BETWEEN TO_DATE('2019-12-30', 'YYYY-MM-DD') AND TO_DATE('2021-01-02', 'YYYY-MM-DD');

SELECT COUNT(*)
FROM OCORRENCIAS
WHERE OCR_DATA_HORA BETWEEN TO_DATE('2019-12-30', 'YYYY-MM-DD') AND TO_DATE('2021-01-02', 'YYYY-MM-DD');

SELECT * FROM APP.OCORRENCIAS
WHERE EXTRACT(YEAR FROM OCR_DATA_HORA) > 2020;

SELECT COUNT(*) FROM OCORRENCIAS;
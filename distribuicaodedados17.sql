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
    INNER JOIN gravidade_acidentes on ocr_id = goc_ocr_id
    INNER JOIN gravidade on grv_id = goc_grv_id where voc_ocr_id = 29
ORDER BY
    voc_ocr_id;
    
    select voc_ocr_id, voc_vei_id, voc_qtde_veiculos from veiculos_ocorrencias where voc_vei_id = 5 and voc_ocr_id = 29;
    select voc_ocr_id, voc_vei_id, voc_qtde_veiculos from veiculos_ocorrencias where voc_ocr_id = 29;
    
     select goc_ocr_id, goc_grv_id, goc_qtde_vitimas from gravidade_acidentes where goc_ocr_id = 29;
    
    
    
select * from dataset_acidentes2 inner join tipo_de_acidente on tipo_de_acidente = tipo_de_acidente.tda_id where n_da_ocorrencia = 350 order by id;

select count(*) from dataset_acidentes2 where trator_maquinas != 0;




CREATE MATERIALIZED VIEW OCR_STAGE
BUILD IMMEDIATE 
REFRESH FORCE
ON DEMAND
AS
SELECT
    o.ocr_id AS ocorrencia_id,
    o.ocr_data_hora AS data_hora_ocorrencia,
    o.ocr_nr_ocorrencia AS numero_ocorrencia,
    (select goc_qtde_vitimas from gravidade_ocorrencias goc2 where goc2.goc_ocr_id = o.ocr_id and goc2.goc_grv_id = 1)+0 AS ilesos,
    (select goc_qtde_vitimas from gravidade_ocorrencias goc2 where goc2.goc_ocr_id = o.ocr_id and goc2.goc_grv_id = 2)+0 AS levemente_feridos,
    (select goc_qtde_vitimas from gravidade_ocorrencias goc2 where goc2.goc_ocr_id = o.ocr_id and goc2.goc_grv_id = 3)+0 AS moderadamente_feridos,
    (select goc_qtde_vitimas from gravidade_ocorrencias goc2 where goc2.goc_ocr_id = o.ocr_id and goc2.goc_grv_id = 4)+0 AS gravemente_feridos,
    (select goc_qtde_vitimas from gravidade_ocorrencias goc2 where goc2.goc_ocr_id = o.ocr_id and goc2.goc_grv_id = 5)+0 AS mortos,
    l.lcl_km AS quilometragem,
    tdo.tdo_descricao AS tipo_ocorrencia,
    tda.tda_descricao AS tipo_acidente,
    s.snt_descricao AS sentido,
    trc.trc_descricao AS trecho,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 1)+0 AS automovel,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 3)+0 AS bicicleta,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 4)+0 AS caminhao,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 5)+0 AS moto,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 6)+0 AS onibus,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 7)+0 AS outros,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 8)+0 AS tracao_animal,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 9)+0 AS tranporte_de_cargas_especiais,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 10)+0 AS trator_maquinas,
    (select voc_qtde_veiculos from veiculos_ocorrencias voc2 where voc2.voc_ocr_id = o.ocr_id and voc2.voc_vei_id = 11)+0 AS utilitarios
FROM
    ocorrencias o
    JOIN gravidade_ocorrencias go ON o.ocr_id = go.goc_ocr_id
    JOIN gravidade g ON go.goc_grv_id = g.grv_id
    JOIN local l ON o.ocr_lcl_id = l.lcl_id
    JOIN tipo_de_ocorrencia tdo ON o.ocr_tdo_id = tdo.tdo_id
    JOIN tipo_de_acidente tda ON o.ocr_tda_id = tda.tda_id
    JOIN sentido s ON o.ocr_snt_id = s.snt_id
    JOIN trecho trc ON o.ocr_trc_id = trc.trc_id
    JOIN veiculos_ocorrencias vo ON o.ocr_id = vo.voc_ocr_id
    JOIN veiculos v ON vo.voc_vei_id = v.vei_id
GROUP BY
    o.ocr_id,
    o.ocr_data_hora,
    o.ocr_nr_ocorrencia,
    l.lcl_km,
    tdo.tdo_descricao,
    tda.tda_descricao,
    s.snt_descricao,
    trc.trc_descricao;
    
    
-- refresh na view
BEGIN
   dbms_mview.refresh('ocr_stage', method => 'C', atomic_refresh => FALSE);
END;

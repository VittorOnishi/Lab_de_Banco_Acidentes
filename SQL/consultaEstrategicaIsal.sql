

--ISA


SELECT
    v.vei_tipo AS TipoDeVeiculo,
    COUNT(vo.voc_ocr_id) AS NumeroDeOcorrencias,
    TO_CHAR((COUNT(vo.voc_ocr_id) / SUM(COUNT(vo.voc_ocr_id)) OVER ()) * 100, 'FM999.99') || '%' AS Porcentagem
FROM
    veiculos v
JOIN
    veiculos_ocorrencias vo ON v.vei_id = vo.voc_vei_id
GROUP BY
    v.vei_tipo
ORDER BY
    NumeroDeOcorrencias DESC;
    

SELECT
    s.snt_descricao AS Sentido,
    COUNT(o.ocr_id) AS QuantidadeOcorrencias,
    TO_CHAR((COUNT(o.ocr_id) / SUM(COUNT(o.ocr_id)) OVER ()) * 100, 'FM999.99') || '%' AS Porcentagem
FROM
    sentido s
INNER JOIN
    ocorrencias o ON s.snt_id = o.ocr_snt_id
GROUP BY
    s.snt_descricao
ORDER BY
    QuantidadeOcorrencias DESC;
--ESTEVAO

SELECT
    t.trc_descricao AS Trecho,
    COUNT(o.ocr_id) AS NumeroDeAcidentes,
    TO_CHAR((COUNT(o.ocr_id) / SUM(COUNT(o.ocr_id)) OVER ()) * 100, 'FM999.99') || '%' AS Porcentagem
FROM
    trecho t
LEFT JOIN
    ocorrencias o ON t.trc_id = o.ocr_trc_id
GROUP BY
    t.trc_descricao
ORDER BY
    NumeroDeAcidentes DESC;
    
    
SELECT
    MesAno,
    QuantidadeAcidentes,
    TO_CHAR((QuantidadeAcidentes / TotalAcidentes) * 100, 'FM999.99') || '%' AS Porcentagem
FROM (
    SELECT
        TO_CHAR(ocr_data_hora, 'MM/YYYY') AS MesAno,
        COUNT(ocr_id) AS QuantidadeAcidentes
    FROM
        ocorrencias
    GROUP BY
        TO_CHAR(ocr_data_hora, 'MM/YYYY')
) OcorrenciasPorMesAno
CROSS JOIN (
    SELECT
        COUNT(ocr_id) AS TotalAcidentes
    FROM
        ocorrencias
) TotalAcidentes
ORDER BY
    QuantidadeAcidentes DESC;
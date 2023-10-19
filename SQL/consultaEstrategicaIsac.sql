SELECT
    Periodo,
    QuantidadeAcidentes,
    TO_CHAR((QuantidadeAcidentes / TotalAcidentes.Total) * 100, 'FM999.99') || '%' AS Porcentagem
FROM (
    SELECT
        CASE
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 6 AND 11 THEN 'Manhã'
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 12 AND 17 THEN 'Tarde'
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 18 AND 23 THEN 'Noite'
            ELSE 'Madrugada'
        END AS Periodo,
        COUNT(ocr_id) AS QuantidadeAcidentes
    FROM
        ocorrencias
    GROUP BY
        CASE
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 6 AND 11 THEN 'Manhã'
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 12 AND 17 THEN 'Tarde'
            WHEN TO_NUMBER(TO_CHAR(ocr_data_hora, 'HH24')) BETWEEN 18 AND 23 THEN 'Noite'
            ELSE 'Madrugada'
        END
) AcidentesPorPeriodo
CROSS JOIN (
    SELECT
        COUNT(ocr_id) AS Total
    FROM
        ocorrencias
) TotalAcidentes
ORDER BY
    QuantidadeAcidentes DESC;
    
    
SELECT
    tdo.tdo_descricao AS TipoDeOcorrencia,
    COUNT(ocr.ocr_id) AS QuantidadeOcorrencias,
    TO_CHAR((COUNT(ocr.ocr_id) / SUM(COUNT(ocr.ocr_id)) OVER ()) * 100, 'FM999.99') || '%' AS Porcentagem
FROM
    tipo_de_ocorrencia tdo
LEFT JOIN
    ocorrencias ocr ON tdo.tdo_id = ocr.ocr_tdo_id
GROUP BY
    tdo.tdo_descricao
ORDER BY
    QuantidadeOcorrencias DESC;    

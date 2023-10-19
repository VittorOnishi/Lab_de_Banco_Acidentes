
--VITTOR

SELECT
    TipoDeAcidente,
    Quantidade,
    TO_CHAR((Quantidade / SUM(Quantidade) OVER ()) * 100, 'FM999.99') || '%' AS Porcentagem
FROM (
    SELECT
        tda.tda_descricao AS TipoDeAcidente,
        COUNT(ocr.ocr_id) AS Quantidade
    FROM
        tipo_de_acidente tda
    INNER JOIN
        ocorrencias ocr ON tda.tda_id = ocr.ocr_tda_id
    WHERE
        TO_CHAR(ocr.ocr_data_hora, 'YYYY') = '2020' -- Substitua '2020' pelo ano desejado
    GROUP BY
        tda.tda_descricao
)
ORDER BY
    Quantidade DESC;



SELECT
    Gravidade,
    QuantidadeAcidentes,
    TO_CHAR((QuantidadeAcidentes / TotalAcidentes.Total) * 100, 'FM999.99') || '%' AS Porcentagem
FROM (
    SELECT
        g.grv_descricao AS Gravidade,
        COUNT(ga.goc_ocr_id) AS QuantidadeAcidentes
    FROM
        gravidade g
    JOIN
        gravidade_ocorrencias ga ON g.grv_id = ga.goc_grv_id
    GROUP BY
        g.grv_descricao
) AcidentesPorGravidade
CROSS JOIN (
    SELECT
        COUNT(goc_ocr_id) AS Total
    FROM
        gravidade_ocorrencias
) TotalAcidentes
ORDER BY
    QuantidadeAcidentes DESC;
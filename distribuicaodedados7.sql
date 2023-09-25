SELECT DISTINCT TIPO_DE_ACIDENTE FROM dataset_acidentes
MINUS
SELECT TO_CHAR(TDA_ID) FROM TIPO_DE_ACIDENTE;

SELECT DISTINCT TO_NUMBER(TIPO_DE_ACIDENTE) FROM dataset_acidentes ORDER BY 1;

select * from ocorrencias;

SELECT nome, idade
FROM pessoas
WHERE CASE
          WHEN idade >= 18 THEN 1
          ELSE 0
      END = 1;

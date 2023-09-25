

insert into tipo_de_acidente

select distinct 0, tipo_de_acidente from dataset_acidentes order by 2;

SELECT * FROM  TIPO_DE_ACIDENTE;

select * from dataset_acidentes where TIPO_DE_OCORRENCIA = 'com danos materiais';
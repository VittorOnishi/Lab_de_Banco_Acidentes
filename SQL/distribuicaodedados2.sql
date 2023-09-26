insert into sentido

select distinct 0, sentido from dataset_acidentes order by 2;


insert into tipo_de_ocorrencia

select distinct 0, tipo_de_ocorrencia from dataset_acidentes order by 2;

select * from tipo_de_ocorrencia;

UPDATE DATASET_ACIDENTES SET TIPO_DE_OCORRENCIA = 'sem vitima' where TIPO_DE_OCORRENCIA = 'Sem vitima';


select * from dataset_acidentes where TIPO_DE_OCORRENCIA = 'Com vitima';

select * from dataset_acidentes where TIPO_DE_OCORRENCIA = 'acidente com danos materiais';

delete from tipo_de_ocorrencia where tdo_id = 6 or tdo_id = 3 or tdo_id = 5 or tdo_id = 1;

UPDATE tipo_de_ocorrencia SET tdo_descricao = 'com danos materiais' where tdo_descricao = 'acidente com danos materiais';
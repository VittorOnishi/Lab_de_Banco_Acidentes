insert into ocorrencias

select distinct 0, tipo_de_ocorrencia from dataset_acidentes order by 2;

alter table dataset_acidentes add column data_hora DateTime;

alter table dataset_acidentes drop column data_hora;

insert into data_hora 

select to_date( data || ' ' || horario, 'dd-mm-yyyy hh24:mi:ss') from dataset_acidentes;

select  horario from dataset_acidentes;

select data_hora from dataset_acidentes;

CREATE TABLE data_hora (

   data_hora    DATE NOT NULL
);


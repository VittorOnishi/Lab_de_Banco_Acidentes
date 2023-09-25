insert into dataset_acidentes2 (id) values(select ocr_id from ocorrencias);


select min(ocr_id) from ocorrencias;

SELECT * FROM DATASET_ACIDENTES;

DELETE FROM dataset_acidentes2;

select distinct ocr_id from ocorrencias
MINUS
select distinct id from dataset_acidentes2;

update dataset_acidentes set ilesos = 0 where ilesos is null;

update dataset_acidentes set levemente_feridos = 0 where levemente_feridos is null;

update dataset_acidentes set moderadamente_feridos = 0 where moderadamente_feridos is null;

update dataset_acidentes set gravemente_feridos = 0 where gravemente_feridos is null;

update dataset_acidentes set mortos = 0 where mortos is null;

select ocr_id from ocorrencias order by ocr_id;



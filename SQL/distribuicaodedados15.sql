select min(ocr_id) from ocorrencias;

select * from ocorrencias order by ocr_id;

select * from dataset_acidentes2 order by id;

select count(*) from dataset_acidentes2;

delete from ocorrencias;

insert into dataset_acidentes2 select 
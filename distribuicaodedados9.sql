insert into veiculos_ocorrencias values(
select automovel from dataset_acidentes where automovel is not null);

select automovel, data from dataset_acidentes where automovel != 0;

select ocr_id from ocorrencias order by ocr_id;

delete from veiculos_ocorrencias;

Select ocr_id from ocorrencias order by ocr_id;

select count(*) from veiculos_ocorrencias;

select max vei_ocr_id from veiculos_ocorrencias;

select count(*) from dataset_acidentes where automovel != 0;


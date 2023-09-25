create or replace NONEDITIONABLE trigger tg_seq_ocr
before insert on Ocorrencias
for each row
begin
    :new.ocr_id := seq_ocr.nextval;
end;

CREATE SEQUENCE  "APP"."SEQ_OCR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
   
   
   select count(*) from dataset_acidentes2 where automovel != 0;
   
   select voc_ocr_id, voc_qtde_veiculos from veiculos_ocorrencias
   minus
   select id, automovel from dataset_acidentes2;
   
   
   select count(*) from veiculos_ocorrencias where voc_vei_id = 1;
   
   delete from veiculos_ocorrencias;
   
   INSERT INTO OCORRENCIAS 
SELECT DISTINCT 
ID,
TO_DATE(data || ' ' || horario,'DD/MM/YYYY HH24:MI:SS'),
N_DA_OCORRENCIA,
to_number(KM),
to_number(TIPO_DE_OCORRENCIA),
to_number(TIPO_DE_ACIDENTE),
to_number(SENTIDO),
to_number(TRECHO)
FROM DATASET_ACIDENTES2;
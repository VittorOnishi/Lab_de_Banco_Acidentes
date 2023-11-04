
  CREATE TABLE "APP"."DATASET_ACIDENTES3" 
   (	"DATA_hora" DATE, 
	"N_DA_OCORRENCIA" NUMBER(38,0), 
	"TIPO_DE_OCORRENCIA" VARCHAR2(50 BYTE), 
	"KM" NUMBER(38,8), 
	"TRECHO" VARCHAR2(50 BYTE), 
	"SENTIDO" VARCHAR2(50 BYTE), 
	"TIPO_DE_ACIDENTE" VARCHAR2(300 BYTE), 
	"AUTOMOVEL" NUMBER(38,0), 
	"BICICLETA" NUMBER(38,0), 
	"CAMINHAO" NUMBER(38,0), 
	"MOTO" NUMBER(38,0), 
	"ONIBUS" NUMBER(38,0), 
	"OUTROS" NUMBER(38,0), 
	"TRACAO_ANIMAL" NUMBER(26,0), 
	"TRANSPORTE_DE_CARGAS_ESPECIAIS" NUMBER(26,0), 
	"TRATOR_MAQUINAS" NUMBER(26,0), 
	"UTILITARIOS" NUMBER(38,0), 
	"ILESOS" NUMBER(38,0), 
	"LEVEMENTE_FERIDOS" NUMBER(38,0), 
	"MODERADAMENTE_FERIDOS" NUMBER(38,0), 
	"GRAVEMENTE_FERIDOS" NUMBER(38,0), 
	"MORTOS" NUMBER(38,0), 
	"ID" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."DS_2" 
before insert on dataset_acidentes2
for each row
begin
    :new.id := seq_DS2.nextval;
end;
/
ALTER TRIGGER "APP"."DS_2" ENABLE;

   CREATE SEQUENCE  "APP"."SEQ_DS3"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
create trigger tg_seq_DS3
before insert on DATASET_ACIDENTES3
for each row
begin
    :new.id := seq_DS3.nextval;
end;

DELETE FROM DATASET_ACIDENTES3;


 INSERT INTO dataset_acidentes3 
SELECT DISTINCT 
TO_DATE(data || ' ' || horario,'DD/MM/YYYY HH24:MI:SS'),
N_DA_OCORRENCIA,
TIPO_DE_OCORRENCIA,
KM,
TRECHO,
SENTIDO,
TIPO_DE_ACIDENTE,
automovel,
bicicleta,
caminhao,
moto,
onibus,
outros,
tracao_animal,
transporte_de_cargas_especiais,
trator_maquinas,
utilitarios,
ilesos,
levemente_feridos,
moderadamente_feridos,
gravemente_feridos,
mortos,
0
FROM DATASET_ACIDENTES2;

SELECT MIN(ID) FROM DATASET_ACIDENTES3;

DELETE FROM APP.dataset_acidentes3
WHERE EXTRACT(YEAR FROM DATA_HORA) < 2020;

SELECT * FROM dataset_acidentes3 ORDER BY DATA_HORA;


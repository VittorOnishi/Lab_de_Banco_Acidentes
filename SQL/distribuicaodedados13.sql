CREATE SEQUENCE  "APP"."SEQ_DS2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

create trigger DS_2
before insert on dataset_acidentes2
for each row
begin
    :new.id := seq_DS2.nextval;
end;



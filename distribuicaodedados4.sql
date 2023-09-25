UPDATE dataset_acidentes SET tipo_de_acidente = 'Atropelamento - Animal' WHERE tipo_de_acidente = 'Atropelamento de Animal'
OR tipo_de_acidente = 'Atropelamento de animal';

SELECT * FROM TIPO_DE_ACIDENTE WHERE tda_descricao LIKE '%Animal%' or tda_descricao LIKE '%animal%';

delete from tipo_de_acidente where tda_descricao = 'Atropelamento de Animal' or tda_descricao = 'Atropelamento de animal';

SELECT * FROM TIPO_DE_ACIDENTE WHERE tda_descricao LIKE '%Colisao%' or tda_descricao LIKE '%colisao%';

UPDATE dataset_acidentes SET tipo_de_acidente = 'Colisao lateral' WHERE tipo_de_acidente = 'Colisao Lateral';

delete from tipo_de_acidente where tda_id = 184;

UPDATE dataset_acidentes SET tipo_de_acidente = 'Colisao traseira' WHERE tipo_de_acidente = 'Colisao Traseira';

UPDATE tipo_de_acidente SET tda_descricao = 'Colisao traseira' WHERE tda_id = 180;

UPDATE dataset_acidentes SET tipo_de_acidente = 'Queda de moto' WHERE tipo_de_acidente = 'Queda de Moto';

delete from tipo_de_acidente where tda_id = 192;

UPDATE dataset_acidentes SET tipo_de_acidente = 'Saida de pista' WHERE tipo_de_acidente = 'Saida de Pista';

delete from tipo_de_acidente where tda_id = 194;
-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-08-19 13:50:31 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE gravidade (
    grv_id        INTEGER NOT NULL,
    grv_descricao VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE gravidade IS
    'Tabela para registro das gravidades que ocorrencias podem possuem';

COMMENT ON COLUMN gravidade.grv_id IS
    'Chave primaria da tabela Gravidade';

COMMENT ON COLUMN gravidade.grv_descricao IS
    'Descricao da gravidade da ocorrencia';

ALTER TABLE gravidade ADD CONSTRAINT pk_grv PRIMARY KEY ( grv_id );

CREATE TABLE gravidade_acidentes (
    goc_grv_id       INTEGER NOT NULL,
    goc_ocr_id       INTEGER NOT NULL,
    goc_qtde_vitimas INTEGER NOT NULL
);

COMMENT ON TABLE gravidade_acidentes IS
    'Tabela para registro da gravidade das ocorrencias e contabilizacao de vitimas';

COMMENT ON COLUMN gravidade_acidentes.goc_grv_id IS
    'PFK referenciando a tabela Gravidade';

COMMENT ON COLUMN gravidade_acidentes.goc_ocr_id IS
    'PFK referenciando a tabela Ocorrencias';

COMMENT ON COLUMN gravidade_acidentes.goc_qtde_vitimas IS
    'Quantidade de vitimas na ocorrencia de acidente';

ALTER TABLE gravidade_acidentes ADD CONSTRAINT pk_goc PRIMARY KEY ( goc_grv_id,
                                                                    goc_ocr_id );

CREATE TABLE local (
    lcl_id INTEGER NOT NULL,
    lcl_km FLOAT(10) NOT NULL
);

COMMENT ON TABLE local IS
    'Tabela para registro do kilometro onde se deu a ocorrencia do acidente de transito';

COMMENT ON COLUMN local.lcl_id IS
    'Chave primaria da tabela Local';

COMMENT ON COLUMN local.lcl_km IS
    'Kilometragem onde se deu a ocorrencia';

ALTER TABLE local ADD CONSTRAINT pk_lcl PRIMARY KEY ( lcl_id );

CREATE TABLE ocorrencias (
    ocr_id            INTEGER NOT NULL,
    ocr_data          DATE NOT NULL,
    ocr_horario       DATE NOT NULL,
    ocr_nr_ocorrencia VARCHAR2(50) NOT NULL,
    ocr_lcl_id        INTEGER NOT NULL,
    ocr_tdo_id        INTEGER NOT NULL,
    ocr_tda_id        INTEGER NOT NULL,
    ocr_snt_id        INTEGER NOT NULL,
    ocr_trc_id        INTEGER NOT NULL
);

COMMENT ON TABLE ocorrencias IS
    'Tabela para registro de ocorrencias de acidente de transito na BR-381';

COMMENT ON COLUMN ocorrencias.ocr_id IS
    'Chave primaria da tabela ocorrencias';

COMMENT ON COLUMN ocorrencias.ocr_data IS
    'Data da ocorrencia';

COMMENT ON COLUMN ocorrencias.ocr_horario IS
    'Horario da ocorrencia';

COMMENT ON COLUMN ocorrencias.ocr_nr_ocorrencia IS
    'Numero da ocorrencia';

COMMENT ON COLUMN ocorrencias.ocr_lcl_id IS
    'Chave estrangeira referenciando a tabela Local';

COMMENT ON COLUMN ocorrencias.ocr_tdo_id IS
    'Chave estrangeira referenciando a tabela Tipo_de_ocorrencia';

COMMENT ON COLUMN ocorrencias.ocr_tda_id IS
    'Chave estrangeira referenciando a tabela Tipo_de_acidente';

COMMENT ON COLUMN ocorrencias.ocr_snt_id IS
    'Chave estrangeira referenciando a tabela Sentido';

COMMENT ON COLUMN ocorrencias.ocr_trc_id IS
    'Chave estrangeira referenciando a tabela Trecho';

ALTER TABLE ocorrencias ADD CONSTRAINT pk_orc PRIMARY KEY ( ocr_id );

CREATE TABLE sentido (
    snt_id        INTEGER NOT NULL,
    snt_descricao VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE sentido IS
    'Tabela para registro dos sentidos que a rodovia BR-381 possui';

COMMENT ON COLUMN sentido.snt_id IS
    'Chave primaria da tabela Sentido';

COMMENT ON COLUMN sentido.snt_descricao IS
    'Sentido que se deu a ocorrencia';

ALTER TABLE sentido ADD CONSTRAINT pk_snt PRIMARY KEY ( snt_id );

CREATE TABLE tipo_de_acidente (
    tda_id        INTEGER NOT NULL,
    tda_descricao VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE tipo_de_acidente IS
    'Tabela para registro dos tipos que acidentes podem possuir';

COMMENT ON COLUMN tipo_de_acidente.tda_id IS
    'Chave primaria da tabela Tipo_de_acidente';

COMMENT ON COLUMN tipo_de_acidente.tda_descricao IS
    'Tipo do acidente';

ALTER TABLE tipo_de_acidente ADD CONSTRAINT pk_tda PRIMARY KEY ( tda_id );

CREATE TABLE tipo_de_ocorrencia (
    tdo_id        INTEGER NOT NULL,
    tdo_descricao VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE tipo_de_ocorrencia IS
    'Tabela para registro dos tipos que uma ocorrencia pode  possuir';

COMMENT ON COLUMN tipo_de_ocorrencia.tdo_id IS
    'Chave primaria da tabela de Tipo_de_ocorrencia';

COMMENT ON COLUMN tipo_de_ocorrencia.tdo_descricao IS
    'Tipo da ocorrencia';

ALTER TABLE tipo_de_ocorrencia ADD CONSTRAINT pk_tdo PRIMARY KEY ( tdo_id );

CREATE TABLE trecho (
    trc_id        INTEGER NOT NULL,
    trc_descricao VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE trecho IS
    'Tabela para registro dos trechos que a BR-381 possui';

COMMENT ON COLUMN trecho.trc_id IS
    'Chave primaria da tabela de Trecho';

COMMENT ON COLUMN trecho.trc_descricao IS
    'Trecho da BR-381';

ALTER TABLE trecho ADD CONSTRAINT pk_trc PRIMARY KEY ( trc_id );

CREATE TABLE veiculos (
    vei_id   INTEGER NOT NULL,
    vei_tipo VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE veiculos IS
    'Tabela para registro de tipos de veiculos';

COMMENT ON COLUMN veiculos.vei_id IS
    'Chave primaria da tabela de Veiculos';

COMMENT ON COLUMN veiculos.vei_tipo IS
    'Tipo do veiculo';

ALTER TABLE veiculos ADD CONSTRAINT pk_vei PRIMARY KEY ( vei_id );

CREATE TABLE veiculos_ocorrencias (
    voc_ocr_id        INTEGER NOT NULL,
    voc_vei_id        INTEGER NOT NULL,
    voc_qtde_veiculos INTEGER NOT NULL
);

COMMENT ON TABLE veiculos_ocorrencias IS
    'Tabela para registro de tipos e quantidades de veiculos envolvidos em ocorrencias';

COMMENT ON COLUMN veiculos_ocorrencias.voc_ocr_id IS
    'PFK referenciando tabela de Ocorrencias';

COMMENT ON COLUMN veiculos_ocorrencias.voc_vei_id IS
    'PFK referenciando tabela de Veiculos';

COMMENT ON COLUMN veiculos_ocorrencias.voc_qtde_veiculos IS
    'Quantidade de veiculos envolvida na ocorrencia';

ALTER TABLE veiculos_ocorrencias ADD CONSTRAINT pk_voc PRIMARY KEY ( voc_ocr_id,
                                                                     voc_vei_id );

ALTER TABLE gravidade_acidentes
    ADD CONSTRAINT fk_goc_grv FOREIGN KEY ( goc_grv_id )
        REFERENCES gravidade ( grv_id );

ALTER TABLE gravidade_acidentes
    ADD CONSTRAINT fk_goc_ocr FOREIGN KEY ( goc_ocr_id )
        REFERENCES ocorrencias ( ocr_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_ocr_lcl FOREIGN KEY ( ocr_lcl_id )
        REFERENCES local ( lcl_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_ocr_snt FOREIGN KEY ( ocr_snt_id )
        REFERENCES sentido ( snt_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_ocr_tda FOREIGN KEY ( ocr_tda_id )
        REFERENCES tipo_de_acidente ( tda_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_ocr_tdo FOREIGN KEY ( ocr_tdo_id )
        REFERENCES tipo_de_ocorrencia ( tdo_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_ocr_trc FOREIGN KEY ( ocr_trc_id )
        REFERENCES trecho ( trc_id );

ALTER TABLE veiculos_ocorrencias
    ADD CONSTRAINT fk_voc_ocr FOREIGN KEY ( voc_ocr_id )
        REFERENCES ocorrencias ( ocr_id );

ALTER TABLE veiculos_ocorrencias
    ADD CONSTRAINT fk_voc_vei FOREIGN KEY ( voc_vei_id )
        REFERENCES veiculos ( vei_id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

-- ESTAVAO

create or replace NONEDITIONABLE TRIGGER TG_INS_HTRC
BEFORE DELETE OR UPDATE ON HTRECHO
FOR EACH ROW
DECLARE
V_TABELA VARCHAR (30) := 'HTRECHO';
V_USU_BD VARCHAR(30);
V_USU_SO VARCHAR(255) := SYS_CONTEXT ('USERENV','OS_USER');
V_IP CHAR(15) := SYS_CONTEXT ('USERENV','IP_ADDRESS');
V_MAC varchar(100) := SYS_CONTEXT ('USERENV', 'TERMINAL');
BEGIN
SELECT USER INTO V_USU_BD FROM DUAL;
IF DELETING THEN
auditor.PRC_INS(V_TABELA, 'D','HTRC_ID',:OLD.HTRC_ID, NULL, :OLD.HTRC_ID, NULL, :OLD.HTRC_DT_ENTRADA, v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HTRC_DESCRICAO', :OLD.HTRC_DESCRICAO, NULL, :OLD.HTRC_ID, NULL, :OLD.HTRC_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HTRC_DT_ENTRADA',:OLD.HTRC_DT_ENTRADA, NULL, :OLD.HTRC_ID, NULL, :OLD.HTRC_DT_ENTRADA,v_usu_bd ,v_usu_so, v_ip, v_mac);
END IF;

IF UPDATING THEN
    IF(:OLD.HTRC_ID <> :NEW.HTRC_ID) THEN
       auditor.PRC_INS (V_TABELA, 'U','HTRC_ID',:OLD.HTRC_ID, :NEW.HTRC_ID, :OLD.HTRC_ID,NULL, :OLD.HTRC_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
    IF(:OLD.HTRC_DESCRICAO <> :NEW.HTRC_DESCRICAO) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HTRC_DESCRICAO',:OLD.HTRC_DESCRICAO, :NEW.HTRC_DESCRICAO, :OLD.HTRC_ID, NULL, :OLD.HTRC_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
     IF(:OLD.HTRC_DT_ENTRADA <> :NEW.HTRC_DT_ENTRADA) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HTRC_DT_ENTRADA',:OLD.HTRC_DT_ENTRADA, :NEW.HTRC_DT_ENTRADA, :OLD.HTRC_ID, NULL, :OLD.HTRC_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
END IF;
END;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace NONEDITIONABLE TRIGGER TG_INS_HOCR
BEFORE DELETE OR UPDATE ON HOCORRENCIAS
FOR EACH ROW
DECLARE
V_TABELA VARCHAR (30) := 'HOCORRENCIAS';
V_USU_BD VARCHAR(30);
V_USU_SO VARCHAR(255) := SYS_CONTEXT ('USERENV','OS_USER');
V_IP CHAR(15) := SYS_CONTEXT ('USERENV','IP_ADDRESS');
V_MAC varchar(100) := SYS_CONTEXT ('USERENV', 'TERMINAL');
BEGIN
SELECT USER INTO V_USU_BD FROM DUAL;
IF DELETING THEN
auditor.PRC_INS(V_TABELA, 'D','HOCR_ID',:OLD.HOCR_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA, v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_DATA_HORA', :OLD.HOCR_DATA_HORA, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_NR_OCORRENCIA', :OLD.HOCR_NR_OCORRENCIA, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_LCL_ID', :OLD.HOCR_LCL_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_TDO_ID', :OLD.HOCR_TDO_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_TDA_ID', :OLD.HOCR_TDA_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_SNT_ID', :OLD.HOCR_SNT_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_TRC_ID', :OLD.HOCR_TRC_ID, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd, v_usu_so, v_ip, v_mac);
auditor.PRC_INS(V_TABELA, 'D','HOCR_DT_ENTRADA',:OLD.HOCR_DT_ENTRADA, NULL, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd ,v_usu_so, v_ip, v_mac);
END IF;
IF UPDATING THEN
    IF(:OLD.HOCR_ID <> :NEW.HOCR_ID) THEN
       auditor.PRC_INS (V_TABELA, 'U','HOCR_ID',:OLD.HOCR_ID, :NEW.HOCR_ID, :OLD.HOCR_ID,NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
    IF(:OLD.HOCR_DATA_HORA <> :NEW.HOCR_DATA_HORA) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_DATA_HORA',:OLD.HOCR_DATA_HORA, :NEW.HOCR_DATA_HORA, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_NR_OCORRENCIA <> :NEW.HOCR_NR_OCORRENCIA) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_NR_OCORRENCIA',:OLD.HOCR_NR_OCORRENCIA, :NEW.HOCR_NR_OCORRENCIA, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_LCL_ID <> :NEW.HOCR_LCL_ID) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_LCL_ID',:OLD.HOCR_LCL_ID, :NEW.HOCR_LCL_ID, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_TDO_ID <> :NEW.HOCR_TDO_ID) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_TDO_ID',:OLD.HOCR_TDO_ID, :NEW.HOCR_TDO_ID, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_TDA_ID <> :NEW.HOCR_TDA_ID) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_TDA_ID',:OLD.HOCR_TDA_ID, :NEW.HOCR_TDA_ID, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_SNT_ID <> :NEW.HOCR_SNT_ID) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_SNT_ID',:OLD.HOCR_SNT_ID, :NEW.HOCR_SNT_ID, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
IF(:OLD.HOCR_TRC_ID <> :NEW.HOCR_TRC_ID) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_TRC_ID',:OLD.HOCR_TRC_ID, :NEW.HOCR_TRC_ID, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
     IF(:OLD.HOCR_DT_ENTRADA <> :NEW.HOCR_DT_ENTRADA) THEN
       AUDITOR.PRC_INS (V_TABELA, 'U','HOCR_DT_ENTRADA',:OLD.HOCR_DT_ENTRADA, :NEW.HOCR_DT_ENTRADA, :OLD.HOCR_ID, NULL, :OLD.HOCR_DT_ENTRADA,v_usu_bd,v_usu_so,v_ip,v_mac);
END IF;
END IF;
END;
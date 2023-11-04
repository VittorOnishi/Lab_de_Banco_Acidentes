--ISA 


CREATE OR REPLACE NONEDITIONABLE TRIGGER tg_ins_htdo BEFORE
    DELETE OR UPDATE ON htipo_de_ocorrencia
    FOR EACH ROW
DECLARE
    v_tabela VARCHAR(30) := 'HTIPO_DE_OCORRENCIA';
    v_usu_bd VARCHAR(30);
    v_usu_so VARCHAR(255) := sys_context('USERENV', 'OS_USER');
    v_ip     CHAR(15) := sys_context('USERENV', 'IP_ADDRESS');
    v_mac    VARCHAR(100) := sys_context('USERENV', 'TERMINAL');
BEGIN
    SELECT
        user
    INTO v_usu_bd
    FROM
        dual;

    IF deleting THEN
        auditor.prc_ins(v_tabela, 'D', 'HTDO_ID', :old.htdo_id, NULL,
                       :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        auditor.prc_ins(v_tabela, 'D', 'HTDO_DESCRICAO', :old.htdo_descricao, NULL,
                       :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        auditor.prc_ins(v_tabela, 'D', 'HTDO_DT_ENTRADA', :old.htdo_dt_entrada, NULL,
                       :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

    END IF;

    IF updating THEN
        IF ( :old.htdo_id <> :new.htdo_id ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HTDO_ID', :old.htdo_id, :new.htdo_id,
                           :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                           v_ip, v_mac);
        END IF;

        IF ( :old.htdo_descricao <> :new.htdo_descricao ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HTDO_DESCRICAO', :old.htdo_descricao, :new.htdo_descricao,
                           :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                           v_ip, v_mac);

        END IF;

        IF ( :old.htdo_dt_entrada <> :new.htdo_dt_entrada ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HTDO_DT_ENTRADA', :old.htdo_dt_entrada, :new.htdo_dt_entrada,
                           :old.htdo_id, NULL, :old.htdo_dt_entrada, v_usu_bd, v_usu_so,
                           v_ip, v_mac);
        END IF;

    END IF;

END;


----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE NONEDITIONABLE TRIGGER tg_ins_HVOC BEFORE
    DELETE OR UPDATE ON hveiculos_ocorrencias
    FOR EACH ROW
DECLARE
    v_tabela VARCHAR(30) := 'HVEICULOS_OCORRENCIAS';
    v_usu_bd VARCHAR(30);
    v_usu_so VARCHAR(255) := sys_context('USERENV', 'OS_USER');
    v_ip     CHAR(15) := sys_context('USERENV', 'IP_ADDRESS');
    v_mac    VARCHAR(100) := sys_context('USERENV', 'TERMINAL');
BEGIN
    SELECT
        user
    INTO v_usu_bd
    FROM
        dual;

    IF deleting THEN
        auditor.prc_ins(v_tabela, 'D', 'HVOC_OCR_ID', :old.HVOC_ocr_id, NULL,
                       :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        auditor.prc_ins(v_tabela, 'D', 'HVOC_VEI_ID', :old.HVOC_vei_id, NULL,
                       :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        auditor.prc_ins(v_tabela, 'D', 'HVOC_QTDE_VEICULOS', :old.HVOC_qtdE_veiculos, NULL,
                       :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        auditor.prc_ins(v_tabela, 'D', 'HVOC_DT_ENTRADA', :old.HVOC_dt_entrada, NULL,
                       :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);
    END IF;

    IF updating THEN
        IF ( :old.HVOC_ocr_id <> :new.HVOC_ocr_id ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HVOC_OCR_ID', :old.HVOC_ocr_id, :new.HVOC_ocr_id,
                           :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);
        END IF;

        IF ( :old.HVOC_vei_id <> :new.HVOC_vei_id ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HVOC_VEI_ID', :old.HVOC_vei_id, :new.HVOC_vei_id,
                           :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

        END IF;

        IF ( :old.HVOC_qtdE_veiculos <> :new.HVOC_qtdE_veiculos ) THEN
            auditor.prc_ins(v_tabela, 'U', 'HVOC_QTDE_VEICULOS', :old.hvoc_qtdE_veiculos, :new.hvoc_qtdE_veiculos,
                           :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);
        END IF;
        IF ( :old.HVOC_dt_entrada <> :new.HVOC_dt_entrada) THEN
        auditor.prc_ins(v_tabela, 'U', 'HVOC_DT_ENTRADA', :old.HVOC_dt_entrada, :new.HVOC_dt_entrada,
                       :old.HVOC_ocr_id, :old.HVOC_vei_id, :old.HVOC_dt_entrada, v_usu_bd, v_usu_so,
                       v_ip, v_mac);

    END IF;

END if;

end;
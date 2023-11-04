create or replace procedure  prc_ins
(
    P_ID IN NUMBER,
    P_TABELA IN VARCHAR2,
    P_EVENTO IN VARCHAR2,
    P_COLUNA IN VARCHAR2,
    P_ANTIGO IN VARCHAR2,
    P_NOVO IN VARCHAR2,
    P_ID_H1 IN NUMBER,
    P_ID_H2 IN NUMBER,
    P_DT_H IN DATE,
    P_USU_BD IN VARCHAR2,
    P_USU_SO IN VARCHAR2,
    P_IP IN VARCHAR2,
    P_MAC IN VARCHAR2
) AS
BEGIN INSERT INTO AUDITA_HISTORICOS VALUES(
            0, 
            P_TABELA,
            P_EVENTO,
            P_COLUNA,
            P_ANTIGO,
            P_NOVO,
            P_ID_H1,
            P_ID_H2,
            P_DT_H,
            P_USU_BD,
            P_USU_SO,
            P_IP,
            P_MAC,
            SYSDATE
            );END PRC_INS;
--  category:  IBM i サービス基本機能
--  description:  メッセージ記述の取得
-- 例）QSYS/QCPFMSGから「CPF9」で始まるメッセージを取り出す
SELECT *
  FROM QSYS2.MESSAGE_FILE_DATA
  WHERE MESSAGE_FILE_LIBRARY = 'QSYS'
        AND MESSAGE_FILE = 'QCPFMSG'
        AND MESSAGE_ID LIKE 'CPF98%'
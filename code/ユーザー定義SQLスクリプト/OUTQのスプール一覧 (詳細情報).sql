--  category:  IBM i サービス基本機能
--  description:  OUTQのスプール一覧 (詳細情報)
SELECT *
  FROM TABLE (
      QSYS2.OUTPUT_QUEUE_ENTRIES('*LIBL', 'QDKT', '*NO')
    ) A
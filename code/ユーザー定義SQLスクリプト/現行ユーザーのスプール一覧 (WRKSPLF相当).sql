--  category:  IBM i サービス基本機能
--  description:  現行ユーザーのスプール一覧 (WRKSPLF相当)
SELECT *
  FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC
  WHERE user_name = CURRENT_USER
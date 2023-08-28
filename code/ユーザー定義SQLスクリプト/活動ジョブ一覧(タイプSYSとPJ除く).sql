--  category:  IBM i サービス基本機能
--  description:  活動ジョブ一覧(タイプSYSとPJ除く)
SELECT SUBSYSTEM,
       JOB_NAME,
       AUTHORIZATION_NAME,
       JOB_TYPE,
       ELAPSED_CPU_PERCENTAGE,
       FUNCTION,
       JOB_STATUS
  FROM TABLE (
      QSYS2.ACTIVE_JOB_INFO(DETAILED_INFO => 'ALL')
    ) X
  WHERE JOB_TYPE <> 'SYS'
        AND JOB_TYPE <> 'PJ'
  ORDER BY SUBSYSTEM,
           JOB_NAME

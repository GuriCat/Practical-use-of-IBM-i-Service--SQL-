--  category:  IBM i サービス基本機能
--  description:  インストール済みPTFグループのレベルと最新を比較
SELECT *
  FROM SYSTOOLS.GROUP_PTF_CURRENCY
  ORDER BY ptf_group_level_available - ptf_group_level_installed DESC;
--  category:  IBM i サービス基本機能
--  description:  グループPTF一覧
SELECT *
  FROM QSYS2.GROUP_PTF_INFO
  ORDER BY ptf_group_name DESC
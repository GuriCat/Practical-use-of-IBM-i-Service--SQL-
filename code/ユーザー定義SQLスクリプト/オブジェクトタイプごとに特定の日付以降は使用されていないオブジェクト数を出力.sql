--  category:  IBM i サービス応用
--  description: オブジェクトタイプごとに特定の日付以降は使用されていないオブジェクト数を出力
SELECT OBJLIB,
       OBJTYPE,
       OBJATTRIBUTE,
       CAST(COUNT(*) AS DECIMAL(11, 0)) AS NUMBER /* 明示的に型を指定 */
  FROM TABLE (
      QSYS2.OBJECT_STATISTICS('QUSRSYS', '*ALL')
    ) AS X
  WHERE DATE(LAST_USED_TIMESTAMP) < '2019-10-01'
  GROUP BY OBJLIB,
           OBJTYPE,
           OBJATTRIBUTE
           -- ORDER BY はGROUPの結果に対して行われる
  ORDER BY OBJLIB,
           OBJTYPE,
           OBJATTRIBUTE
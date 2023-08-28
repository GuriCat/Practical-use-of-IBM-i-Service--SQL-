# 3 IBM iサービスの基本用例

<p></p>

 
 
## 3.1 表/ビューの照会

この章では、シンプルな表/ビューの照会によるIBM iサービスの利用例を紹介します。

表/ビューから情報を取得する例として、CLのWRKSYSSTSコマンドと同様の情報を取得刷るIBM iサービス「QSYS2.SYSTEM_STATUS_INFO」を取りあげます。例えば次のようなSQLを実行してIBM iサービスを利用します。

![3.1_表_ビューの照会.jpg](/files/3.1_表_ビューの照会.jpg)

SQL文では、IBM iサービスが提供するビューから、利用するカラムを指定してデータをSELECTしています。カラム名にはSQLの長い名前ではなく、短いシステム列名を使用しています。

SYSTEM_STATUS_INFOビューには多くの情報(次ページの表参照)が含まれるので、必要な列(カラム)を選択しています。利用できる列とその属性、値は、IBM Knowledge Centerで、ホーム > IBM i 7.4 > データベース > パフォーマンスおよびQuery最適化 > IBM i サービス > 実行管理サービス の「SYSTEM_STATUS_INFO ビュー」に記載されています。

データはシステムが保守しており、WRKSYSSTSコマンド同様に実行のたびにその時点の値が得られます。

?> WRKSYSSTSの「F10=再開」のように統計をリセットするには、SYSTEM_STATUS テーブル関数を「SELECT * FROM TABLE(QSYS2.SYSTEM_STATUS(**<font color="#4db56a">RESET_STATISTICS=>'YES'</font>**)) X」のように実行します。

![3.1_表_ビューの照会2.jpg](/files/3.1_表_ビューの照会2.jpg)

<p>　</p>

---

次の例では、IBM iサービス「QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC」でWRKSPLFコマンドと同様の情報を取得します。

![3.1_表_ビューの照会3.jpg](/files/3.1_表_ビューの照会3.jpg)

このSQLを実行すると、現行ユーザーが作成したスプール・ファイルが選択されます。WHERE句で、スプール・ファイルを作成したユーザー・プロファイルが「CURRENT_USER」と等しいデータ、を選択しています。「CURRENT_USER」はSQLステートメントで参照できる特殊レジスターで、1次権限ID(通常はSQLの実行ユーザー)を示します。

?> 特殊レジスターの詳細は、IBM Knowledge Centerの、ホーム > IBM i 7.4 > データベース > 参照 > SQL解説書 > 言語エレメント > 特殊レジスター を参照。

選択条件に出力待ち行列を指定すれば、コマンド「WRKOUTQ (出力待ち行列名)」相当の情報が得られます。例えば出力待ち行列「QGPL/QDKT」にあるスプール・ファイル一覧は次のSQLで取得できます。

![3.1_表_ビューの照会4.jpg](/files/3.1_表_ビューの照会4.jpg)

スプール一覧を取得するには次の3つの方法があり、いずれも各スプール・ファイルについて1行を返します。

* QSYS2.OUTPUT_QUEUE_ENTRIES_BASICビュー
* QSYS2.OUTPUT_QUEUE_ENTRIESビュー
* QSYS2.OUTPUT_QUEUE_ENTRIESテーブル関数

パフォーマンスの観点から、通常はOUTPUT_QUEUE_ENTRIES_BASICビューの利用が推奨されます。OUTPUT_QUEUE_ENTRIES (「_BASIC」が付かない方)は、必要とする列(情報)がOUTPUT_QUEUE_ENTRIES_BASICに含まれない場合にのみ、を使用する事をお勧めします。

どの方法であっても、ライブラリーやOUTQを指定して、結果の行数が大量にならないように配慮すべきでしょう。

<p>　</p>

---

3つめの例はシステム値の一覧を提供する「QSYS2.SYSTEM_VALUE_INFO」ビューです。下記のSQL文で、システム値の名前(QDATEなど)と設定値が取得できます。

![3.1_表_ビューの照会5.jpg](/files/3.1_表_ビューの照会5.jpg)

「QSYS2.SYSTEM_VALUE_INFO」ビューは下表のように定義されています。

![3.1_表_ビューの照会6.jpg](/files/3.1_表_ビューの照会6.jpg)

3カラムのシンプルなビューですが、システム値が文字か数値かで、異なるカラムに値が記録されます。これを1カラムにまとめて使い勝手を良くするため、IFNULLスカラー関数で「CURRENT_CHARACTER_VALUE」がヌルの場合は「CURRENT_NUMERIC_VALUE」を文字に変換して返すようにしています。

<p>　</p>

### <u>ワーク2 IBM iサービスの基本的な実行</u>

**□ W2-1.** ACSのSQLスクリプトを起動します。起動にはいくつかの方法がありますが、ACSの5250セッションを使用している場合、ツールバーの歯車アイコンをクリックして起動します。

![W2-1_IBM_i_サービスの基本的な実行.jpg](/files/W2-1_IBM_i_サービスの基本的な実行.jpg)

**□ W2-2.** SQLスクリプトが起動するので、IBM iサービスを利用するSQLを入力し、「全て実行」(砂時計が重なっているアイコン   )をクリックして実行します。

* システム状況の取得(WRKSYSSTS相当)
```sql
  SELECT CPU_AVG, ELAP_TIME, TOTAL_JOBS, PERM_RATE, TEMP_RATE, AUX_STG, SYS_RATE
  FROM QSYS2.SYSTEM_STATUS_INFO
```
* 現行ユーザーのスプール一覧(WRKSPLF相当)
```sql
  SELECT * FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC
  WHERE USER_NAME = CURRENT_USER
```
* OUTQ内のスプール一覧(OUTQ指定のWRKOUTQ相当)。適宜、スプール・ファイルの存在する出力待ち行列(下の例ではQGPL/QDKT)を変更
```sql
  SELECT * FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC
  WHERE OUTPUT_QUEUE_NAME = 'QDKT' AND OUTPUT_QUEUE_LIBRARY_NAME = 'QGPL'
```
* システム値の一覧
```sql
  SELECT SYSTEM_VALUE_NAME,
    IFNULL(CURRENT_CHARACTER_VALUE, CHAR(CURRENT_NUMERIC_VALUE)) SYSVAL_VALUE
  FROM QSYS2.SYSTEM_VALUE_INFO
  ORDER BY SYSTEM_VALUE_NAME
```

**□ W2-3.** (オプション1) 前のステップ(□W2-2)のSQL出力と、相当するCLコマンドの画面・印刷出力を比較。

(システム状況の取得とWRKSYSSTS画面の比較例)

![W2-1_IBM_i_サービスの基本的な実行2.jpg](/files/W2-1_IBM_i_サービスの基本的な実行2.jpg)

**□ W2-4.** (オプション2) 前のステップ(□W2-2)のSQLを、対話型SQL(STRSQLコマンドで起動)、および、db2コマンド(英小文字の使用できる環境からQshellを起動)で実施。


<p>　</p>

## 3.2 UDTF(ユーザー定義テーブル関数)による照会

次に、UDTF(User Defined Table Function：ユーザー定義テーブル関数)を使用したIBM iサービスを使用します。UDTFは「表」の形式で、ユーザーが定義した処理の結果をSQLに返します。

?> Db2 for iではV5R4以降でUDTFをサポート。詳細については、「The power of user-defined table functions」(https://developer.ibm.com/technologies/systems/articles/i-power-of-udtf/#_Ref359996016 英文)、「絶対にRPGのUDTF」(https://www.e-bellnet.com/category/jungle/1209/1209-686.html )、「UDTFs in RPG for the Win!」(https://www.scottklement.com/udtf/UDTFs%20for%20the%20Win.html 英文)などのサイトを参照。

![3.2_UDTFによる照会.jpg](/files/3.2_UDTFによる照会.jpg)

UDTFを利用すると、コードの再利用性が高まると同時に、複数の関連した処理をまとめる事ができます。さらに、RPGなどの高水準言語と組み合わせれば、一般的なSELECT文による表へのアクセスに限定されず、IFSやスプールなどの情報をSQLから利用できるようになります。

<br>

実行管理サービスの、QSYS2.ACTIVE_JOB_INFOテーブル関数(UDTF)を利用すれば、WRKACTJOBコマンドに類似した情報が得られます。

このテーブル関数をFROM句に指定すると、1アクティブ・ジョブについて1行が返ります。テーブル関数にはオプション・パラメーターで、サブシステムやジョブ名によるフィルターや、統計のリセットなどを指定できます。

![3.2_UDTFによる照会2.jpg](/files/3.2_UDTFによる照会2.jpg)

上記SQLを実行するとWRKACTJOBコマンドと似た結果が得られます。テーブル関数で指定されている「DETAILED_INFO」はフィルター・パラメーターです。指定可能な値がIBM Knowledge Centerに記載されており、「ALL」(すべての列の情報が返される)、「NONE」、「QTEMP」が指定できる事がわかります。

3行目末尾の「X」は「相関名」(Correlation name)と呼ばれ、他の相関名や非修飾の表/ビュー名と重複しない任意の値を指定します。

?> FROM文節にテーブル関数を指定した際に「あいまいさ」によるSQLエラーが発生する場合、相関名を指定して回避します。

このIBM iサービスを利用して、例えば、特定のジョブが起動しているか、MSGWで止まっていないか、などをチェックできます。

<br>

UDTFの利用例をもう一つ紹介します。ライブラリアン・サービスのOBJECT_STATISTICSテーブル関数で、特定ユーザーが所有するオブジェクトの一覧を取得できます。

![3.2_UDTFによる照会3.jpg](/files/3.2_UDTFによる照会3.jpg)

OBJECT_STATISTICSテーブル関数からは、DSPOBJDコマンドの出力に似た情報が得られます。例えば、作成日や最終使用日、使用日数などから未使用オブジェクトの棚卸をしたり、オブジェクトのサイズを元にディスク整理をしたりできるでしょう。

<p>　</p>

### <u>ワーク3 UDTFを使用したIBM iサービスの実行</u>

**□ W3-1.** 「□W2-1」の要領でSQLスクリプトを起動し、UDTFを使ったIBM iサービスを呼び出すSQLを入力・実行します。

* 活動ジョブの表示 (WRKACTJOB相当)
```sql
  SELECT SUBSYSTEM, JOB_NAME, AUTHORIZATION_NAME, JOB_TYPE,
    ELAPSED_CPU_PERCENTAGE, FUNCTION, JOB_STATUS
  FROM TABLE (QSYS2.ACTIVE_JOB_INFO(DETAILED_INFO => 'ALL')) X
    WHERE JOB_TYPE <> 'SYS' AND JOB_TYPE <> 'PJ'
  ORDER BY SUBSYSTEM, JOB_NAME
```
* 特定ユーザーの所有オブジェクト一覧(WRKOBJOWN相当)
```sql
  SELECT * 
  FROM TABLE (QSYS2.OBJECT_STATISTICS('*ALLUSR', '*ALL')) 
  WHERE OBJOWNER = 'QPGMR'
```

**□ W3-2.** (オプション1) 前のステップ(□W3-1)のSQL出力と、相当するCLコマンドの画面・印刷出力を比較。

**□ W3-3.** (オプション2) 前のステップ(□W3-1)のSQLを、対話型SQL(STRSQLコマンドで起動)、および、db2コマンド(英小文字の使用できる環境からQshellを起動)で実施。


# 4 IBM提供サンプルの活用

<P> </P>

　

## 4.1 ACS SQLスクリプトのユーザー定義「例」

IBM iサービスは多くの分野で多彩な機能を提供します。これらのまとまった情報源がいくつか存在します。

* IBM Knowledge Centerの記載。表/ビューの定義、関数のパラメーターと意味など、詳細な情報を日本語を含む各国語で記載
* IBM Supportサイトの[「IBM i Technology Updates」](https://www.ibm.com/support/pages/node/1119129)から[「IBM i Services (SQL)」](https://www.ibm.com/support/pages/node/1119123)を参照(英文)。TRやPTFによる更新が早めに反映される
* Gistに掲載の、IBMアーキテクトが公開しているサンプル(英文)

?> Gistはサンプルコードやコードの一部を容易に共有するGitHubのソースコード公開サービス。IBMサイトに掲載された一覧はhttps://www.ibm.com/support/pages/ibm-i-services 、Gistは https://gist.github.com/forstie

* ACSのSQLスクリプトに添付されているIBM提供の「例」(英文)

いずれも相当な量の情報が掲載されているので、「何をしたいか」目的を明確にし、その目的に利用・流用できるIBM iサービスがあるかを調べるようにすると良いでしょう。

<br>

ACSのSQLスクリプトの「例」で効率的にIBM iサービスを試すことができます。SQLスクリプトを起動し、メニューバーの「例から挿入...」アイコンをクリック、または、「編集(E)」→「例」→「例から挿入...(Ctrl+I)」を実行すると「例」ウインドゥが開きます。キーワード検索やカテゴリーを選択して絞り込み、目的に合った「例」を探します。

IBM iサービス関連では、次ページの表のような「例」が提供されています。

?> SQLスクリプトの「例」には、「Db2 for i Services」や「SYSTOOLS」など、他のサービスや、DDL/DMLの例なども含まれます。

![4.1_ACS_SQLスクリプトのユーザー定義「例」.jpg](/files/4.1_ACS_SQLスクリプトのユーザー定義「例」.jpg)

<br>

例えば、CLコマンドのWRKSBSと似たIBM iサービス「QSYS2.SUBSYSTEM_INFO」を利用したSQLは、下図の要領で「例」から実行できます。

![4.1_ACS_SQLスクリプトのユーザー定義「例」2.jpg](/files/4.1_ACS_SQLスクリプトのユーザー定義「例」2.jpg)

<br>

SQLスクリプトの「例」には、**ユーザーが定義したSQL**を登録する事ができます。SQLスクリプトで任意のSQL文を記述し、メニューバーの「編集(E)」→「例」→「新しい例として保管...」を選択し、「カテゴリー」と「説明」を編集します。

入力した「カテゴリー」と「説明」がファイル名とSQL文冒頭2行のコメントに自動的に反映されます。編集が完了したら「OK(O)」で保存します。

?> プレビューペインに表示されるSQL文の漢字が化けますが、操作に支障はないようです。

?> SQLスクリプトはテキスト形式ですが、BOM(Byte Order Mark：ユニコード文字列の符号化形式を表すためファイル先頭に付加されるバイト列)付きのUTF-8で作成されます。テキスト・エディターなどでSQLスクリプトを編集する場合はこの形式を扱えるエディターを使用します。

![4.1_ACS_SQLスクリプトのユーザー定義「例」3.jpg](/files/4.1_ACS_SQLスクリプトのユーザー定義「例」3.jpg)

保管したユーザー定義の新しい「例」は、IBM提供の「例」と同様に呼出し・再利用できます。

?> WindowsにACSを標準的な方法でインストールした場合、ユーザー定義の「例」はディレクトリー「C:\Users\%username%\Documents\IBM\iAccessClient\RunSQLScripts\Examples」に保存されます。

![4.1_ACS_SQLスクリプトのユーザー定義「例」4.jpg](/files/4.1_ACS_SQLスクリプトのユーザー定義「例」4.jpg)

<p>　</p>

### 参考：SQLスクリプトファイルの活用

SQLスクリプトから保管した「*.sql」ファイルは、「例」以外の方法でも呼び出すことができます。

* 「\*.sql」をユーザーに配布し、定型的なSQLの実行を効率化。あるいは、ファイルサーバーやIFSの共有ディレクトリーに「*.sql」を配置して共用

?> インストーラーを使用せずにACSを導入した場合、インストール先ディレクトリーを変更している場合は、SQLスクリプトの保管ディレクトリーを確認。

* ACSのメイン画面から「ツール(T)」→「ファイル・アソシエーション...」で拡張子「.sql」に関連付けを行い、「*.sql」のダブルクリックでSQLスクリプトが起動するように設定して利用

![4.1_参考_SQLスクリプトファイルの活用.jpg](/files/4.1_参考_SQLスクリプトファイルの活用.jpg)

* Windowsのデスクトップにバッチファイル(下図の例では「SQLスクリプトの実行.bat」)を配置しておき、このアイコンに「*.sql」をドラッグ&ドロップしてSQLスクリプトを起動・実行

?> 「rss」プラグインの利用についてはACS添付の「Documentation/GettingStarted_ja.html」を参照。環境によって初回のみ、または毎回、「IBM iへのサインオン」ダイアログが表示されます。

![4.1_参考_SQLスクリプトファイルの活用2.jpg](/files/4.1_参考_SQLスクリプトファイルの活用2.jpg)

<br>

(バッチファイルの内容)
```
java -jar C:\Users\%USERNAME%\IBM\ClientSolutions\acsbundle.jar /SYSTEM=(IBM iのホスト名またはIPアドレス) /PLUGIN=rss /file=%1 /autorun=1
```

* SQLスクリプトで「ファイル(F)」→「別名保管」→「IFSストリーム・ファイル」で「*.sql」をIFSの任意のディレクトリーに保管し、RUNSQLSTMコマンドで利用。ただしRUNSQLSTMコマンドの制約により、SELECT文は副照会に、出力をファイルやスプールに指定する、などの変更が必要

(元のSQLスクリプト例)
```
SELECT * FROM TABLE(QSYS2.JOB_INFO(JOB_TYPE_FILTER => '*INTERACT')) X;
```

(変更後のSQLスクリプト例)
```
DECLARE GLOBAL TEMPORARY TABLE SESSION.INTJOB AS
      (SELECT * FROM TABLE(QSYS2.JOB_INFO(JOB_TYPE_FILTER => '*INTERACT')) X)
      WITH DATA INCLUDING DEFAULTS
  WITH REPLACE;        

CL:CHGJOB OUTQ(QGPL/QDKT);
CL:RUNQRY QRYFILE((QTEMP/INTJOB)) OUTTYPE(*PRINTER)
```

(実行例)
```
> RUNSQLSTM SRCSTMF('/tmp/(保管したSQLスクリプト名).sql') COMMIT(*NONE) NAMING(*SQL)
```

<p>　</p> 

### <u>ワーク4 SQLスクリプトの「例」の利用</u>

**□ W4-1.** 「□W2-1」の手順でSQLスクリプトを起動し、次の操作を実施。

1.「編集(E)」→「例」→「新しい例として保管...」を選択

2.「新しい例」ウインドゥの「ディレクトリー」行の「開く」ボタンをクリック

3.SQLスクリプトの保管フォルダーが開くので、Windowsデスクトップのハンズオン用ディレクトリー「LMSV」にある「ユーザー定義SQLスクリプト.zip」内の「*.sql」ファイルをここにコピー

![W4-1_SQLスクリプトの「例」の利用.jpg](/files/W4-1_SQLスクリプトの「例」の利用.jpg)

4.SQLスクリプトの保管フォルダーと「新しい例」ウインドゥをクローズ

5.SQLスクリプトをクローズして再起動

6.「編集(E)」→「例」→「例から挿入... (Ctrl+I)」を選択

7.「IBM i サービス基本機能」と「IBM i サービス応用」の2つのカテゴリーが追加されており、それぞれに「例」が登録されていることを確認

![W4-1_SQLスクリプトの「例」の利用2.jpg](/files/W4-1_SQLスクリプトの「例」の利用2.jpg)

**□ W4-2.** 次のユーザー定義「例」を実行。

* 「IBM i サービス基本機能」カテゴリーの「OUTQのスプール一覧」を、QGPL/QDKT<u>以外</u>の出力待ち行列に対して実行
* 「IBM i サービス応用」カテゴリーの「WRKOBJOWN類似」を、QPGMR<u>以外</u>のユーザー・プロフィール(自身のユーザー・プロフィールなど)に対して実行

**□ W4-3.** (オプション1) 「OUTQのスプール一覧」を編集したSQLスクリプトを新しい「例」として保管して実行。

**□ W4-4.** (オプション2) 前のステップ(□W4-3)で作成したSQLスクリプトをRUNSQLSTMコマンドで動作するように変更してIFSに保管し、5250画面からRUNSQLSTMで実行して結果を確認。

<p>　</p>

## 4.2 ユーザー定義テーブル関数のカスタマイズ

2.4の表(IBM iサービス一覧)に記載されているように、IBM iサービスでは多くの機能がUDTFで実装されています。

この節では、スプール・ファイルの内容を返すUDTF 「SYSTOOLS.SPOOLED_FILE_DATA」のDBCS対応手順を例にとり、UDTFのソース取得・編集・作成手順を解説します。

<br>

初期バージョンのSYSTOOLSに含まれる「SYSTOOLS.SPOOLED_FILE_DATA」を日本語環境で利用するには、下記現象への対応が望まれます。

?> SYSTOOLSの詳細はIBM Knowledge Center (https://www.ibm.com/support/knowledgecenter/ja/ssw_ibm_i_74/rzajq/rzajqsystools.htm )の記載を参照。

* UDTF内でDBCSのスプール・ファイルをSBCSの物理ファイルにCPYSPLFするためにエラーが発生

?> IBM i 7.4のIBM Knowledge Centerの「SPOOLED_FILE_DATA table function」(https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_74/rzajq/rzajqudfspooldata.htm )によると、2020-10-06の更新でDBCSサポートが追加されています。

* シフト文字が除去されるため、桁ずれが発生

次の手順でこのUDTFをカスタマイズします。

* SQLスクリプトでUDTFのソースを取得
* ソースを修正
* SQLを実行して新しいUDTFを作成

<br>

最初にUDTF 「SYSTOOLS.SPOOLED_FILE_DATA」のソースを取り出します。SQLスクリプトを起動し、「生成したSQLの挿入」アイコンをクリックするか、「編集(E)」→「生成したSQLの挿入... (Ctrl+Shift+G)」を実行します。

「SQLの生成」ウインドゥが表示されるので、➀「追加(A)」ボタンをクリックして「オブジェクトの参照」ウインドゥを表示し、② SYSTOOLSスキーマの左の ⊞ をクリックしてツリーを展開し、さらに「関数」の左の ⊞ をクリックして展開、「SPOOLED_FILE_DATA...」を見つけて□にチェックを入れ、③「OK(O)」をクリックします。「SQLの生成」ウインドゥに戻るので、「SQLが生成されるオブジェクト:」に「SPOOLED_FILE_DATA...」が追加されたことを確認し、④「生成」ボタンをクリックします。

![4.2_ユーザー定義テーブル関数のカスタマイズ.jpg](/files/4.2_ユーザー定義テーブル関数のカスタマイズ.jpg)

SQLスクリプトにソースコードが挿入されます。このソースコードをSQLフォーマッターで整形したリスト、および、DBCS対応のための変更を「4.2.1 SQLソースコード」に示します。このソースをSQLスクリプトで実行すると、UDTFが作成 されます。

?> IBM iのバージョンやPTFの適用状況により、ソースコードの内容が異なる場合があります。このソースコードはIBM i 7.4 (累積PTF C0121740、Db2 PTF レベル7、TR1)で取得したものです。IBM iのバージョンやPTFが古いとSQLの修正が必要な場合があります。

同じSQLスクリプトをIBM i上で実行してUDTFを作成する事も可能です。例えばこのSQLスクリプトをIFSの「/tmp/SPOOLED_FILE_DATA_DBCS.sql」にコピーした場合、次のコマンドを実行します。

```
> CHGATR OBJ('/tmp/SPOOLED_FILE_DATA_DBCS.sql') ATR(*CCSID) VALUE(1208)    
  1オブジェクトの属性が変更された。0オブジェクトは変更されていません。 
> RUNSQLSTM SRCSTMF('/tmp/SPOOLED_FILE_DATA_DBCS.sql') COMMIT(*NONE) NAMING
  (*SQL)                                                                   
```

UDTFは指定したスキーマ(ライブラリー)に*SRVPGMとして作成されます。UDTF名とIBM iオブジェクト名(*SRVPGM)の関連は、例えば下記のようなSQLで調査できます。

```
SELECT SPECIFIC_SCHEMA, SPECIFIC_NAME, ROUTINE_NAME, EXTERNAL_NAME FROM QSYS2.SYSFUNCS WHERE ROUTINE_SCHEMA = 'LMSVxxLIB'
```

### 4.2.1 SQLソースコード「SYSTOOLS.SPOOLED_FILE_DATA」

DBCS対応部分を合わせて記載しており、「↾↾↾↾」は変更行、「++++」は追加行を示します。

```
0001 --  SQLの生成
0002 --  バージョン:                   	V7R4M0 190621
0003 --  生成:              	21/01/06 13:43:07
0004 --  リレーショナル・データベース:       	XXXXXX
0005 --  規格オプション:          	Db2 for i
0006 SET PATH "QSYS", "QSYS2", "SYSPROC", "SYSIBMADM";
0007 
0008 CREATE FUNCTION SYSTOOLS.SPOOLED_FILE_DATA (
↾↾↾↾ CREATE OR REPLACE FUNCTION LMSVxxLIB.SPOOLED_FILE_DATA_DBCS (
0009       JOB_NAME VARCHAR(28),
0010       SPOOLED_FILE_NAME VARCHAR(10) DEFAULT 'QPJOBLOG',
↾↾↾↾       SPOOLED_FILE_NAME VARCHAR(10),
0011       SPOOLED_FILE_NUMBER VARCHAR(6) DEFAULT '*LAST'
0012     )
0013   RETURNS TABLE (
0014     ORDINAL_POSITION INTEGER,
0015     SPOOLED_DATA VARCHAR(200) FOR SBCS DATA
↾↾↾↾     SPOOLED_DATA VARCHAR(200) FOR MIXED DATA
0016   )
0017   LANGUAGE SQL
0018   SPECIFIC SYSTOOLS.SPOOL_FILE
↾↾↾↾   SPECIFIC LMSVxxLIB.SPOOL_FILE_DBCS
0019   NOT DETERMINISTIC
0020   MODIFIES SQL DATA
0021   CALLED ON NULL INPUT
0022   SYSTEM_TIME SENSITIVE NO
0023   SET OPTION ALWBLK = *ALLREAD,
0024              ALWCPYDTA = *OPTIMIZE,
0025              COMMIT = *NONE,
0026              DECRESULT = (31,
0027              31,
0028              00),
0029              DFTRDBCOL = QSYS2,
0030              DLYPRP = *NO,
0031              DYNDFTCOL = *NO,
0032              DYNUSRPRF = *USER,
0033              MONITOR = *SYSTEM,
0034              SRTSEQ = *HEX,
0035              USRPRF = *USER
0036   BEGIN
0037     DECLARE ERROR_V BIGINT DEFAULT 0;
0038     BEGIN
0039       DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ERROR_V = 1;
0040       CALL QSYS2.QCMDEXC(
0041         'QSYS/CRTPF FILE(QTEMP/QIBM_SFD) RCDLEN(200) ' CONCAT ' MBR(*NONE) MAXMBRS(*NOMAX) SIZE(*NOMAX)'
↾↾↾↾         'QSYS/CRTPF FILE(QTEMP/QIBM_SFD) RCDLEN(200) ' CONCAT ' MBR(*NONE) MAXMBRS(*NOMAX) SIZE(*NOMAX) IGCDTA(*YES)'
0042       );
0043     END;
0044     BEGIN
0045       DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ERROR_V = 2;
0046       CALL QSYS2.QCMDEXC(
0047         'QSYS/CPYSPLF     FILE(' CONCAT SPOOLED_FILE_NAME CONCAT ') TOFILE(QTEMP/QIBM_SFD) JOB(' CONCAT JOB_NAME CONCAT
0048           ') MBROPT(*REPLACE) SPLNBR(' CONCAT SPOOLED_FILE_NUMBER CONCAT ') OPNSPLF(*YES)'
0049       );
0050     END;
 

++++     BEGIN
++++       DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ERROR_V = 3;
++++       CALL QSYS2.QCMDEXC(
++++         'QSYS/CALL PGM(LMSVxxLIB/SHIFTUDTF)'
++++       );
++++     END;
++++  -- Ignore error in CRTPF
0051     IF ERROR_V > 1 THEN
↾↾↾↾     IF ERROR_V = 2 THEN
0052       SIGNAL SQLSTATE '42704'
0053         SET MESSAGE_TEXT = 'FAILURE ON CPYSPLF';
↾↾↾↾         SET MESSAGE_TEXT = 'CPYSPLF{でエラー。}';
0054     END IF;
++++     IF ERROR_V = 3 THEN
++++       SIGNAL SQLSTATE '42704'
++++         SET MESSAGE_TEXT = 'CALL{でエラー。}';
++++     END IF;
0055     RETURN SELECT RRN(JL),
0056                   JL.*
0057         FROM QTEMP.QIBM_SFD JL
0058         ORDER BY RRN(JL) ASC;
0059   END;
0060 
0061 COMMENT ON SPECIFIC FUNCTION SYSTOOLS.SPOOL_FILE IS 'DB2 FOR IBM i SUPPLIED OBJECT VERSION 07400010002';
↾↾↾↾ COMMENT ON SPECIFIC FUNCTION LMSVxxLIB.SPOOL_FILE_DBCS IS 'DB2 FOR IBM i - modified SYSTOOLS.SPOOLED_FILE_DATA UDTF for DBCS';
0062 
0063 GRANT EXECUTE
0064   ON SPECIFIC FUNCTION SYSTOOLS.SPOOL_FILE
↾↾↾↾   ON SPECIFIC FUNCTION LMSVxxLIB.SPOOL_FILE_DBCS
0065   TO PUBLIC;
0066 
0067 GRANT ALTER,
0068     EXECUTE
0069   ON SPECIFIC FUNCTION SYSTOOLS.SPOOL_FILE
↾↾↾↾   ON SPECIFIC FUNCTION LMSVxxLIB.SPOOL_FILE_DBCS
0070   TO QSYS WITH GRANT OPTION;
```

<br>

作成したUDTFを利用し、DBCS(漢字など)を含むスプール・ファイルの内容をSQLのSELECT文の結果として表示できます。

![4.2.1_SQLソースコード「SYSTOOLS.SPOOLED_FILE_DATA」.jpg](/files/4.2.1_SQLソースコード「SYSTOOLS.SPOOLED_FILE_DATA」.jpg)


<p>　</p>

### <u>ワーク5 UDFTの作成と実行</u>

**□ W5-1.** 下記の手順でハンズオン用ライブラリーにUDTFを作成。

1. Windows上で「SPOOLED_FILE_DATA_DBCS.sql」をダブルクリックしてSQLスクリプトを起動。「.sql」がACSに関連付けられておらずSQLスクリプトが起動しない場合は「□W2-1」の手順でSQLスクリプトを起動し、「ファイル(F)」→「開く...」→「PCファイル Ctrl+O」で「SPOOLED_FILE_DATA_DBCS.sql」を選択して開く
2. SQLソースコードの中の、「LMSVxxLIB」の「xx」をハンズオン用ライブラリー名に変更
3. SQLスクリプトを実行し、UDTFを作成
4. WRKOBJPDMコマンドなどでハンズオン用ライブラリー「LMSVxxLIB」に「SPOOL00001」などの名前の*SRVPGM(属性 CLE)が作成されていることを確認

**□ W5-2.** コマンド「WRKMBRPDM FILE(LMSVxxLIB/DB2ISVC)」を実行し、メンバー「SHIFTUDTF」(シフト文字補填用ILE-RPGプログラム)に、オプション「14=ｺﾝﾊﾟｲﾙ」を指定してプログラムを作成

**□ W5-3.** SQLスクリプトからUDTF「SPOOLED_FILE_DATA_DBCS」を実行。

* コマンド「WRKACTJOB OUTPUT(*PRINT)」でスプール・ファイルを作成し、ジョブ名、ユーザー名、ジョブ番号、スプール・ファイル名(この場合は「QPDSPAJB」)を記録
* 記録した情報を元に、SQLスクリプトからUDTFを含むSELECT文を実行してスプール・ファイルの内容が表示されることを確認
```
SELECT SPOOLED_DATA FROM TABLE(LMSVxxLIB.SPOOLED_FILE_DATA_DBCS(
                             JOB_NAME          =>'ジョブ番号/ユーザー名/ジョブ名', 
                             SPOOLED_FILE_NAME =>'スプールファイル名'))
ORDER BY ORDINAL_POSITION;
```

**□ W5-4.** (オプション1) □W5-3のSELECT文の前に、ジョブCCSIDを日本語英小文字(5035または1399)に変更するSQL文を追加し、出力の内容に変化があるか確認。
```
CALL QSYS2.QCMDEXC('CHGJOB CCSID(5035)');
```

**□ W5-5.** (オプション2) Windows10でVBスクリプト「GetOutqSplf.vbs」(4.2.2参照)を実行し、指定した出力待ち行列内のスプール・ファイルがテキスト形式でWindowsにダウンロードされることを確認。

* WindowsにODBCドライバーがインストール済みであることを確認
  * <font color="red">IBM i用のODBCドライバーがWindowsにインストールされていない場合は「IBM i Access - Client Solutions」(https://www.ibm.com/support/pages/ibm-i-access-client-solutions )の「Downloads for IBM i Access Client Solutions」のリンクからダウンロードしてインストールするか、この実習をスキップしてください。</font>
  * ACSとともに配布されているWindows用ODBCドライバーをインストールすると、複数のODBCドライバーが登録されます。「IBM i Access ODBC Driver」以外は、古いドライバー名で参照するプログラムとの互換性のために残されているので、新規に作成する場合は「IBM i Access ODBC Driver」を指定します。

  ![W5_UDFTの作成と実行.jpg](/files/W5_UDFTの作成と実行.jpg)

* VBスクリプト「GetOutqSplf.vbs」を任意のディレクトリーに配置し、テキスト・エディターで44行目のライブラリー名「LMSVxxLIB」をハンズオン用ライブラリー名に変更して保管
* Windowsのコマンド・プロンプトからVBスクリプトを実行し、指定した出力待ち行列のスプール・ファイルを現行ディレクトリーにダウンロードして内容を確認
```
(任意のディレクトリー)>CScript //nologo GetOutqSplf.vbs (IBM iサーバー名、または IPアドレス) (ユーザー名) (パスワード) (出力待ち行列名) (ライブラリー名)
```

<br>

(実行例)
```
C:\Users\(Windowsユーザー名)\Desktop\temp>CScript //nologo GetOutqSplf.vbs ibmi test test qprints qgpl
サーバー ibmi にユーザー TEST で接続中...
出力待ち行列 QGPL/QPRINTS のスプールファイル一覧を取得中...
1/3 ジョブ 043015/TEST/QPADEV0003 のスプールファイル QPDSPAJB, 番号 1 の内容を取得中...
2/3 ジョブ 120827/QNTP/QZSHSH のスプールファイル QPJOBLOG, 番号 1 の内容を取得中...
3/3 ジョブ 061527/QSRVAGT/QTOCRUNPRX のスプールファイル QPRINT, 番号 1 の内容を取得中...
3個のスプールファイルを取得しました。
```

<p>　</p>

### 4.2.2 VBスクリプト「GetOutqSplf.vbs」

IBM i上の指定した出力待ち行列の全てのスプール・ファイルをWindowsの現行ディレクトリーにテキスト形式で保存します。

```
0001 Option Explicit
0002 
0003 Dim args
0004 Dim conn, stmt, rs
0005 Dim conn2, stmt2, rs2
0006 Dim objFSO, objSplf
0007 Dim seqNo
0008 
0009 ' パラメーターで受け取った システム(IPアドレス)、ユーザーID、パスワードでIBM i に接続
0010 Set args = WScript.Arguments
0011 Set conn = CreateObject("ADODB.Connection")
0012 
0013 WScript.echo "サーバー " & args.item(0) & " にユーザー " & UCase(args.item(1)) & " で接続中..."
0014 
0015 conn.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
0016           ";UID=" & args.item(1) & ";PWD=" & args.item(2)
0017 
0018 ' パラメーターで受け取ったライブラリー名、OUTQ名を条件にしてviewをSELECT。
0019 stmt = "SELECT * FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC " & _
0020        "WHERE OUTPUT_QUEUE_NAME = UCASE('" & args.item(3) & "') AND "  & _
0021        "OUTPUT_QUEUE_LIBRARY_NAME = UCASE('" & args.item(4) & "') AND " & _
0022        "TOTAL_PAGES > 0 AND DEVICE_TYPE = '*SCS' AND " & _
0023        "(STATUS = 'READY' OR STATUS = 'HELD')"
0024 
0025 WScript.echo "出力待ち行列 " & UCase(args.item(4)) & "/" & UCase(args.item(3)) & _
0026              " のスプールファイル一覧を取得中..."
0027 
0028 ' Result Setのオープン
0029 Set rs = CreateObject("ADODB.Recordset")
0030 rs.CursorLocation = 3 ' クライアントサイドカーソル(全レコード件数取得のため指定)
0031 rs.Open stmt, conn
0032 
0033 ' スプールファイル連番
0034 seqNo = 1
0035 
0036 ' 全行読み込み&出力
0037 Do Until rs.EOF
0038 
0039   ' スプール・ファイル情報を元にスプールデータを取得
0040   Set conn2 = CreateObject("ADODB.Connection")
0041   conn2.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
0042              ";UID=" & args.item(1) & ";PWD=" & args.item(2)
0043 
0044   stmt2 = "SELECT * FROM TABLE(LMSVxxLIB.SPOOLED_FILE_DATA_DBCS(" & _
0045           "JOB_NAME => '" & rs.Fields(11) & "', " & _
0046           "SPOOLED_FILE_NAME => '" & RTrim(rs.Fields(3)) & "', " & _
0047           "SPOOLED_FILE_NUMBER => '" & CInt(rs.Fields(14)) & "')) " & _
0048           "ORDER BY ORDINAL_POSITION"
0049 
0050   WScript.echo CInt(seqNo) & "/" & rs.RecordCount & _
0051                " ジョブ " & rs.Fields(11) & _
0052                " のスプールファイル " & RTrim(rs.Fields(3)) & _
0053                ", 番号 " & CInt(rs.Fields(14)) & " の内容を取得中..."
0054 
0055   ' スプールデータ用Result Setのオープン
0056   Set rs2 = CreateObject("ADODB.Recordset")
0057   rs2.Open stmt2, conn2
0058 
0059   ' スプールデータ出力先ファイルの作成
0060   Set objFSO  = WScript.CreateObject("Scripting.FileSystemObject")
0061   Set objSplf = objFSO.OpenTextFile( _
0062                 RTrim(rs.Fields(3)) & "_" & CInt(rs.Fields(14)) & _
0063                 Replace(rs.Fields(11), "/", "-") & "_" & _
0064                 CInt(rs.Fields(14)) & ".txt", 2, True)
0065 
0066   ' スプールデータをファイルへ出力
0067   Do Until rs2.EOF
0068         objSplf.WriteLine(RTrim(rs2.Fields(1).Value))
0069     rs2.MoveNext
0070   Loop
0071 
0072   seqNo = seqNo + 1
0073 
0074   rs2.Close
0075   conn2.Close
0076   Set rs2 = Nothing
0077   Set conn2 = Nothing
0078   Set objSplf = Nothing
0079   Set objFSO = Nothing
0080 
0081   rs.MoveNext
0082 
0083 Loop
0084 
0085 rs.Close
0086 conn.Close
0087 Set rs = Nothing
0088 Set conn = Nothing
0089 
0090 seqNo = seqNo - 1
0091 
0092 If seqNo = 0 Then
0093   WScript.echo "スプールファイルがありません。"
0094   Wscript.Quit(-1)
0095 Else
0096   WScript.echo CInt(seqNo) & "個のスプールファイルを取得しました。"
0097   Wscript.Quit(0)
0098 End If
```

* 19～23行目：「QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC」ビューから、指定した出力待ち行列の、ページ数が0より大きく、装置タイプが「*SCS」で、状況が「READY」または「HELD」のスプールを選択。
* 44～48行目：UDTF「LMSVxxLIB.SPOOLED_FILE_DATA_DBCS」で個々のスプール・ファイルを読みだし。
* 67～70行目：スプールデータを1行ずつテキストファイルに出力。


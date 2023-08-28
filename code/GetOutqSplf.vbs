Option Explicit

Dim args
Dim conn, stmt, rs
Dim conn2, stmt2, rs2
Dim objFSO, objSplf
Dim seqNo

' パラメーターで受け取った システム(IPアドレス)、ユーザーID、パスワードでIBM i に接続
Set args = WScript.Arguments
Set conn = CreateObject("ADODB.Connection")

WScript.echo "サーバー " & args.item(0) & " にユーザー " & UCase(args.item(1)) & " で接続中..."

conn.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
          ";UID=" & args.item(1) & ";PWD=" & args.item(2)

' パラメーターで受け取ったライブラリー名、OUTQ名を条件にしてviewをSELECT。
stmt = "SELECT * FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC " & _
       "WHERE OUTPUT_QUEUE_NAME = UCASE('" & args.item(3) & "') AND "  & _
       "OUTPUT_QUEUE_LIBRARY_NAME = UCASE('" & args.item(4) & "') AND " & _
       "TOTAL_PAGES > 0 AND DEVICE_TYPE = '*SCS' AND " & _
       "(STATUS = 'READY' OR STATUS = 'HELD')"

WScript.echo "出力待ち行列 " & UCase(args.item(4)) & "/" & UCase(args.item(3)) & _
             " のスプールファイル一覧を取得中..."

' Result Setのオープン
Set rs = CreateObject("ADODB.Recordset")
rs.CursorLocation = 3 ' クライアントサイドカーソル(全レコード件数取得のため指定)
rs.Open stmt, conn

' スプールファイル連番
seqNo = 1

' 全行読み込み&出力
Do Until rs.EOF

  ' スプール・ファイル情報を元にスプールデータを取得
  Set conn2 = CreateObject("ADODB.Connection")
  conn2.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
             ";UID=" & args.item(1) & ";PWD=" & args.item(2)

  stmt2 = "SELECT * FROM TABLE(LMSVxxLIB.SPOOLED_FILE_DATA_DBCS(" & _
          "JOB_NAME => '" & rs.Fields(11) & "', " & _
          "SPOOLED_FILE_NAME => '" & RTrim(rs.Fields(3)) & "', " & _
          "SPOOLED_FILE_NUMBER => '" & CInt(rs.Fields(14)) & "')) " & _
          "ORDER BY ORDINAL_POSITION"

  WScript.echo CInt(seqNo) & "/" & rs.RecordCount & _
               " ジョブ " & rs.Fields(11) & _
               " のスプールファイル " & RTrim(rs.Fields(3)) & _
               ", 番号 " & CInt(rs.Fields(14)) & " の内容を取得中..."

  ' スプールデータ用Result Setのオープン
  Set rs2 = CreateObject("ADODB.Recordset")
  rs2.Open stmt2, conn2

  ' スプールデータ出力先ファイルの作成
  Set objFSO  = WScript.CreateObject("Scripting.FileSystemObject")
  Set objSplf = objFSO.OpenTextFile( _
                RTrim(rs.Fields(3)) & "_" & CInt(rs.Fields(14)) & _
                Replace(rs.Fields(11), "/", "-") & "_" & _
                CInt(rs.Fields(14)) & ".txt", 2, True)

  ' スプールデータをファイルへ出力
  Do Until rs2.EOF
        objSplf.WriteLine(RTrim(rs2.Fields(1).Value))
    rs2.MoveNext
  Loop

  seqNo = seqNo + 1

  rs2.Close
  conn2.Close
  Set rs2 = Nothing
  Set conn2 = Nothing
  Set objSplf = Nothing
  Set objFSO = Nothing

  rs.MoveNext

Loop

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing

seqNo = seqNo - 1

If seqNo = 0 Then
  WScript.echo "スプールファイルがありません。"
  Wscript.Quit(-1)
Else
  WScript.echo CInt(seqNo) & "個のスプールファイルを取得しました。"
  Wscript.Quit(0)
End If

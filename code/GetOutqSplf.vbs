Option Explicit

Dim args
Dim conn, stmt, rs
Dim conn2, stmt2, rs2
Dim objFSO, objSplf
Dim seqNo

' �p�����[�^�[�Ŏ󂯎���� �V�X�e��(IP�A�h���X)�A���[�U�[ID�A�p�X���[�h��IBM i �ɐڑ�
Set args = WScript.Arguments
Set conn = CreateObject("ADODB.Connection")

WScript.echo "�T�[�o�[ " & args.item(0) & " �Ƀ��[�U�[ " & UCase(args.item(1)) & " �Őڑ���..."

conn.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
          ";UID=" & args.item(1) & ";PWD=" & args.item(2)

' �p�����[�^�[�Ŏ󂯎�������C�u�����[���AOUTQ���������ɂ���view��SELECT�B
stmt = "SELECT * FROM QSYS2.OUTPUT_QUEUE_ENTRIES_BASIC " & _
       "WHERE OUTPUT_QUEUE_NAME = UCASE('" & args.item(3) & "') AND "  & _
       "OUTPUT_QUEUE_LIBRARY_NAME = UCASE('" & args.item(4) & "') AND " & _
       "TOTAL_PAGES > 0 AND DEVICE_TYPE = '*SCS' AND " & _
       "(STATUS = 'READY' OR STATUS = 'HELD')"

WScript.echo "�o�͑҂��s�� " & UCase(args.item(4)) & "/" & UCase(args.item(3)) & _
             " �̃X�v�[���t�@�C���ꗗ���擾��..."

' Result Set�̃I�[�v��
Set rs = CreateObject("ADODB.Recordset")
rs.CursorLocation = 3 ' �N���C�A���g�T�C�h�J�[�\��(�S���R�[�h�����擾�̂��ߎw��)
rs.Open stmt, conn

' �X�v�[���t�@�C���A��
seqNo = 1

' �S�s�ǂݍ���&�o��
Do Until rs.EOF

  ' �X�v�[���E�t�@�C���������ɃX�v�[���f�[�^���擾
  Set conn2 = CreateObject("ADODB.Connection")
  conn2.Open "DRIVER=IBM i Access ODBC Driver;SYSTEM=" & args.item(0) & _
             ";UID=" & args.item(1) & ";PWD=" & args.item(2)

  stmt2 = "SELECT * FROM TABLE(LMSVxxLIB.SPOOLED_FILE_DATA_DBCS(" & _
          "JOB_NAME => '" & rs.Fields(11) & "', " & _
          "SPOOLED_FILE_NAME => '" & RTrim(rs.Fields(3)) & "', " & _
          "SPOOLED_FILE_NUMBER => '" & CInt(rs.Fields(14)) & "')) " & _
          "ORDER BY ORDINAL_POSITION"

  WScript.echo CInt(seqNo) & "/" & rs.RecordCount & _
               " �W���u " & rs.Fields(11) & _
               " �̃X�v�[���t�@�C�� " & RTrim(rs.Fields(3)) & _
               ", �ԍ� " & CInt(rs.Fields(14)) & " �̓��e���擾��..."

  ' �X�v�[���f�[�^�pResult Set�̃I�[�v��
  Set rs2 = CreateObject("ADODB.Recordset")
  rs2.Open stmt2, conn2

  ' �X�v�[���f�[�^�o�͐�t�@�C���̍쐬
  Set objFSO  = WScript.CreateObject("Scripting.FileSystemObject")
  Set objSplf = objFSO.OpenTextFile( _
                RTrim(rs.Fields(3)) & "_" & CInt(rs.Fields(14)) & _
                Replace(rs.Fields(11), "/", "-") & "_" & _
                CInt(rs.Fields(14)) & ".txt", 2, True)

  ' �X�v�[���f�[�^���t�@�C���֏o��
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
  WScript.echo "�X�v�[���t�@�C��������܂���B"
  Wscript.Quit(-1)
Else
  WScript.echo CInt(seqNo) & "�̃X�v�[���t�@�C�����擾���܂����B"
  Wscript.Quit(0)
End If

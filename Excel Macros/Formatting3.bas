Attribute VB_Name = "Formatting3"
Sub Format3()
    
'AddSplit Format

    AddSplit.Range("H1:I1").Interior.Color = 12611584 'blue
    AddSplit.Range("J1:O1").Interior.Color = 5287936 'green
    AddSplit.Range("P1:W1").Interior.Color = 10498160 'purple
    AddSplit.Range("W1:W1").Font.ThemeColor = xlThemeColorLight1
    AddSplit.Range("X1:Y1").Interior.ThemeColor = xlThemeColorLight1
    AddSplit.Range("X1:Y1").Font.ThemeColor = xlThemeColorDark1
    AddSplit.Columns("A:A").ColumnWidth = 14.43
    AddSplit.Columns("E:E").ColumnWidth = 8.57
    AddSplit.Columns("F:F").ColumnWidth = 6.14
    AddSplit.Columns("G:G").ColumnWidth = 6.71
    AddSplit.Columns("H:I").ColumnWidth = 8.43
    AddSplit.Columns("J:J").ColumnWidth = 6.43
    AddSplit.Columns("K:K").ColumnWidth = 5.57
    AddSplit.Columns("L:L").ColumnWidth = 4.71
    AddSplit.Columns("M:M").ColumnWidth = 5.14
    AddSplit.Columns("N:N").ColumnWidth = 6.14
    AddSplit.Columns("O:O").ColumnWidth = 8.43
    AddSplit.Columns("P:P").ColumnWidth = 6#
    AddSplit.Columns("Q:Q").ColumnWidth = 10.86
    AddSplit.Columns("R:R").ColumnWidth = 5.57
    AddSplit.Columns("S:S").ColumnWidth = 7.14
    AddSplit.Columns("T:T").ColumnWidth = 9.43
    AddSplit.Columns("U:U").ColumnWidth = 7.71
    AddSplit.Columns("V:V").ColumnWidth = 4.57
    AddSplit.Columns("W:W").ColumnWidth = 7#
    AddSplit.Columns("X:X").ColumnWidth = 8.29
    AddSplit.Columns("Y:Y").ColumnWidth = 5.29
    AddSplit.Rows("1:1").WrapText = True
    
'StSplit Format

    StSplit.Range("J1:O1").Interior.Color = 5287936 'green
    StSplit.Range("P1:R1").Interior.Color = 10498160 'purple
    StSplit.Range("T1:T1").Interior.Color = 49407 ' yellow
    StSplit.Range("S1:S1").Interior.ThemeColor = xlThemeColorLight1
    StSplit.Range("S1:S1").Font.ThemeColor = xlThemeColorDark1
    StSplit.Columns("A:A").ColumnWidth = 14.43
    StSplit.Columns("E:E").ColumnWidth = 8.57
    StSplit.Columns("F:F").ColumnWidth = 6.14
    StSplit.Columns("G:G").ColumnWidth = 6.71
    StSplit.Columns("J:J").ColumnWidth = 7.43
    StSplit.Columns("K:K").ColumnWidth = 18.57
    StSplit.Columns("L:L").ColumnWidth = 10.86
    StSplit.Columns("M:M").ColumnWidth = 11.71
    StSplit.Columns("N:N").ColumnWidth = 6.29
    StSplit.Columns("O:O").ColumnWidth = 10#
    StSplit.Columns("P:P").ColumnWidth = 7.71
    StSplit.Columns("Q:Q").ColumnWidth = 7.71
    StSplit.Columns("R:R").ColumnWidth = 6.71
    StSplit.Columns("S:S").ColumnWidth = 8.29
    StSplit.Rows("1:1").WrapText = True
    
End Sub



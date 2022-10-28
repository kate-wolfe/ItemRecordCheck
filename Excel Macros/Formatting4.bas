Attribute VB_Name = "Formatting4"
Sub Format4()

    TownCheck.Range("A1:H1,L1:M1,Q1:Z1").Interior.ThemeColor = xlThemeColorLight1
    TownCheck.Range("A1:H1,L1:M1,Q1:Z1").Font.ThemeColor = xlThemeColorDark1
    TownCheck.Range("I1:I1,N1:N1").Interior.Color = 12611584 'blue
    TownCheck.Range("J1:J1,O1:O1").Interior.Color = 5287936 'green
    TownCheck.Range("K1:K1,P1:P1").Interior.Color = 49407  'yellow

    TownCheck.Columns("A:A").ColumnWidth = 14.43
    TownCheck.Columns("C:C").ColumnWidth = 8.57
    TownCheck.Columns("D:D").ColumnWidth = 6.14
    TownCheck.Columns("E:E").ColumnWidth = 6.71
    TownCheck.Columns("F:F").ColumnWidth = 6#
    TownCheck.Columns("G:G").ColumnWidth = 13.71
    TownCheck.Columns("H:K").ColumnWidth = 10.57
    TownCheck.Columns("L:L").ColumnWidth = 4.86
    TownCheck.Columns("M:M").ColumnWidth = 5.43
    TownCheck.Columns("N:N").ColumnWidth = 8.57
    TownCheck.Columns("O:O").ColumnWidth = 6.14
    TownCheck.Columns("P:P").ColumnWidth = 7.29
    TownCheck.Columns("Q:Q").ColumnWidth = 8.57
    TownCheck.Columns("R:R").ColumnWidth = 8#
    TownCheck.Columns("S:S").ColumnWidth = 5.57
    TownCheck.Columns("T:T").ColumnWidth = 6.57
    TownCheck.Columns("U:U").ColumnWidth = 6.43
    TownCheck.Columns("V:V").ColumnWidth = 6.86
    TownCheck.Columns("W:W").ColumnWidth = 8.71
    TownCheck.Columns("X:X").ColumnWidth = 6.29
    TownCheck.Columns("Y:Y").ColumnWidth = 7#
    
    TownCheck.Rows("1:1").WrapText = True

End Sub


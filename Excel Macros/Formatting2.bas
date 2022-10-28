Attribute VB_Name = "Formatting2"
Sub Format2()

'General Format

    AllData.Range("Q1:T1").Interior.Color = 12611584
    AllData.Columns("Q:Q").ColumnWidth = 7.43
    AllData.Columns("R:R").ColumnWidth = 6.86
    AllData.Columns("S:S").ColumnWidth = 8.57
    AllData.Columns("T:T").ColumnWidth = 9.57
    AllData.Rows("1:1").WrapText = True

'Name Format

    Name.Range("C1:G1").Interior.Color = 12611584
    Name.Range("H1:J1").Interior.Color = 5287936
    Name.Range("K1").Interior.ThemeColor = xlThemeColorLight1
    Name.Range("K1").Font.ThemeColor = xlThemeColorDark1
    Name.Columns("A:A").ColumnWidth = 14.43
    Name.Range("L1").Interior.ThemeColor = xlThemeColorLight1
    Name.Range("L1").Font.ThemeColor = xlThemeColorDark1
    Name.Columns("E:G").ColumnWidth = 5.43
    Name.Columns("H:J").ColumnWidth = 7.86
    Name.Rows("1:1").WrapText = True
    
'Address Format

    Address.Range("H1:J1").Interior.Color = 49407
    Address.Range("K1:L1").Interior.Color = 10498160
    Address.Range("M1:T1").Interior.Color = 12611584
    Address.Range("U1:AB1").Interior.Color = 5287936
    Address.Range("AC1:AD1").Interior.ThemeColor = xlThemeColorLight1
    Address.Range("AC1:AD1").Font.ThemeColor = xlThemeColorDark1
    Address.Columns("A:A").ColumnWidth = 14.43
    Address.Columns("H:H").ColumnWidth = 5.14
    Address.Columns("I:I").ColumnWidth = 7.14
    Address.Columns("J:J").ColumnWidth = 4.14
    Address.Columns("K:K").ColumnWidth = 10.29
    Address.Columns("L:L").ColumnWidth = 12.71
    Address.Columns("M:M").ColumnWidth = 7.29
    Address.Columns("N:Q").ColumnWidth = 6.86
    Address.Columns("R:R").ColumnWidth = 7.29
    Address.Columns("S:S").ColumnWidth = 6#
    Address.Columns("T:T").ColumnWidth = 8.43
    Address.Columns("U:U").ColumnWidth = 7.29
    Address.Columns("V:Y").ColumnWidth = 6.86
    Address.Columns("Z:Z").ColumnWidth = 7.29
    Address.Columns("AA:AA").ColumnWidth = 6#
    Address.Columns("AB:AB").ColumnWidth = 8.43
    Address.Columns("AC:AC").ColumnWidth = 8.29
    Address.Columns("AD:AD").ColumnWidth = 5.29
    Address.Rows("1:1").WrapText = True
    
'Contact Format

    Contact.Range("F1:G1").Interior.Color = 49407
    Contact.Range("H1:K1").Interior.Color = 12611584
    Contact.Range("L1:O1").Interior.Color = 5287936
    Contact.Range("P1:Q1").Interior.Color = 10498160
    Contact.Range("F1:G1").Interior.Color = 49407
    Contact.Columns("A:A").ColumnWidth = 14.43
    Contact.Range("R1").Interior.ThemeColor = xlThemeColorLight1
    Contact.Range("R1").Font.ThemeColor = xlThemeColorDark1
    Contact.Columns("C:D").ColumnWidth = 12.57
    Contact.Columns("F:F").EntireColumn.AutoFit
    Contact.Columns("G:G").ColumnWidth = 10.29
    Contact.Columns("H:O").ColumnWidth = 7.14
    Contact.Columns("P:P").ColumnWidth = 7.29
    Contact.Columns("Q:Q").ColumnWidth = 9.29
    Contact.Rows("1:1").WrapText = True

End Sub






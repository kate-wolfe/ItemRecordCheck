Attribute VB_Name = "Copy2"
Sub CopyStreets()

StSplit.Range("A:T").AutoFilter Field:=19, Criteria1:="Ok"

Dim LastC2Row As Long
LastC2Row = StSplit.Cells(StSplit.Rows.Count, 3).End(xlUp).Row

Dim CopyNameBar As Range
Set CopyNameBar = StSplit.Range("A1", "B" & LastC2Row)

Dim CopyMATown As Range
Set CopyMATown = StSplit.Range("E1", "E" & LastC2Row)

Dim CopyPType As Range
Set CopyPType = StSplit.Range("F1", "F" & LastC2Row)

Dim CopyNCode As Range
Set CopyNCode = StSplit.Range("G1", "G" & LastC2Row)

Dim CopySt As Range
Set CopySt = StSplit.Range("J1", "K" & LastC2Row)

Dim CopyCity As Range
Set CopyCity = StSplit.Range("M1", "M" & LastC2Row)

Dim CopyState As Range
Set CopyState = StSplit.Range("N1", "N" & LastC2Row)

Dim CopyZip As Range
Set CopyZip = StSplit.Range("T1", "T" & LastC2Row)

CopyNameBar.SpecialCells(xlCellTypeVisible).Copy TownCheck.Columns("A:B")
CopyMATown.SpecialCells(xlCellTypeVisible).Copy TownCheck.Columns("C:C")
CopyPType.SpecialCells(xlCellTypeVisible).Copy TownCheck.Columns("D:D")
CopyNCode.SpecialCells(xlCellTypeVisible).Copy TownCheck.Columns("E:E")
CopySt.SpecialCells(xlCellTypeVisible).Copy
TownCheck.Columns("F:G").PasteSpecial xlPasteValues
CopyCity.SpecialCells(xlCellTypeVisible).Copy
TownCheck.Columns("H:H").PasteSpecial xlPasteValues
CopyState.SpecialCells(xlCellTypeVisible).Copy
TownCheck.Columns("L:L").PasteSpecial xlPasteValues
CopyZip.SpecialCells(xlCellTypeVisible).Copy
TownCheck.Columns("M:M").PasteSpecial xlPasteValues

Call ReplaceLetters

TownCheck.Columns("F:F").TextToColumns Destination:=TownCheck.Range("F1"), DataType:=xlDelimited, _
TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
Semicolon:=True, Comma:=False, Space:=False, FieldInfo:=Array(Array(1, 1), Array(1, 1)), TrailingMinusNumbers:=True

TownCheck.Columns("M:M").TextToColumns Destination:=TownCheck.Range("M1"), DataType:=xlDelimited, _
TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
Semicolon:=True, Comma:=False, Space:=False, FieldInfo:=Array(Array(1, 1), Array(1, 1)), TrailingMinusNumbers:=True

TownCheck.Columns("M:M").NumberFormat = "00000"

StSplit.Range("A:T").AutoFilter

End Sub





Attribute VB_Name = "Copy3"
Sub CopyNCode()

TownCheck.Range("A:Z").AutoFilter Field:=26, Criteria1:="Clean"

Dim LastC2Row As Long
LastC2Row = TownCheck.Cells(StSplit.Rows.Count, 3).End(xlUp).Row

Dim CopyBarName As Range
Set CopyBarName = TownCheck.Range("A1", "B" & LastC2Row)

Dim CopyNBHD As Range
Set CopyNBHD = TownCheck.Range("E1", "E" & LastC2Row)

Dim CopyAdd1 As Range
Set CopyAdd1 = TownCheck.Range("F1", "H" & LastC2Row)

Dim CopyAdd2 As Range
Set CopyAdd2 = TownCheck.Range("L1", "M" & LastC2Row)

CopyBarName.SpecialCells(xlCellTypeVisible).Copy NCheck.Columns("A:B")
CopyNBHD.SpecialCells(xlCellTypeVisible).Copy NCheck.Columns("C:C")
CopyAdd1.SpecialCells(xlCellTypeVisible).Copy NCheck.Columns("F:H")
CopyAdd2.SpecialCells(xlCellTypeVisible).Copy NCheck.Columns("I:J")

TownCheck.Range("A:Z").AutoFilter

End Sub






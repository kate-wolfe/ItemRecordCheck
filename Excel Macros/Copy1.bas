Attribute VB_Name = "Copy1"
Sub CopyOver()

Dim LastRow As Long
LastRow = AllData.Cells(AllData.Rows.Count, 9).End(xlUp).Row

Dim CopyName As Range
Set CopyName = AllData.Range("A1", "B" & LastRow)

Dim CopyAdd As Range
Set CopyAdd = AllData.Range("A1", "F" & LastRow)
Dim CopyAdd2 As Range
Set CopyAdd2 = AllData.Range("J1", "J" & LastRow)

Dim CopyCon As Range
Set CopyCon = AllData.Range("A1", "B" & LastRow)
Dim CopyCon2 As Range
Set CopyCon2 = AllData.Range("M1", "O" & LastRow)


CopyName.Copy Name.Columns("A:B")

CopyAdd.Copy Address.Columns("A:F")
CopyAdd2.Copy Address.Columns("G:G")

CopyCon.Copy Contact.Columns("A:B")
CopyCon2.Copy Contact.Columns("C:E")

End Sub




Attribute VB_Name = "ReplaceLtrs"
Sub ReplaceLetters()

Dim StreetNumbers As Range
Set StreetNumbers = TownCheck.Columns("F:F")

With StreetNumbers
.Replace "a", "", xlPart
.Replace "b", "", xlPart
.Replace "c", "", xlPart
.Replace "d", "", xlPart
.Replace "e", "", xlPart
.Replace "f", "", xlPart
.Replace "g", "", xlPart
.Replace "h", "", xlPart
.Replace "i", "", xlPart
.Replace "j", "", xlPart
.Replace "k", "", xlPart
.Replace "l", "", xlPart
.Replace "m", "", xlPart
.Replace "n", "", xlPart
.Replace "o", "", xlPart
.Replace "p", "", xlPart
.Replace "q", "", xlPart
.Replace "r", "", xlPart
.Replace "s", "", xlPart
.Replace "t", "", xlPart
.Replace "u", "", xlPart
.Replace "v", "", xlPart
.Replace "w", "", xlPart
.Replace "x", "", xlPart
.Replace "y", "", xlPart
.Replace "z", "", xlPart
End With

End Sub



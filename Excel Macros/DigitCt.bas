Attribute VB_Name = "DigitCt"
Function DigitCount(S As String) As Long
  Dim X As Long
  For X = 1 To Len(S)
    If Mid(S, X, 1) Like "#" Then DigitCount = DigitCount + 1
  Next
End Function




Attribute VB_Name = "NameFormulas"
Sub NameForm()

Dim LastNameRow As Long
LastNameRow = Name.Range("A1").CurrentRegion.Rows.Count

    Name.Columns("B:B").TextToColumns Destination:=Name.Range("L1"), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
        Semicolon:=True, Comma:=False, Space:=False, Other:=False, FieldInfo _
        :=Array(1, 1), TrailingMinusNumbers:=True
        
    Name.Range("C1").FormulaR1C1 = "Blank"
    Name.Range("C2:C" & LastNameRow).FormulaR1C1 = _
    "=IF(RC[-1]="""",""Error"",""Ok"")"
    
    Name.Range("D1").FormulaR1C1 = "Period"
    Name.Range("D2:D" & LastNameRow).FormulaR1C1 = _
    "=IF(ISERROR(FIND(""."",RC[-2])),""Ok"",""Error"")"
    
    Name.Range("E1").FormulaR1C1 = "Lead Space"
    Name.Range("E2:E" & LastNameRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-3],1)="" "",""Error"",""Ok"")"
    
    Name.Range("F1").FormulaR1C1 = "Mult Space"
    Name.Range("F2:F" & LastNameRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""  "",RC[-4])),""Error"",""Ok"")"
    
    Name.Range("G1").FormulaR1C1 = "End Space"
    Name.Range("G2:G" & LastNameRow).FormulaR1C1 = _
    "=IF(RIGHT(RC[-5],1)="" "",""Error"",""Ok"")"
    
    Name.Range("H1").FormulaR1C1 = "Name 1 Commas"
    Name.Range("H2:H" & LastNameRow).FormulaR1C1 = _
    "=IF(RC[4]="""",""-"",LEN(RC[4])-LEN(SUBSTITUTE(RC[4],"","","""")))"
    
    Name.Range("I1").FormulaR1C1 = "Name 2 Commas"
    Name.Range("I2:I" & LastNameRow).FormulaR1C1 = _
    "=IF(RC[4]="""",""-"",LEN(RC[4])-LEN(SUBSTITUTE(RC[4],"","","""")))"
    
    Name.Range("J1").FormulaR1C1 = "Name 3 Commas"
    Name.Range("J2:J" & LastNameRow).FormulaR1C1 = _
    "=IF(RC[4]="""",""-"",LEN(RC[4])-LEN(SUBSTITUTE(RC[4],"","","""")))"
    
    Name.Range("K1").FormulaR1C1 = "All Errors"
    Name.Range("K2:K" & LastNameRow).FormulaR1C1 = _
        "=IF(OR(RC[-8]=""Error"",RC[-7]=""Error"",RC[-6]=""Error"",RC[-5]=""Error"",RC[-4]=""Error""),""Error"",""Ok"")"


'Conditional Formatting

Dim NameError As Range
Set NameError = Name.Range("C2:G" & LastNameRow)

    NameError.FormatConditions.Add Type:=xlCellValue, Operator:=xlEqual, Formula1:="=""Error"""
    NameError.FormatConditions(1).Interior.Color = 255
    NameError.FormatConditions(1).StopIfTrue = False

End Sub





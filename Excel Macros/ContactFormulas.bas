Attribute VB_Name = "ContactFormulas"
Sub ConForm()

Dim LastConRow As Long
LastConRow = Contact.Range("A1").CurrentRegion.Rows.Count
    
    Contact.Range("F1").FormulaR1C1 = "All Blank"
    Contact.Range("F2:F" & LastConRow).FormulaR1C1 = _
    "=IF(AND(RC[-3]="""",RC[-2]="""",RC[-1]=""""),""Error"",""Ok"")"
    
    Contact.Range("G1").FormulaR1C1 = "Tel 1 Blank, 2 Not"
    Contact.Range("G2:G" & LastConRow).FormulaR1C1 = _
    "=IF(AND(RC[-4]="""",RC[-3]<>""""),""Error"",""Ok"")"
    
    Contact.Range("H1").FormulaR1C1 = "Lead Space 1"
    Contact.Range("H2:H" & LastConRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-5],1)="" "",""Error"",""Ok"")"
    
    Contact.Range("I1").FormulaR1C1 = "Mult Space 1"
    Contact.Range("I2:I" & LastConRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""  "",RC[-6])),""Error"",""Ok"")"
    
    Contact.Range("J1").FormulaR1C1 = "End Space 1"
    Contact.Range("J2:J" & LastConRow).FormulaR1C1 = _
    "=IF(RIGHT(RC[-7],1)="" "",""Error"",""Ok"")"
    
    Contact.Range("K1").FormulaR1C1 = "Punc 1"
    Contact.Range("K2:K" & LastConRow).FormulaR1C1 = _
    "=IF(RC[-8]="""",""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-8],ROW(INDIRECT(""1:""&LEN(RC[-8]))), 1),"" 0123456789-"" ))),""Error"",""Ok""))"
    
    Contact.Range("L1").FormulaR1C1 = "Lead Space 2"
    Contact.Range("L2:L" & LastConRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-8],1)="" "",""Error"",""Ok"")"
    
    Contact.Range("M1").FormulaR1C1 = "Mult Space 2"
    Contact.Range("M2:M" & LastConRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""  "",RC[-9])),""Error"",""Ok"")"
    
    Contact.Range("N1").FormulaR1C1 = "End Space 2"
    Contact.Range("N2:N" & LastConRow).FormulaR1C1 = _
    "=IF(RIGHT(RC[-10],1)="" "",""Error"",""Ok"")"
    
    Contact.Range("O1").FormulaR1C1 = "Punc 2"
    Contact.Range("O2:O" & LastConRow).FormulaR1C1 = _
    "=IF(RC[-11]="""",""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-11],ROW(INDIRECT(""1:""&LEN(RC[-11]))), 1),"" 0123456789-"" ))),""Error"",""Ok""))"
    
    Contact.Range("P1").FormulaR1C1 = "No @ in email"
    Contact.Range("P2:P" & LastConRow).FormulaR1C1 = _
    "=IF(OR(RC[-11]="""",ISERROR(FIND(""@"",RC[-11]))=FALSE),""Ok"",""Error"")"
    
    Contact.Range("Q1").FormulaR1C1 = "Any Space in Email"
    Contact.Range("Q2:Q" & LastConRow).FormulaR1C1 = _
    "=IF(ISERROR(FIND("" "",RC[-12]))=TRUE,""Ok"",""Error"")"
    
    Contact.Range("R1").FormulaR1C1 = "All Errors"
    Contact.Range("R2:R" & LastConRow).FormulaR1C1 = _
        "=IF(OR(RC[-12]=""Error"",RC[-11]=""Error"",RC[-10]=""Error"",RC[-9]=""Error"",RC[-8]=""Error"",RC[-7]=""Error"",RC[-6]=""Error"",RC[-5]=""Error"",RC[-4]=""Error"",RC[-3]=""Error"",RC[-2]=""Error"",RC[-1]=""Error""),""Error"",""Ok"")"

    
'Conditional Formatting

Dim ConError As Range
Set ConError = Contact.Range("F2:Q" & LastConRow)

    ConError.FormatConditions.Add Type:=xlCellValue, Operator:=xlEqual, Formula1:="=""Error"""
    ConError.FormatConditions(1).Interior.Color = 255
    ConError.FormatConditions(1).StopIfTrue = False

End Sub





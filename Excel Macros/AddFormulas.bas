Attribute VB_Name = "AddFormulas"
Sub AddForm()

Dim LastAddRow As Long
LastAddRow = Address.Range("A1").CurrentRegion.Rows.Count
    
    Address.Range("H1").FormulaR1C1 = "Both Blank"
    Address.Range("H2:H" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(RC[-5]="""",RC[-4]=""""),""Error"",""Ok"")"
    
    Address.Range("I1").FormulaR1C1 = "1 Blank, 2 Not"
    Address.Range("I2:I" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(RC[-6]="""",RC[-5]<>""""),""Error"",""Ok"")"
        
    Address.Range("J1").FormulaR1C1 = "c/o?"
    Address.Range("J2:J" & LastAddRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""c/o"",RC[-7]))=TRUE,""c/o"",""Ok"")"
    
    Address.Range("K1").FormulaR1C1 = "Cambridge Zip? (TRUE)"
    Address.Range("K2:K" & LastAddRow).FormulaR1C1 = _
    "=OR(ISNUMBER(SEARCH(""02138"",RC[-8])),ISNUMBER(SEARCH(""02139"",RC[-8])),ISNUMBER(SEARCH(""02140"",RC[-8])),ISNUMBER(SEARCH(""02141"",RC[-8])),ISNUMBER(SEARCH(""02142"",RC[-8])))"

    Address.Range("L1").FormulaR1C1 = """Cambridge""? (FALSE)"
    Address.Range("L2:L" & LastAddRow).FormulaR1C1 = _
    "=ISNUMBER(SEARCH(""cambridge "",RC[-9]))"
    
    Address.Range("M1").FormulaR1C1 = "Lead $ 1"
    Address.Range("M2:M" & LastAddRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-10],1)=""$"",""Error"",""Ok"")"
    
    Address.Range("N1").FormulaR1C1 = "Lead Space 1"
    Address.Range("N2:N" & LastAddRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-11],1)="" "",""Error"",""Ok"")"
    
    Address.Range("O1").FormulaR1C1 = "Mult Space 1"
    Address.Range("O2:O" & LastAddRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""  "",RC[-12])),""Error"",""Ok"")"
    
    Address.Range("P1").FormulaR1C1 = "End Space 1"
    Address.Range("P2:P" & LastAddRow).FormulaR1C1 = _
    "=IF(RIGHT(RC[-13],1)="" "",""Error"",""Ok"")"
    
    Address.Range("Q1").FormulaR1C1 = "Mid Space 1"
    Address.Range("Q2:Q" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(ISERROR(FIND("" $"",RC[-14]))=TRUE,ISERROR(FIND(""$ "",RC[-14])))=TRUE,""Ok"",""Error"")"
    
    Address.Range("R1").FormulaR1C1 = "Mult $ 1"
    Address.Range("R2:R" & LastAddRow).FormulaR1C1 = _
    "=IF(RC[-15]="""",""-"",LEN(RC[-15])-LEN(SUBSTITUTE(RC[-15],""$"","""")))"
    
    Address.Range("S1").FormulaR1C1 = "Punc 1"
    Address.Range("S2:S" & LastAddRow).FormulaR1C1 = _
    "=IF(RC[-16]="""",""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-16],ROW(INDIRECT(""1:""&LEN(RC[-16]))), 1),"" 0123456789abcdefghijklmnopqrstuvwxyz$-/"" ))),""Error"",""Ok""))"
    
    Address.Range("T1").FormulaR1C1 = "P O Box 1"
    Address.Range("T2:T" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(ISNUMBER(FIND(""P O Box"",RC[-17]))=FALSE,ISNUMBER(SEARCH(""box"",RC[-17]))=TRUE),""Error"",""Ok"")"

    Address.Range("U1").FormulaR1C1 = "Lead $ 2"
    Address.Range("U2:U" & LastAddRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-17],1)="" "",""Error"",""Ok"")"

    Address.Range("V1").FormulaR1C1 = "Lead Space 2"
    Address.Range("V2:V" & LastAddRow).FormulaR1C1 = _
    "=IF(LEFT(RC[-18],1)=""$"",""Error"",""Ok"")"
    
    Address.Range("W1").FormulaR1C1 = "Mult Space 2"
    Address.Range("W2:W" & LastAddRow).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""  "",RC[-19])),""Error"",""Ok"")"
    
    Address.Range("X1").FormulaR1C1 = "End Space 2"
    Address.Range("X2:X" & LastAddRow).FormulaR1C1 = _
    "=IF(RIGHT(RC[-20],1)="" "",""Error"",""Ok"")"
    
    Address.Range("Y1").FormulaR1C1 = "Mid Space 2"
    Address.Range("Y2:Y" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(ISERROR(FIND("" $"",RC[-21]))=TRUE,ISERROR(FIND(""$ "",RC[-21])))=TRUE,""Ok"",""Error"")"
    
    Address.Range("Z1").FormulaR1C1 = "Mult $ 2"
    Address.Range("Z2:Z" & LastAddRow).FormulaR1C1 = _
    "=IF(RC[-22]="""",""-"",LEN(RC[-22])-LEN(SUBSTITUTE(RC[-22],""$"","""")))"
    
    Address.Range("AA1").FormulaR1C1 = "Punc 2"
    Address.Range("AA2:AA" & LastAddRow).FormulaR1C1 = _
    "=IF(RC[-23]="""",""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-23],ROW(INDIRECT(""1:""&LEN(RC[-23]))), 1),"" 0123456789abcdefghijklmnopqrstuvwxyz$-/"" ))),""Error"",""Ok""))"
    
    Address.Range("AB1").FormulaR1C1 = "P O Box 2"
    Address.Range("AB2:AB" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(ISNUMBER(FIND(""P O Box"",RC[-24]))=FALSE,ISNUMBER(SEARCH(""box"",RC[-24]))=TRUE),""Error"",""Ok"")"

    Address.Range("AC1").FormulaR1C1 = "All Errors"
    Address.Range("AC2:AC" & LastAddRow).FormulaR1C1 = _
    "=IF(OR(RC[-21]=""Error"",RC[-20]=""Error"",RC[-19]=""Error"",RC[-16]=""Error"",RC[-15]=""Error"",RC[-14]=""Error"",RC[-13]=""Error"",RC[-12]=""Error"",RC[-10]=""Error"",RC[-9]=""Error"",RC[-8]=""Error"",RC[-7]=""Error"",RC[-6]=""Error"",RC[-5]=""Error"",RC[-4]=""Error"",RC[-2]=""Error"",RC[-1]=""Error""),""Error"",""Ok"")"

    Address.Range("AD1").FormulaR1C1 = "Clean"
    Address.Range("AD2:AD" & LastAddRow).FormulaR1C1 = _
    "=IF(AND(RC[-19]=TRUE,RC[-18]=FALSE),""No"",IF(AND(RC[-12]<>1,RC[-12]<>""-""),""No"",IF(AND(RC[-4]<>1,RC[-4]<>""-""),""No"",IF(RC[-1]=""Error"",""No"",""Clean""))))"

'Conditional Formatting

Dim AddError As Range
Set AddError = Address.Range("H2:AB" & LastAddRow)

    AddError.FormatConditions.Add Type:=xlCellValue, Operator:=xlEqual, Formula1:="=""Error"""
    AddError.FormatConditions(1).Interior.Color = 255
    AddError.FormatConditions(1).StopIfTrue = False

End Sub







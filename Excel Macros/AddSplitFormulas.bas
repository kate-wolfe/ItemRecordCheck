Attribute VB_Name = "AddSplitFormulas"
Sub AddSplit1()

Dim LastAddRow As Long
LastAddRow = Address.Range("A1").CurrentRegion.Rows.Count

Address.Range("A:AD").AutoFilter Field:=30, Criteria1:="Clean"

Address.Range("A1:G" & LastAddRow).SpecialCells(xlCellTypeVisible).Copy AddSplit.Columns("A:G")

Address.Range("A:AD").AutoFilter

AddSplit.Columns("C:C").TextToColumns Destination:=Range("H1"), DataType:=xlDelimited, _
TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
Semicolon:=False, Comma:=False, Space:=False, Other:=True, OtherChar _
:="$", FieldInfo:=Array(Array(1, 1), Array(2, 1)), TrailingMinusNumbers:=True

AddSplit.Range("H1").FormulaR1C1 = "Street 1"
AddSplit.Range("I1").FormulaR1C1 = "City 1"
AddSplit.Range("H1:I1").Interior.Color = 12611584
AddSplit.Range("H1:I1").Font.ThemeColor = xlThemeColorLight1
AddSplit.Range("J1:K1").Interior.Color = 5287936
AddSplit.Range("J1:K1").Font.ThemeColor = xlThemeColorLight1
AddSplit.Range("L1:V1").Interior.Color = 12611584
AddSplit.Range("L1:V1").Font.ThemeColor = xlThemeColorLight1

Dim LastAS1Row As Long
LastAS1Row = AddSplit.Range("A1").CurrentRegion.Rows.Count

AddSplit.Range("J1").FormulaR1C1 = "No St #"
AddSplit.Range("J2:J" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(VALUE(LEFT(RC[-2],1))),""Ok"",IF(ISNUMBER(SEARCH(""p o box"",RC[-2]))=TRUE,""Ok"",""Error""))"
        
AddSplit.Range("K1").FormulaR1C1 = "Slash Count"
AddSplit.Range("K2:K" & LastAS1Row).FormulaR1C1 = "=LEN(RC[-3])-LEN(SUBSTITUTE(RC[-3],""/"",""""))"
    
AddSplit.Range("L1").FormulaR1C1 = "Mass Ave?"
AddSplit.Range("L2:L" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""mass ave"",RC[-4]))=FALSE,""Ok"",""Error"")"
        
AddSplit.Range("M1").FormulaR1C1 = "Abbr."
AddSplit.Range("M2:M" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""apar"",RC[-5]))=TRUE,""Error"",IF(ISNUMBER(SEARCH(""buil"",RC[-5]))=TRUE,""Error"",IF(ISNUMBER(SEARCH(""room"",RC[-5]))=TRUE,""Error"",IF(ISNUMBER(SEARCH(""suit"",RC[-5]))=TRUE,""Error"",""Ok""))))"
    
AddSplit.Range("N1").FormulaR1C1 = """Apt""?"
AddSplit.Range("N2:N" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""apt"",RC[-6]))=FALSE,""-"",IF(ISNUMBER(FIND(""Apt"",RC[-6]))=TRUE,""Ok"",""Error""))"
    
AddSplit.Range("O1").FormulaR1C1 = "Space After Apt"
AddSplit.Range("O2:O" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH(""apt"",RC[-7]))=FALSE,""-"",IF(ISNUMBER(SEARCH(""apt "",RC[-7]))=TRUE,""Ok"",""Error""))"
    
AddSplit.Range("P1").FormulaR1C1 = """MA""?"
AddSplit.Range("P2:P" & LastAS1Row).FormulaR1C1 = "=IF(ISNUMBER(SEARCH(""ma"",RC[-7]))=FALSE,""-"",IF(ISNUMBER(SEARCH(""germany"",RC[-7]))=TRUE,""-"", IF(ISNUMBER(FIND("" MA "",RC[-7]))=TRUE,""Ok"",""Error"")))"

AddSplit.Range("Q1").FormulaR1C1 = "Out of State Codes"
AddSplit.Range("Q2:Q" & LastAS1Row).FormulaR1C1 = _
    "=IF(ISNUMBER(SEARCH("" ma "",RC[-8]))=TRUE,""Ok"",IF(AND(RC[-12]=201,RC[-11]=255),""Ok"",IF(RC[-1]<>""-"",""Ok"",""Error"")))"

AddSplit.Range("R1").FormulaR1C1 = "Space Count"
AddSplit.Range("R2:R" & LastAS1Row).FormulaR1C1 = "=LEN(RC[-9])-LEN(SUBSTITUTE(RC[-9],"" "",""""))"

AddSplit.Range("S1").FormulaR1C1 = "Hyphen Count"
AddSplit.Range("S2:S" & LastAS1Row).FormulaR1C1 = "=LEN(RC[-10])-LEN(SUBSTITUTE(RC[-10],""-"",""""))"

AddSplit.Range("T1").FormulaR1C1 = "Zip Code # Count"
AddSplit.Range("T2:T" & LastAS1Row).FormulaR1C1 = "=DigitCount(RC[-11])"

AddSplit.Range("U1").FormulaR1C1 = "Zip Punc Error"
AddSplit.Range("U2:U" & LastAS1Row).FormulaR1C1 = _
    "=IF(RC[-2]=0,""Ok"",IF(OR(RC[-2]<>1,AND(RC[-2]=1,RC[-3]<>2)),""Error"",""Ok""))"

AddSplit.Range("V1").FormulaR1C1 = "Zip # Error"
AddSplit.Range("V2:V" & LastAS1Row).FormulaR1C1 = "=IF(RC[-2]=5,""Ok"",IF(AND(RC[-2]=9,RC[-3]=1),""Ok"",""Error""))"

AddSplit.Range("W1").FormulaR1C1 = "P O Box Error"
AddSplit.Range("W2:W" & LastAS1Row).FormulaR1C1 = "=IF(ISNUMBER(SEARCH(""p o box"",RC[-15]))=FALSE,""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-15],ROW(INDIRECT(""1:""&LEN(RC[-15]))), 1),"" pobox1234567890"" ))),""Error"",""Ok""))"

AddSplit.Range("X1").FormulaR1C1 = "All Errors"
AddSplit.Range("X2:X" & LastAS1Row).FormulaR1C1 = "=IF(OR(RC[-7]=""Error"",RC[-8]=""Error"",RC[-9]=""Error"",RC[-10]=""Error"",RC[-11]=""Error"",RC[-12]=""Error"",RC[-14]=""Error"",RC[-3]=""Error"",RC[-2]=""Error"",RC[-1]=""Error""),""Error"",""Ok"")"

AddSplit.Range("Y1").FormulaR1C1 = "Clean"
AddSplit.Range("Y2:Y" & LastAS1Row).FormulaR1C1 = "=IF(AND(ISNUMBER(SEARCH(""p o box"",RC[-17]))=FALSE,RC[-1]=""Ok"",ISNUMBER(SEARCH("" ma "",RC[-16]))=TRUE),""Clean"",""No"")"


Dim AddSpError As Range
Set AddSpError = AddSplit.Range("L2:W" & LastAS1Row)

    AddSpError.FormatConditions.Add Type:=xlCellValue, Operator:=xlEqual, Formula1:="=""Error"""
    AddSpError.FormatConditions(1).Interior.Color = 255
    AddSpError.FormatConditions(1).StopIfTrue = False


End Sub








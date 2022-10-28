Attribute VB_Name = "StSplitFormulas"
Sub StSplit1()

Dim LastAS1Row As Long
LastAS1Row = AddSplit.Range("A1").CurrentRegion.Rows.Count

AddSplit.Range("A:Y").AutoFilter Field:=25, Criteria1:="Clean"

AddSplit.Range("A1:I" & LastAS1Row).SpecialCells(xlCellTypeVisible).Copy StSplit.Columns("A:I")

AddSplit.Range("A:Y").AutoFilter

Dim LastSS1Row As Long
LastSS1Row = StSplit.Range("A1").CurrentRegion.Rows.Count

StSplit.Range("J1").FormulaR1C1 = "St #"
StSplit.Range("J2:J" & LastSS1Row).FormulaR1C1 = _
    "=TRIM(IFERROR(LEFT(RC[-2],SEARCH("" "",RC[-2],SEARCH(""/"",RC[-2]))),TRIM(IFERROR(LEFT(RC[-2],SEARCH("" "",RC[-2])),""""))))"
    
StSplit.Range("L1").FormulaR1C1 = "Apt #"
StSplit.Range("L2:L" & LastSS1Row).FormulaR1C1 = "=TRIM(IF(ISNUMBER(SEARCH("" ph "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" ph "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" bsmt"",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" bsmt"",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" fl "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" fl "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" apt "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" apt "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" unit "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" unit "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" ste "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" ste "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" rm "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" rm "",RC[-4]))," _
& "IF(ISNUMBER(SEARCH("" bldg "",RC[-4]))=TRUE,RIGHT(RC[-4],LEN(RC[-4])-SEARCH("" bldg "",RC[-4])),"""")))))))))"
    
StSplit.Range("K1").FormulaR1C1 = "Street"
StSplit.Range("K2:K" & LastSS1Row).FormulaR1C1 = _
    "=IFERROR(TRIM(MID(RC[-3],LEN(RC[-1])+1,LEN(RC[-3])-LEN(RC[-1])-LEN(RC[1]))),""#Error"")"
    
StSplit.Range("M1").FormulaR1C1 = "City"
StSplit.Range("M2:M" & LastSS1Row).FormulaR1C1 = _
    "=TRIM(IFERROR(LEFT(RC[-4],SEARCH("" ma"",RC[-4])),""""))"

StSplit.Range("O1").FormulaR1C1 = "Zip"
StSplit.Range("O2:O" & LastSS1Row).FormulaR1C1 = _
    "=TRIM(IFERROR(RIGHT(RC[-6],LEN(RC[-6])-SEARCH("" ma "",RC[-6])-3),""""))"

StSplit.Range("N1").FormulaR1C1 = "State"
StSplit.Range("N2:N" & LastSS1Row).FormulaR1C1 = _
    "=IFERROR(TRIM(MID(RC[-5],LEN(RC[-1])+1,LEN(RC[-5])-LEN(RC[-1])-LEN(RC[1]))),""Error"")"

StSplit.Range("P1").FormulaR1C1 = "Zip Punc"
StSplit.Range("P2:P" & LastSS1Row).FormulaR1C1 = _
    "=IF(RC[-1]="""",""Ok"",IF(ISERROR(SUMPRODUCT(SEARCH(MID(RC[-1],ROW(INDIRECT(""1:""&LEN(RC[-1]))), 1),""-0123456789"" ))),""Error"",""Ok""))"
    
StSplit.Range("Q1").FormulaR1C1 = "Zip Error"
StSplit.Range("Q2:Q" & LastSS1Row).FormulaR1C1 = _
    "=IF(RC[-3]<>""MA"",""Ok"",IF(LEFT(RC[-2],1)=""0"",""Ok"",""Error""))"
    
StSplit.Range("R1").FormulaR1C1 = "St Error"
StSplit.Range("R2:R" & LastSS1Row).FormulaR1C1 = _
    "=IF(OR(RC[-7]="""",ISNUMBER(SEARCH(""P O Box"",RC[-10])))=TRUE,""Error"",""Ok"")"
    
StSplit.Range("S1").FormulaR1C1 = "All Errors"
StSplit.Range("S2:S" & LastSS1Row).FormulaR1C1 = _
    "=IF(OR(RC[-2]=""Error"",RC[-1]=""Error"",RC[-3]=""Error""),""Error"",""Ok"")"
    
StSplit.Range("T1").FormulaR1C1 = "5# Zip"
StSplit.Range("T2:T" & LastSS1Row).FormulaR1C1 = "=LEFT(RC[-5],5)"
    
End Sub







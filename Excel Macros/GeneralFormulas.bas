Attribute VB_Name = "GeneralFormulas"
Sub GenForm()

Dim LastGenRow As Long
LastGenRow = AllData.Range("A1").CurrentRegion.Rows.Count
    
    AllData.Range("Q1").FormulaR1C1 = "Weird Barcode"
    AllData.Range("Q2:Q" & LastGenRow).FormulaR1C1 = _
    "=IF(RC[-16]="""","""",IF( ISERROR( SUMPRODUCT( SEARCH(MID(RC[-16],ROW( INDIRECT( ""1:""&LEN(RC[-16]))), 1), ""0123456789"" ))),""Error"",""Ok""))"
 
    AllData.Range("R1").FormulaR1C1 = "B Day / Decade"
    AllData.Range("R2:R" & LastGenRow).FormulaR1C1 = _
    "=IF(AND(ISNUMBER(SEARCH(""190"",YEAR(RC[-6])))=TRUE,RC[-7]=""e""),""Ok"",IF(AND(ISNUMBER(SEARCH(""191"",YEAR(RC[-6])))=TRUE,RC[-7]=""f""),""Ok"",IF(AND(ISNUMBER(SEARCH(""192"",YEAR(RC[-6])))=TRUE,RC[-7]=2),""Ok"",IF(AND(ISNUMBER(SEARCH(""193"",YEAR(RC[-6])))=TRUE,RC[-7]=3),""Ok"",IF(AND(ISNUMBER(SEARCH(""194"",YEAR(RC[-6])))=TRUE,RC[-7]=4),""Ok"",IF(AND(ISNUMBER(SEA" & _
        "RCH(""195"",YEAR(RC[-6])))=TRUE,RC[-7]=5),""Ok"",IF(AND(ISNUMBER(SEARCH(""196"",YEAR(RC[-6])))=TRUE,RC[-7]=6),""Ok"",IF(AND(ISNUMBER(SEARCH(""197"",YEAR(RC[-6])))=TRUE,RC[-7]=7),""Ok"",IF(AND(ISNUMBER(SEARCH(""198"",YEAR(RC[-6])))=TRUE,RC[-7]=8),""Ok"",IF(AND(ISNUMBER(SEARCH(""199"",YEAR(RC[-6])))=TRUE,RC[-7]=9),""Ok"",IF(AND(ISNUMBER(SEARCH(""200"",YEAR(RC[-6])))=T" & _
        "RUE,RC[-7]=0),""Ok"",IF(AND(ISNUMBER(SEARCH(""201"",YEAR(RC[-6])))=TRUE,RC[-7]=1),""Ok"",IF(AND(RC[-6]="""",RC[-7]=""-""),""Ok"",""Error"")))))))))))))" & _
        ""

    AllData.Range("S1").FormulaR1C1 = "No Z in Home Lib"
    AllData.Range("S2:S" & LastGenRow).FormulaR1C1 = _
    "=IF(ISERROR(FIND(""z"",RC[-11])),""Error"",""Ok"")"
    
    AllData.Range("T1").FormulaR1C1 = "Census Non-Blank"
    AllData.Range("T2:T" & LastGenRow).FormulaR1C1 = _
    "=IF(RC[-4]="""",""Ok"",""Error"")"
   
'Conditional Formatting

Dim GenError As Range
Set GenError = AllData.Range("Q2:T" & LastGenRow)

    GenError.FormatConditions.Add Type:=xlCellValue, Operator:=xlEqual, Formula1:="=""Error"""
    GenError.FormatConditions(1).Interior.Color = 255
    GenError.FormatConditions(1).StopIfTrue = False
    
End Sub







Attribute VB_Name = "TownCheckFormulas"
Sub TownCheckMacro()

Dim LastTCRow As Long
LastTCRow = TownCheck.Range("C1").CurrentRegion.Rows.Count

With TownCheck

    .Range("A1").FormulaR1C1 = "Barcode"
    .Range("B1").FormulaR1C1 = "Name"
    .Range("C1").FormulaR1C1 = "MA Town"
    .Range("D1").FormulaR1C1 = "P Type"
    .Range("E1").FormulaR1C1 = "N Code"
    .Range("F1").FormulaR1C1 = "St #"
    .Range("G1").FormulaR1C1 = "Street"
    .Range("H1").FormulaR1C1 = "City"
    
    .Range("I1").FormulaR1C1 = "MA Town ="
    .Range("I2:I" & LastTCRow).FormulaR1C1 = _
        "=IFERROR(VLOOKUP(RC[-6],MATown,2,FALSE),""#City Not Found"")"
    .Range("J1").FormulaR1C1 = "P Type ="
    .Range("J2:J" & LastTCRow).FormulaR1C1 = _
        "=IFERROR(VLOOKUP(RC[-6],PType,2,FALSE),""#Invalid P Type"")"
    .Range("K1").FormulaR1C1 = "Zip Result"
    .Range("K2:K" & LastTCRow).FormulaR1C1 = _
        "=IFERROR(VLOOKUP(RC[2],Zip,2,FALSE),""#Zip Not Found"")"
    
    .Range("L1").FormulaR1C1 = "State"
    .Range("M1").FormulaR1C1 = "5# Zip"
    .Range("P1").FormulaR1C1 = "City/Zip Error"
    .Range("P2:P" & LastTCRow).FormulaR1C1 = "=IF(RC[-8]=RC[-5],"""",""Error"")"
    .Range("Q1").FormulaR1C1 = "MA Town Gen Error"
    .Range("Q2:Q" & LastTCRow).FormulaR1C1 = _
        "=IF(OR(ISNUMBER(MATCH(RC[-8],CheckTown[Check],0))=TRUE,ISNUMBER(MATCH(RC[-8],VsPType[MA Town],0))=TRUE,RC[-8]=""Boston"",RC[-8]=""Other MA""),"""",IF(RC[-9]=RC[-8],"""",""Error""))"
    .Range("R1").FormulaR1C1 = "Other MA Error"
    .Range("R2:R" & LastTCRow).FormulaR1C1 = _
        "=IF(RC[-9]<>""Other MA"","""",IF(AND(RC[-9]=""Other MA"",ISNUMBER(MATCH(RC[-10],NOMA,0))=FALSE),"""",""Error""))"
    .Range("S1").FormulaR1C1 = "Check Other"
    .Range("S2:S" & LastTCRow).FormulaR1C1 = _
        "=IF(ISNUMBER(MATCH(RC[-10],CheckTown[Check],0))=TRUE,""Check"","""")"
    .Range("T1").FormulaR1C1 = "Check against P Type"
    .Range("T2:T" & LastTCRow).FormulaR1C1 = _
        "=IF(ISNA(VLOOKUP(RC[-10],VsPType,2,FALSE))=TRUE,"""",IF(VLOOKUP(RC[-10],VsPType,2,FALSE)=RC[-11],"""",""Error""))"
    .Range("U1").FormulaR1C1 = "Boston"
    .Range("U2:U" & LastTCRow).FormulaR1C1 = _
        "=IF(RC[-12]<>""Boston"","""",IF(AND(RC[-12]=""Boston"",ISNUMBER(MATCH(RC[-13],Boston[Boston Neighborhoods],0))=TRUE),"""",""Error""))"
    .Range("V1").FormulaR1C1 = "Normal P Type"
    .Range("V2:V" & LastTCRow).FormulaR1C1 = _
        "=IF(OR(RC[-12]=""Non-MLN resident"",RC[-12]=""Online Patron"",ISNA(MATCH(RC[-12],Ignore[Ignore],0))=FALSE,ISNA(MATCH(RC[-12],Exempt[Exempt],0))=FALSE),"""",IF(RC[-12]=RC[-14],"""",""Error""))"
    .Range("W1").FormulaR1C1 = "Non-MLN Resident"
    .Range("W2:W" & LastTCRow).FormulaR1C1 = _
        "=IF(RC[-13]<>""Non-MLN resident"","""",IF(AND(RC[-13]=""Non-MLN resident"",ISNUMBER(MATCH(RC[-15],MLNLib[MLN Libraries],0))=FALSE),"""",""Error""))"
    .Range("X1").FormulaR1C1 = "Online Patron"
    .Range("X2:X" & LastTCRow).FormulaR1C1 = _
        "=IF(RC[-14]<>""Online Patron"","""",IF(AND(RC[-14]=""Online Patron"",DigitCount(RC[-23])=7),"""",""Error""))"
    .Range("Y1").FormulaR1C1 = "Exempt"
    .Range("Y2:Y" & LastTCRow).FormulaR1C1 = _
        "=IF(ISNA(MATCH(RC[-15],Exempt[Exempt],0))=TRUE,"""",IF(VLOOKUP(RC[-15],Exempt,2,FALSE)=RC[-17],"""",""Error""))"
    .Range("N1").FormulaR1C1 = "MA Town Error"
    .Range("N2:N" & LastTCRow).FormulaR1C1 = "=CONCATENATE(RC[3],RC[4],RC[5],RC[6],RC[7])"
    .Range("O1").FormulaR1C1 = "P Type Error"
    .Range("O2:O" & LastTCRow).FormulaR1C1 = "=CONCATENATE(RC[7],RC[8],RC[9],RC[10])"
    .Range("Z1").FormulaR1C1 = "Clean"
    .Range("Z2:Z" & LastTCRow).FormulaR1C1 = _
        "=IF(OR(RC[-18]=""Cambridge"",LEFT(RC[-21],1)=""6""),""Clean"",""No"")"


End With

End Sub




Attribute VB_Name = "NCheckFormulas"
Sub NCodeCheck()

Dim LastNCRow As Long
LastNCRow = NCheck.Range("C1").CurrentRegion.Rows.Count

    NCheck.Range("D1").FormulaR1C1 = "Correct N Code"
    NCheck.Range("K1").FormulaR1C1 = "General N Code"
    NCheck.Range("K2:K" & LastNCRow).FormulaR1C1 = "=IFERROR(VLOOKUP(RC[-4],NCodes,2,FALSE),"""")"
    NCheck.Range("L1").FormulaR1C1 = "Albany"
    NCheck.Range("L2:L" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-5]=""Albany St"",RC[-5]=""Albany Street""),RC[-6]<=100),""604"",IF(AND(OR(RC[-5]=""Albany St"",RC[-5]=""Albany Street""),RC[-6]>=101),""605"","""")),"""")"
    NCheck.Range("M1").FormulaR1C1 = "Alewife"
    NCheck.Range("M2:M" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-6]= ""Alewife Brook Pkwy"",RC[-6]=""Alewife Brook Parkway""),RC[-7]<=185),""611"",IF(AND(OR(RC[-6]=""Alewife Brook Parkway"",RC[-6]=""Alewife Brook Pkwy""),RC[-7]>=186),""612"","""")),"""")"
    NCheck.Range("N1").FormulaR1C1 = "Alpine"
    NCheck.Range("N2:N" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-7]= ""Alpine St"",RC[-7]=""Alpine Street""),RC[-8]<=56),""610"",IF(AND(OR(RC[-7]=""Alpine St"",RC[-7]=""Alpine Street""),RC[-8]>=57),""609"","""")),"""")"
    NCheck.Range("O1").FormulaR1C1 = "Auburn"
    NCheck.Range("O2:O" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-8]= ""Auburn St"",RC[-8]=""Auburn Street""),RC[-9]<=211),""605"",IF(AND(OR(RC[-8]=""Auburn St"",RC[-8]=""Auburn Street""),RC[-9]>=212),""607"","""")),"""")"
    NCheck.Range("P1").FormulaR1C1 = "Binney"
    NCheck.Range("P2:P" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-9]= ""Binney St"",RC[-9]=""Binney Street""),RC[-10]<=345),""601"",IF(AND(OR(RC[-9]=""Binney St"",RC[-9]=""Binney Street""),RC[-10]>=346),""603"","""")),"""")"
    NCheck.Range("Q1").FormulaR1C1 = "Bishop Allen"
    NCheck.Range("Q2:Q" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-10]= ""Bishop Allen Dr"",RC[-10]=""Bishop Allen Drive"",RC[-10]= ""Bishop Richard Allen Dr"",RC[-10]=""Bishop Richard Allen Drive""),RC[-11]<=121),""604"",IF(AND(OR(RC[-10]=""Bishop Allen Dr"",RC[-10]=""Bishop Allen Drive"",RC[-10]= ""Bishop Richard Allen Dr"",RC[-10]=""Bishop Richard Allen Drive""),RC[-11]>=122),""606"","""")),"""")"
    NCheck.Range("R1").FormulaR1C1 = "Blanchard"
    NCheck.Range("R2:R" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-11]= ""Blanchard Rd"",RC[-11]=""Blanchard Road""),RC[-12]<=3),""613"",IF(AND(OR(RC[-11]=""Blanchard Rd"",RC[-11]=""Blanchard Road""),RC[-12]>=4),""612"","""")),"""")"
    NCheck.Range("S1").FormulaR1C1 = "Bristol"
    NCheck.Range("S2:S" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-12]= ""Bristol St"",RC[-12]=""Bristol Street""),RC[-13]<=74),""603"",IF(AND(OR(RC[-12]=""Bristol St"",RC[-12]=""Bristol Street""),RC[-13]>=75),""604"","""")),"""")"
    NCheck.Range("T1").FormulaR1C1 = "Broadway"
    NCheck.Range("T2:T" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(RC[-13]= ""Broadway"",RC[-14]<=143,MOD(RC[-14],2)<>0),""601"",IF(AND(RC[-13]= ""Broadway"",RC[-14]<=142,MOD(RC[-14],2)=0),""602"",IF(AND(RC[-13]= ""Broadway"",RC[-14]<=316,RC[-14]>=144),""604"",IF(AND(RC[-13]= ""Broadway"",RC[-14]>=317),""606"","""")))),"""")"
    NCheck.Range("U1").FormulaR1C1 = "Cambridge"
    NCheck.Range("U2:U" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-14]= ""Cambridge St"",RC[-14]=""Cambridge Street""),RC[-15]<=681),""601"",IF(AND(OR(RC[-14]=""Cambridge St"",RC[-14]=""Cambridge Street""),RC[-15]>=682,RC[-15]<=1385),""603"",IF(AND(OR(RC[-14]=""Cambridge St"",RC[-14]=""Cambridge Street""),RC[-15]>=1386),""606"",""""))),"""")"
    NCheck.Range("V1").FormulaR1C1 = "Chilton"
    NCheck.Range("V2:V" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-15]= ""Chilton St"",RC[-15]=""Chilton Street""),RC[-16]<=131),""610"",IF(AND(OR(RC[-15]=""Chilton St"",RC[-15]=""Chilton Street""),RC[-16]>=132),""609"","""")),"""")"
    NCheck.Range("W1").FormulaR1C1 = "Clark"
    NCheck.Range("W2:W" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-16]= ""Clark St"",RC[-16]=""Clark Street""),RC[-17]<=192),""604"",IF(AND(OR(RC[-16]=""Clark St"",RC[-16]=""Clark Street""),RC[-17]>=193),""603"","""")),"""")"
    NCheck.Range("X1").FormulaR1C1 = "Columbia"
    NCheck.Range("X2:X" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-17]= ""Columbia St"",RC[-17]=""Columbia Street""),RC[-18]<=278),""604"",IF(AND(OR(RC[-17]=""Columbia St"",RC[-17]=""Columbia Street""),RC[-18]>=279),""603"","""")),"""")"
    NCheck.Range("Y1").FormulaR1C1 = "Concord"
    NCheck.Range("Y2:Y" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-18]= ""Concord Ave"",RC[-18]=""Concord Avenue""),RC[-19]<=9),""609"",IF(AND(OR(RC[-18]= ""Concord Ave"",RC[-18]=""Concord Avenue""),RC[-19]<=506,RC[-19]>=10,MOD(RC[-19],2)=0),""610"",IF(AND(OR(RC[-18]= ""Concord Ave"",RC[-18]=""Concord Avenue""),RC[-19]<=505,RC[-19]>=11,MOD(RC[-19],2)<>0),""609"",IF(AND(OR(RC[-18]= ""Concord Ave"",RC[-18]=""Co" & _
        "ncord Avenue""),RC[-19]>=507),""612"","""")))),"""")" & _
        ""
    NCheck.Range("Z1").FormulaR1C1 = "Elm"
    NCheck.Range("Z2:Z" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-19]= ""Elm St"",RC[-19]=""Elm Street""),RC[-20]<=145,RC[-16]=2139),""604"",IF(AND(OR(RC[-19]= ""Elm St"",RC[-19]=""Elm Street""),RC[-20]>=146,RC[-16]=2139),""603"",IF(AND(OR(RC[-19]= ""Elm St"",RC[-19]=""Elm Street"",RC[-19]=""Elm St North"",RC[-19]=""Elm Street North"",RC[-19]=""Elm St N"",RC[-19]=""Elm Street N""),RC[-16]=2140),""611"",""""))),"""")"
    NCheck.Range("AA1").FormulaR1C1 = "Fayerweather"
    NCheck.Range("AA2:AA" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-20]= ""Fayerweather St"",RC[-20]=""Fayerweather Street""),RC[-21]<=145),""610"",IF(AND(OR(RC[-20]=""Fayerweather St"",RC[-20]=""Fayerweather Street""),RC[-21]>=146),""609"","""")),"""")"
    NCheck.Range("AB1").FormulaR1C1 = "Franklin"
    NCheck.Range("AB2:AB" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-21]= ""Franklin St"",RC[-21]=""Franklin Street""),RC[-22]<=287),""605"",IF(AND(OR(RC[-21]=""Franklin St"",RC[-21]=""Franklin Street""),RC[-22]>=288),""607"","""")),"""")"
    NCheck.Range("AC1").FormulaR1C1 = "Garden"
    NCheck.Range("AC2:AC" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-22]= ""Garden St"",RC[-22]=""Garden Street""),RC[-23]<=25,MOD(RC[-23],2)<>0),""609"",IF(AND(OR(RC[-22]= ""Garden St"",RC[-22]=""Garden Street""),RC[-23]<=26,MOD(RC[-23],2)=0),""610"",IF(AND(OR(RC[-22]= ""Garden St"",RC[-22]=""Garden Street""),RC[-23]>=27),""609"",""""))),"""")"
    NCheck.Range("AD1").FormulaR1C1 = "Green"
    NCheck.Range("AD2:AD" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-23]= ""Green St"",RC[-23]=""Green Street""),RC[-24]<=341),""605"",IF(AND(OR(RC[-23]=""Green St"",RC[-23]=""Green Street""),RC[-24]>=342),""607"","""")),"""")"
    NCheck.Range("AE1").FormulaR1C1 = "Hampshire"
    NCheck.Range("AE2:AE" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-24]= ""Hampshire St"",RC[-24]=""Hampshire Street""),RC[-25]<=176,MOD(RC[-25],2)=0),""604"",IF(AND(OR(RC[-24]= ""Hampshire St"",RC[-24]=""Hampshire Street""),RC[-25]>=178,MOD(RC[-25],2)=0),""606"",IF(AND(OR(RC[-24]= ""Hampshire St"",RC[-24]=""Hampshire Street""),MOD(RC[-25],2)<>0),""603"",""""))),"""")"
    NCheck.Range("AF1").FormulaR1C1 = "Hancock"
    NCheck.Range("AF2:AF" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-25]= ""Hancock St"",RC[-25]=""Hancock Street""),RC[-26]<=57),""607"",IF(AND(OR(RC[-25]=""Hancock St"",RC[-25]=""Hancock Street""),RC[-26]>=58),""606"","""")),"""")"
    NCheck.Range("AG1").FormulaR1C1 = "Harvard"
    NCheck.Range("AG2:AG" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-26]= ""Harvard St"",RC[-26]=""Harvard Street""),RC[-27]<=255),""604"",IF(AND(OR(RC[-26]=""Harvard St"",RC[-26]=""Harvard Street""),RC[-27]>=256),""606"","""")),"""")"
    NCheck.Range("AH1").FormulaR1C1 = "Huron"
    NCheck.Range("AH2:AH" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-27]= ""Huron Ave"",RC[-27]=""Huron Avenue""),RC[-28]<=159),""609"",IF(AND(OR(RC[-27]=""Huron Ave"",RC[-27]=""Huron Avenue""),RC[-28]>=160,RC[-28]<=595),""610"",IF(AND(OR(RC[-27]=""Huron Ave"",RC[-27]=""Huron Avenue""),RC[-28]>=596),""613"",""""))),"""")"
    NCheck.Range("AI1").FormulaR1C1 = "Irving"
    NCheck.Range("AI2:AI" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-28]= ""Irving St"",RC[-28]=""Irving Street""),RC[-29]<=59),""606"",IF(AND(OR(RC[-28]=""Irving St"",RC[-28]=""Irving Street""),RC[-29]>=60),""608"","""")),"""")"
    NCheck.Range("AJ1").FormulaR1C1 = "JFK"
    NCheck.Range("AJ2:AJ" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-29]= ""JFK St"",RC[-29]=""JFK Street"",RC[-29]=""John F Kennedy St"",RC[-29]=""John F Kennedy Street""),MOD(RC[-30],2)=0),""607"",IF(AND(OR(RC[-29]=""JFK St"",RC[-29]=""JFK Street"",RC[-29]=""John F Kennedy St"",RC[-29]=""John F Kennedy Street""),MOD(RC[-30],2)<>610),""608"","""")),"""")"
    NCheck.Range("AK1").FormulaR1C1 = "Kirkland"
    NCheck.Range("AK2:AK" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-30]= ""Kirkland St"",RC[-30]=""Kirkland Street""),MOD(RC[-31],2)<>610),""608"",IF(AND(OR(RC[-30]=""Kirkland St"",RC[-30]=""Kirkland Street""),MOD(RC[-31],2)=0),""606"","""")),"""")"
    NCheck.Range("AL1").FormulaR1C1 = "Main"
    NCheck.Range("AL2:AL" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-31]= ""Main St"",RC[-31]=""Main Street""),RC[-32]<=493),""602"",IF(AND(OR(RC[-31]=""Main St"",RC[-31]=""Main Street""),RC[-32]>=494),""604"","""")),"""")"
    NCheck.Range("AM1").FormulaR1C1 = "Mass Ave"
    NCheck.Range("AM2:AM" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),RC[-33]<=138),""602"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)<>0, RC[-33]>=139,RC[-33]<=655),""604"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""M" & _
        "assachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)=0,RC[-33]>=140,RC[-33]<=654),""605"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)=0,RC[-33]>=656,RC[-33]<=1400),""607"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-" & _
        "32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)<>0,RC[-33]>=657,RC[-33]<=1495),""606"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)=0,RC[-33]>=1402,RC[-33]<=1454),""610"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue""," & _
        "RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)=0,RC[-33]>=1456,RC[-33]<=1900),""609"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachusetts Avenue""),MOD(RC[-33],2)<>0,RC[-33]>=1497,RC[-33]<=1899),""608"",IF(AND(OR(RC[-32]= ""Mass Ave"",RC[-32]=""Massachusetts Ave"",RC[-32]=""Mass Avenue"",RC[-32]=""Massachus" & _
        "etts Avenue""),RC[-33]>=1901),""611"",""""))))))))),"""")" & _
        ""
    NCheck.Range("AN1").FormulaR1C1 = "Memorial"
    NCheck.Range("AN2:AN" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-33]= ""Memorial Dr"",RC[-33]=""Memorial Drive""),RC[-34]<=618),""602"",IF(AND(OR(RC[-33]=""Memorial Dr"",RC[-33]=""Memorial Drive""),RC[-34]>=619,RC[-34]<=816),""605"",IF(AND(OR(RC[-33]=""Memorial Dr"",RC[-33]=""Memorial Drive""),RC[-34]>=817,RC[-34]<=967),""607"",IF(AND(OR(RC[-33]=""Memorial Dr"",RC[-33]=""Memorial Drive""),RC[-34]>=968),""61" & _
        "0"","""")))),"""")" & _
        ""
    NCheck.Range("AO1").FormulaR1C1 = "Mt Auburn"
    NCheck.Range("AO2:AO" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-34]=""Mt Auburn St"",RC[-34]=""Mount Auburn St"",RC[-34]=""Mt Auburn Street"",RC[-34]=""Mount Auburn Street""),RC[-35]<=94),""607"",IF(AND(OR(RC[-34]= ""Mt Auburn St"",RC[-34]=""Mount Auburn St"",RC[-34]=""Mt Auburn Street"",RC[-34]=""Mount Auburn Street""),RC[-35]>=95),""610"","""")),"""")"
    NCheck.Range("AP1").FormulaR1C1 = "Norfolk"
    NCheck.Range("AP2:AP" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-35]= ""Norfolk St"",RC[-35]=""Norfolk Street""),RC[-36]<=272),""604"",IF(AND(OR(RC[-35]=""Norfolk St"",RC[-35]=""Norfolk Street""),RC[-36]>=273),""603"","""")),"""")"
    NCheck.Range("AQ1").FormulaR1C1 = "Pleasant"
    NCheck.Range("AQ2:AQ" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-36]= ""Pleasant St"",RC[-36]=""Pleasant Street""),RC[-35]<=41),""607"",IF(AND(OR(RC[-36]=""Pleasant St"",RC[-36]=""Pleasant Street""),RC[-35]>=42),""605"","""")),"""")"
    NCheck.Range("AR1").FormulaR1C1 = "Prospect"
    NCheck.Range("AR2:AR" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-37]= ""Prospect St"",RC[-37]=""Prospect Street""),RC[-38]<=279,MOD(RC[-38],2)<>0),""606"",IF(AND(OR(RC[-37]=""Prospect St"",RC[-37]=""Prospect Street""),RC[-38]<=278,MOD(RC[-38],2)=0),""604"",IF(AND(OR(RC[-37]=""Prospect St"",RC[-37]=""Prospect Street""),RC[-38]>=280),""603"",""""))),"""")"
    NCheck.Range("AS1").FormulaR1C1 = "Putnam"
    NCheck.Range("AS2:AS" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-38]= ""Putnam Ave"",RC[-38]=""Putnam Avenue""),RC[-39]<=280),""607"",IF(AND(OR(RC[-38]=""Putnam Ave"",RC[-38]=""Putnam Avenue""),RC[-39]>=281),""605"","""")),"""")"
    NCheck.Range("AT1").FormulaR1C1 = "River"
    NCheck.Range("AT2:AT" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-39]= ""River St"",RC[-39]=""River Street""),MOD(RC[-40],2)=0),""605"",IF(AND(OR(RC[-39]=""River St"",RC[-39]=""River Street""),MOD(RC[-40],2)<>0),""607"","""")),"""")"
    NCheck.Range("AU1").FormulaR1C1 = "Sherman"
    NCheck.Range("AU2:AU" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-40]= ""Sherman St"",RC[-40]=""Sherman Street""),RC[-41]<=137),""609"",IF(AND(OR(RC[-40]=""Sherman St"",RC[-40]=""Sherman Street""),RC[-41]>=138),""611"","""")),"""")"
    NCheck.Range("AV1").FormulaR1C1 = "Tremont"
    NCheck.Range("AV2:AV" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-41]= ""Tremont St"",RC[-41]=""Tremont Street""),RC[-42]<=49),""604"",IF(AND(OR(RC[-41]=""Tremont St"",RC[-41]=""Tremont Street""),RC[-42]>=50),""603"","""")),"""")"
    NCheck.Range("AW1").FormulaR1C1 = "Union"
    NCheck.Range("AW2:AW" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-42]= ""Union St"",RC[-42]=""Union Street""),RC[-43]<=15),""604"",IF(AND(OR(RC[-42]=""Union St"",RC[-42]=""Union Street""),RC[-43]>=16),""603"","""")),"""")"
    NCheck.Range("AX1").FormulaR1C1 = "Walden"
    NCheck.Range("AX2:AX" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-43]= ""Walden St"",RC[-43]=""Walden Street""),RC[-44]<=51),""611"",IF(AND(OR(RC[-43]=""Walden St"",RC[-43]=""Walden Street""),RC[-44]>=52,RC[-44]<=369),""609"",IF(AND(OR(RC[-43]=""Walden St"",RC[-43]=""Walden Street""),RC[-44]>=370),""610"",""""))),"""")"
    NCheck.Range("AY1").FormulaR1C1 = "Windsor"
    NCheck.Range("AY2:AY" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-44]= ""Windsor St"",RC[-44]=""Windsor Street""),RC[-45]<=307),""604"",IF(AND(OR(RC[-44]=""Windsor St"",RC[-44]=""Windsor Street""),RC[-45]>=308),""603"","""")),"""")"
    NCheck.Range("AZ1").FormulaR1C1 = "Winthrop"
    NCheck.Range("AZ2:AZ" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(AND(OR(RC[-45]= ""Winthrop St"",RC[-45]=""Winthrop Street""),RC[-46]<=79),""607"",IF(AND(OR(RC[-45]=""Winthrop St"",RC[-45]=""Winthrop Street""),RC[-46]>=80),""610"","""")),"""")"
    NCheck.Range("BA1").FormulaR1C1 = "Other MA"
    NCheck.Range("BA2:BA" & LastNCRow).FormulaR1C1 = "=IF(RC[-45]<>""Cambridge"",""0"","""")"
    
    NCheck.Range("D2:D" & LastNCRow).FormulaR1C1 = _
        "=CONCATENATE(RC[7],RC[8],RC[9],RC[10],RC[11],RC[12],RC[13],RC[14],RC[15],RC[16],RC[17],RC[18],RC[19],RC[20],RC[21],RC[22],RC[23],RC[24],RC[25],RC[26],RC[27],RC[28],RC[29],RC[30],RC[31],RC[32],RC[33],RC[34],RC[35],RC[36],RC[37],RC[38],RC[39],RC[40],RC[41],RC[42],RC[43],RC[44],RC[45],RC[46],RC[47],RC[48],RC[49])"
    NCheck.Range("E1").FormulaR1C1 = "N Code Error"
    NCheck.Range("E2:E" & LastNCRow).FormulaR1C1 = _
        "=IFERROR(IF(RC[-2]=VALUE(RC[-1]),""Ok"",""Error""),""No Code"")"
    
    
    NCheck.Columns("L:BA").EntireColumn.AutoFit
    NCheck.Rows("1:1").WrapText = True
        
    NCheck.Range("D1").Interior.Color = 12611584 'blue
    NCheck.Range("E1").Interior.Color = 255  'red
    NCheck.Range("K1:BA1").Interior.Color = 5287936 'green

    NCheck.Columns("A:A").ColumnWidth = 14.43
    NCheck.Columns("C:K").EntireColumn.AutoFit
        

End Sub





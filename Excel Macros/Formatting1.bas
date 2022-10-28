Attribute VB_Name = "Formatting1"
Sub Format()

AllData.Range("A1:P1").Interior.ThemeColor = xlThemeColorLight1
AllData.Range("A1:P1").Font.ThemeColor = xlThemeColorDark1

With AllData

    .Columns("A:A").NumberFormat = "0"
    .Range("A1").FormulaR1C1 = "Barcode"
    .Range("B1").FormulaR1C1 = "Name"
    .Range("C1").FormulaR1C1 = "Add 1"
    .Range("D1").FormulaR1C1 = "Add 2"
    .Range("E1").FormulaR1C1 = "MA Town"
    .Range("F1").FormulaR1C1 = "P Type"
    .Range("G1").FormulaR1C1 = "P Agency"
    .Range("H1").FormulaR1C1 = "Home Lib"
    .Range("I1").FormulaR1C1 = "Created Date"
    .Range("J1").FormulaR1C1 = "N Code"
    .Range("K1").FormulaR1C1 = "Decade"
    .Range("L1").FormulaR1C1 = "B Day"
    .Range("M1").FormulaR1C1 = "Tel 1"
    .Range("N1").FormulaR1C1 = "Tel 2"
    .Range("O1").FormulaR1C1 = "Email"
    .Range("P1").FormulaR1C1 = "Census"
    .Columns("I:I").EntireColumn.AutoFit
    .Columns("L:L").EntireColumn.AutoFit
    
End With
    
Application.Calculation = xlManual
Application.CalculateBeforeSave = False


End Sub




Attribute VB_Name = "Import"
Option Explicit

Sub OpenFile()

ChDrive "H:\"
    ChDir "H:\My Documents"

    Dim Ret
    
    Application.ScreenUpdating = False

    Ret = Application.GetOpenFilename("Text Files (*.txt), *.txt")

    If Ret <> False Then
        With AllData.QueryTables.Add(Connection:= _
        "TEXT;" & Ret, Destination:=AllData.Range("$A$1"))

        .Name = "Patron Data"
        .FieldNames = True
        .RowNumbers = False
        .FillAdjacentFormulas = False
        .AdjustColumnWidth = False
        .PreserveFormatting = True
        .RefreshOnFileOpen = False
        .RefreshStyle = xlInsertDeleteCells
        .SavePassword = False
        .SaveData = True
        .AdjustColumnWidth = False
        .RefreshPeriod = 0
        .TextFilePromptOnRefresh = False
        .TextFilePlatform = 437
        .TextFileStartRow = 1
        .TextFileParseType = xlDelimited
        .TextFileTextQualifier = xlTextQualifierDoubleQuote
        .TextFileConsecutiveDelimiter = False
        .TextFileTabDelimiter = False
        .TextFileSemicolonDelimiter = False
        .TextFileCommaDelimiter = False
        .TextFileSpaceDelimiter = False
        .TextFileOtherDelimiter = "^"
        .TextFileColumnDataTypes = Array(1, 1, 1, 1, 1, 1)
        .TextFileTrailingMinusNumbers = True
        .Refresh BackgroundQuery:=False

        End With
        
    End If

Call Format

Call CopyOver

Call GenForm

Call NameForm

Call AddForm

Call ConForm

Call Format2

Call AddSplit1
    
Call StSplit1

Call Format3

Call CopyStreets

Call TownCheckMacro

Call Format4

Call CopyNCode

Call NCodeCheck

End Sub






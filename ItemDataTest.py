import pandas as pd
import numpy as np
import re
import time
import datetime

#Read in Item data

startTime = time.perf_counter()

dfItems = pd.read_csv('ItemsFullDataMessage.txt', sep='^', encoding='utf8', dtype={'RECORD #(BIBLIO)': str, 'RECORD #(ITEM)': str, 'BARCODE': str, 'TITLE': str, \
                                             'AUTHOR': str, 'CALL #': str, 'ICODE1': int, 'ICODE2': str, 'I TYPE': int, 'LOCATION': str, 'STATUS': str, \
                                             'DUE DATE': str, 'MESSAGE(ITEM)': str, 'MAT TYPE': str, 'LANG': str, 'CREATED(ITEM)': str, 'PUB INFO': str, \
                                             'PRICE': str, 'OUT DATE': str, 'OUT LOC': int, 'LOUTDATE': str, 'LCHKIN': str, 'IN LOC': int, \
                                             'TOT CHKOUT': int, 'LYRCIRC': int, 'YTDCIRC': int, '# RENEWALS': int, 'TOT RENEW': int})


dfItems.rename(columns={"RECORD #(BIBLIO)": "BibRecord", "RECORD #(ITEM)": "ItemRecord", "BARCODE": "Barcode", "TITLE": "Title", "AUTHOR": "Author", \
                        "CALL #": "CallNumber", "ICODE1": "SCAT", "ICODE2": "ICode2", "I TYPE": "IType", "LOCATION": "Location", "STATUS": "Status", \
                        "DUE DATE": "DueDate", "MESSAGE(ITEM)": "Message", "MAT TYPE": "MatType", "LANG": "Language", "CREATED(ITEM)": "ItemCreatedDate", \
                        "PUB INFO": "PubInfo", "PRICE": "Price", "OUT DATE": "CheckoutDate", "OUT LOC": "CheckoutLocation", "LOUTDATE": "LastCheckoutDate", 
                        "LCHKIN": "LastCheckinDate", "IN LOC": "CheckinLocation", "TOT CHKOUT": "TotalCheckouts", "LYRCIRC": "LastYearCirc", \
                        "YTDCIRC": "YearToDateCirc", "# RENEWALS": "CurrentNumOfRenewals", "TOT RENEW": "TotalNumOfRenewals"}, inplace=True)


CallNumberList = dfItems['CallNumber'].tolist()
realSCAT = dfItems['SCAT'].tolist()
realICode2 = dfItems['ICode2'].tolist()
realIType = dfItems['IType'].tolist()

realLoc = dfItems['Location'].tolist()
realLoc = [w.rstrip() for w in realLoc]
dfItems['Location'] = realLoc

realMatType = dfItems['MatType'].tolist()
realMatType = [m.rstrip() for m in realMatType]
dfItems['MatType'] = realMatType

realLang = dfItems['Language'].tolist()

realCreatedDateList = dfItems['ItemCreatedDate'].tolist()
realPubList = dfItems['PubInfo'].tolist()

realMessage = dfItems['Message'].tolist()
realStatus = dfItems['Status'].tolist()
realStatus = [a.rstrip() for a in realStatus]
dfItems['Status'] = realStatus
realDueDate = dfItems['DueDate'].tolist()


# Clean up Price

dfItems['Price'] = dfItems['Price'].str.replace('$', '').astype(float)


# Get new status if checked out

newStatus = []

for z in range(len(realStatus)):
    if realStatus[z] == "-" and realDueDate[z] == "  -  -  ":
        newStatus.append("-")
    elif realStatus[z] == "-":
        newStatus.append("c")
    else:
        newStatus.append(realStatus[z])

dfItems['Status'] = newStatus

# REMEMBER TO ADJUST MONTH AND YEAR


pubYearList = []

yearRegEx = re.compile("\d{4}")

for p in realPubList:
    if yearRegEx.search(str(p)):
        result = [e for e in re.split("[^\d\d\d\d]", p) if e != '']
        if len(str(max(map(int, result)))) == 8:
            pubYearList.append(str(max(map(int, result)))[0:4])
        elif max(map(int, result)) >= 2022:
            pubYearList.append("Check")
        else:
            pubYearList.append(max(map(int, result)))
    else:
        pubYearList.append("")

dfItems['PubYear'] = pubYearList



# Mark items NEW or OLD (ADJUST MONTH AND YEAR)


newList = []

for d in range(len(realCreatedDateList)):
    dateList = realCreatedDateList[d].split("-")

    if (pubYearList[d] == 'Check' or pubYearList[d] == '') and ((int(dateList[2]) == 2019 and int(dateList[0]) >= 10) or int(dateList[2]) == 2020):
        newList.append("Check")
    elif (pubYearList[d] == 'Check' or pubYearList[d] == '') and ((int(dateList[2]) == 2019 and int(dateList[0]) <= 9) or int(dateList[2]) <= 2018):
        newList.append("Old")
    elif ((int(dateList[2]) == 2019 and int(dateList[0]) >= 10) and int(pubYearList[d]) == 2019) or int(pubYearList[d]) == 2020:
        newList.append("New")
    elif ((int(dateList[2]) == 2020 and int(dateList[0]) <= 2) and int(pubYearList[d]) == 2019):
        newList.append("New")
    else:
        newList.append("Old")


dfItems['NewBooks'] = newList


# Identify reg ex patterns for check against SCAT codes

patBarcode = re.compile("^31189\d{9}$")

patNonfiction = "^(\[Express\]\s)?(\[Black\sStudies\]\s)?(?!811|91|78)([1-9]\d)\d.*\s[\w,'\s\-]+$"

pat000_019 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?0(0|1)\d.*\s[\w,'\s\-]+$")
pat020_029 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?02\d.*\s[\w,'\s\-]+$")
pat030_039 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?03\d.*\s[\w,'\s\-]+$")
pat040_049 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?04\d.*\s[\w,'\s\-]+$")
pat050_059 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?05\d.*\s[\w,'\s\-]+$")
pat060_069 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?06\d.*\s[\w,'\s\-]+$")
pat070_079 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?07\d.*\s[\w,'\s\-]+$")
pat080_089 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?08\d.*\s[\w,'\s\-]+$")
pat090_099 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?09\d.*\s[\w,'\s\-]+$")

patCDB41 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s41\d.*\s[\w,'\s\-]+$")
patCDB42 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s42\d.*\s[\w,'\s\-]+$")
patCDB43 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s43\d.*\s[\w,'\s\-]+$")
patCDB44 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s44\d.*\s[\w,'\s\-]+$")
patCDB45 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s45\d.*\s[\w,'\s\-]+$")
patCDB46 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s46\d.*\s[\w,'\s\-]+$")
patCDB47 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s47\d.*\s[\w,'\s\-]+$")
patCDB48 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s48\d.*\s[\w,'\s\-]+$")
patCDB49 = re.compile("^(\[Express\]\s)?(CDB|DVD)\s49\d.*\s[\w,'\s\-]+$")

patCitizenship = re.compile("^\[Citizenship\]$")
patShortStories = re.compile("^(\[Express\]\s)?(FICTION|MYSTERY|SCI FIC)\sSHORT\sSTORIES\s[A-Za-z'\s]+")
patFiction = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?FICTION\s[A-Za-z,'\-\s]+")
patMystery = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?MYSTERY\s[A-Za-z,'\-\s]+")
patSciFic = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?SCI\sFIC\s[A-Za-z,'\-\s]+")
patManga = re.compile("^(\[Express\]\s)?MANGA\s(\d{3}.*\s)?[\w,'\-\s]+")
patGraphic = re.compile("^(\[Express\]\s)?GRAPHIC\s(\d{3}.*\s)?[\w,'\-\s]+")

patPoetryMain = re.compile("^(\[Express\]\s)?POETRY\s[\w,'\s\-]+")
pat811 = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?811.*\s[\w,'\s\-]+$")
patTest = re.compile("^(\[Express\]\s)?\[Test\]\s.*")
patTravel = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?91\d.*\s[\w,'\s\-]+$")
patGreatBoGoods = re.compile("^\[Great BoGoods\]\s.+")
patMusicScore = re.compile("^(\[Express\]\s)?(\[Black\sStudies\]\s)?78\d.*\s[\w,'\s\-]+$")
patCollege = re.compile("^(\[Express\]\s)?\[College\]\s\d{3}.+")
patMagazine = re.compile("^(MAGAZINE|NEWSPAPER)$")
patCareer = re.compile("^(\[Express\]\s)?\[Career\]\s\d{3}.+")

patPBfic = re.compile("^\[PB\]\s(FICTION|SCI FIC)\s[A-Z]$")
patPBurban = re.compile("^\[PB\]\sURBAN\s.*")
patPBmys = re.compile("^\[PB\]\sMYSTERY\s[A-Z]$")
patPBrom = re.compile("^\[PB\]\sROMANCE\s[A-Z]$")
patExpPB = re.compile("^\[EXPRESS\sPB\]\s[A-Z]$")
patLPfic = re.compile("^LP\s[A-Za-z][A-Za-z,'\s\-]+")
patLPnf = re.compile("^LP\s\d{3}.*\s[\w,'\s]+")

patLiteracy = re.compile("^(\[R\])?\[Literacy\].*", re.IGNORECASE)
patHIVE = re.compile("^HIVE\sEquipment$")

patPO = re.compile("^\[PO\]\s.*")
patSP = re.compile("^\[SP\]\s.*")
patCH = re.compile("^\[CH\]\s.*")
patFR = re.compile("^\[FR\]\s.*")
patHA = re.compile("^\[HA\]\s.*")

patRef = re.compile("^(R|\[R\])\s\d{3}.*")

patDVDfic = re.compile("^(\[Express View\]\s)?DVD\s[A-Z]{1,3}(?!\d{3}).*")
patDVDnf = re.compile("^(\[Express View\]\s)?DVD\s\d{3}.*\s[A-Z]{1,3}.*")
patBLUfic = re.compile("^(\[Express View\]\s)?BLU\s[A-Z]{1,3}.*")
patBLUnf = re.compile("^(\[Express View\]\s)?BLU\s\d{3}.*\s[A-Z]{1,3}.*")

patWatt = re.compile("^Kill\sA\sWatt\sMeter$")
patDatabase = re.compile("^(Online\sDatabase|Flipster\sOnline\sMagazine)$")
patMuseum = re.compile("^MUSEUM\sPASS$")

patCDBfic = re.compile("^CDB\s(FICTION|MYSTERY|SCI FIC)\s[A-Z][\w,']*")
patCDBnf = re.compile("^CDB\s(?!4)(\d{3}|POETRY).*\s.*")
patGreatCourses = re.compile("^\[Great\sCourses\]\s(CDB|DVD)\s.*")
patMP3 = re.compile("^MP3\s(FICTION|MYSTERY|SCI FIC|(?!4)\d{3}.*)\s[A-Z][\w,']*")
patBOP = re.compile("^BOP\s(FICTION|MYSTERY|SCI FIC|(?!4)\d{3}.*)\s[A-Z][\w,']*")
patMusic = re.compile("^CD\s(HOLIDAY|WORLD|CLASSICAL|BLUES|OPERA|ROCK|POP|POPULAR|JAZZ|COUNTRY|MUSICAL|SNDTRK|FOLK|BOX)\s.*")

patSteamKit = re.compile("^STEAM\sKits?$")
patAdLaunc = re.compile("^LAUNCHPAD$")
patAdeReader = re.compile("^(NoGood(?!\s\(Teen)|SRS\sNoGood|Cambridge\sKINDLE).*")
patYAeReader = re.compile("^NoGood\s\(Teen.*")

patYAnf = re.compile("^(YA\s\d{3}.*|YAB\s|YA\s\[POETRY\]\s)[A-Z].*")
patYAgraphic = re.compile("^YA\s(\[GRAPHIC\]|\[MANGA\])\s.*")
patYAfic = re.compile("^YA\s(\[Express\]\s)?(\[SHORT\sSTORIES\]\s)?[A-Z]{1,3}$")
patYAref = re.compile("^\[YAR\]\s.*")
patYAmag = re.compile("^YA\sMAGAZINE$")
patYAdvd = re.compile("^DVD\sYA\s([A-Z]{1,3}|\d{3}.*)$")
patYAcdb = re.compile("^(CDB|MP3)\sYA(B\s[A-Z][a-z]+|\s[A-Z]{1,3}|\s\d{3}.*|\sPOETRY\s.*)$")
patYAbop = re.compile("^BOP\sYA(B\s[A-Z][a-z]+|\s[A-Z]{1,3}|\s\d{3}.*|\sPOETRY\s.*)$")
patYAvg = re.compile("^YA\sVGame\s.*")
patYAlaunc = re.compile("^YA\sLAUNCHPAD$")

patJboard = re.compile("^(\[Express\]\s)?J\s\[Board\]$")
patJgraphic = re.compile("^(\[Express\]\s)?J\s\[(GRAPHIC|MANGA)\]\s.*")
patJpic = re.compile("^(\[Express\]\s)?J\s\[(Pop\sUp|Picture|Little)\]\s[A-Z]{1,3}$")
patJbeg = re.compile("^(\[Express\]\s)?J\s\[Beginning\]\s[A-Z]{1,3}$")
patJfic = re.compile("^(\[Express\]\s)?J\s\[(Caldecott|Newbery|Fiction|Series|SHORT\sSTORIES)\]\s[A-Z]{1,3}$")
patJpoetry = re.compile("^(\[Express\]\s)?J\s(POETRY|811.*)\s.*")
patJ398 = re.compile("^(\[Express\]\s)?(J\s398\.2|j398\.2).*")
patJholiday = re.compile("^(\[Express\]\s)?J\s\[Holiday\]\s[A-Z]{1,3}$")
patJref = re.compile("^\[jR\]\sj\d{3}.*[A-Z].*")
patJprof = re.compile("^J\s\[(Prof|PROF)\]\s.*")
patJparent = re.compile("^J\s\[P\/T\]\s\d{3}.*\s.*")
patJmag = re.compile("^J\sMAGAZINE$")
patJbop = re.compile("^BOP\s(Pack\s)?J\s([A-Z]{1,3}|\d{3}.*$)")
patJlaunc = re.compile("^J\sLAUNCHPAD$")
patJcd = re.compile("^CDB?\sJB?\s.*")
patJstory = re.compile("^J\s\[Story\sHour\sKit\].*")
patJblu = re.compile("^BLU\sJ\s([A-Z]{1,3}|\d{3}).*")
patJgame = re.compile("^J\sVGame\s.*")
patJdvd = re.compile("^DVD\sJ\s(\[[A-Z][A-Z]\]\s)?([A-Z]{1,3}|\d{3}).*")
patJ000_099 = re.compile("^(J\s0\d{2}|j0\d{2}).*")
patJ100_199 = re.compile("^(J\s1\d{2}|j1\d{2}).*")
patJ200_299 = re.compile("^(J\s2\d{2}|j2\d{2}).*")
patJ300_399 = re.compile("^(J\s3\d{2}|j3\d{2}).*")
patJ400_499 = re.compile("^(J\s4\d{2}|j4\d{2}).*")
patJ500_599 = re.compile("^(J\s5\d{2}|j5\d{2}).*")
patJ600_699 = re.compile("^(J\s6\d{2}|j6\d{2}).*")
patJ700_799 = re.compile("^(J\s7\d{2}|j7\d{2}).*")
patJ800_899 = re.compile("^(J\s8\d{2}|j8\d{2}).*")
patJ900_999 = re.compile("^(J\s9\d{2}|j9\d{2}).*")
patJbio = re.compile("^(\[Express\]\s)?JB\s[A-Z][\w\-\s']*")
patJecrc = re.compile("^ECRC\s(DVD\s)?(J\s|j\d{3}).*")
patJsp = re.compile("^JB?\s\[SP.*")
patJpo = re.compile("^JB?\s\[PO.*")
patJfr = re.compile("^JB?\s\[FR.*")
patJch = re.compile("^JB?\s\[CH.*")
patJvox = re.compile("^J\sRead\-Along\s.*")

patUnknown = re.compile(".*")


# Check call numbers against regex and return SCAT, Itype, and Mat.

LOOKUPS  = [
    [pat000_019, 1, '0 or 4', 'a'],
    [pat020_029, 2, '0 or 4', 'a'],
    [pat030_039, 3, '0 or 4', 'a'],
    [pat040_049, 4, '0 or 4', 'a'],
    [pat050_059, 5, '0 or 4', 'a'],
    [pat060_069, 6, '0 or 4', 'a'],
    [pat070_079, 7, '0 or 4', 'a'],
    [pat080_089, 8, '0 or 4', 'a'],
    [pat090_099, 9, '0 or 4', 'a'],
    [patCDB41, 41, '36 or 28', '4 or 5'],
    [patCDB42, 42, '36 or 28', '4 or 5'],
    [patCDB43, 43, '36 or 28', '4 or 5'],
    [patCDB44, 44, '36 or 28', '4 or 5'],
    [patCDB45, 45, '36 or 28', '4 or 5'],
    [patCDB46, 46, '36 or 28', '4 or 5'],
    [patCDB47, 47, '36 or 28', '4 or 5'],
    [patCDB48, 48, '36 or 28', '4 or 5'],
    [patCDB49, 49, '36 or 28', '4 or 5'],
    [patCitizenship, 100, 0, 'a, 5, k'],
    [patShortStories, 106, '0 or 4', 'a'],
    [patFiction, 101, '0 or 4', 'a'],
    [patMystery, 102, '0 or 4', 'a'],
    [patSciFic, 103, '0 or 4', 'a'],
    [patManga, 107, 0, 'a'],
    [patGraphic, 108, 0, 'a'],
    [patPoetryMain, 109, '0 or 4', 'a'],
    [pat811, '81 or 109', '0 or 4', 'a'],
    [patTest, 113, '0 or 28', 'a'],
    [patTravel, '91 or 114', '0 or 4', 'a or e'],
    [patGreatBoGoods, 115, 7, 'a'],
    [patMusicScore, '78 or 116', '0, 4 or 12', 'a or c'],
    [patCollege, 117, 0, 'a'],
    [patMagazine, 118, 10, 3],
    [patCareer, 119, 0, 'a'],
    [patPBfic, 121, 1, 'a'],
    [patPBurban, 121, 1, 'a'],
    [patPBmys, 122, 1, 'a'],
    [patPBrom, 124, 1, 'a'],
    [patExpPB, 127, 4, 'a'],
    [patLPfic, 128, 2, '2'],
    [patLPnf, 129, 2, '2'],
    [patLiteracy, 130, 9, 'LIT'],
    [patPO, 131, '0 or 36', 'LANG'],
    [patSP, 132, '0 or 36', 'LANG'],
    [patCH, '133 or 140', '0 or 36', 'LANG'],
    [patFR, 134, '0 or 36', 'LANG'],
    [patHA, 135, '0 or 36', 'LANG'],
    [patRef, 139, 3, 'a'],
    [patJdvd, 249, '167 or 168', 5],
    [patJblu, 247, '167 or 168', 'u'],
    [patJcd, 244, '157, 171, 173', '4 or j'],
    [patJbop, 242, 180, 'z'],
    [patYAdvd, 220, '117 or 118', 5],
    [patYAcdb, 223, 125, 4],
    [patYAbop, 224, 130, 'z'],
    [patDVDfic, 143, '20, 21, 27', 5],
    [patDVDnf, 148, '28 or 21', 5],
    [patBLUfic, 144, '20, 21, 27', 'u'],
    [patBLUnf, 149, 28, 'u'],
    [patCDBfic, 175, 36, 4],
    [patCDBnf, 177, 36, 4],
    [patHIVE, 169, 3, 'q'],
    [patGreatCourses, 177, 36, '4 or 5'],
    [patMP3, 178, 36, '4'],
    [patBOP, 179, 50, 'z'],
    [patMusic, 222, 33, 'j'],
    [patAdLaunc, 182, 253, 'v'],
    [patWatt, 184, 252, 'r'],
    [patSteamKit, 186, 252, 'r'],
    [patDatabase, 195, 244, 'b or y'],
    [patYAeReader, 204, 131, 'v'],
    [patAdeReader, 202, 51, 'v'],
    [patMuseum, 205, 243, 'r'],
    [patYAnf, 210, '100 or 101', 'a'],
    [patYAgraphic, 211, '100 or 101', 'a'],
    [patYAfic, 212, '100 or 101', 'a'],
    [patYAref, 216, 103, 'a'],
    [patYAmag, 219, 107, 3],
    [patYAvg, 226, 129, 'n'],
    [patYAlaunc, 227, 131, 'v'],
    [patJboard, 228, 150, 'a'],
    [patJgraphic, 229, '150, 151 or 160', 'a'],
    [patJpic, 230, '150, 151 or 160', 'a'],
    [patJbeg, 231, '150, 151 or 160', 'a'],
    [patJfic, 232, '150, 151 or 160', 'a'],
    [patJpoetry, 234, '150, 151 or 160', 'a'],
    [patJ398, 236, '150, 151 or 160', 'a'],
    [patJholiday, 237, '150, 151 or 160', 'a'],
    [patJref, 238, 154, 'a'],
    [patJprof, 239, 154, 'a'],
    [patJparent, 240, '150, 151 or 160', 'a'],
    [patJmag, 241, 158, 3],
    [patJlaunc, 243, 181, 'v'],
    [patJstory, 246, 176, 'o or a'],
    [patJgame, 248, 178, 'n'],
    [patJ000_099, 250, '150, 151 or 160', 'a'],
    [patJ100_199, 251, '150, 151 or 160', 'a'],
    [patJ200_299, 252, '150, 151 or 160', 'a'],
    [patJ300_399, 253, '150, 151 or 160', 'a'],
    [patJ400_499, 254, '150, 151 or 160', 'a'],
    [patJ500_599, 255, '150, 151 or 160', 'a'],
    [patJ600_699, 256, '150, 151 or 160', 'a'],
    [patJ700_799, 257, '150, 151 or 160', 'a'],
    [patJ800_899, 258, '150, 151 or 160', 'a'],
    [patJ900_999, 259, '150, 151 or 160', 'a'],
    [patJbio, 260, '150, 151 or 160', 'a'],
    [patJecrc, 261, 'ECRC', 'a, g, 5'],
    [patJsp, 262, '150, 151 or 160', 'a'],
    [patJpo, 263, '150, 151 or 160', 'a'],
    [patJfr, 264, '150, 151 or 160', 'a'],
    [patJch, '265 or 140', '150, 151 or 160', 'a'],
    [patJvox, 266, 150, 'a'],
    [patUnknown, 'Unknown', 'Unknown', 'Unknown']
]

def lookup(s, lookups):
    for pattern, SCAT, IType, Mat in lookups:
        if re.search(pattern, s):
            return [SCAT, IType, Mat]
    return None


suggestedSCAT = []
suggestedIType = []
suggestedMat = []

for x in CallNumberList:
    if re.match(patNonfiction, str(x)):
        suggestedSCAT.append(re.search(patNonfiction, str(x)).group(3))
        suggestedIType.append('0 or 4')
        suggestedMat.append('a')
    else :
        lookupList = lookup(str(x), LOOKUPS)
        suggestedSCAT.append(lookupList[0])
        suggestedIType.append(lookupList[1])
        suggestedMat.append(lookupList[2])



dfItems['SuggestedSCAT'] = suggestedSCAT
dfItems['SuggestedIType'] = suggestedIType
dfItems['SuggestedMat'] = suggestedMat



# Checks barcode for 31189 beginning and 14 digits total, then adds new column with results.

dfItems['BarcodeCheck'] = np.where(dfItems.Barcode.str.match(patBarcode), "Good", "Bad")

# Get bad SCATs/Call Numbers

SCATcomp = []

for i in range(len(suggestedSCAT)):
    try:
        if suggestedSCAT[i] == 'Unknown':
            SCATcomp.append('Bad')
        elif suggestedSCAT[i] == '81 or 109' and (realSCAT[i] == 81 or realSCAT[i] == 109):
            SCATcomp.append('Good')
        elif suggestedSCAT[i] == '91 or 114' and (realSCAT[i] == 91 or realSCAT[i] == 114):
            SCATcomp.append('Good')
        elif suggestedSCAT[i] == '78 or 116' and (realSCAT[i] == 78 or realSCAT[i] == 116):
            SCATcomp.append('Good')
        elif suggestedSCAT[i] == '133 or 140' and (realSCAT[i] == 133 or realSCAT[i] == 140):
            SCATcomp.append('Good')
        elif suggestedSCAT[i] == '165 or 185' and (realSCAT[i] == 165 or realSCAT[i] == 185):
            SCATcomp.append('Good')
        elif suggestedSCAT[i] == '265 or 140' and (realSCAT[i] == 265 or realSCAT[i] == 140):
            SCATcomp.append('Good')
        elif (int(suggestedSCAT[i]) >= 1 and  int(suggestedSCAT[i]) <= 99) and (realSCAT[i] == int(suggestedSCAT[i]) or realSCAT[i] == 261):
            SCATcomp.append('Good')
        elif realSCAT[i] == int(suggestedSCAT[i]):
            SCATcomp.append('Good')
        else:
            SCATcomp.append('Bad')
    except:
        SCATcomp.append('Bad')

dfItems['SCATcheck'] = SCATcomp


# Get bad ITypes

itypeComp = []

for t in range(len(suggestedIType)):
    try:
        if suggestedIType[t] == 'Unknown':
            itypeComp.append('Bad')
        elif (realLoc[t] == 'ca3a' or realLoc[t] == 'ca3al') and realIType[t] == 6:
            itypeComp.append('Good')
        elif re.match('^\[E.*', str(CallNumberList[t])) and realSCAT[t] == 114 and realIType[t] == 4:
            itypeComp.append('Good')
        elif (realSCAT[t] >= 40 and realSCAT[t] <= 49) and realIType[t] == 0:
            itypeComp.append('Good')    
        elif suggestedIType[t] == '0 or 4' and newList[t] == 'New' and realIType[t] == 4:
            itypeComp.append('Good')
        elif suggestedIType[t] == '0 or 4' and newList[t] == 'Old' and realIType[t] == 0:
            itypeComp.append('Good')    
        elif suggestedIType[t] == '0, 4 or 12' and newList[t] == 'New' and realIType[t] == 4:
            itypeComp.append('Good')
        elif suggestedIType[t] == '0, 4 or 12' and newList[t] == 'Old' and realIType[t] == 0:
            itypeComp.append('Good')       
        elif suggestedIType[t] == '0, 4 or 12' and realIType[t] == 12:
            itypeComp.append('Good')  
        elif suggestedIType[t] == '36 or 28' and re.match('^DVD.*', str(CallNumberList[t])) and realIType[t] == 28:
            itypeComp.append('Good')
        elif suggestedIType[t] == '36 or 28' and realIType[t] == 36:
            itypeComp.append('Good')
        elif suggestedIType[t] == '167 or 168' and re.match('.*\d\d\d.*', str(CallNumberList[t])) and realIType[t] == 168:
            itypeComp.append('Good')
        elif suggestedIType[t] == '167 or 168' and realIType[t] == 167:
            itypeComp.append('Good')
        elif suggestedIType[t] == '157, 171, 173' and re.match('.*CDB.*', str(CallNumberList[t])) and realMatType[t] == 9 and realIType[t] == 157:
            itypeComp.append('Good')    
        elif suggestedIType[t] == '157, 171, 173' and re.match('.*CDB.*', str(CallNumberList[t])) and realIType[t] == 173:
            itypeComp.append('Good')
        elif suggestedIType[t] == '157, 171, 173' and realIType[t] == 171:
            itypeComp.append('Good')
        elif suggestedIType[t] == '28 or 21' and re.match('^\[E.*', str(CallNumberList[t])) and realIType[t] == 21:
            itypeComp.append('Good')
        elif suggestedIType[t] == '28 or 21' and realIType[t] == 28:
            itypeComp.append('Good')
        elif suggestedIType[t] == '20, 21, 27' and re.match('^\[E.*', str(CallNumberList[t])) and realIType[t] == 21:
            itypeComp.append('Good')
        elif suggestedIType[t] == '20, 21, 27' and (realIType[t] == 20 or realIType[t] == 27):
            itypeComp.append('Good')
        elif suggestedIType[t] == '0 or 36' and re.match('.*CDB.*', str(CallNumberList[t])) and realIType[t] == 36:
            itypeComp.append('Good')    
        elif suggestedIType[t] == '0 or 36' and realIType[t] == 0:
            itypeComp.append('Good')   
        elif suggestedIType[t] == '0 or 28' and re.match('.*DVD.*', str(CallNumberList[t])) and realIType[t] == 28:
            itypeComp.append('Good')    
        elif suggestedIType[t] == '0 or 28' and realIType[t] == 0:
            itypeComp.append('Good') 
        elif suggestedIType[t] == '100 or 101' and (realIType[t] == 100 or realIType[t] == 101):
            itypeComp.append('Good')
        elif suggestedIType[t] == '150, 151 or 160' and re.match('^\[E.*', str(CallNumberList[t])) and realIType[t] == 160:
            itypeComp.append('Good')
        elif suggestedIType[t] == '150, 151 or 160' and (realIType[t] == 150 or realIType[t] == 151):
            itypeComp.append('Good')
        elif suggestedIType[t] == 'ECRC' and re.match('.*VHS.*', str(CallNumberList[t])) and realIType[t] == 166:
            itypeComp.append('Good')
        elif suggestedIType[t] == 'ECRC' and re.match('.*DVD.*', str(CallNumberList[t])) and realIType[t] == 168:
            itypeComp.append('Good')
        elif suggestedIType[t] == 'ECRC' and re.match('.*CDB.*', str(CallNumberList[t])) and (realIType[t] == 157 or realIType[t] == 173):
            itypeComp.append('Good')
        elif suggestedIType[t] == 'ECRC' and re.match('^ECRC.*', str(CallNumberList[t])) and (realIType[t] == 150 or realIType[t] == 151):
            itypeComp.append('Good')
        elif suggestedIType[t] == 'ECRC' and realIType[t] == 0:
            itypeComp.append('Good')
        elif suggestedIType[t] == realIType[t]:
            itypeComp.append('Good')
        else:
            itypeComp.append('Bad')
    except:
        itypeComp.append('Bad')


dfItems['ITYPEcheck'] = itypeComp

# Check Mat Type.

matComp = []

for m in range(len(suggestedMat)):
    try:
        if suggestedMat[m] == 'Unknown':
            matComp.append('Bad')
        elif suggestedMat[m] == 'a, 5, k' and (realMatType[m] == 'a' or realMatType[m] == '5' or realMatType[m] == 'k'):
            matComp.append('Good')
        elif suggestedMat[m] == 'a or e' and (realMatType[m] == 'a' or realMatType[m] == 'e'):
            matComp.append('Good')
        elif suggestedMat[m] == 'a or c' and (realMatType[m] == 'a' or realMatType[m] == 'c'):
            matComp.append('Good')
        elif suggestedMat[m] == 'LIT' and re.match('.*CDB.*', str(CallNumberList[m])) and realMatType[m] == '4':
            matComp.append('Good')
        elif suggestedMat[m] == 'LIT' and re.match('.*DVD.*', str(CallNumberList[m])) and realMatType[m] == '5':
            matComp.append('Good')
        elif suggestedMat[m] == 'LIT' and re.match('.*BOP.*', str(CallNumberList[m])) and realMatType[m] == 'z':
            matComp.append('Good')
        elif suggestedMat[m] == 'LIT' and re.match('.*LAUNCHPAD.*', str(CallNumberList[m])) and realMatType[m] == 'v':
            matComp.append('Good')
        elif suggestedMat[m] == 'LIT' and realMatType[m] == 'a':
            matComp.append('Good')
        elif suggestedMat[m] == 'LANG' and re.match('.*CDB.*', str(CallNumberList[m])) and realMatType[m] == '4':
            matComp.append('Good')
        elif suggestedMat[m] == 'LANG' and re.match('.*BOP.*', str(CallNumberList[m])) and realMatType[m] == 'z':
            matComp.append('Good')
        elif suggestedMat[m] == 'LANG' and re.match('.*78/d.*', str(CallNumberList[m])) and (realMatType[m] == 'c'or realMatType[m] == 'a'):
            matComp.append('Good')
        elif suggestedMat[m] == 'LANG' and realMatType[m] == 'a':
            matComp.append('Good')
        elif suggestedMat[m] == '4 or j' and re.match('.*CDB.*', str(CallNumberList[m])) and realMatType[m] == '4':
            matComp.append('Good')
        elif suggestedMat[m] == '4 or j' and realMatType[m] == 'j':
            matComp.append('Good')
        elif suggestedMat[m] == '4 or 5' and re.match('.*CDB.*', str(CallNumberList[m])) and realMatType[m] == '4':
            matComp.append('Good')
        elif suggestedMat[m] == '4 or 5' and re.match('.*DVD.*', str(CallNumberList[m])) and realMatType[m] == '5':
            matComp.append('Good')
        elif suggestedMat[m] == 'b or y' and (realMatType[m] == 'b' or realMatType[m] == 'y'):
            matComp.append('Good')
        elif suggestedMat[m] == 'a, g, 5' and re.match('.*VHS.*', str(CallNumberList[m])) and realMatType[m] == 'g':
            matComp.append('Good')
        elif suggestedMat[m] == 'a, g, 5' and re.match('.*DVD.*', str(CallNumberList[m])) and realMatType[m] == '5':
            matComp.append('Good')
        elif suggestedMat[m] == 'a, g, 5' and realMatType[m] == 'a':
            matComp.append('Good')
        elif str(suggestedMat[m]) == realMatType[m]:
            matComp.append('Good')
        else:
            matComp.append('Bad')
    except:
        matComp.append('Bad')


dfItems['MATcheck'] = matComp



# ICode2 check

ic2Comp = []

for c in range(len(suggestedMat)):
    if (realIType[c] == 6 or realIType[c] == 7) and realICode2[c] != 'n':
        ic2Comp.append('Bad')
    elif (realIType[c] != 6 and realIType[c] != 7) and realICode2[c] == 'n':
        ic2Comp.append('Bad')
    elif realICode2[c] == ' ':
        ic2Comp.append('Bad')
    else:
        ic2Comp.append('Good')

dfItems['ICODE2check'] = ic2Comp


# Lang check

LangComp = []

for l in range(len(suggestedMat)):
    if realSCAT[l] == 131 and realLang[l] != 'por':
        LangComp.append('Bad')
    elif realSCAT[l] == 132 and realLang[l] != 'spa':
        LangComp.append('Bad')
    elif realSCAT[l] == 133 and realLang[l] != 'chi':
        LangComp.append('Bad')
    elif realSCAT[l] == 134 and realLang[l] != 'fre':
        LangComp.append('Bad')
    elif realSCAT[l] == 135 and realLang[l] != 'hat':
        LangComp.append('Bad')
    elif realSCAT[l] == 262 and realLang[l] != 'spa':
        LangComp.append('Bad')
    elif realSCAT[l] == 263 and realLang[l] != 'por':
        LangComp.append('Bad')
    elif realSCAT[l] == 264 and realLang[l] != 'fre':
        LangComp.append('Bad')
    elif realSCAT[l] == 265 and realLang[l] != 'chi':
        LangComp.append('Bad')
    else:
        LangComp.append('Good')



dfItems['LANGcheck'] = LangComp


# Check locations based on real SCAT.

locCheckList = []

for s in range(len(suggestedMat)):
    try:
        if ((realSCAT[s] >= 40 and realSCAT[s] <= 49) or (realSCAT[s] >= 131 and realSCAT[s] <= 135)) and re.match(".*(CDB|DVD|BOP).*", str(CallNumberList[s])) \
            and (realLoc[s] == 'camn' or realLoc[s] == 'ca4n' or realLoc[s] == 'ca5n' or realLoc[s] == 'ca6n' or realLoc[s] == 'ca7n' or realLoc[s] == 'ca8n' or realLoc[s] == 'ca9n'):
            locCheckList.append('Good')
        elif (realSCAT[s] <= 99 or realSCAT[s] == 101 or realSCAT[s] == 102 or realSCAT[s] == 103 or realSCAT[s] == 106 or realSCAT[s] == 109) \
            and newList[s] == 'New' \
            and (realLoc[s] == 'caman' or realLoc[s] == 'ca3a' or realLoc[s] == 'ca4a' or realLoc[s] == 'ca5a' or realLoc[s] == 'ca6a' or realLoc[s] == 'ca7a' or realLoc[s] == 'ca8a' or realLoc[s] == 'ca9a'):
            locCheckList.append('Good')
        elif (realSCAT[s] <= 99 or realSCAT[s] == 101 or realSCAT[s] == 102 or realSCAT[s] == 103 or realSCAT[s] == 106 or realSCAT[s] == 109) \
            and newList[s] == 'Old' \
            and (realLoc[s] == 'cama' or realLoc[s] == 'ca3a' or realLoc[s] == 'ca4a' or realLoc[s] == 'ca5a' or realLoc[s] == 'ca6a' or realLoc[s] == 'ca7a' or realLoc[s] == 'ca8a' or realLoc[s] == 'ca9a'):
            locCheckList.append('Good')
        elif realSCAT[s] == 100 and realLoc[s] == 'ca5a':
            locCheckList.append('Good')
        elif (realSCAT[s] == 107 or realSCAT[s] == 108 or (realSCAT[s] >= 111 and realSCAT[s] <= 119) or (realSCAT[s] >= 131 and realSCAT[s] <= 135) or realSCAT[s] == 183  or realSCAT[s] == 205) \
            and (realLoc[s] == 'cama' or realLoc[s] == 'ca3a' or realLoc[s] == 'ca4a' or realLoc[s] == 'ca5a' or realLoc[s] == 'ca6a' or realLoc[s] == 'ca7a' or realLoc[s] == 'ca8a' or realLoc[s] == 'ca9a'):
            locCheckList.append('Good')
        elif (realSCAT[s] >= 121 and realSCAT[s] <= 124) and (realLoc[s] == 'camap' or realLoc[s] == 'ca5ap'):
            locCheckList.append('Good')
        elif realSCAT[s] == 127 and realLoc[s] == 'camas':
            locCheckList.append('Good')
        elif (realSCAT[s] == 128 or realSCAT[s] == 129) and (realLoc[s] == 'camal' or realLoc[s] == 'ca3al' or realLoc[s] == 'ca5al' or realLoc[s] == 'ca8al' or realLoc[s] == 'ca9al'):
            locCheckList.append('Good')
        elif realSCAT[s] == 130 and (realLoc[s] == 'camae' or realLoc[s] == 'ca5ae' or realLoc[s] == 'ca8ae'):
            locCheckList.append('Good')
        elif (realSCAT[s] == 139 or realSCAT[s] == 169 or realSCAT[s] == 195) and realLoc[s][3] == 'r':
            locCheckList.append('Good')
        elif realSCAT[s] == 140 and (realLoc[s] == 'cama' or realLoc[s] == 'camj'):
            locCheckList.append('Good')
        elif realSCAT[s] == 141 and realLoc[s] == 'camc':
            locCheckList.append('Good')
        elif ((realSCAT[s] >= 143 and realSCAT[s] <= 149) or (realSCAT[s] >= 175 and realSCAT[s] <= 179) or realSCAT[s] == 182 or realSCAT[s] == 222) \
            and (realLoc[s] == 'camn' or realLoc[s] == 'ca4n' or realLoc[s] == 'ca5n' or realLoc[s] == 'ca6n' or realLoc[s] == 'ca7n' or realLoc[s] == 'ca8n' or realLoc[s] == 'ca9n'):
            locCheckList.append('Good')
        elif ((realSCAT[s] >= 165 and realSCAT[s] <= 168) or (realSCAT[s] >= 184 and realSCAT[s] <= 186) or (realSCAT[s] >= 202 and realSCAT[s] <= 204) or realSCAT[s] == 180 or realSCAT[s] == 181) and realLoc[s][4] == 'n':
            locCheckList.append('Good')
        elif realSCAT[s] == 209 and (realLoc[s] == 'cama' or realLoc[s] == 'camy'):
            locCheckList.append('Good')
        elif (realSCAT[s] >= 210 and realSCAT[s] <= 227) and realLoc[s][3] == 'y':
            locCheckList.append('Good')
        elif realSCAT[s] == 239 and realLoc[s][4] == 'r':
            locCheckList.append('Good')
        elif realSCAT[s] == 240 and realLoc[s][4] == 't':
            locCheckList.append('Good')
        elif realSCAT[s] == 261 and (realLoc[s] == 'cama' or realLoc[s] == 'camj' or realLoc[s][4] == 't'):
            locCheckList.append('Good')
        elif realSCAT[s] >= 228 and realLoc[s][3] == 'j':
            locCheckList.append('Good')
        else:
            locCheckList.append('Bad')
    except:
        locCheckList.append('Bad')


dfItems['LOCcheck'] = locCheckList


# Prep transit table

transitDateTime = []
transitTo = []
trasitFrom = []
transitHold = []

patTransit = re.compile('(.*;")?(.*):\sIN\sTRANSIT\sfrom\s(\w\w\w).*\sto\s(\w\w\w)(\w)')

for y in realMessage:
    if re.match(patTransit, str(y)):
        transitDateTime.append(re.search(patTransit, str(y)).group(2))
        transitTo.append(re.search(patTransit, str(y)).group(4))
        trasitFrom.append(re.search(patTransit, str(y)).group(3))
        if re.search(patTransit, str(y)).group(5) == 'z':
            transitHold.append("Yes")
        else:
            transitHold.append("No")
    else :
        transitDateTime.append("")
        transitTo.append("")
        trasitFrom.append("")
        transitHold.append("")

transitDate = []
transitTime = []

for u in transitDateTime:
    if u != '':
        datetimeobj = datetime.datetime.strptime(u, '%a %b %d %Y %I:%M%p')
        transitDate.append(datetimeobj.date())
        transitTime.append(datetimeobj.time())
    else:
        transitDate.append('')
        transitTime.append('')

dfItems['TransitDate'] = transitDate
dfItems['TransitTime'] = transitTime
dfItems['TransitTo'] = transitTo
dfItems['TransitFrom'] = trasitFrom
dfItems['TransitHold'] = transitHold


# Write Transit Table to csv

dfTransit = dfItems.loc[((dfItems['Status'] == 't') & (dfItems['BarcodeCheck'] == 'Good') & (dfItems['SCATcheck'] == 'Good') & (dfItems['ITYPEcheck'] == 'Good') & (dfItems['MATcheck'] == 'Good') & (dfItems['ICODE2check'] == 'Good') & (dfItems['LANGcheck'] == 'Good') & (dfItems['LOCcheck'] == 'Good'))]
transitHeader = ["ItemRecord", "TransitDate", "TransitTime", "TransitTo", "TransitFrom", "TransitHold"]
dfTransit.to_csv('outtransit.txt', columns = transitHeader, sep='^', index=False)



# Get clean and dirty data and write to csv


dfDirty = dfItems.loc[((dfItems['BarcodeCheck'] == 'Bad') | (dfItems['SCATcheck'] == 'Bad') | (dfItems['ITYPEcheck'] == 'Bad') | (dfItems['MATcheck'] == 'Bad') | (dfItems['ICODE2check'] == 'Bad') | (dfItems['LANGcheck'] == 'Bad') | (dfItems['LOCcheck'] == 'Bad'))]
dirtyHeader = ["ItemRecord", "Barcode", "CallNumber", "SCAT", "ICode2", "IType", "Location", "MatType", "Language", "ItemCreatedDate", "PubInfo", "PubYear", "NewBooks", "SuggestedSCAT", "SuggestedIType", "SuggestedMat", "BarcodeCheck", "SCATcheck", "ITYPEcheck", "MATcheck", "ICODE2check", "LANGcheck", "LOCcheck" ]


dfClean = dfItems.loc[((dfItems['BarcodeCheck'] == 'Good') & (dfItems['SCATcheck'] == 'Good') & (dfItems['ITYPEcheck'] == 'Good') & (dfItems['MATcheck'] == 'Good') & (dfItems['ICODE2check'] == 'Good') & (dfItems['LANGcheck'] == 'Good') & (dfItems['LOCcheck'] == 'Good'))]
cleanHeader = ["BibRecord", "ItemRecord", "Title", "Author", "SCAT", "ICode2", "IType", "Location", "Status", "MatType", "Language", "ItemCreatedDate", "PubYear", "Price", "TotalCheckouts", "LastYearCirc", "YearToDateCirc", "CurrentNumOfRenewals", "TotalNumOfRenewals"]


cociHeader = ["ItemRecord", "Location", "CheckoutDate", "CheckoutLocation", "LastCheckoutDate", "LastCheckinDate", "CheckinLocation"]
dfClean.to_csv('outcoci.txt', columns = cociHeader, sep='^', index=False)


# Writes dataframe to new document.

endTime = time.perf_counter()
print(f"Process took {endTime - startTime:0.4f} seconds")

dfDirty.to_csv('outdirty.txt', columns = dirtyHeader, sep='^', index=False)
dfClean.to_csv('outclean.txt', columns = cleanHeader, sep='^', index=False)

#dfItems.to_csv('outfull.txt', sep='^', index=False)

# Dieses Script liest eine CSV-Datendatei in GNU R ein.
# Beim Einlesen werden für alle Variablen Beschriftungen (comment) angelegt.
# Die Beschriftungen für Werte wird ebenfalls als Attribute (attr) abgelegt.

Testdaten_file = file.choose()
# setwd("./")
# Testdaten_file = "rdata_ERN_SOC_2019-07-25_15-17.csv"

Testdaten = read.table(
  file=Testdaten_file, encoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = "CASE",
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","SD01","SD02_01","SD02_02",
    "SD02_03","SD02_04","SD02_05","SD02_06","SD02_07","SD02_08","SD02_09","SD02_10",
    "SD02_11","SD02_12","SD02_13","SD07","SD08_01","SD09_01","SD22","BD02","BD03",
    "BD04","BD05","BD06","BD07","BD08","BD09","BD10","BD11","BD12","BD13","BD14",
    "BD15","BD16","BD17","BD18","BD19","BD20","BD21","BD22","SP02_01","SP02_02",
    "SP02_03","SP02_04","SP02_05","SP02_06","SP02_07","SP02_08","SP02_09","SP02_10",
    "SP02_11","SP02_12","SP02_13","SP02_14","SP02_15","SP02_16","SP02_17","SP02_18",
    "SP02_19","SP02_20","DE02_01","DE02_02","DE02_03","DE02_04","DE02_05","DE02_06",
    "DE03_01","DE04_01","DE04_02","DE04_03","DE04_04","DE05_01","DE06_01","DE06_02",
    "DE07_01","DE07_02","DE08_01","DE08_02","DE08_03","DE09_01","DE09_02","DE11_01",
    "DE11_02","DE11_03","DE11_04","NE01_01","NE01_02","NE01_03","NE01_04","NE01_05",
    "NE01_06","NE01_07","NE01_08","NE01_09","NE01_10","NE01_11","NE01_12","NE01_13",
    "NE01_14","NE01_15","NE01_16","NE01_17","NE01_18","NE01_19","NE01_20","NE01_21",
    "NE01_22","NE01_23","NE01_24","NE01_25","NE01_26","NE01_27","NE01_28","NE01_29",
    "NE01_30","NE01_31","NE01_32","NE01_33","NE01_34","NE01_35","NE01_36","NE01_37",
    "NE01_38","NE01_39","NE01_40","NE01_41","NE01_42","NE01_43","NE01_44","NE01_45",
    "NE01_46","NE01_47","NE01_48","NA01_01","NA01_02","NA01_03","NA01_12","NA01_04",
    "NA01_05","NA01_06","NA01_07","NA01_08","NA01_09","NA01_10","NA01_11","NA01_13",
    "NA01_14","NA01_15","NA01_16","NA01_17","NA01_18","NA01_19","NA01_20","NA01_21",
    "NA01_22","NA01_23","NA01_24","NA01_25","NA01_26","NA01_27","NA01_28","NA01_29",
    "NA01_30","NA01_31","NA01_32","NA01_33","NA01_34","NA01_35","NA01_36","NA01_37",
    "NA01_38","NA01_39","NA01_40","NA01_41","NA01_42","NA01_43","NA01_44","NA01_45",
    "NA01_46","NA01_47","NA01_48","NN01_01","NN01_02","NN01_03","NN01_04","NN01_05",
    "NN01_06","NN01_07","NN01_08","NN01_09","NN01_10","NN01_11","NN01_12","NN01_13",
    "NN01_14","NN01_15","NN01_16","NN01_17","NN01_18","NN01_19","NN01_20","NN01_21",
    "NN01_22","NN01_23","NN01_24","NN01_25","NN01_26","NN01_27","NN01_28","NN01_29",
    "NN01_30","NN01_31","NN01_32","NN01_33","NN01_34","NN01_35","NN01_36","NN01_37",
    "NN01_38","NN01_39","NN01_40","NN01_41","NN01_42","NN01_43","NN01_44","NN01_45",
    "NN01_46","NN01_47","NN01_48","AE01_01","AE01_02","AE01_03","AE01_04","AE01_05",
    "AE01_06","AE01_07","AE01_08","AE01_09","AE01_10","AE01_11","AE01_12","AE01_13",
    "AE01_14","AE01_15","AE01_16","AE01_17","AE01_18","AE01_19","AE01_20","AE01_21",
    "AE01_22","AE01_23","AE01_24","AE01_25","AE01_26","AE01_27","AE01_28","AE01_29",
    "AE01_30","SC01_01","SC01_02","SC01_03","SC01_04","SC01_05","SC01_06","SC01_07",
    "SC01_08","SC01_09","SC01_10","SC01_11","SC01_12","SC01_13","SC01_14","SC01_15",
    "SC01_16","SC01_17","SC01_18","SC01_19","SC01_20","SC01_21","CD01_01","S201_01",
    "S201_02","S201_03","S201_04","S201_05","S201_06","S201_07","S201_08","S201_09",
    "S201_10","S201_11","S201_12","S201_13","S201_14","S201_15","S201_16","TIME001",
    "TIME002","TIME003","TIME004","TIME005","TIME006","TIME007","TIME008","TIME009",
    "TIME010","TIME011","TIME012","TIME_SUM","MAILSENT","LASTDATA","FINISHED",
    "Q_VIEWER","LASTPAGE","MAXPAGE","MISSING","MISSREL","TIME_RSI","DEG_TIME"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="character", STARTED="POSIXct", SD01="numeric", SD02_01="numeric",
    SD02_02="numeric", SD02_03="numeric", SD02_04="numeric", SD02_05="numeric",
    SD02_06="numeric", SD02_07="numeric", SD02_08="numeric", SD02_09="numeric",
    SD02_10="numeric", SD02_11="numeric", SD02_12="numeric", SD02_13="numeric",
    SD07="numeric", SD08_01="character", SD09_01="character", SD22="numeric",
    BD02="numeric", BD03="numeric", BD04="numeric", BD05="numeric",
    BD06="numeric", BD07="numeric", BD08="numeric", BD09="numeric",
    BD10="numeric", BD11="numeric", BD12="numeric", BD13="numeric",
    BD14="numeric", BD15="numeric", BD16="numeric", BD17="numeric",
    BD18="numeric", BD19="numeric", BD20="numeric", BD21="numeric",
    BD22="numeric", SP02_01="numeric", SP02_02="numeric", SP02_03="numeric",
    SP02_04="numeric", SP02_05="numeric", SP02_06="numeric", SP02_07="numeric",
    SP02_08="numeric", SP02_09="numeric", SP02_10="numeric", SP02_11="numeric",
    SP02_12="numeric", SP02_13="numeric", SP02_14="numeric", SP02_15="numeric",
    SP02_16="numeric", SP02_17="numeric", SP02_18="numeric", SP02_19="numeric",
    SP02_20="numeric", DE02_01="numeric", DE02_02="numeric", DE02_03="numeric",
    DE02_04="numeric", DE02_05="numeric", DE02_06="numeric", DE03_01="numeric",
    DE04_01="numeric", DE04_02="numeric", DE04_03="numeric", DE04_04="numeric",
    DE05_01="numeric", DE06_01="numeric", DE06_02="numeric", DE07_01="numeric",
    DE07_02="numeric", DE08_01="numeric", DE08_02="numeric", DE08_03="numeric",
    DE09_01="numeric", DE09_02="numeric", DE11_01="numeric", DE11_02="numeric",
    DE11_03="numeric", DE11_04="numeric", NE01_01="numeric", NE01_02="numeric",
    NE01_03="numeric", NE01_04="numeric", NE01_05="numeric", NE01_06="numeric",
    NE01_07="numeric", NE01_08="numeric", NE01_09="numeric", NE01_10="numeric",
    NE01_11="numeric", NE01_12="numeric", NE01_13="numeric", NE01_14="numeric",
    NE01_15="numeric", NE01_16="numeric", NE01_17="numeric", NE01_18="numeric",
    NE01_19="numeric", NE01_20="numeric", NE01_21="numeric", NE01_22="numeric",
    NE01_23="numeric", NE01_24="numeric", NE01_25="numeric", NE01_26="numeric",
    NE01_27="numeric", NE01_28="numeric", NE01_29="numeric", NE01_30="numeric",
    NE01_31="numeric", NE01_32="numeric", NE01_33="numeric", NE01_34="numeric",
    NE01_35="numeric", NE01_36="numeric", NE01_37="numeric", NE01_38="numeric",
    NE01_39="numeric", NE01_40="numeric", NE01_41="numeric", NE01_42="numeric",
    NE01_43="numeric", NE01_44="numeric", NE01_45="numeric", NE01_46="numeric",
    NE01_47="numeric", NE01_48="numeric", NA01_01="numeric", NA01_02="numeric",
    NA01_03="numeric", NA01_12="numeric", NA01_04="numeric", NA01_05="numeric",
    NA01_06="numeric", NA01_07="numeric", NA01_08="numeric", NA01_09="numeric",
    NA01_10="numeric", NA01_11="numeric", NA01_13="numeric", NA01_14="numeric",
    NA01_15="numeric", NA01_16="numeric", NA01_17="numeric", NA01_18="numeric",
    NA01_19="numeric", NA01_20="numeric", NA01_21="numeric", NA01_22="numeric",
    NA01_23="numeric", NA01_24="numeric", NA01_25="numeric", NA01_26="numeric",
    NA01_27="numeric", NA01_28="numeric", NA01_29="numeric", NA01_30="numeric",
    NA01_31="numeric", NA01_32="numeric", NA01_33="numeric", NA01_34="numeric",
    NA01_35="numeric", NA01_36="numeric", NA01_37="numeric", NA01_38="numeric",
    NA01_39="numeric", NA01_40="numeric", NA01_41="numeric", NA01_42="numeric",
    NA01_43="numeric", NA01_44="numeric", NA01_45="numeric", NA01_46="numeric",
    NA01_47="numeric", NA01_48="numeric", NN01_01="numeric", NN01_02="numeric",
    NN01_03="numeric", NN01_04="numeric", NN01_05="numeric", NN01_06="numeric",
    NN01_07="numeric", NN01_08="numeric", NN01_09="numeric", NN01_10="numeric",
    NN01_11="numeric", NN01_12="numeric", NN01_13="numeric", NN01_14="numeric",
    NN01_15="numeric", NN01_16="numeric", NN01_17="numeric", NN01_18="numeric",
    NN01_19="numeric", NN01_20="numeric", NN01_21="numeric", NN01_22="numeric",
    NN01_23="numeric", NN01_24="numeric", NN01_25="numeric", NN01_26="numeric",
    NN01_27="numeric", NN01_28="numeric", NN01_29="numeric", NN01_30="numeric",
    NN01_31="numeric", NN01_32="numeric", NN01_33="numeric", NN01_34="numeric",
    NN01_35="numeric", NN01_36="numeric", NN01_37="numeric", NN01_38="numeric",
    NN01_39="numeric", NN01_40="numeric", NN01_41="numeric", NN01_42="numeric",
    NN01_43="numeric", NN01_44="numeric", NN01_45="numeric", NN01_46="numeric",
    NN01_47="numeric", NN01_48="numeric", AE01_01="numeric", AE01_02="numeric",
    AE01_03="numeric", AE01_04="numeric", AE01_05="numeric", AE01_06="numeric",
    AE01_07="numeric", AE01_08="numeric", AE01_09="numeric", AE01_10="numeric",
    AE01_11="numeric", AE01_12="numeric", AE01_13="numeric", AE01_14="numeric",
    AE01_15="numeric", AE01_16="numeric", AE01_17="numeric", AE01_18="numeric",
    AE01_19="numeric", AE01_20="numeric", AE01_21="numeric", AE01_22="numeric",
    AE01_23="numeric", AE01_24="numeric", AE01_25="numeric", AE01_26="numeric",
    AE01_27="numeric", AE01_28="numeric", AE01_29="numeric", AE01_30="numeric",
    SC01_01="numeric", SC01_02="numeric", SC01_03="numeric", SC01_04="numeric",
    SC01_05="numeric", SC01_06="numeric", SC01_07="numeric", SC01_08="numeric",
    SC01_09="numeric", SC01_10="numeric", SC01_11="numeric", SC01_12="numeric",
    SC01_13="numeric", SC01_14="numeric", SC01_15="numeric", SC01_16="numeric",
    SC01_17="numeric", SC01_18="numeric", SC01_19="numeric", SC01_20="numeric",
    SC01_21="numeric", CD01_01="character", S201_01="numeric",
    S201_02="numeric", S201_03="numeric", S201_04="numeric", S201_05="numeric",
    S201_06="numeric", S201_07="numeric", S201_08="numeric", S201_09="numeric",
    S201_10="numeric", S201_11="numeric", S201_12="numeric", S201_13="numeric",
    S201_14="numeric", S201_15="numeric", S201_16="numeric", TIME001="integer",
    TIME002="integer", TIME003="integer", TIME004="integer", TIME005="integer",
    TIME006="integer", TIME007="integer", TIME008="integer", TIME009="integer",
    TIME010="integer", TIME011="integer", TIME012="integer", TIME_SUM="integer",
    MAILSENT="POSIXct", LASTDATA="POSIXct", FINISHED="logical",
    Q_VIEWER="logical", LASTPAGE="numeric", MAXPAGE="numeric",
    MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric", DEG_TIME="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

rm(Testdaten_file)

attr(Testdaten, "project") = "ERN_SOC"
attr(Testdaten, "description") = "ERN_SOC"
attr(Testdaten, "date") = "2019-07-25 15:17:33"
attr(Testdaten, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
Testdaten$SD01 = attr(Testdaten$SD01, levels=c("1","2","3","-9"), labels=c("weiblich","männlich","anderes","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$SD07 = attr(Testdaten$SD07, levels=c("1","2","3","4","5","6","7","8","9","-9"), labels=c("noch Schüler","Schule ohne Abschluss beendet","Hauptschule","Realschule / Mittlere Reife","Abgeschlossene Lehre","Fachabitur / Fachhochschulreife","Abitur / Hochschulreife","Fachhochschul- / Hochschulabschluss","Anderer Abschluss, nämlich:","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$SD22 = attr(Testdaten$SD22, levels=c("1","2","3","4","5","6","-9"), labels=c("sehr schlecht","schlecht","eher schlecht","eher gut","gut","sehr gut","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD02 = attr(Testdaten$BD02, levels=c("0","1","2","3","-9"), labels=c("Ich bin nicht traurig","Ich bin oft traurig","Ich bin ständig traurig","Ich bin so traurig oder unglücklich, dass ich es nicht aushalte","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD03 = attr(Testdaten$BD03, levels=c("0","1","2","3","-9"), labels=c("Ich sehe nicht mutlos in die Zukunft","Ich sehe mutloser in die Zukunft als sonst","Ich bin mutlos und erwarte nicht, dass meine Situation besser wird","Ich glaube, dass meine Zukunft hoffnungslos ist und nur noch schlechter wird","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD04 = attr(Testdaten$BD04, levels=c("0","1","2","3","-9"), labels=c("Ich fühle mich nicht als Versager","Ich habe häufiger Versagensgefühle","Wenn ich zurückblicke, sehe ich eine Menge Fehlschläge","Ich habe das Gefühl, als Mensch ein völliger Versager zu sein","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD05 = attr(Testdaten$BD05, levels=c("0","1","2","3","-9"), labels=c("Ich kann die Dinge genauso gut genießen wie früher","Ich kann die Dinge nicht mehr so genießen wie früher","Dinge, die mir früher Freude gemacht haben, kann ich kaum mehr genießen","Dinge, die mir früher Freude gemacht haben, kann ich überhaupt nicht mehr genießen","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD06 = attr(Testdaten$BD06, levels=c("0","1","2","3","-9"), labels=c("Ich habe keine besonderen Schuldgefühle","Ich habe oft Schuldgefühle wegen Dingen, die ich getan habe oder hätte tun sollen","Ich habe die meiste Zeit Schuldgefühle","Ich habe ständig Schuldgefühle","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD07 = attr(Testdaten$BD07, levels=c("0","1","2","3","-9"), labels=c("Ich habe nicht das Gefühl, für etwas bestraft zu sein","Ich habe das Gefühl, vielleicht bestraft zu werden","Ich erwarte, bestraft zu werden","Ich habe das Gefühl, bestraft zu sein","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD08 = attr(Testdaten$BD08, levels=c("0","1","2","3","-9"), labels=c("Ich halte von mir genauso viel wie immer","Ich habe Vertrauen in mich verloren","Ich bin von mir enttäuscht","Ich lehne mich völlig ab","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD09 = attr(Testdaten$BD09, levels=c("0","1","2","3","-9"), labels=c("Ich kritisiere oder tadle mich nicht mehr als sonst","Ich bin mir gegenüber kritischer als sonst","Ich kritisiere mich für all meine Mängel","Ich gebe mir die Schuld für alles Schlimme, was passiert","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD10 = attr(Testdaten$BD10, levels=c("0","1","2","3","-9"), labels=c("Ich denke nicht daran, mir etwas anzutun","Ich denke manchmal an Selbstmord, aber ich würde es nicht tun","Ich möchte mich am liebsten umbringen","Ich würde mich umbringen, wenn ich die Gelegenheit dazu hätte","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD11 = attr(Testdaten$BD11, levels=c("0","1","2","3","-9"), labels=c("Ich weine nicht öfter als früher","Ich weine jetzt mehr als früher","Ich weine beim geringsten Anlass","Ich möchte gern weinen, aber ich kann nicht","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD12 = attr(Testdaten$BD12, levels=c("0","1","2","3","-9"), labels=c("Ich bin nicht unruhiger als sonst","Ich bin unruhiger als sonst","Ich bin so unruhig, dass es mir schwer fällt, stillzusitzen","Ich bin so unruhig, dass ich mich ständig bewegen oder etwas tun muss","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD13 = attr(Testdaten$BD13, levels=c("0","1","2","3","-9"), labels=c("Ich habe das Interesse an anderen Menschen oder an Tätigkeiten nicht verloren","Ich habe weniger Interesse an anderen Menschen oder an Dingen als sonst","Ich habe das Interesse an anderen Menschen oder an Dingen zum größten Teil verloren","Es fällt mir schwer, mich überhaupt für irgend etwas zu interessieren","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD14 = attr(Testdaten$BD14, levels=c("0","1","2","3","-9"), labels=c("Ich bin so entschlussfreudig wie immer","Es fällt mir schwerer als sonst, Entscheidungen zu treffen","Es fällt mir sehr viel schwerer als sonst, Entscheidungen zu treffen","Ich habe Mühe, überhaupt Entscheidungen zu treffen","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD15 = attr(Testdaten$BD15, levels=c("0","1","2","3","-9"), labels=c("Ich fühle mich nicht wertlos","Ich halte mich für weniger wertvoll und nützlich als sonst","Verglichen mit anderen Menschen fühle ich mich viel weniger wert","Ich fühle mich völlig wertlos","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD16 = attr(Testdaten$BD16, levels=c("0","1","2","3","-9"), labels=c("Ich habe so viel Energie wie immer","Ich habe weniger Energie als sonst","Ich habe so wenig Energie, dass ich kaum noch etwas schaffe","Ich habe keine Energie mehr, um überhaupt noch etwas zu tun","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD17 = attr(Testdaten$BD17, levels=c("0","1","1","2","2","3","3","-9"), labels=c("Meine Schlafgewohnheiten haben sich nicht verändert","Ich schlafe etwas mehr als sonst","Ich schlafe etwas weniger als sonst","Ich schlafe viel mehr als sonst","Ich schlafe viel weniger als sonst","Ich schlafe fast den ganzen Tag","Ich wache 1-2 Stunden früher auf als gewöhnlich und kann nicht mehr einschlafen","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD18 = attr(Testdaten$BD18, levels=c("0","1","2","3","-9"), labels=c("Ich bin nicht reizbarer als sonst","Ich bin reizbarer als sonst","Ich bin viel reizbarer als sonst","Ich fühle mich dauernd gereizt","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD19 = attr(Testdaten$BD19, levels=c("0","1","1","2","2","3","3","-9"), labels=c("Mein Appetit hat sich nicht verändert","Mein Appetit ist etwas schlechter als sonst","Mein Appetit ist etwas größer als sonst","Mein Appetit ist viel schlechter als sonst","Mein Appetit ist viel größer als sonst","Ich habe überhaupt keinen Appetit","Ich habe ständig Heißhunger","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD20 = attr(Testdaten$BD20, levels=c("0","1","2","3","-9"), labels=c("Ich kann mich so gut konzentrieren wie immer","Ich kann mich nicht mehr so gut konzentrieren wie sonst","Es fällt mir schwer, mich längere Zeit auf irgend etwas zu konzentrieren","Ich kann mich überhaupt nicht mehr konzentrieren","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD21 = attr(Testdaten$BD21, levels=c("0","1","2","3","-9"), labels=c("Ich fühle mich nicht müder oder erschöpfter als sonst","Ich werde schneller müder oder erschöpft als sonst","Für viele Dinge, die ich üblicherweise tue, bin ich zu müde oder erschöpft","Ich bin so müde oder erschöpft, dass ich fast nichts mehr tun kann","[NA] nicht beantwortet"), ordered=FALSE)
Testdaten$BD22 = attr(Testdaten$BD22, levels=c("0","1","2","3","-9"), labels=c("Mein Interesse an Sexualität hat sich in letzter Zeit nicht verändert","Ich interessiere mich weniger für Sexualität als früher","Ich interessiere mich jetzt viel weniger für Sexualität","Ich habe das Interesse an Sexualität völlig verloren","[NA] nicht beantwortet"), ordered=FALSE)
attr(Testdaten$SD02_01,"1") = "Rangplatz 1"
attr(Testdaten$SD02_01,"2") = "Rangplatz 2"
attr(Testdaten$SD02_02,"1") = "Rangplatz 1"
attr(Testdaten$SD02_02,"2") = "Rangplatz 2"
attr(Testdaten$SD02_03,"1") = "Rangplatz 1"
attr(Testdaten$SD02_03,"2") = "Rangplatz 2"
attr(Testdaten$SD02_04,"1") = "Rangplatz 1"
attr(Testdaten$SD02_04,"2") = "Rangplatz 2"
attr(Testdaten$SD02_05,"1") = "Rangplatz 1"
attr(Testdaten$SD02_05,"2") = "Rangplatz 2"
attr(Testdaten$SD02_06,"1") = "Rangplatz 1"
attr(Testdaten$SD02_06,"2") = "Rangplatz 2"
attr(Testdaten$SD02_07,"1") = "Rangplatz 1"
attr(Testdaten$SD02_07,"2") = "Rangplatz 2"
attr(Testdaten$SD02_08,"1") = "Rangplatz 1"
attr(Testdaten$SD02_08,"2") = "Rangplatz 2"
attr(Testdaten$SD02_09,"1") = "Rangplatz 1"
attr(Testdaten$SD02_09,"2") = "Rangplatz 2"
attr(Testdaten$SD02_10,"1") = "Rangplatz 1"
attr(Testdaten$SD02_10,"2") = "Rangplatz 2"
attr(Testdaten$SD02_11,"1") = "Rangplatz 1"
attr(Testdaten$SD02_11,"2") = "Rangplatz 2"
attr(Testdaten$SD02_12,"1") = "Rangplatz 1"
attr(Testdaten$SD02_12,"2") = "Rangplatz 2"
attr(Testdaten$SD02_13,"1") = "Rangplatz 1"
attr(Testdaten$SD02_13,"2") = "Rangplatz 2"
attr(Testdaten$SP02_01,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_01,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_01,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_01,"3") = "stark zutreffend"
attr(Testdaten$SP02_01,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_02,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_02,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_02,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_02,"3") = "stark zutreffend"
attr(Testdaten$SP02_02,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_03,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_03,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_03,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_03,"3") = "stark zutreffend"
attr(Testdaten$SP02_03,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_04,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_04,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_04,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_04,"3") = "stark zutreffend"
attr(Testdaten$SP02_04,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_05,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_05,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_05,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_05,"3") = "stark zutreffend"
attr(Testdaten$SP02_05,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_06,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_06,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_06,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_06,"3") = "stark zutreffend"
attr(Testdaten$SP02_06,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_07,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_07,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_07,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_07,"3") = "stark zutreffend"
attr(Testdaten$SP02_07,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_08,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_08,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_08,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_08,"3") = "stark zutreffend"
attr(Testdaten$SP02_08,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_09,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_09,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_09,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_09,"3") = "stark zutreffend"
attr(Testdaten$SP02_09,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_10,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_10,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_10,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_10,"3") = "stark zutreffend"
attr(Testdaten$SP02_10,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_11,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_11,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_11,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_11,"3") = "stark zutreffend"
attr(Testdaten$SP02_11,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_12,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_12,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_12,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_12,"3") = "stark zutreffend"
attr(Testdaten$SP02_12,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_13,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_13,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_13,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_13,"3") = "stark zutreffend"
attr(Testdaten$SP02_13,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_14,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_14,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_14,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_14,"3") = "stark zutreffend"
attr(Testdaten$SP02_14,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_15,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_15,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_15,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_15,"3") = "stark zutreffend"
attr(Testdaten$SP02_15,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_16,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_16,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_16,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_16,"3") = "stark zutreffend"
attr(Testdaten$SP02_16,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_17,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_17,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_17,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_17,"3") = "stark zutreffend"
attr(Testdaten$SP02_17,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_18,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_18,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_18,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_18,"3") = "stark zutreffend"
attr(Testdaten$SP02_18,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_19,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_19,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_19,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_19,"3") = "stark zutreffend"
attr(Testdaten$SP02_19,"4") = "sehr stark zutreffend"
attr(Testdaten$SP02_20,"0") = "überhaupt nicht zutreffend"
attr(Testdaten$SP02_20,"1") = "ein wenig zutreffend"
attr(Testdaten$SP02_20,"2") = "ziemlich zutreffend"
attr(Testdaten$SP02_20,"3") = "stark zutreffend"
attr(Testdaten$SP02_20,"4") = "sehr stark zutreffend"
attr(Testdaten$DE02_01,"1") = "stimme nicht zu"
attr(Testdaten$DE02_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_01,"3") = "teils/ teils"
attr(Testdaten$DE02_01,"4") = "stimme eher zu"
attr(Testdaten$DE02_01,"5") = "stimme zu"
attr(Testdaten$DE02_02,"1") = "stimme nicht zu"
attr(Testdaten$DE02_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_02,"3") = "teils/ teils"
attr(Testdaten$DE02_02,"4") = "stimme eher zu"
attr(Testdaten$DE02_02,"5") = "stimme zu"
attr(Testdaten$DE02_03,"1") = "stimme nicht zu"
attr(Testdaten$DE02_03,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_03,"3") = "teils/ teils"
attr(Testdaten$DE02_03,"4") = "stimme eher zu"
attr(Testdaten$DE02_03,"5") = "stimme zu"
attr(Testdaten$DE02_04,"1") = "stimme nicht zu"
attr(Testdaten$DE02_04,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_04,"3") = "teils/ teils"
attr(Testdaten$DE02_04,"4") = "stimme eher zu"
attr(Testdaten$DE02_04,"5") = "stimme zu"
attr(Testdaten$DE02_05,"1") = "stimme nicht zu"
attr(Testdaten$DE02_05,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_05,"3") = "teils/ teils"
attr(Testdaten$DE02_05,"4") = "stimme eher zu"
attr(Testdaten$DE02_05,"5") = "stimme zu"
attr(Testdaten$DE02_06,"1") = "stimme nicht zu"
attr(Testdaten$DE02_06,"2") = "stimme eher nicht zu"
attr(Testdaten$DE02_06,"3") = "teils/ teils"
attr(Testdaten$DE02_06,"4") = "stimme eher zu"
attr(Testdaten$DE02_06,"5") = "stimme zu"
attr(Testdaten$DE03_01,"1") = "stimme nicht zu"
attr(Testdaten$DE03_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE03_01,"3") = "teils/teils"
attr(Testdaten$DE03_01,"4") = "stimme eher zu"
attr(Testdaten$DE03_01,"5") = "stimme zu"
attr(Testdaten$DE04_01,"1") = "stimme nicht zu"
attr(Testdaten$DE04_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE04_01,"3") = "teils/teils"
attr(Testdaten$DE04_01,"4") = "stimme eher zu"
attr(Testdaten$DE04_01,"5") = "stimme zu"
attr(Testdaten$DE04_02,"1") = "stimme nicht zu"
attr(Testdaten$DE04_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE04_02,"3") = "teils/teils"
attr(Testdaten$DE04_02,"4") = "stimme eher zu"
attr(Testdaten$DE04_02,"5") = "stimme zu"
attr(Testdaten$DE04_03,"1") = "stimme nicht zu"
attr(Testdaten$DE04_03,"2") = "stimme eher nicht zu"
attr(Testdaten$DE04_03,"3") = "teils/teils"
attr(Testdaten$DE04_03,"4") = "stimme eher zu"
attr(Testdaten$DE04_03,"5") = "stimme zu"
attr(Testdaten$DE04_04,"1") = "stimme nicht zu"
attr(Testdaten$DE04_04,"2") = "stimme eher nicht zu"
attr(Testdaten$DE04_04,"3") = "teils/teils"
attr(Testdaten$DE04_04,"4") = "stimme eher zu"
attr(Testdaten$DE04_04,"5") = "stimme zu"
attr(Testdaten$DE05_01,"1") = "stimme nicht zu"
attr(Testdaten$DE05_01,"2") = "stimme eher nichtzu"
attr(Testdaten$DE05_01,"3") = "teils/teils"
attr(Testdaten$DE05_01,"4") = "stimme eher zu"
attr(Testdaten$DE05_01,"5") = "stimme zu"
attr(Testdaten$DE06_01,"1") = "stimme nicht zu"
attr(Testdaten$DE06_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE06_01,"3") = "teils/teils"
attr(Testdaten$DE06_01,"4") = "stimme eher zu"
attr(Testdaten$DE06_01,"5") = "stimme zu"
attr(Testdaten$DE06_02,"1") = "stimme nicht zu"
attr(Testdaten$DE06_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE06_02,"3") = "teils/teils"
attr(Testdaten$DE06_02,"4") = "stimme eher zu"
attr(Testdaten$DE06_02,"5") = "stimme zu"
attr(Testdaten$DE07_01,"1") = "stimme nicht zu"
attr(Testdaten$DE07_01,"2") = "stimme eher nich tzu"
attr(Testdaten$DE07_01,"3") = "teils/teils"
attr(Testdaten$DE07_01,"4") = "stimme eher zu"
attr(Testdaten$DE07_01,"5") = "stimme zu"
attr(Testdaten$DE07_02,"1") = "stimme nicht zu"
attr(Testdaten$DE07_02,"2") = "stimme eher nich tzu"
attr(Testdaten$DE07_02,"3") = "teils/teils"
attr(Testdaten$DE07_02,"4") = "stimme eher zu"
attr(Testdaten$DE07_02,"5") = "stimme zu"
attr(Testdaten$DE08_01,"1") = "stimme nicht zu"
attr(Testdaten$DE08_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE08_01,"3") = "teils/teils"
attr(Testdaten$DE08_01,"4") = "stimme eher zu"
attr(Testdaten$DE08_01,"5") = "stimme zu"
attr(Testdaten$DE08_02,"1") = "stimme nicht zu"
attr(Testdaten$DE08_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE08_02,"3") = "teils/teils"
attr(Testdaten$DE08_02,"4") = "stimme eher zu"
attr(Testdaten$DE08_02,"5") = "stimme zu"
attr(Testdaten$DE08_03,"1") = "stimme nicht zu"
attr(Testdaten$DE08_03,"2") = "stimme eher nicht zu"
attr(Testdaten$DE08_03,"3") = "teils/teils"
attr(Testdaten$DE08_03,"4") = "stimme eher zu"
attr(Testdaten$DE08_03,"5") = "stimme zu"
attr(Testdaten$DE09_01,"1") = "stimme nicht zu"
attr(Testdaten$DE09_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE09_01,"3") = "teils/teils"
attr(Testdaten$DE09_01,"4") = "stimme eher zu"
attr(Testdaten$DE09_01,"5") = "stimme zu"
attr(Testdaten$DE09_02,"1") = "stimme nicht zu"
attr(Testdaten$DE09_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE09_02,"3") = "teils/teils"
attr(Testdaten$DE09_02,"4") = "stimme eher zu"
attr(Testdaten$DE09_02,"5") = "stimme zu"
attr(Testdaten$DE11_01,"1") = "stimme nicht zu"
attr(Testdaten$DE11_01,"2") = "stimme eher nicht zu"
attr(Testdaten$DE11_01,"3") = "teils/teils"
attr(Testdaten$DE11_01,"4") = "stimme eher zu"
attr(Testdaten$DE11_01,"5") = "stimme zu"
attr(Testdaten$DE11_02,"1") = "stimme nicht zu"
attr(Testdaten$DE11_02,"2") = "stimme eher nicht zu"
attr(Testdaten$DE11_02,"3") = "teils/teils"
attr(Testdaten$DE11_02,"4") = "stimme eher zu"
attr(Testdaten$DE11_02,"5") = "stimme zu"
attr(Testdaten$DE11_03,"1") = "stimme nicht zu"
attr(Testdaten$DE11_03,"2") = "stimme eher nicht zu"
attr(Testdaten$DE11_03,"3") = "teils/teils"
attr(Testdaten$DE11_03,"4") = "stimme eher zu"
attr(Testdaten$DE11_03,"5") = "stimme zu"
attr(Testdaten$DE11_04,"1") = "stimme nicht zu"
attr(Testdaten$DE11_04,"2") = "stimme eher nicht zu"
attr(Testdaten$DE11_04,"3") = "teils/teils"
attr(Testdaten$DE11_04,"4") = "stimme eher zu"
attr(Testdaten$DE11_04,"5") = "stimme zu"
attr(Testdaten$NE01_01,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_01,"2") = "unzutreffend"
attr(Testdaten$NE01_01,"3") = "weder noch"
attr(Testdaten$NE01_01,"4") = "zutreffend"
attr(Testdaten$NE01_01,"5") = "sehr zutreffend"
attr(Testdaten$NE01_02,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_02,"2") = "unzutreffend"
attr(Testdaten$NE01_02,"3") = "weder noch"
attr(Testdaten$NE01_02,"4") = "zutreffend"
attr(Testdaten$NE01_02,"5") = "sehr zutreffend"
attr(Testdaten$NE01_03,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_03,"2") = "unzutreffend"
attr(Testdaten$NE01_03,"3") = "weder noch"
attr(Testdaten$NE01_03,"4") = "zutreffend"
attr(Testdaten$NE01_03,"5") = "sehr zutreffend"
attr(Testdaten$NE01_04,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_04,"2") = "unzutreffend"
attr(Testdaten$NE01_04,"3") = "weder noch"
attr(Testdaten$NE01_04,"4") = "zutreffend"
attr(Testdaten$NE01_04,"5") = "sehr zutreffend"
attr(Testdaten$NE01_05,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_05,"2") = "unzutreffend"
attr(Testdaten$NE01_05,"3") = "weder noch"
attr(Testdaten$NE01_05,"4") = "zutreffend"
attr(Testdaten$NE01_05,"5") = "sehr zutreffend"
attr(Testdaten$NE01_06,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_06,"2") = "unzutreffend"
attr(Testdaten$NE01_06,"3") = "weder noch"
attr(Testdaten$NE01_06,"4") = "zutreffend"
attr(Testdaten$NE01_06,"5") = "sehr zutreffend"
attr(Testdaten$NE01_07,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_07,"2") = "unzutreffend"
attr(Testdaten$NE01_07,"3") = "weder noch"
attr(Testdaten$NE01_07,"4") = "zutreffend"
attr(Testdaten$NE01_07,"5") = "sehr zutreffend"
attr(Testdaten$NE01_08,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_08,"2") = "unzutreffend"
attr(Testdaten$NE01_08,"3") = "weder noch"
attr(Testdaten$NE01_08,"4") = "zutreffend"
attr(Testdaten$NE01_08,"5") = "sehr zutreffend"
attr(Testdaten$NE01_09,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_09,"2") = "unzutreffend"
attr(Testdaten$NE01_09,"3") = "weder noch"
attr(Testdaten$NE01_09,"4") = "zutreffend"
attr(Testdaten$NE01_09,"5") = "sehr zutreffend"
attr(Testdaten$NE01_10,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_10,"2") = "unzutreffend"
attr(Testdaten$NE01_10,"3") = "weder noch"
attr(Testdaten$NE01_10,"4") = "zutreffend"
attr(Testdaten$NE01_10,"5") = "sehr zutreffend"
attr(Testdaten$NE01_11,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_11,"2") = "unzutreffend"
attr(Testdaten$NE01_11,"3") = "weder noch"
attr(Testdaten$NE01_11,"4") = "zutreffend"
attr(Testdaten$NE01_11,"5") = "sehr zutreffend"
attr(Testdaten$NE01_12,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_12,"2") = "unzutreffend"
attr(Testdaten$NE01_12,"3") = "weder noch"
attr(Testdaten$NE01_12,"4") = "zutreffend"
attr(Testdaten$NE01_12,"5") = "sehr zutreffend"
attr(Testdaten$NE01_13,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_13,"2") = "unzutreffend"
attr(Testdaten$NE01_13,"3") = "weder noch"
attr(Testdaten$NE01_13,"4") = "zutreffend"
attr(Testdaten$NE01_13,"5") = "sehr zutreffend"
attr(Testdaten$NE01_14,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_14,"2") = "unzutreffend"
attr(Testdaten$NE01_14,"3") = "weder noch"
attr(Testdaten$NE01_14,"4") = "zutreffend"
attr(Testdaten$NE01_14,"5") = "sehr zutreffend"
attr(Testdaten$NE01_15,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_15,"2") = "unzutreffend"
attr(Testdaten$NE01_15,"3") = "weder noch"
attr(Testdaten$NE01_15,"4") = "zutreffend"
attr(Testdaten$NE01_15,"5") = "sehr zutreffend"
attr(Testdaten$NE01_16,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_16,"2") = "unzutreffend"
attr(Testdaten$NE01_16,"3") = "weder noch"
attr(Testdaten$NE01_16,"4") = "zutreffend"
attr(Testdaten$NE01_16,"5") = "sehr zutreffend"
attr(Testdaten$NE01_17,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_17,"2") = "unzutreffend"
attr(Testdaten$NE01_17,"3") = "weder noch"
attr(Testdaten$NE01_17,"4") = "zutreffend"
attr(Testdaten$NE01_17,"5") = "sehr zutreffend"
attr(Testdaten$NE01_18,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_18,"2") = "unzutreffend"
attr(Testdaten$NE01_18,"3") = "weder noch"
attr(Testdaten$NE01_18,"4") = "zutreffend"
attr(Testdaten$NE01_18,"5") = "sehr zutreffend"
attr(Testdaten$NE01_19,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_19,"2") = "unzutreffend"
attr(Testdaten$NE01_19,"3") = "weder noch"
attr(Testdaten$NE01_19,"4") = "zutreffend"
attr(Testdaten$NE01_19,"5") = "sehr zutreffend"
attr(Testdaten$NE01_20,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_20,"2") = "unzutreffend"
attr(Testdaten$NE01_20,"3") = "weder noch"
attr(Testdaten$NE01_20,"4") = "zutreffend"
attr(Testdaten$NE01_20,"5") = "sehr zutreffend"
attr(Testdaten$NE01_21,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_21,"2") = "unzutreffend"
attr(Testdaten$NE01_21,"3") = "weder noch"
attr(Testdaten$NE01_21,"4") = "zutreffend"
attr(Testdaten$NE01_21,"5") = "sehr zutreffend"
attr(Testdaten$NE01_22,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_22,"2") = "unzutreffend"
attr(Testdaten$NE01_22,"3") = "weder noch"
attr(Testdaten$NE01_22,"4") = "zutreffend"
attr(Testdaten$NE01_22,"5") = "sehr zutreffend"
attr(Testdaten$NE01_23,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_23,"2") = "unzutreffend"
attr(Testdaten$NE01_23,"3") = "weder noch"
attr(Testdaten$NE01_23,"4") = "zutreffend"
attr(Testdaten$NE01_23,"5") = "sehr zutreffend"
attr(Testdaten$NE01_24,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_24,"2") = "unzutreffend"
attr(Testdaten$NE01_24,"3") = "weder noch"
attr(Testdaten$NE01_24,"4") = "zutreffend"
attr(Testdaten$NE01_24,"5") = "sehr zutreffend"
attr(Testdaten$NE01_25,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_25,"2") = "unzutreffend"
attr(Testdaten$NE01_25,"3") = "weder noch"
attr(Testdaten$NE01_25,"4") = "zutreffend"
attr(Testdaten$NE01_25,"5") = "sehr zutreffend"
attr(Testdaten$NE01_26,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_26,"2") = "unzutreffend"
attr(Testdaten$NE01_26,"3") = "weder noch"
attr(Testdaten$NE01_26,"4") = "zutreffend"
attr(Testdaten$NE01_26,"5") = "sehr zutreffend"
attr(Testdaten$NE01_27,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_27,"2") = "unzutreffend"
attr(Testdaten$NE01_27,"3") = "weder noch"
attr(Testdaten$NE01_27,"4") = "zutreffend"
attr(Testdaten$NE01_27,"5") = "sehr zutreffend"
attr(Testdaten$NE01_28,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_28,"2") = "unzutreffend"
attr(Testdaten$NE01_28,"3") = "weder noch"
attr(Testdaten$NE01_28,"4") = "zutreffend"
attr(Testdaten$NE01_28,"5") = "sehr zutreffend"
attr(Testdaten$NE01_29,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_29,"2") = "unzutreffend"
attr(Testdaten$NE01_29,"3") = "weder noch"
attr(Testdaten$NE01_29,"4") = "zutreffend"
attr(Testdaten$NE01_29,"5") = "sehr zutreffend"
attr(Testdaten$NE01_30,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_30,"2") = "unzutreffend"
attr(Testdaten$NE01_30,"3") = "weder noch"
attr(Testdaten$NE01_30,"4") = "zutreffend"
attr(Testdaten$NE01_30,"5") = "sehr zutreffend"
attr(Testdaten$NE01_31,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_31,"2") = "unzutreffend"
attr(Testdaten$NE01_31,"3") = "weder noch"
attr(Testdaten$NE01_31,"4") = "zutreffend"
attr(Testdaten$NE01_31,"5") = "sehr zutreffend"
attr(Testdaten$NE01_32,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_32,"2") = "unzutreffend"
attr(Testdaten$NE01_32,"3") = "weder noch"
attr(Testdaten$NE01_32,"4") = "zutreffend"
attr(Testdaten$NE01_32,"5") = "sehr zutreffend"
attr(Testdaten$NE01_33,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_33,"2") = "unzutreffend"
attr(Testdaten$NE01_33,"3") = "weder noch"
attr(Testdaten$NE01_33,"4") = "zutreffend"
attr(Testdaten$NE01_33,"5") = "sehr zutreffend"
attr(Testdaten$NE01_34,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_34,"2") = "unzutreffend"
attr(Testdaten$NE01_34,"3") = "weder noch"
attr(Testdaten$NE01_34,"4") = "zutreffend"
attr(Testdaten$NE01_34,"5") = "sehr zutreffend"
attr(Testdaten$NE01_35,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_35,"2") = "unzutreffend"
attr(Testdaten$NE01_35,"3") = "weder noch"
attr(Testdaten$NE01_35,"4") = "zutreffend"
attr(Testdaten$NE01_35,"5") = "sehr zutreffend"
attr(Testdaten$NE01_36,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_36,"2") = "unzutreffend"
attr(Testdaten$NE01_36,"3") = "weder noch"
attr(Testdaten$NE01_36,"4") = "zutreffend"
attr(Testdaten$NE01_36,"5") = "sehr zutreffend"
attr(Testdaten$NE01_37,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_37,"2") = "unzutreffend"
attr(Testdaten$NE01_37,"3") = "weder noch"
attr(Testdaten$NE01_37,"4") = "zutreffend"
attr(Testdaten$NE01_37,"5") = "sehr zutreffend"
attr(Testdaten$NE01_38,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_38,"2") = "unzutreffend"
attr(Testdaten$NE01_38,"3") = "weder noch"
attr(Testdaten$NE01_38,"4") = "zutreffend"
attr(Testdaten$NE01_38,"5") = "sehr zutreffend"
attr(Testdaten$NE01_39,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_39,"2") = "unzutreffend"
attr(Testdaten$NE01_39,"3") = "weder noch"
attr(Testdaten$NE01_39,"4") = "zutreffend"
attr(Testdaten$NE01_39,"5") = "sehr zutreffend"
attr(Testdaten$NE01_40,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_40,"2") = "unzutreffend"
attr(Testdaten$NE01_40,"3") = "weder noch"
attr(Testdaten$NE01_40,"4") = "zutreffend"
attr(Testdaten$NE01_40,"5") = "sehr zutreffend"
attr(Testdaten$NE01_41,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_41,"2") = "unzutreffend"
attr(Testdaten$NE01_41,"3") = "weder noch"
attr(Testdaten$NE01_41,"4") = "zutreffend"
attr(Testdaten$NE01_41,"5") = "sehr zutreffend"
attr(Testdaten$NE01_42,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_42,"2") = "unzutreffend"
attr(Testdaten$NE01_42,"3") = "weder noch"
attr(Testdaten$NE01_42,"4") = "zutreffend"
attr(Testdaten$NE01_42,"5") = "sehr zutreffend"
attr(Testdaten$NE01_43,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_43,"2") = "unzutreffend"
attr(Testdaten$NE01_43,"3") = "weder noch"
attr(Testdaten$NE01_43,"4") = "zutreffend"
attr(Testdaten$NE01_43,"5") = "sehr zutreffend"
attr(Testdaten$NE01_44,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_44,"2") = "unzutreffend"
attr(Testdaten$NE01_44,"3") = "weder noch"
attr(Testdaten$NE01_44,"4") = "zutreffend"
attr(Testdaten$NE01_44,"5") = "sehr zutreffend"
attr(Testdaten$NE01_45,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_45,"2") = "unzutreffend"
attr(Testdaten$NE01_45,"3") = "weder noch"
attr(Testdaten$NE01_45,"4") = "zutreffend"
attr(Testdaten$NE01_45,"5") = "sehr zutreffend"
attr(Testdaten$NE01_46,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_46,"2") = "unzutreffend"
attr(Testdaten$NE01_46,"3") = "weder noch"
attr(Testdaten$NE01_46,"4") = "zutreffend"
attr(Testdaten$NE01_46,"5") = "sehr zutreffend"
attr(Testdaten$NE01_47,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_47,"2") = "unzutreffend"
attr(Testdaten$NE01_47,"3") = "weder noch"
attr(Testdaten$NE01_47,"4") = "zutreffend"
attr(Testdaten$NE01_47,"5") = "sehr zutreffend"
attr(Testdaten$NE01_48,"1") = "völlig unzutreffend"
attr(Testdaten$NE01_48,"2") = "unzutreffend"
attr(Testdaten$NE01_48,"3") = "weder noch"
attr(Testdaten$NE01_48,"4") = "zutreffend"
attr(Testdaten$NE01_48,"5") = "sehr zutreffend"
attr(Testdaten$NA01_01,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_01,"2") = "unzutreffend"
attr(Testdaten$NA01_01,"3") = "weder noch"
attr(Testdaten$NA01_01,"4") = "zutreffend"
attr(Testdaten$NA01_01,"5") = "sehr zutreffend"
attr(Testdaten$NA01_02,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_02,"2") = "unzutreffend"
attr(Testdaten$NA01_02,"3") = "weder noch"
attr(Testdaten$NA01_02,"4") = "zutreffend"
attr(Testdaten$NA01_02,"5") = "sehr zutreffend"
attr(Testdaten$NA01_03,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_03,"2") = "unzutreffend"
attr(Testdaten$NA01_03,"3") = "weder noch"
attr(Testdaten$NA01_03,"4") = "zutreffend"
attr(Testdaten$NA01_03,"5") = "sehr zutreffend"
attr(Testdaten$NA01_12,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_12,"2") = "unzutreffend"
attr(Testdaten$NA01_12,"3") = "weder noch"
attr(Testdaten$NA01_12,"4") = "zutreffend"
attr(Testdaten$NA01_12,"5") = "sehr zutreffend"
attr(Testdaten$NA01_04,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_04,"2") = "unzutreffend"
attr(Testdaten$NA01_04,"3") = "weder noch"
attr(Testdaten$NA01_04,"4") = "zutreffend"
attr(Testdaten$NA01_04,"5") = "sehr zutreffend"
attr(Testdaten$NA01_05,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_05,"2") = "unzutreffend"
attr(Testdaten$NA01_05,"3") = "weder noch"
attr(Testdaten$NA01_05,"4") = "zutreffend"
attr(Testdaten$NA01_05,"5") = "sehr zutreffend"
attr(Testdaten$NA01_06,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_06,"2") = "unzutreffend"
attr(Testdaten$NA01_06,"3") = "weder noch"
attr(Testdaten$NA01_06,"4") = "zutreffend"
attr(Testdaten$NA01_06,"5") = "sehr zutreffend"
attr(Testdaten$NA01_07,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_07,"2") = "unzutreffend"
attr(Testdaten$NA01_07,"3") = "weder noch"
attr(Testdaten$NA01_07,"4") = "zutreffend"
attr(Testdaten$NA01_07,"5") = "sehr zutreffend"
attr(Testdaten$NA01_08,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_08,"2") = "unzutreffend"
attr(Testdaten$NA01_08,"3") = "weder noch"
attr(Testdaten$NA01_08,"4") = "zutreffend"
attr(Testdaten$NA01_08,"5") = "sehr zutreffend"
attr(Testdaten$NA01_09,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_09,"2") = "unzutreffend"
attr(Testdaten$NA01_09,"3") = "weder noch"
attr(Testdaten$NA01_09,"4") = "zutreffend"
attr(Testdaten$NA01_09,"5") = "sehr zutreffend"
attr(Testdaten$NA01_10,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_10,"2") = "unzutreffend"
attr(Testdaten$NA01_10,"3") = "weder noch"
attr(Testdaten$NA01_10,"4") = "zutreffend"
attr(Testdaten$NA01_10,"5") = "sehr zutreffend"
attr(Testdaten$NA01_11,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_11,"2") = "unzutreffend"
attr(Testdaten$NA01_11,"3") = "weder noch"
attr(Testdaten$NA01_11,"4") = "zutreffend"
attr(Testdaten$NA01_11,"5") = "sehr zutreffend"
attr(Testdaten$NA01_13,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_13,"2") = "unzutreffend"
attr(Testdaten$NA01_13,"3") = "weder noch"
attr(Testdaten$NA01_13,"4") = "zutreffend"
attr(Testdaten$NA01_13,"5") = "sehr zutreffend"
attr(Testdaten$NA01_14,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_14,"2") = "unzutreffend"
attr(Testdaten$NA01_14,"3") = "weder noch"
attr(Testdaten$NA01_14,"4") = "zutreffend"
attr(Testdaten$NA01_14,"5") = "sehr zutreffend"
attr(Testdaten$NA01_15,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_15,"2") = "unzutreffend"
attr(Testdaten$NA01_15,"3") = "weder noch"
attr(Testdaten$NA01_15,"4") = "zutreffend"
attr(Testdaten$NA01_15,"5") = "sehr zutreffend"
attr(Testdaten$NA01_16,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_16,"2") = "unzutreffend"
attr(Testdaten$NA01_16,"3") = "weder noch"
attr(Testdaten$NA01_16,"4") = "zutreffend"
attr(Testdaten$NA01_16,"5") = "sehr zutreffend"
attr(Testdaten$NA01_17,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_17,"2") = "unzutreffend"
attr(Testdaten$NA01_17,"3") = "weder noch"
attr(Testdaten$NA01_17,"4") = "zutreffend"
attr(Testdaten$NA01_17,"5") = "sehr zutreffend"
attr(Testdaten$NA01_18,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_18,"2") = "unzutreffend"
attr(Testdaten$NA01_18,"3") = "weder noch"
attr(Testdaten$NA01_18,"4") = "zutreffend"
attr(Testdaten$NA01_18,"5") = "sehr zutreffend"
attr(Testdaten$NA01_19,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_19,"2") = "unzutreffend"
attr(Testdaten$NA01_19,"3") = "weder noch"
attr(Testdaten$NA01_19,"4") = "zutreffend"
attr(Testdaten$NA01_19,"5") = "sehr zutreffend"
attr(Testdaten$NA01_20,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_20,"2") = "unzutreffend"
attr(Testdaten$NA01_20,"3") = "weder noch"
attr(Testdaten$NA01_20,"4") = "zutreffend"
attr(Testdaten$NA01_20,"5") = "sehr zutreffend"
attr(Testdaten$NA01_21,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_21,"2") = "unzutreffend"
attr(Testdaten$NA01_21,"3") = "weder noch"
attr(Testdaten$NA01_21,"4") = "zutreffend"
attr(Testdaten$NA01_21,"5") = "sehr zutreffend"
attr(Testdaten$NA01_22,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_22,"2") = "unzutreffend"
attr(Testdaten$NA01_22,"3") = "weder noch"
attr(Testdaten$NA01_22,"4") = "zutreffend"
attr(Testdaten$NA01_22,"5") = "sehr zutreffend"
attr(Testdaten$NA01_23,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_23,"2") = "unzutreffend"
attr(Testdaten$NA01_23,"3") = "weder noch"
attr(Testdaten$NA01_23,"4") = "zutreffend"
attr(Testdaten$NA01_23,"5") = "sehr zutreffend"
attr(Testdaten$NA01_24,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_24,"2") = "unzutreffend"
attr(Testdaten$NA01_24,"3") = "weder noch"
attr(Testdaten$NA01_24,"4") = "zutreffend"
attr(Testdaten$NA01_24,"5") = "sehr zutreffend"
attr(Testdaten$NA01_25,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_25,"2") = "unzutreffend"
attr(Testdaten$NA01_25,"3") = "weder noch"
attr(Testdaten$NA01_25,"4") = "zutreffend"
attr(Testdaten$NA01_25,"5") = "sehr zutreffend"
attr(Testdaten$NA01_26,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_26,"2") = "unzutreffend"
attr(Testdaten$NA01_26,"3") = "weder noch"
attr(Testdaten$NA01_26,"4") = "zutreffend"
attr(Testdaten$NA01_26,"5") = "sehr zutreffend"
attr(Testdaten$NA01_27,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_27,"2") = "unzutreffend"
attr(Testdaten$NA01_27,"3") = "weder noch"
attr(Testdaten$NA01_27,"4") = "zutreffend"
attr(Testdaten$NA01_27,"5") = "sehr zutreffend"
attr(Testdaten$NA01_28,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_28,"2") = "unzutreffend"
attr(Testdaten$NA01_28,"3") = "weder noch"
attr(Testdaten$NA01_28,"4") = "zutreffend"
attr(Testdaten$NA01_28,"5") = "sehr zutreffend"
attr(Testdaten$NA01_29,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_29,"2") = "unzutreffend"
attr(Testdaten$NA01_29,"3") = "weder noch"
attr(Testdaten$NA01_29,"4") = "zutreffend"
attr(Testdaten$NA01_29,"5") = "sehr zutreffend"
attr(Testdaten$NA01_30,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_30,"2") = "unzutreffend"
attr(Testdaten$NA01_30,"3") = "weder noch"
attr(Testdaten$NA01_30,"4") = "zutreffend"
attr(Testdaten$NA01_30,"5") = "sehr zutreffend"
attr(Testdaten$NA01_31,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_31,"2") = "unzutreffend"
attr(Testdaten$NA01_31,"3") = "weder noch"
attr(Testdaten$NA01_31,"4") = "zutreffend"
attr(Testdaten$NA01_31,"5") = "sehr zutreffend"
attr(Testdaten$NA01_32,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_32,"2") = "unzutreffend"
attr(Testdaten$NA01_32,"3") = "weder noch"
attr(Testdaten$NA01_32,"4") = "zutreffend"
attr(Testdaten$NA01_32,"5") = "sehr zutreffend"
attr(Testdaten$NA01_33,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_33,"2") = "unzutreffend"
attr(Testdaten$NA01_33,"3") = "weder noch"
attr(Testdaten$NA01_33,"4") = "zutreffend"
attr(Testdaten$NA01_33,"5") = "sehr zutreffend"
attr(Testdaten$NA01_34,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_34,"2") = "unzutreffend"
attr(Testdaten$NA01_34,"3") = "weder noch"
attr(Testdaten$NA01_34,"4") = "zutreffend"
attr(Testdaten$NA01_34,"5") = "sehr zutreffend"
attr(Testdaten$NA01_35,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_35,"2") = "unzutreffend"
attr(Testdaten$NA01_35,"3") = "weder noch"
attr(Testdaten$NA01_35,"4") = "zutreffend"
attr(Testdaten$NA01_35,"5") = "sehr zutreffend"
attr(Testdaten$NA01_36,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_36,"2") = "unzutreffend"
attr(Testdaten$NA01_36,"3") = "weder noch"
attr(Testdaten$NA01_36,"4") = "zutreffend"
attr(Testdaten$NA01_36,"5") = "sehr zutreffend"
attr(Testdaten$NA01_37,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_37,"2") = "unzutreffend"
attr(Testdaten$NA01_37,"3") = "weder noch"
attr(Testdaten$NA01_37,"4") = "zutreffend"
attr(Testdaten$NA01_37,"5") = "sehr zutreffend"
attr(Testdaten$NA01_38,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_38,"2") = "unzutreffend"
attr(Testdaten$NA01_38,"3") = "weder noch"
attr(Testdaten$NA01_38,"4") = "zutreffend"
attr(Testdaten$NA01_38,"5") = "sehr zutreffend"
attr(Testdaten$NA01_39,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_39,"2") = "unzutreffend"
attr(Testdaten$NA01_39,"3") = "weder noch"
attr(Testdaten$NA01_39,"4") = "zutreffend"
attr(Testdaten$NA01_39,"5") = "sehr zutreffend"
attr(Testdaten$NA01_40,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_40,"2") = "unzutreffend"
attr(Testdaten$NA01_40,"3") = "weder noch"
attr(Testdaten$NA01_40,"4") = "zutreffend"
attr(Testdaten$NA01_40,"5") = "sehr zutreffend"
attr(Testdaten$NA01_41,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_41,"2") = "unzutreffend"
attr(Testdaten$NA01_41,"3") = "weder noch"
attr(Testdaten$NA01_41,"4") = "zutreffend"
attr(Testdaten$NA01_41,"5") = "sehr zutreffend"
attr(Testdaten$NA01_42,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_42,"2") = "unzutreffend"
attr(Testdaten$NA01_42,"3") = "weder noch"
attr(Testdaten$NA01_42,"4") = "zutreffend"
attr(Testdaten$NA01_42,"5") = "sehr zutreffend"
attr(Testdaten$NA01_43,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_43,"2") = "unzutreffend"
attr(Testdaten$NA01_43,"3") = "weder noch"
attr(Testdaten$NA01_43,"4") = "zutreffend"
attr(Testdaten$NA01_43,"5") = "sehr zutreffend"
attr(Testdaten$NA01_44,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_44,"2") = "unzutreffend"
attr(Testdaten$NA01_44,"3") = "weder noch"
attr(Testdaten$NA01_44,"4") = "zutreffend"
attr(Testdaten$NA01_44,"5") = "sehr zutreffend"
attr(Testdaten$NA01_45,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_45,"2") = "unzutreffend"
attr(Testdaten$NA01_45,"3") = "weder noch"
attr(Testdaten$NA01_45,"4") = "zutreffend"
attr(Testdaten$NA01_45,"5") = "sehr zutreffend"
attr(Testdaten$NA01_46,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_46,"2") = "unzutreffend"
attr(Testdaten$NA01_46,"3") = "weder noch"
attr(Testdaten$NA01_46,"4") = "zutreffend"
attr(Testdaten$NA01_46,"5") = "sehr zutreffend"
attr(Testdaten$NA01_47,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_47,"2") = "unzutreffend"
attr(Testdaten$NA01_47,"3") = "weder noch"
attr(Testdaten$NA01_47,"4") = "zutreffend"
attr(Testdaten$NA01_47,"5") = "sehr zutreffend"
attr(Testdaten$NA01_48,"1") = "völlig unzutreffend"
attr(Testdaten$NA01_48,"2") = "unzutreffend"
attr(Testdaten$NA01_48,"3") = "weder noch"
attr(Testdaten$NA01_48,"4") = "zutreffend"
attr(Testdaten$NA01_48,"5") = "sehr zutreffend"
attr(Testdaten$NN01_01,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_01,"2") = "unzutreffend"
attr(Testdaten$NN01_01,"3") = "weder noch"
attr(Testdaten$NN01_01,"4") = "zutreffend"
attr(Testdaten$NN01_01,"5") = "sehr zutreffend"
attr(Testdaten$NN01_02,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_02,"2") = "unzutreffend"
attr(Testdaten$NN01_02,"3") = "weder noch"
attr(Testdaten$NN01_02,"4") = "zutreffend"
attr(Testdaten$NN01_02,"5") = "sehr zutreffend"
attr(Testdaten$NN01_03,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_03,"2") = "unzutreffend"
attr(Testdaten$NN01_03,"3") = "weder noch"
attr(Testdaten$NN01_03,"4") = "zutreffend"
attr(Testdaten$NN01_03,"5") = "sehr zutreffend"
attr(Testdaten$NN01_04,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_04,"2") = "unzutreffend"
attr(Testdaten$NN01_04,"3") = "weder noch"
attr(Testdaten$NN01_04,"4") = "zutreffend"
attr(Testdaten$NN01_04,"5") = "sehr zutreffend"
attr(Testdaten$NN01_05,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_05,"2") = "unzutreffend"
attr(Testdaten$NN01_05,"3") = "weder noch"
attr(Testdaten$NN01_05,"4") = "zutreffend"
attr(Testdaten$NN01_05,"5") = "sehr zutreffend"
attr(Testdaten$NN01_06,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_06,"2") = "unzutreffend"
attr(Testdaten$NN01_06,"3") = "weder noch"
attr(Testdaten$NN01_06,"4") = "zutreffend"
attr(Testdaten$NN01_06,"5") = "sehr zutreffend"
attr(Testdaten$NN01_07,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_07,"2") = "unzutreffend"
attr(Testdaten$NN01_07,"3") = "weder noch"
attr(Testdaten$NN01_07,"4") = "zutreffend"
attr(Testdaten$NN01_07,"5") = "sehr zutreffend"
attr(Testdaten$NN01_08,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_08,"2") = "unzutreffend"
attr(Testdaten$NN01_08,"3") = "weder noch"
attr(Testdaten$NN01_08,"4") = "zutreffend"
attr(Testdaten$NN01_08,"5") = "sehr zutreffend"
attr(Testdaten$NN01_09,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_09,"2") = "unzutreffend"
attr(Testdaten$NN01_09,"3") = "weder noch"
attr(Testdaten$NN01_09,"4") = "zutreffend"
attr(Testdaten$NN01_09,"5") = "sehr zutreffend"
attr(Testdaten$NN01_10,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_10,"2") = "unzutreffend"
attr(Testdaten$NN01_10,"3") = "weder noch"
attr(Testdaten$NN01_10,"4") = "zutreffend"
attr(Testdaten$NN01_10,"5") = "sehr zutreffend"
attr(Testdaten$NN01_11,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_11,"2") = "unzutreffend"
attr(Testdaten$NN01_11,"3") = "weder noch"
attr(Testdaten$NN01_11,"4") = "zutreffend"
attr(Testdaten$NN01_11,"5") = "sehr zutreffend"
attr(Testdaten$NN01_12,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_12,"2") = "unzutreffend"
attr(Testdaten$NN01_12,"3") = "weder noch"
attr(Testdaten$NN01_12,"4") = "zutreffend"
attr(Testdaten$NN01_12,"5") = "sehr zutreffend"
attr(Testdaten$NN01_13,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_13,"2") = "unzutreffend"
attr(Testdaten$NN01_13,"3") = "weder noch"
attr(Testdaten$NN01_13,"4") = "zutreffend"
attr(Testdaten$NN01_13,"5") = "sehr zutreffend"
attr(Testdaten$NN01_14,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_14,"2") = "unzutreffend"
attr(Testdaten$NN01_14,"3") = "weder noch"
attr(Testdaten$NN01_14,"4") = "zutreffend"
attr(Testdaten$NN01_14,"5") = "sehr zutreffend"
attr(Testdaten$NN01_15,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_15,"2") = "unzutreffend"
attr(Testdaten$NN01_15,"3") = "weder noch"
attr(Testdaten$NN01_15,"4") = "zutreffend"
attr(Testdaten$NN01_15,"5") = "sehr zutreffend"
attr(Testdaten$NN01_16,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_16,"2") = "unzutreffend"
attr(Testdaten$NN01_16,"3") = "weder noch"
attr(Testdaten$NN01_16,"4") = "zutreffend"
attr(Testdaten$NN01_16,"5") = "sehr zutreffend"
attr(Testdaten$NN01_17,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_17,"2") = "unzutreffend"
attr(Testdaten$NN01_17,"3") = "weder noch"
attr(Testdaten$NN01_17,"4") = "zutreffend"
attr(Testdaten$NN01_17,"5") = "sehr zutreffend"
attr(Testdaten$NN01_18,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_18,"2") = "unzutreffend"
attr(Testdaten$NN01_18,"3") = "weder noch"
attr(Testdaten$NN01_18,"4") = "zutreffend"
attr(Testdaten$NN01_18,"5") = "sehr zutreffend"
attr(Testdaten$NN01_19,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_19,"2") = "unzutreffend"
attr(Testdaten$NN01_19,"3") = "weder noch"
attr(Testdaten$NN01_19,"4") = "zutreffend"
attr(Testdaten$NN01_19,"5") = "sehr zutreffend"
attr(Testdaten$NN01_20,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_20,"2") = "unzutreffend"
attr(Testdaten$NN01_20,"3") = "weder noch"
attr(Testdaten$NN01_20,"4") = "zutreffend"
attr(Testdaten$NN01_20,"5") = "sehr zutreffend"
attr(Testdaten$NN01_21,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_21,"2") = "unzutreffend"
attr(Testdaten$NN01_21,"3") = "weder noch"
attr(Testdaten$NN01_21,"4") = "zutreffend"
attr(Testdaten$NN01_21,"5") = "sehr zutreffend"
attr(Testdaten$NN01_22,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_22,"2") = "unzutreffend"
attr(Testdaten$NN01_22,"3") = "weder noch"
attr(Testdaten$NN01_22,"4") = "zutreffend"
attr(Testdaten$NN01_22,"5") = "sehr zutreffend"
attr(Testdaten$NN01_23,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_23,"2") = "unzutreffend"
attr(Testdaten$NN01_23,"3") = "weder noch"
attr(Testdaten$NN01_23,"4") = "zutreffend"
attr(Testdaten$NN01_23,"5") = "sehr zutreffend"
attr(Testdaten$NN01_24,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_24,"2") = "unzutreffend"
attr(Testdaten$NN01_24,"3") = "weder noch"
attr(Testdaten$NN01_24,"4") = "zutreffend"
attr(Testdaten$NN01_24,"5") = "sehr zutreffend"
attr(Testdaten$NN01_25,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_25,"2") = "unzutreffend"
attr(Testdaten$NN01_25,"3") = "weder noch"
attr(Testdaten$NN01_25,"4") = "zutreffend"
attr(Testdaten$NN01_25,"5") = "sehr zutreffend"
attr(Testdaten$NN01_26,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_26,"2") = "unzutreffend"
attr(Testdaten$NN01_26,"3") = "weder noch"
attr(Testdaten$NN01_26,"4") = "zutreffend"
attr(Testdaten$NN01_26,"5") = "sehr zutreffend"
attr(Testdaten$NN01_27,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_27,"2") = "unzutreffend"
attr(Testdaten$NN01_27,"3") = "weder noch"
attr(Testdaten$NN01_27,"4") = "zutreffend"
attr(Testdaten$NN01_27,"5") = "sehr zutreffend"
attr(Testdaten$NN01_28,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_28,"2") = "unzutreffend"
attr(Testdaten$NN01_28,"3") = "weder noch"
attr(Testdaten$NN01_28,"4") = "zutreffend"
attr(Testdaten$NN01_28,"5") = "sehr zutreffend"
attr(Testdaten$NN01_29,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_29,"2") = "unzutreffend"
attr(Testdaten$NN01_29,"3") = "weder noch"
attr(Testdaten$NN01_29,"4") = "zutreffend"
attr(Testdaten$NN01_29,"5") = "sehr zutreffend"
attr(Testdaten$NN01_30,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_30,"2") = "unzutreffend"
attr(Testdaten$NN01_30,"3") = "weder noch"
attr(Testdaten$NN01_30,"4") = "zutreffend"
attr(Testdaten$NN01_30,"5") = "sehr zutreffend"
attr(Testdaten$NN01_31,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_31,"2") = "unzutreffend"
attr(Testdaten$NN01_31,"3") = "weder noch"
attr(Testdaten$NN01_31,"4") = "zutreffend"
attr(Testdaten$NN01_31,"5") = "sehr zutreffend"
attr(Testdaten$NN01_32,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_32,"2") = "unzutreffend"
attr(Testdaten$NN01_32,"3") = "weder noch"
attr(Testdaten$NN01_32,"4") = "zutreffend"
attr(Testdaten$NN01_32,"5") = "sehr zutreffend"
attr(Testdaten$NN01_33,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_33,"2") = "unzutreffend"
attr(Testdaten$NN01_33,"3") = "weder noch"
attr(Testdaten$NN01_33,"4") = "zutreffend"
attr(Testdaten$NN01_33,"5") = "sehr zutreffend"
attr(Testdaten$NN01_34,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_34,"2") = "unzutreffend"
attr(Testdaten$NN01_34,"3") = "weder noch"
attr(Testdaten$NN01_34,"4") = "zutreffend"
attr(Testdaten$NN01_34,"5") = "sehr zutreffend"
attr(Testdaten$NN01_35,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_35,"2") = "unzutreffend"
attr(Testdaten$NN01_35,"3") = "weder noch"
attr(Testdaten$NN01_35,"4") = "zutreffend"
attr(Testdaten$NN01_35,"5") = "sehr zutreffend"
attr(Testdaten$NN01_36,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_36,"2") = "unzutreffend"
attr(Testdaten$NN01_36,"3") = "weder noch"
attr(Testdaten$NN01_36,"4") = "zutreffend"
attr(Testdaten$NN01_36,"5") = "sehr zutreffend"
attr(Testdaten$NN01_37,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_37,"2") = "unzutreffend"
attr(Testdaten$NN01_37,"3") = "weder noch"
attr(Testdaten$NN01_37,"4") = "zutreffend"
attr(Testdaten$NN01_37,"5") = "sehr zutreffend"
attr(Testdaten$NN01_38,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_38,"2") = "unzutreffend"
attr(Testdaten$NN01_38,"3") = "weder noch"
attr(Testdaten$NN01_38,"4") = "zutreffend"
attr(Testdaten$NN01_38,"5") = "sehr zutreffend"
attr(Testdaten$NN01_39,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_39,"2") = "unzutreffend"
attr(Testdaten$NN01_39,"3") = "weder noch"
attr(Testdaten$NN01_39,"4") = "zutreffend"
attr(Testdaten$NN01_39,"5") = "sehr zutreffend"
attr(Testdaten$NN01_40,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_40,"2") = "unzutreffend"
attr(Testdaten$NN01_40,"3") = "weder noch"
attr(Testdaten$NN01_40,"4") = "zutreffend"
attr(Testdaten$NN01_40,"5") = "sehr zutreffend"
attr(Testdaten$NN01_41,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_41,"2") = "unzutreffend"
attr(Testdaten$NN01_41,"3") = "weder noch"
attr(Testdaten$NN01_41,"4") = "zutreffend"
attr(Testdaten$NN01_41,"5") = "sehr zutreffend"
attr(Testdaten$NN01_42,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_42,"2") = "unzutreffend"
attr(Testdaten$NN01_42,"3") = "weder noch"
attr(Testdaten$NN01_42,"4") = "zutreffend"
attr(Testdaten$NN01_42,"5") = "sehr zutreffend"
attr(Testdaten$NN01_43,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_43,"2") = "unzutreffend"
attr(Testdaten$NN01_43,"3") = "weder noch"
attr(Testdaten$NN01_43,"4") = "zutreffend"
attr(Testdaten$NN01_43,"5") = "sehr zutreffend"
attr(Testdaten$NN01_44,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_44,"2") = "unzutreffend"
attr(Testdaten$NN01_44,"3") = "weder noch"
attr(Testdaten$NN01_44,"4") = "zutreffend"
attr(Testdaten$NN01_44,"5") = "sehr zutreffend"
attr(Testdaten$NN01_45,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_45,"2") = "unzutreffend"
attr(Testdaten$NN01_45,"3") = "weder noch"
attr(Testdaten$NN01_45,"4") = "zutreffend"
attr(Testdaten$NN01_45,"5") = "sehr zutreffend"
attr(Testdaten$NN01_46,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_46,"2") = "unzutreffend"
attr(Testdaten$NN01_46,"3") = "weder noch"
attr(Testdaten$NN01_46,"4") = "zutreffend"
attr(Testdaten$NN01_46,"5") = "sehr zutreffend"
attr(Testdaten$NN01_47,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_47,"2") = "unzutreffend"
attr(Testdaten$NN01_47,"3") = "weder noch"
attr(Testdaten$NN01_47,"4") = "zutreffend"
attr(Testdaten$NN01_47,"5") = "sehr zutreffend"
attr(Testdaten$NN01_48,"1") = "völlig unzutreffend"
attr(Testdaten$NN01_48,"2") = "unzutreffend"
attr(Testdaten$NN01_48,"3") = "weder noch"
attr(Testdaten$NN01_48,"4") = "zutreffend"
attr(Testdaten$NN01_48,"5") = "sehr zutreffend"
attr(Testdaten$AE01_01,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_01,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_01,"3") = "teils-teils [2]"
attr(Testdaten$AE01_01,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_01,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_02,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_02,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_02,"3") = "teils-teils [2]"
attr(Testdaten$AE01_02,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_02,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_03,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_03,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_03,"3") = "teils-teils [2]"
attr(Testdaten$AE01_03,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_03,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_04,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_04,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_04,"3") = "teils-teils [2]"
attr(Testdaten$AE01_04,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_04,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_05,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_05,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_05,"3") = "teils-teils [2]"
attr(Testdaten$AE01_05,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_05,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_06,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_06,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_06,"3") = "teils-teils [2]"
attr(Testdaten$AE01_06,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_06,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_07,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_07,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_07,"3") = "teils-teils [2]"
attr(Testdaten$AE01_07,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_07,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_08,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_08,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_08,"3") = "teils-teils [2]"
attr(Testdaten$AE01_08,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_08,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_09,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_09,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_09,"3") = "teils-teils [2]"
attr(Testdaten$AE01_09,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_09,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_10,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_10,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_10,"3") = "teils-teils [2]"
attr(Testdaten$AE01_10,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_10,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_11,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_11,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_11,"3") = "teils-teils [2]"
attr(Testdaten$AE01_11,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_11,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_12,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_12,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_12,"3") = "teils-teils [2]"
attr(Testdaten$AE01_12,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_12,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_13,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_13,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_13,"3") = "teils-teils [2]"
attr(Testdaten$AE01_13,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_13,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_14,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_14,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_14,"3") = "teils-teils [2]"
attr(Testdaten$AE01_14,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_14,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_15,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_15,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_15,"3") = "teils-teils [2]"
attr(Testdaten$AE01_15,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_15,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_16,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_16,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_16,"3") = "teils-teils [2]"
attr(Testdaten$AE01_16,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_16,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_17,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_17,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_17,"3") = "teils-teils [2]"
attr(Testdaten$AE01_17,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_17,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_18,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_18,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_18,"3") = "teils-teils [2]"
attr(Testdaten$AE01_18,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_18,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_19,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_19,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_19,"3") = "teils-teils [2]"
attr(Testdaten$AE01_19,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_19,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_20,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_20,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_20,"3") = "teils-teils [2]"
attr(Testdaten$AE01_20,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_20,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_21,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_21,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_21,"3") = "teils-teils [2]"
attr(Testdaten$AE01_21,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_21,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_22,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_22,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_22,"3") = "teils-teils [2]"
attr(Testdaten$AE01_22,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_22,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_23,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_23,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_23,"3") = "teils-teils [2]"
attr(Testdaten$AE01_23,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_23,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_24,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_24,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_24,"3") = "teils-teils [2]"
attr(Testdaten$AE01_24,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_24,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_25,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_25,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_25,"3") = "teils-teils [2]"
attr(Testdaten$AE01_25,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_25,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_26,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_26,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_26,"3") = "teils-teils [2]"
attr(Testdaten$AE01_26,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_26,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_27,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_27,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_27,"3") = "teils-teils [2]"
attr(Testdaten$AE01_27,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_27,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_28,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_28,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_28,"3") = "teils-teils [2]"
attr(Testdaten$AE01_28,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_28,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_29,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_29,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_29,"3") = "teils-teils [2]"
attr(Testdaten$AE01_29,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_29,"5") = "trifft völlig zu [4]"
attr(Testdaten$AE01_30,"1") = "trifft gar nicht zu [0]"
attr(Testdaten$AE01_30,"2") = "trifft wenig zu [1]"
attr(Testdaten$AE01_30,"3") = "teils-teils [2]"
attr(Testdaten$AE01_30,"4") = "trifft ziemlich zu [3]"
attr(Testdaten$AE01_30,"5") = "trifft völlig zu [4]"
attr(Testdaten$SC01_01,"1") = "eher nicht [0]"
attr(Testdaten$SC01_01,"2") = "eher schon [1]"
attr(Testdaten$SC01_02,"1") = "eher nicht [0]"
attr(Testdaten$SC01_02,"2") = "eher schon [1]"
attr(Testdaten$SC01_03,"1") = "eher nicht [0]"
attr(Testdaten$SC01_03,"2") = "eher schon [1]"
attr(Testdaten$SC01_04,"1") = "eher nicht [0]"
attr(Testdaten$SC01_04,"2") = "eher schon [1]"
attr(Testdaten$SC01_05,"1") = "eher nicht [0]"
attr(Testdaten$SC01_05,"2") = "eher schon [1]"
attr(Testdaten$SC01_06,"1") = "eher nicht [0]"
attr(Testdaten$SC01_06,"2") = "eher schon [1]"
attr(Testdaten$SC01_07,"1") = "eher nicht [0]"
attr(Testdaten$SC01_07,"2") = "eher schon [1]"
attr(Testdaten$SC01_08,"1") = "eher nicht [0]"
attr(Testdaten$SC01_08,"2") = "eher schon [1]"
attr(Testdaten$SC01_09,"1") = "eher nicht [0]"
attr(Testdaten$SC01_09,"2") = "eher schon [1]"
attr(Testdaten$SC01_10,"1") = "eher nicht [0]"
attr(Testdaten$SC01_10,"2") = "eher schon [1]"
attr(Testdaten$SC01_11,"1") = "eher nicht [0]"
attr(Testdaten$SC01_11,"2") = "eher schon [1]"
attr(Testdaten$SC01_12,"1") = "eher nicht [0]"
attr(Testdaten$SC01_12,"2") = "eher schon [1]"
attr(Testdaten$SC01_13,"1") = "eher nicht [0]"
attr(Testdaten$SC01_13,"2") = "eher schon [1]"
attr(Testdaten$SC01_14,"1") = "eher nicht [0]"
attr(Testdaten$SC01_14,"2") = "eher schon [1]"
attr(Testdaten$SC01_15,"1") = "eher nicht [0]"
attr(Testdaten$SC01_15,"2") = "eher schon [1]"
attr(Testdaten$SC01_16,"1") = "eher nicht [0]"
attr(Testdaten$SC01_16,"2") = "eher schon [1]"
attr(Testdaten$SC01_17,"1") = "eher nicht [0]"
attr(Testdaten$SC01_17,"2") = "eher schon [1]"
attr(Testdaten$SC01_18,"1") = "eher nicht [0]"
attr(Testdaten$SC01_18,"2") = "eher schon [1]"
attr(Testdaten$SC01_19,"1") = "eher nicht [0]"
attr(Testdaten$SC01_19,"2") = "eher schon [1]"
attr(Testdaten$SC01_20,"1") = "eher nicht [0]"
attr(Testdaten$SC01_20,"2") = "eher schon [1]"
attr(Testdaten$SC01_21,"1") = "eher nicht [0]"
attr(Testdaten$SC01_21,"2") = "eher schon [1]"
attr(Testdaten$S201_01,"1") = "richtig"
attr(Testdaten$S201_01,"2") = "falsch"
attr(Testdaten$S201_02,"1") = "richtig"
attr(Testdaten$S201_02,"2") = "falsch"
attr(Testdaten$S201_03,"1") = "richtig"
attr(Testdaten$S201_03,"2") = "falsch"
attr(Testdaten$S201_04,"1") = "richtig"
attr(Testdaten$S201_04,"2") = "falsch"
attr(Testdaten$S201_05,"1") = "richtig"
attr(Testdaten$S201_05,"2") = "falsch"
attr(Testdaten$S201_06,"1") = "richtig"
attr(Testdaten$S201_06,"2") = "falsch"
attr(Testdaten$S201_07,"1") = "richtig"
attr(Testdaten$S201_07,"2") = "falsch"
attr(Testdaten$S201_08,"1") = "richtig"
attr(Testdaten$S201_08,"2") = "falsch"
attr(Testdaten$S201_09,"1") = "richtig"
attr(Testdaten$S201_09,"2") = "falsch"
attr(Testdaten$S201_10,"1") = "richtig"
attr(Testdaten$S201_10,"2") = "falsch"
attr(Testdaten$S201_11,"1") = "richtig"
attr(Testdaten$S201_11,"2") = "falsch"
attr(Testdaten$S201_12,"1") = "richtig"
attr(Testdaten$S201_12,"2") = "falsch"
attr(Testdaten$S201_13,"1") = "richtig"
attr(Testdaten$S201_13,"2") = "falsch"
attr(Testdaten$S201_14,"1") = "richtig"
attr(Testdaten$S201_14,"2") = "falsch"
attr(Testdaten$S201_15,"1") = "richtig"
attr(Testdaten$S201_15,"2") = "falsch"
attr(Testdaten$S201_16,"1") = "richtig"
attr(Testdaten$S201_16,"2") = "falsch"
attr(Testdaten$FINISHED,"F") = "abgebrochen"
attr(Testdaten$FINISHED,"T") = "ausgefüllt"
attr(Testdaten$Q_VIEWER,"F") = "Teilnehmer"
attr(Testdaten$Q_VIEWER,"T") = "Durchklicker"
comment(Testdaten$SERIAL) = "Seriennummer (sofern verwendet)"
comment(Testdaten$REF) = "Referenz (sofern im Link angegeben)"
comment(Testdaten$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(Testdaten$MODE) = "Interview-Modus"
comment(Testdaten$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(Testdaten$SD01) = "Geschlecht"
comment(Testdaten$SD02_01) = "Alter (direkt): 1"
comment(Testdaten$SD02_02) = "Alter (direkt): 1"
comment(Testdaten$SD02_03) = "Alter (direkt): 2"
comment(Testdaten$SD02_04) = "Alter (direkt): 2"
comment(Testdaten$SD02_05) = "Alter (direkt): 3"
comment(Testdaten$SD02_06) = "Alter (direkt): 3"
comment(Testdaten$SD02_07) = "Alter (direkt): 4"
comment(Testdaten$SD02_08) = "Alter (direkt): 5"
comment(Testdaten$SD02_09) = "Alter (direkt): 6"
comment(Testdaten$SD02_10) = "Alter (direkt): 7"
comment(Testdaten$SD02_11) = "Alter (direkt): 8"
comment(Testdaten$SD02_12) = "Alter (direkt): 9"
comment(Testdaten$SD02_13) = "Alter (direkt): 0"
comment(Testdaten$SD07) = "Abschluss"
comment(Testdaten$SD08_01) = "Abschlussnote:  ... (bitte tragen Sie hier Ihre Note oder Punkte ein)"
comment(Testdaten$SD09_01) = "Beruf/Studium: [01]"
comment(Testdaten$SD22) = "Befindlichkeit"
comment(Testdaten$BD02) = "Traurigkeit"
comment(Testdaten$BD03) = "Pessimismus"
comment(Testdaten$BD04) = "Versagensgefühle"
comment(Testdaten$BD05) = "Verlust von Freude"
comment(Testdaten$BD06) = "Schuldgefühle"
comment(Testdaten$BD07) = "Bestrafungsgefühle"
comment(Testdaten$BD08) = "Selbstablehnung"
comment(Testdaten$BD09) = "Selbstvorwürfe"
comment(Testdaten$BD10) = "Selbstmordgedanken"
comment(Testdaten$BD11) = "Weinen"
comment(Testdaten$BD12) = "Unruhe"
comment(Testdaten$BD13) = "Interessenverlust"
comment(Testdaten$BD14) = "Entschlussunfähigkeit"
comment(Testdaten$BD15) = "Wertlosigkeit"
comment(Testdaten$BD16) = "Energieverlust"
comment(Testdaten$BD17) = "Veränderung der Schlafgewohnheiten"
comment(Testdaten$BD18) = "Reizbarkeit"
comment(Testdaten$BD19) = "Veränderung des Appetits"
comment(Testdaten$BD20) = "Konzentrationsschwierigkeiten"
comment(Testdaten$BD21) = "Ermüdung und Erschöpfung"
comment(Testdaten$BD22) = "Verlust an sexuellem Interesse"
comment(Testdaten$SP02_01) = "SPS: Ich werde ängstlich, wenn ich vor anderen Personen schreiben muss"
comment(Testdaten$SP02_02) = "SPS: Ich werde verunsichert, wenn ich öffentliche Toiletten benutze"
comment(Testdaten$SP02_03) = "SPS: Es kann sein, daß mir plötzlich meine eigene Stimme bewusst wird, und wie andere mir zuhören"
comment(Testdaten$SP02_04) = "SPS: Wenn ich auf der Straße gehe, wer ich nervös, weil ich glaube, andere Leute starren mir nach"
comment(Testdaten$SP02_05) = "SPS: Ich befürchte, zu erröten, wenn ich mit anderen zusammen bin"
comment(Testdaten$SP02_06) = "SPS: Ich fühle mich befangen, wenn ich einen Raum betreten muß, in dem bereits andere Personen sitzen"
comment(Testdaten$SP02_07) = "SPS: Ich mache mir darüber Sorgen, daß ich zittern könnte, wenn ich von anderen Personen beobachtet werde"
comment(Testdaten$SP02_08) = "SPS: Ich würde angespannt werden, wenn ich im Bus oder Zug anderen Personen gegenübersitzen müßte"
comment(Testdaten$SP02_09) = "SPS: Ich bekomme Panik, wenn ich glaube, andere könnten sehen, wie ich ohnmächtig werde oder mir übel wird oder ich krank werde"
comment(Testdaten$SP02_10) = "SPS: Es würde mich schwer fallen, in einer Gruppe etwas zu trinken"
comment(Testdaten$SP02_11) = "SPS: Ich würde mich befangen fühlen, wenn ich vor einem Fremden in einem Restaurant essen müßte"
comment(Testdaten$SP02_12) = "SPS: Ich mache mir sorgen, daß andere mein Verhalten seltsam finden könnten"
comment(Testdaten$SP02_13) = "SPS: Ich würde angespannt werden, wenn ich ein Tablett durch eine gefüllte Cafeteria tragen müsste"
comment(Testdaten$SP02_14) = "SPS: Ich habe die Befürchtung, vor anderen die Kontrolle über mich zu verlieren"
comment(Testdaten$SP02_15) = "SPS: Ich mache mir Sorgen, daß ich etwas tun könnte, daß die Aufmerksamkeit andere auf mich zieht"
comment(Testdaten$SP02_16) = "SPS: Im Aufzug bin ich angespannt, wenn andere Leute mich anschauen"
comment(Testdaten$SP02_17) = "SPS: Wenn ich in einer Schlange stehe, kommt es vor, daß ich das Gefühl habe, aufzufallen"
comment(Testdaten$SP02_18) = "SPS: Manchmal werde ich angespannt, wenn ich vor anderen Leuten rede"
comment(Testdaten$SP02_19) = "SPS: Ich mache mir Sorgen, daß sich mein Kopf vor anderen schütteln könnte oder daß er nicken könnte"
comment(Testdaten$SP02_20) = "SPS: Ich fühle mich ungeschickt und angespannt, wenn ich weiß, daß andere mich beobachten"
comment(Testdaten$DE02_01) = "DES: ... werde ich hilflos im Umgang mit meinen Gefühlen sein."
comment(Testdaten$DE02_02) = "DES: ... wird es mir helfen, wenn ich Dinge tue, die mir gewöhnlich Spaß machen."
comment(Testdaten$DE02_03) = "DES: ... werde ich meine Stimmung beeinflussen können."
comment(Testdaten$DE02_04) = "DES: ... wird es mir gut tun, wenn ich mich körperlich schone."
comment(Testdaten$DE02_05) = "DES: ... werde ich mich besser fühlen, wenn ich mit jemandem über meine Probleme rede."
comment(Testdaten$DE02_06) = "DES: ... werde ich es nicht schaffen, irgendetwas zu leisten."
comment(Testdaten$DE03_01) = "DES: ... wird sie mich abweisen."
comment(Testdaten$DE04_01) = "DES: ... werde ich mich danach besser fühlen.*"
comment(Testdaten$DE04_02) = "DES: ... werden sie mich verstehen.*"
comment(Testdaten$DE04_03) = "DES: ... werden sie mich ausnutzen."
comment(Testdaten$DE04_04) = "DES: ... werden sie danach nichts mehr mit mir zu tun haben wollen."
comment(Testdaten$DE05_01) = "DES: ... werden andere dafür Verständnis haben."
comment(Testdaten$DE06_01) = "DES: ... wird mir das gelingen."
comment(Testdaten$DE06_02) = "DES: ... werde ich nette Leute kennenlernen."
comment(Testdaten$DE07_01) = "DES: ... wird es mir besser gehen, wenn ich mich ins Bett lege."
comment(Testdaten$DE07_02) = "DES: ... werde ich nichts tun können, um mich besser zu fühlen."
comment(Testdaten$DE08_01) = "DES: ... werde ich dabei versagen."
comment(Testdaten$DE08_02) = "DES: ... werde ich mich dabei kaum konzentrieren können."
comment(Testdaten$DE08_03) = "DES: ... werden meine Gedanken automatisch abschweifen."
comment(Testdaten$DE09_01) = "DES: ... wird mich niemand mehr mögen."
comment(Testdaten$DE09_02) = "DES: ... werden andere enttäuscht von mir sein."
comment(Testdaten$DE11_01) = "DES: Die meisten Leute werden mich so mögen, wie ich bin."
comment(Testdaten$DE11_02) = "DES: Ich werde mich für nichts interessieren können."
comment(Testdaten$DE11_03) = "DES: Wenn jemand in der Vergangenheit nicht gut zu mir war, wird das auch in Zukunft so sein."
comment(Testdaten$DE11_04) = "DES: Niemand wird für mich da sein, wenn ich um Hilfe bitte."
comment(Testdaten$NE01_01) = "NE: Die meisten Menschen, die mir begegnen, sind mir wirklich sympathisch."
comment(Testdaten$NE01_02) = "NE: Ich gehe Menschenansammlungen aus dem Weg."
comment(Testdaten$NE01_03) = "NE: Ich bin dominant, selbstsicher und durchsetzungsfähig."
comment(Testdaten$NE01_04) = "NE: Ich arbeite und spiele in einer gemächlichen Art."
comment(Testdaten$NE01_05) = "NE: Ich sehne mich häufig danach, mehr Aufregendes zu erleben."
comment(Testdaten$NE01_06) = "NE: Ich bin noch nie vor Freude wirklich in die Luft gesprungen."
comment(Testdaten$NE01_07) = "NE: Es macht mir nicht viel Spaß, mit anderen zu plaudern."
comment(Testdaten$NE01_08) = "NE: Ich habe gerne viele Leute um mich herum."
comment(Testdaten$NE01_09) = "NE: Manchmal kann ich mich nicht angemessen behaupten."
comment(Testdaten$NE01_10) = "NE: Wenn ich etwas mache, dann auch mit viel Elan."
comment(Testdaten$NE01_11) = "NE: Es würde mir keinen Spaß machen, in einer Stadt wie Las Vegas meinen Urlaub zu verbringen."
comment(Testdaten$NE01_12) = "NE: Manchmal habe ich eine intensive Freude oder Ekstase erfahren."
comment(Testdaten$NE01_13) = "NE: Ich bin als eine herzliche und freundliche Person bekannt."
comment(Testdaten$NE01_14) = "NE: Ich ziehe es gewöhnlich vor, Dinge allein zu tun."
comment(Testdaten$NE01_15) = "NE: Ich hatte oft eine führende Stellung in Gruppen, denen ich angehörte."
comment(Testdaten$NE01_16) = "NE: Ich arbeite meist langsam, aber stetig."
comment(Testdaten$NE01_17) = "NE: Manchmal habe ich etwas nur wegen des Nervenkitzels getan."
comment(Testdaten$NE01_18) = "NE: Ich bin kein gut gelaunter Optimist."
comment(Testdaten$NE01_19) = "NE: Viele Leute halten mich für etwas kühl und distanziert."
comment(Testdaten$NE01_20) = "NE: Wenn ich längere Zeit allein gewesen bin, habe ich ein starkes Bedürfnis, mit anderen Leuten zusammen zu sein."
comment(Testdaten$NE01_21) = "NE: Bei Versammlungen überlasse ich das Reden gewöhnlich anderen"
comment(Testdaten$NE01_22) = "NE: Ich habe oft das Gefühl, vor Energie überzuschäumen."
comment(Testdaten$NE01_23) = "NE: Ich vermeide es nach Möglichkeit, mir schockierende oder schaurige Filme anzusehen."
comment(Testdaten$NE01_24) = "NE: Manchmal sprudele ich vor Glück über."
comment(Testdaten$NE01_25) = "NE: Ich unterhalte mich wirklich gern mit anderen Menschen."
comment(Testdaten$NE01_26) = "NE: Ich bevorzuge Arbeiten, die ich alleine und ohne von anderen gestört zu werden erledigen kann."
comment(Testdaten$NE01_27) = "NE: Andere Menschen erwarten oft von mir, dass ich die Entscheidungen treffe."
comment(Testdaten$NE01_28) = "NE: Ich reagiere nicht so schnell und lebhaft wie andere."
comment(Testdaten$NE01_29) = "NE: Ich bin gerne im Zentrum des Geschehens."
comment(Testdaten$NE01_30) = "NE: Ich halte mich nicht für besonders fröhlich."
comment(Testdaten$NE01_31) = "NE: Ich finde es leicht zu lächeln und mit Fremden gut auszukommen"
comment(Testdaten$NE01_32) = "NE: Lieber würde ich an einem sehr belebten Strand als in einer einsamen Waldhütte Urlaub machen."
comment(Testdaten$NE01_33) = "NE: Lieber würde ich meine eigenen Wege gehen, als eine Gruppe anzuführen."
comment(Testdaten$NE01_34) = "NE: Ich mache gewöhnlich den Eindruck, in Eile zu sein."
comment(Testdaten$NE01_35) = "NE: Ich liebe die Aufregung von Achterbahnfahrten."
comment(Testdaten$NE01_36) = "NE: Ich bin ein fröhlicher, gut gelaunter Mensch."
comment(Testdaten$NE01_37) = "NE: Zu meinen Freunden habe ich starke gefühlsmäßige Bindungen."
comment(Testdaten$NE01_38) = "NE: Gesellige Zusammenkünfte finde ich meistens langweilig."
comment(Testdaten$NE01_39) = "NE: Bei Unterhaltungen rede ich selbst am meisten."
comment(Testdaten$NE01_40) = "NE: Ich führe ein hektisches Leben."
comment(Testdaten$NE01_41) = "NE: Leuchtende Farben und knallige Aufmachungen ziehen mich an."
comment(Testdaten$NE01_42) = "NE: Ich benutze selten Worte wie etwa \"phantastisch!\" oder \"sensationell!\", um meine Erlebnisse zu beschreiben."
comment(Testdaten$NE01_43) = "NE: An den Menschen, mit denen ich zusammenarbeite, bin ich auch persönlich interessiert."
comment(Testdaten$NE01_44) = "NE: Ich mag Partys mit vielen Leuten."
comment(Testdaten$NE01_45) = "NE: Es fällt mir schwer, eine führende Rolle zu übernehmen."
comment(Testdaten$NE01_46) = "NE: Ich bin ein sehr aktiver Mensch."
comment(Testdaten$NE01_47) = "NE: Ich mag es, Teil einer Menge bei Sportveranstaltungen zu sein."
comment(Testdaten$NE01_48) = "NE: Ich bin leicht zum Lachen zu bringen."
comment(Testdaten$NA01_01) = "NA: Im Hinblick auf die Absichten anderer bin ich eher zynisch und skeptisch."
comment(Testdaten$NA01_02) = "NA: Ich halte mich nicht für jemanden, der listig oder gerissen ist."
comment(Testdaten$NA01_03) = "NA: Manche Leute halten mich für selbstsüchtig und selbstgefällig."
comment(Testdaten$NA01_12) = "NA: Ich würde lieber mit anderen zusammenarbeiten, als mit ihnen zu wetteifern."
comment(Testdaten$NA01_04) = "NA: Es macht mir nichts aus, mit meinen Fähigkeiten und Leistungen anzugeben."
comment(Testdaten$NA01_05) = "NA: Politiker sollen sich mehr um die menschliche Seite ihrer Politik kümmern."
comment(Testdaten$NA01_06) = "NA: Ich glaube, dass die meisten Menschen im Grunde gute Absichten haben."
comment(Testdaten$NA01_07) = "NA: Um zu bekommen was ich will, bin ich notfalls bereit, Menschen zu manipulieren."
comment(Testdaten$NA01_08) = "NA: Ich versuche zu jedem, dem ich begegne, freundlich zu sein."
comment(Testdaten$NA01_09) = "NA: Wenn nötig, kann ich sarkastisch und spitz sein."
comment(Testdaten$NA01_10) = "NA: Ich möchte lieber nicht über mich selbst und meine Leistungen sprechen."
comment(Testdaten$NA01_11) = "NA: In Bezug auf meine Einstellungen bin ich nüchtern und unnachgiebig."
comment(Testdaten$NA01_13) = "NA: Ich glaube, dass man von den meisten Leuten ausgenutzt wird, wenn man es zulässt."
comment(Testdaten$NA01_14) = "NA: Ich könnte niemanden betrügen, selbst wenn ich es wollte."
comment(Testdaten$NA01_15) = "NA: Manche Leute halten mich für kalt und berechnend."
comment(Testdaten$NA01_16) = "NA: Ich zögere, meinen Ärger auszudrücken, selbst wenn dieser gerechtfertigt ist."
comment(Testdaten$NA01_17) = "NA: Ich bin besser als die meisten Menschen und das weiß ich auch."
comment(Testdaten$NA01_18) = "NA: Für arme und ältere Menschen kann man nie genug tun."
comment(Testdaten$NA01_19) = "NA: Ich glaube, dass die meisten Menschen, mit denen man zu tun hat, ehrlich und vertrauenswürdig sind."
comment(Testdaten$NA01_20) = "NA: Mit absoluter Ehrlichkeit kommt man im Geschäftsleben nicht weit."
comment(Testdaten$NA01_21) = "NA: Ich versuche, stets rücksichtsvoll und sensibel zu handeln."
comment(Testdaten$NA01_22) = "NA: Wenn ich Menschen nicht mag, so zeige ich ihnen das auch offen."
comment(Testdaten$NA01_23) = "NA: Ich bemühe mich, bescheiden zu sein."
comment(Testdaten$NA01_24) = "NA: Mit Bettlern habe ich kein Mitleid."
comment(Testdaten$NA01_25) = "NA: Ich werde misstrauisch, wenn mir jemand einen Gefallen tut."
comment(Testdaten$NA01_26) = "NA: Ich fände es schlimm, für einen Heuchler gehalten zu werden."
comment(Testdaten$NA01_27) = "NA: Ich bin nicht gerade für meine Großzügigkeit bekannt."
comment(Testdaten$NA01_28) = "NA: Wenn man mich verletzt hat, versuche ich, das Geschehene zu vergeben und zu vergessen."
comment(Testdaten$NA01_29) = "NA: Ich habe eine sehr hohe Meinung von mir selbst."
comment(Testdaten$NA01_30) = "NA: Menschliche Bedürfnisse sollten immer Vorrang vor wirtschaftlichen Überlegungen haben."
comment(Testdaten$NA01_31) = "NA: Meine erste Reaktion ist es, Menschen zu vertrauen."
comment(Testdaten$NA01_32) = "NA: Manchmal beeinflusse ich die Leute derart, dass sie das tun, was ich wünsche."
comment(Testdaten$NA01_33) = "NA: Die meisten Menschen, die ich kenne, mögen mich."
comment(Testdaten$NA01_34) = "NA: Wenn jemand einen Streit anzettelt, bin ich bereit zurückzuschlagen."
comment(Testdaten$NA01_35) = "NA: Ich fühle mich anderen Menschen gegenüber nicht überlegen, egal in welcher Situation sie sich befinden."
comment(Testdaten$NA01_36) = "NA: Ich treffe nur selten voreilige Entscheidungen."
comment(Testdaten$NA01_37) = "NA: Ich neige dazu, von anderen das Beste zu nehmen."
comment(Testdaten$NA01_38) = "NA: Manchmal setze ich Leuten zu oder schmeichle ihnen, damit sie tun, was ich will."
comment(Testdaten$NA01_39) = "NA: Ich halte mich für einen großherzigen Menschen."
comment(Testdaten$NA01_40) = "NA: Ich bin ziemlich hartnäckig und dickköpfig."
comment(Testdaten$NA01_41) = "NA: Ich verteile lieber Lob an andere, als dass ich selber gelobt werden will."
comment(Testdaten$NA01_42) = "NA: Ich empfinde Mitgefühl für Menschen, denen es weniger gut geht als mir."
comment(Testdaten$NA01_43) = "NA: Ich habe ziemlich viel Vertrauen in die menschliche Natur."
comment(Testdaten$NA01_44) = "NA: Ich bin stolz auf meine große Geschicklichkeit im Umgang mit Menschen."
comment(Testdaten$NA01_45) = "NA: Ich unterbreche meine Tätigkeiten, um anderen soweit wie möglich zu helfen."
comment(Testdaten$NA01_46) = "NA: Ich bekomme häufiger Streit mit meiner Familie und meinen Kollegen."
comment(Testdaten$NA01_47) = "NA: Ich glaube, dass ich anderen überlegen bin."
comment(Testdaten$NA01_48) = "NA: Ich wäre lieber als gütig denn als gerecht bekannt."
comment(Testdaten$NN01_01) = "NN: Ich bin nicht leicht beunruhigt."
comment(Testdaten$NN01_02) = "NN: Ich ärgere mich oft darüber, wie andere Leute mich behandeln."
comment(Testdaten$NN01_03) = "NN: Ich fühle mich selten einsam oder traurig."
comment(Testdaten$NN01_04) = "NN: Im Umgang mit anderen befürchte ich häufig, dass ich unangenehm auffallen könnte."
comment(Testdaten$NN01_05) = "NN: Ich lasse mich selten zu übermäßig auf etwas ein."
comment(Testdaten$NN01_06) = "NN: Ich fühle mich oft hilflos und wünsche mir eine Person, die meine Probleme löst."
comment(Testdaten$NN01_07) = "NN: Ich bin leicht zu erschrecken."
comment(Testdaten$NN01_08) = "NN: Ich bin ein Mensch mit ausgeglichenem Temperament."
comment(Testdaten$NN01_09) = "NN: Manchmal fühle ich mich völlig wertlos."
comment(Testdaten$NN01_10) = "NN: Ich bin selten verlegen, wenn ich unter Leuten bin."
comment(Testdaten$NN01_11) = "NN: Ich habe Schwierigkeiten, meinen Begierden zu widerstehen."
comment(Testdaten$NN01_12) = "NN: Ich fühle mich fähig, die meisten meiner Probleme zu bewältigen."
comment(Testdaten$NN01_13) = "NN: Ich empfinde selten Furcht oder Angst."
comment(Testdaten$NN01_14) = "NN: Man hält mich für einen leicht aufbrausenden, temperamentvollen Menschen."
comment(Testdaten$NN01_15) = "NN: Ich bin selten traurig oder deprimiert."
comment(Testdaten$NN01_16) = "NN: Manchmal war mir etwas so peinlich, dass ich mich am liebsten versteckt hätte."
comment(Testdaten$NN01_17) = "NN: Ich habe wenig Schwierigkeiten, Versuchungen zu widerstehen."
comment(Testdaten$NN01_18) = "NN: Wenn ich unter starkem Stress stehe, fühle ich mich manchmal als ob ich zusammenbreche."
comment(Testdaten$NN01_19) = "NN: Ich fühle mich oft angespannt und nervös."
comment(Testdaten$NN01_20) = "NN: Man hält mich nicht für eine reizbare oder leicht erregbare Person."
comment(Testdaten$NN01_21) = "NN: Ich empfinde manchmal ein tiefes Gefühl von Schuld oder Sünde."
comment(Testdaten$NN01_22) = "NN: Es bringt mich nicht besonders in Verlegenheit, wenn andere mich verspotten oder lächerlich machen."
comment(Testdaten$NN01_23) = "NN: Ich esse meist zu viel von meinen Lieblingsspeisen."
comment(Testdaten$NN01_24) = "NN: In Notsituationen bewahre ich einen kühlen Kopf."
comment(Testdaten$NN01_25) = "NN: Ich bin selten beunruhigt über die Zukunft."
comment(Testdaten$NN01_26) = "NN: Häufig mag ich die Leute nicht, mit denen ich mich abgeben muss."
comment(Testdaten$NN01_27) = "NN: Ich neige dazu, mir Vorwürfe zu machen, wenn irgendetwas schief geht."
comment(Testdaten$NN01_28) = "NN: Ich fühle mich anderen oft unterlegen."
comment(Testdaten$NN01_29) = "NN: Ich gebe selten meinen spontanen Gefühlen nach."
comment(Testdaten$NN01_30) = "NN: Ich kann mich oft schwer entschließen."
comment(Testdaten$NN01_31) = "NN: Ich bin häufig beunruhigt über Dinge, die schief gehen könnten."
comment(Testdaten$NN01_32) = "NN: Es muss schon viel geschehen, damit ich aus der Fassung gerate."
comment(Testdaten$NN01_33) = "NN: Ich halte nicht viel von mir selbst."
comment(Testdaten$NN01_34) = "NN: In Gegenwart meiner Chefs oder anderer Autoritäten fühle ich mich wohl."
comment(Testdaten$NN01_35) = "NN: Manchmal esse ich, bis mir schlecht wird."
comment(Testdaten$NN01_36) = "NN: In Krisensituationen habe ich mich selbst ziemlich gut im Griff."
comment(Testdaten$NN01_37) = "NN: Ich habe weniger Ängste als die meisten anderen Menschen."
comment(Testdaten$NN01_38) = "NN: Schon zu verschiedenen Zeitpunkten bin ich verärgert oder verbittert gewesen."
comment(Testdaten$NN01_39) = "NN: Manchmal erscheint mir alles ziemlich düster und hoffnungslos."
comment(Testdaten$NN01_40) = "NN: Wenn ich einer Person etwas Falsches gesagt oder angetan habe, kann ich es kaum ertragen, ihr noch einmal zu begegnen."
comment(Testdaten$NN01_41) = "NN: Manchmal handele ich aus einem spontanen Gefühl heraus und bereue es später."
comment(Testdaten$NN01_42) = "NN: Auch wenn alles schief zu gehen scheint, kann ich immer noch gute Entscheidungen treffen."
comment(Testdaten$NN01_43) = "NN: Manchmal kommen mir furchterregende Gedanken in den Sinn."
comment(Testdaten$NN01_44) = "NN: Selbst kleinere Ärgernisse können mich frustrieren."
comment(Testdaten$NN01_45) = "NN: Zu häufig bin ich entmutigt und will aufgeben, wenn etwas schief geht."
comment(Testdaten$NN01_46) = "NN: Wenn meine Bekannten dummen Unfug treiben, so ist mir das peinlich."
comment(Testdaten$NN01_47) = "NN: Ich bin stets in der Lage, meine Gefühle unter Kontrolle zu halten."
comment(Testdaten$NN01_48) = "NN: Ich bin gefühlsmäßig ziemlich stabil."
comment(Testdaten$AE01_01) = "MAE: Ich arbeite selbst dann an einer Aufgabe weiter, wenn ich sehr müde bin."
comment(Testdaten$AE01_02) = "MAE: Ich bin oft ohne besonderen Grund glücklich und zufrieden."
comment(Testdaten$AE01_03) = "MAE: Ich dominiere Gespräche oft sehr stark."
comment(Testdaten$AE01_04) = "MAE: Die meiste Zeit fühle ich mich „im Frieden mit der Welt“."
comment(Testdaten$AE01_05) = "MAE: Ich mag harte Arbeit."
comment(Testdaten$AE01_06) = "MAE: Wenn ich mit anderen zusammenarbeite, übernehme ich gerne die Verantwortung."
comment(Testdaten$AE01_07) = "MAE: Ich halte mich nicht für besonders fröhlich."
comment(Testdaten$AE01_08) = "MAE: Ich arbeite, ohne zu übertreiben, und nur so viel, um gerade zurechtzukommen."
comment(Testdaten$AE01_09) = "MAE: Es fällt mir sehr leicht, die heiteren und strahlenden Seiten des Lebens zu sehen."
comment(Testdaten$AE01_10) = "MAE: Ich bringe oft Leben in eine Party."
comment(Testdaten$AE01_11) = "MAE: Ich bin keine schrecklich ehrgeizige Person."
comment(Testdaten$AE01_12) = "MAE: Ich bin von Natur aus fröhlich."
comment(Testdaten$AE01_13) = "MAE: Ich bin ziemlich gut darin, andere zu überzeugen, die Dinge so zu sehen wie ich."
comment(Testdaten$AE01_14) = "MAE: Ich gehe gern an schwierige Aufgaben heran."
comment(Testdaten$AE01_15) = "MAE: In Gesellschaft bin ich nicht besonders darauf aus, im Vordergrund zu stehen."
comment(Testdaten$AE01_16) = "MAE: Ich habe Schwierigkeiten, mich dazu zu bringen, das zu tun, was ich tun sollte."
comment(Testdaten$AE01_17) = "MAE: Ich habe eine Reihe von klaren Zielen und arbeite systematisch auf sie zu."
comment(Testdaten$AE01_18) = "MAE: Meine Zukunft erscheint mir sehr hell und strahlend."
comment(Testdaten$AE01_19) = "MAE: Ich hatte oft eine führende Stellung in Gruppen, denen ich angehörte."
comment(Testdaten$AE01_20) = "MAE: An den meisten Tagen habe ich Augenblicke voller Freude und Vergnügen."
comment(Testdaten$AE01_21) = "MAE: Bei Versammlungen überlasse ich das Reden gewöhnlich anderen."
comment(Testdaten$AE01_22) = "MAE: Ich fordere mich selbst bis an meine Grenzen."
comment(Testdaten$AE01_23) = "MAE: Ich bin dominant, selbstsicher und durchsetzungsfähig."
comment(Testdaten$AE01_24) = "MAE: Ich bin kein gutgelaunter Optimist."
comment(Testdaten$AE01_25) = "MAE: Wenn ein Vorhaben sich als zu schwierig erweist, neige ich dazu, etwas neues anzufangen."
comment(Testdaten$AE01_26) = "MAE: Ich habe Spaß an fast allem, was ich tue."
comment(Testdaten$AE01_27) = "MAE: Bei Unterhaltungen rede ich selbst am meisten."
comment(Testdaten$AE01_28) = "MAE: Bei allem, was ich tue, strebe ich nach Perfektion."
comment(Testdaten$AE01_29) = "MAE: Ich finde, dass es sehr leicht ist, das Leben zu genießen."
comment(Testdaten$AE01_30) = "MAE: Ich kann Leute sehr gut beeinflussen."
comment(Testdaten$SC01_01) = "MPQ-SC: Gewöhnlich verbringe ich meine Freizeit lieber mit Freunden als allein."
comment(Testdaten$SC01_02) = "MPQ-SC: Ich könnte allein in einer Hütte im Wald oder in den Bergen glücklich leben."
comment(Testdaten$SC01_03) = "MPQ-SC: Wenn ich über etwas unglücklich bin, suche ich den Kontakt zu einem Freund oder einer Freundin und vermeide möglichst das Alleinsein."
comment(Testdaten$SC01_04) = "MPQ-SC: Ich ziehe es vor, nicht zu viel Persönliches von mir zu erzählen, nicht einmal Freunden."
comment(Testdaten$SC01_05) = "MPQ-SC: Ich bin eher eine warmherzige als eine kühle und distanzierte Persönlichkeit."
comment(Testdaten$SC01_06) = "MPQ-SC: Ich bin im Allgemeinen glücklicher, wenn ich allein bin."
comment(Testdaten$SC01_07) = "MPQ-SC: Ich arbeite lieber mit Leuten zusammen als allein."
comment(Testdaten$SC01_08) = "MPQ-SC: Ich habe wenige oder gar keine Freunde."
comment(Testdaten$SC01_09) = "MPQ-SC: Im Vergleich zu anderen bin ich eher ein Einzelgänger."
comment(Testdaten$SC01_10) = "MPQ-SC: Oft bin ich einen ganzen Vormittag lang kaum für andere ansprechbar."
comment(Testdaten$SC01_11) = "MPQ-SC: Eine der schönsten Erfahrungen ist für mich das angenehme Gefühl, mit einer Gruppe guter Freunde zusammen zu sein."
comment(Testdaten$SC01_12) = "MPQ-SC: Ich ziehe es vor, allein zu arbeiten."
comment(Testdaten$SC01_13) = "MPQ-SC: Ich würde lieber in einem freundlichen Vorort als allein im Wald leben."
comment(Testdaten$SC01_14) = "MPQ-SC: Wenn ich ein Problem habe, ziehe ich es vor, allein damit fertig zu werden."
comment(Testdaten$SC01_15) = "MPQ-SC: Es fällt mir leicht, für einen Menschen Zuneigung zu empfinden."
comment(Testdaten$SC01_16) = "MPQ-SC: Ich bin eher zurückhaltend und halte Distanz zu anderen."
comment(Testdaten$SC01_17) = "MPQ-SC: Ich bin am glücklichsten, wenn ich die meiste Zeit unter Menschen bin."
comment(Testdaten$SC01_18) = "MPQ-SC: Ich neige dazu, meine Probleme für mich zu behalten."
comment(Testdaten$SC01_19) = "MPQ-SC: Ich ziehe es vor, keine Menschen um mich zu haben."
comment(Testdaten$SC01_20) = "MPQ-SC: Ohne enge Beziehungen zu anderen wäre mein Leben weitaus weniger erfreulich."
comment(Testdaten$SC01_21) = "MPQ-SC: Ich könnte alles aufgeben, mein Zuhause, meine Eltern und meine Freunde, ohne es sehr zu bedauern."
comment(Testdaten$CD01_01) = "Code: [01]"
comment(Testdaten$S201_01) = "SES-17_alternativ: Manchmal werfe ich Müll einfach in die Landschaft oder auf die Straße."
comment(Testdaten$S201_02) = "SES-17_alternativ: Eigene Fehler gebe ich stets offen zu und ertrage gelassen etwaige negative Konsequenzen."
comment(Testdaten$S201_03) = "SES-17_alternativ: Im Straßenverkehr nehme ich stets Rücksicht auf die anderen Verkehrsteilnehmer."
comment(Testdaten$S201_04) = "SES-17_alternativ: Ich akzeptiere alle anderen Meinungen, auch wenn sie mit meiner eigenen nicht übereinstimmen."
comment(Testdaten$S201_05) = "SES-17_alternativ: Meine Wut oder schlechte Laune lasse ich hin und wieder an unschuldigen oder schwächeren Leuten aus."
comment(Testdaten$S201_06) = "SES-17_alternativ: Ich habe schon einmal jemanden ausgenutzt oder übers Ohr gehauen."
comment(Testdaten$S201_07) = "SES-17_alternativ: In einem Gespräch lasse ich den anderen stets ausreden und höre ihm aufmerksam zu."
comment(Testdaten$S201_08) = "SES-17_alternativ: Ich zögere niemals, jemandem in einer Notlage beizustehen."
comment(Testdaten$S201_09) = "SES-17_alternativ: Wenn ich etwas versprochen habe, halte ich es ohne Wenn und Aber."
comment(Testdaten$S201_10) = "SES-17_alternativ: Ich lästere gelegentlich über andere hinter deren Rücken."
comment(Testdaten$S201_11) = "SES-17_alternativ: Ich würde niemals auf Kosten der Allgemeinheit leben."
comment(Testdaten$S201_12) = "SES-17_alternativ: Ich bleibe immer freundlich und zuvorkommend anderen Leuten gegenüber, auch wenn ich selbst gestresst bin."
comment(Testdaten$S201_13) = "SES-17_alternativ: Im Streit bleibe ich stets sachlich und objektiv."
comment(Testdaten$S201_14) = "SES-17_alternativ: Ich habe schon einmal geliehene Sachen nicht zurückgegeben."
comment(Testdaten$S201_15) = "SES-17_alternativ: Ich ernähre mich stets gesund."
comment(Testdaten$S201_16) = "SES-17_alternativ: Manchmal helfe ich nur, weil ich eine Gegenleistung erwarte."
comment(Testdaten$TIME001) = "Verweildauer Seite 1"
comment(Testdaten$TIME002) = "Verweildauer Seite 2"
comment(Testdaten$TIME003) = "Verweildauer Seite 3"
comment(Testdaten$TIME004) = "Verweildauer Seite 4"
comment(Testdaten$TIME005) = "Verweildauer Seite 5"
comment(Testdaten$TIME006) = "Verweildauer Seite 6"
comment(Testdaten$TIME007) = "Verweildauer Seite 7"
comment(Testdaten$TIME008) = "Verweildauer Seite 8"
comment(Testdaten$TIME009) = "Verweildauer Seite 9"
comment(Testdaten$TIME010) = "Verweildauer Seite 10"
comment(Testdaten$TIME011) = "Verweildauer Seite 11"
comment(Testdaten$TIME012) = "Verweildauer Seite 12"
comment(Testdaten$TIME_SUM) = "Verweildauer gesamt (ohne Ausreißer)"
comment(Testdaten$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur für nicht-anonyme Adressaten)"
comment(Testdaten$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geändert wurde"
comment(Testdaten$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(Testdaten$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(Testdaten$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(Testdaten$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(Testdaten$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(Testdaten$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(Testdaten$TIME_RSI) = "Maluspunkte für schnelles Ausfüllen"
comment(Testdaten$DEG_TIME) = "Maluspunkte für schnelles Ausfüllen"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
Testdaten_tmp = data.frame(
  lapply(Testdaten, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(Testdaten_tmp) = attributes(Testdaten)
Testdaten = Testdaten_tmp
rm(Testdaten_tmp)

survey <- Testdaten

# drop irrelevant variables 
drop <- c("SERIAL", "REF", "QUESTNNR", "MODE", "STARTED",
          "TIME001", "TIME002", "TIME003", "TIME004", "TIME005",
          "TIME006", "TIME007", "TIME008", "TIME009", "TIME010",
          "TIME011", "TIME012", "TIME_SUM", "MAILSENT", "LASTDATA",
          "FINISHED", "Q_VIEWER", "LASTPAGE", "MAXPAGE", "MISSING",
          "MISSREL", "TIME_RSI", "DEG_TIME")
survey <-  select(survey, -drop)

survey <- mutate(survey, bdi = BD02 + BD03 + BD04 +
                                BD05 + BD06 + BD07 +
                                BD08 + BD09 + BD10 + 
                                BD11 + BD12 + BD13 + 
                                BD14 + BD15 + BD16 + 
                                BD17 + BD18 + BD19 +
                                BD20 + BD21 + BD22,
                         sps = SP02_01 + SP02_02 + 
                                SP02_03 + SP02_04 +
                                SP02_05 + SP02_06 + 
                                SP02_07 + SP02_08 + 
                                SP02_09 + SP02_10 + 
                                SP02_11 + SP02_12 +
                                SP02_13 + SP02_14 + 
                                SP02_15 + SP02_16 + 
                                SP02_17 + SP02_18 + 
                                SP02_19 + SP02_20, 
                          DES = DE02_01 + DE02_02 - 
                                DE02_03 + DE02_04 - 
                                DE02_05 - DE02_06 + 
                                DE03_01 - DE04_01 - 
                                DE04_02 + DE04_03 + 
                                DE04_04 + DE05_01 - 
                                DE06_01 - DE06_02 + 
                                DE07_01 + DE07_02 + 
                                DE08_01 + DE08_02 +
                                DE08_03 + DE09_01 + 
                                DE09_02 - DE11_01 + 
                                DE11_02 + DE11_03 +
                                DE11_04,
                        NE1 =   NE01_01 - NE01_07 +
                                NE01_13 - NE01_19 +
                                NE01_25 + NE01_31 + 
                                NE01_37 + NE01_43,
                        NE2 = - NE01_02 + NE01_08 -
                                NE01_14 + NE01_20 -
                                NE01_26 + NE01_32 - 
                                NE01_38 + NE01_44,
                        NE3 =   NE01_03 - NE01_09 + 
                                NE01_15 - NE01_21 + 
                                NE01_27 - NE01_33 +
                                NE01_39 - NE01_45,
                        NE4 = - NE01_04 + NE01_10 - 
                                NE01_16 + NE01_22 -
                                NE01_28 + NE01_34 + 
                                NE01_40 + NE01_46,
                        NE5 =   NE01_05 - NE01_11 + 
                                NE01_17 - NE01_23 +
                                NE01_29 + NE01_35 +
                                NE01_41 + NE01_47,
                        NE6 = - NE01_06 + NE01_12 - 
                                NE01_18 + NE01_24 - 
                                NE01_30 + NE01_36 - 
                                NE01_42 + NE01_48,
                        extra = NE1 + NE2 + NE3 + 
                                NE4 + NE5 + NE6,
                        NA1 = - NA01_01 + NA01_07 - 
                                NA01_13 + NA01_19 -
                                NA01_25 + NA01_31 +
                                NA01_37 + NA01_43,
                        NA2 =   NA01_02 - NA01_08 +
                                NA01_14 - NA01_20 + 
                                NA01_26 - NA01_32 - 
                                NA01_38 - NA01_44,
                        NA3 = - NA01_03 + NA01_09 - 
                                NA01_15 + NA01_21 - 
                                NA01_27 + NA01_33 + 
                                NA01_39 + NA01_45, 
                        NA4 =   NA01_04 - NA01_10 + 
                                NA01_16 - NA01_22 + 
                                NA01_28 - NA01_34 - 
                                NA01_40 - NA01_46,
                        NA5 = - NA01_05 + NA01_11 -
                                NA01_17 + NA01_23 - 
                                NA01_29 + NA01_35 + 
                                NA01_41 - NA01_47,
                        NA6 =   NA01_06 - NA01_12 + 
                                NA01_18 - NA01_24 + 
                                NA01_30 + NA01_36 + 
                                NA01_42 + NA01_48,
                        affil = NA1 + NA2 + NA3 + 
                                NA4 + NA5 + NA6, 
                        NN1 = - NN01_01 + NN01_07 -
                                NN01_13 + NN01_19 - 
                                NN01_25 + NN01_31 - 
                                NN01_37 + NN01_43, 
                        NN2 =   NN01_02 - NN01_08 + 
                                NN01_14 - NN01_20 + 
                                NN01_26 - NN01_32 + 
                                NN01_38 + NN01_44,
                        NN3 = - NN01_03 + NN01_09 - 
                                NN01_15 + NN01_21 + 
                                NN01_27 - NN01_33 + 
                                NN01_39 + NN01_45,
                        NN4 =   NN01_04 - NN01_10 + 
                                NN01_16 - NN01_22 + 
                                NN01_28 - NN01_34 +
                                NN01_40 + NN01_46,
                        NN5 = - NN01_05 + NN01_11 -
                                NN01_17 + NN01_23 - 
                                NN01_29 + NN01_35 + 
                                NN01_41 + NN01_47,
                        NN6 =   NN01_06 - NN01_12 + 
                                NN01_18 - NN01_24 +
                                NN01_30 - NN01_36 -
                                NN01_42 - NN01_48,
                      neuro =   NN1 + NN2 + NN3 + 
                                NN4 + NN5 + NN6,
                         sc =   SC01_01 - SC01_02 + SC01_03 - 
                                SC01_04 + SC01_05 - SC01_06 + 
                                SC01_07 - SC01_08 - SC01_09 - 
                                SC01_10 + SC01_11 - SC01_12 + 
                                SC01_13 - SC01_14 + SC01_15 -
                                SC01_16 + SC01_17 - SC01_18 - 
                                SC01_19 + SC01_20 - SC01_21,
                        wb =    AE01_02 + AE01_04 - AE01_07 + 
                                AE01_09 + AE01_12 + AE01_18 + 
                                AE01_20 - AE01_24 + AE01_26 + 
                                AE01_29,
                    achiev =    AE01_01 + AE01_05 - AE01_08 - 
                                AE01_11 + AE01_14 - AE01_16 + 
                                AE01_17 + AE01_22 - AE01_25 + 
                                AE01_28,
                        sp =    AE01_03 + AE01_06 + AE01_10 + 
                                AE01_13 - AE01_15 + AE01_19 - 
                                AE01_21 + AE01_23 + AE01_27 + 
                                AE01_30,
                       mae =    wb + achiev + sp
                       )
survey["7", "mae"] <- 38
row_remove <- c("1", "2", "3" , "4", "5",
                "8", "15", "17", "22", "25",
                "34")
survey <- survey[!(row.names(survey) %in% row_remove), ]
survey["id"] <- NA
survey["first"] <- NA
survey["age"] <- NA
#---------add id keys---------#
survey["6", "id"] <- 1002
survey["7", "id"] <- 1003
survey["10", "id"] <- 1004
survey["11", "id"] <- 1005
survey["12", "id"] <- 1006
survey["13", "id"] <- 1007
survey["14", "id"] <- 1008
survey["16", "id"] <- 1009
survey["9", "id"] <- 1010
survey["21", "id"] <- 1011
survey["23", "id"] <- 1012
survey["19", "id"] <- 1013
survey["28", "id"] <- 1014
survey["24", "id"] <- 1015
survey["26", "id"] <- 1016
survey["20", "id"] <- 1017
survey["30", "id"] <- 1018
survey["29", "id"] <- 1019
survey["27", "id"] <- 1020
survey["31", "id"] <- 1021
survey["32", "id"] <- 1022
survey["33", "id"] <- 1023
survey["18", "id"] <- 1024
survey["35", "id"] <- 1027
survey["36", "id"] <- 1028

survey <- survey %>% select("id", everything())
#-----add order of conditions----------#
survey["6", "first"] <- "pos"
survey["7", "first"] <- "neg"
survey["10", "first"] <- "pos"
survey["11", "first"] <- "neg"
survey["12", "first"] <- "pos"
survey["13", "first"] <- "neg"
survey["14", "first"] <- "pos"
survey["16", "first"] <- "neg"
survey["9", "first"] <- "pos"
survey["21", "first"] <- "pos"
survey["23", "first"] <- "neg"
survey["19", "first"] <- "pos"
survey["28", "first"] <- "neg"
survey["24", "first"] <- "pos"
survey["26", "first"] <- "neg"
survey["20", "first"] <- "pos"
survey["30", "first"] <- "neg"
survey["29", "first"] <- "pos"
survey["27", "first"] <- "neg"
survey["31", "first"] <- "pos"
survey["32", "first"] <- "neg"
survey["33", "first"] <- "pos"
survey["18", "first"] <- "neg"
survey["35", "first"] <- "pos"
survey["36", "first"] <- "neg"

#--add age-----------------#
survey["6", "age"] <- 26
survey["7", "age"] <- 19
survey["10", "age"] <- 20
survey["11", "age"] <- 20
survey["12", "age"] <- 24
survey["13", "age"] <- 23
survey["14", "age"] <- 20
survey["16", "age"] <- 21
 survey["9", "age"] <- 19
survey["21", "age"] <- 23
survey["23", "age"] <- 21
survey["19", "age"] <- 21
survey["28", "age"] <- 33
survey["24", "age"] <- 23
survey["26", "age"] <- 19
survey["20", "age"] <- 21
survey["30", "age"] <- 36
survey["29", "age"] <- 20
survey["27", "age"] <- 21
survey["31", "age"] <- 22
survey["32", "age"] <- 22
survey["33", "age"] <- 25
survey["18", "age"] <- 20
survey["35", "age"] <- 26
survey["36", "age"] <- 22

keep <- c("id", "SD01", "SD07", "SD08_01", "SD09_01", "SD22",
          "bdi", "sps", "DES", "extra", "affil", "neuro", "sc",
          "mae", "first", "age")
survey <- survey[keep]



## 1. removed entries in linneaus.csv data that had no species
clean_linneaus=linneaus[c(1:294, 296:367, 369:474, 476:495, 497:538),]
## saved to data folder
write.csv(clean_linneaus, file="clean_linneaus.csv")

## 2. grouped factors into categories
## create new column by using micro-habitat data
clean_linneaus$Habitat_groups=(clean_linneaus$`Micro-habitat`)
## set data to as factor
clean_linneaus$Habitat_groups=as.factor(clean_linneaus$Habitat_groups)
## re group factors in new column
levels(clean_linneaus$Habitat_groups)<-list(
  Rupes=c("1 Rupes Lassbyenses", "10 Rupes Gottsundenses", "3 Rupes"), 
  Silva=c("2 Pascua Sylvatica", "12 Silva Regia", "5 Silva Regia", 
          "1 Sylva Deserta", "4 Saltus Rickombergensis", "5 Nemus Regium", 
          "6 Lucus Norrbyensis"),
  Palus=c("3 Palus Norrbyensis", "2 Palus Jumkilensis"), 
  Pratum=c("4 Pratum Norrbyense", "7 Pratum Gottsundense", 
                    "11 Praedium Wardsattra", "1 Pratum Regium", 
                    "2 Pratumbarbyense", "3 Prata Ekensia & Fallensia", 
                    "3 Pratum Saltpetterángen", "4 Prata", 
                    "8 Praedium Kiattinge", "9 Pratum Nyflense", 
                    "10 Praedium Husby", "5 Prataflogstadensia & Hagensia"),
  Agros=c("2 Agri Upsalieness", "2 Agri Waxalenses", "3 Versurae Agrorum"),
  Fluvius=c("2 Ripae", "2 Ripa fluvii UPSALIENSIS", "3 Fluvius", 
            "6 Rivulus", "6 Fons Sandwiksensis","5 Uliginosa Amni", 
            "2 Piscina"),
  Urbis=c("1Tecta Upsaliensia", "3 Plateae Urbis Upsaliensis", 
          "1 Via Upsaliensis", "1 Tecta Upsaliensia", "4 Campus Polonicus",
          "Tegelhagen", "1 SEPTA"),
  Rusticus=c("9 Praecipitia Gottsundensia", "6 Lucus Norrbyensis", "7 Haga",
             "1 Luthagen", "5 Tórnby", "4 Falla", "5 Lucus Nantunensis",
             "9 Liljeholmen", "7 Ultuna", "5 Wittulsbergensis",
             "4 Tumuli Upsaliensis", "4 Templo Danemarkensi",
             "7 Templi Borfensis", "3 Lupuleta", "8 Bovilia Pastoris",
             "1 Tegelhagen")
  )

## 3.

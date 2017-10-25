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

## 3. checked and changed species names
## copy and check clean_linne_sp file
test<-clean_linne_sp
## manually change species names using gsub
test$species<-gsub("Arbutus Uva urfi", "Arctostaphylos uva-ursi", test$species)
test$species<-gsub("Cerefus Padus", "Prunus padus", test$species)
## perhaps remove this species as it is a fungus
test$species<-gsub("Elvela Mitra", "Gyromitra infula", test$species)
##
test$species<-gsub("Ophrys Nidus", "Neottia nidus-avis", test$species)
test$species<-gsub("Ranuculus Ficaria:", "Ficaria verna", test$species)
## perhaps remove this species as it is a lichen
test$species<-gsub("Lichen nivalis:", "Lepraria nivalis", test$species)
##
test$species<-gsub("Ribes Vua crispa", "Ribes uva-crispa", test$species)
test$species<-gsub("TuffiIago Farfara", "Tussilago farfara", test$species)
test$species<-gsub("Convolvulus Polygonum", "Polygonum convolvulus", test$species)
test$species<-gsub("Crataeus Aira", "Sorbus aria", test$species)
test$species<-gsub("Buphtalmo tinctorio", "Cota tinctoria", test$species)
test$species<-gsub("Comarum palustre", "Potentilla palustris", test$species)
test$species<-gsub("Ethusa Cynapium", "Aethusa cynapium", test$species)
## perhaps remove this species as it is a liverwort
test$species<-gsub("Jungermannia pusilla", "Blasia pusilla", test$species)
##
test$species<-gsub("Ophrys Monorchis", "Herminium monorchis", test$species)
test$species<-gsub("Pedicularis SceptCarolin", "Pedicularis sceptrum-carolinum", test$species)
test$species<-gsub("Scabiosam arvensem", "Knautia arvensis", test$species)
test$species<-gsub("Chenopodium Bonus henricus", "Blitum bonus-henricus", test$species)

## checked and changed species names clean_trait_sp
clean_trait_sp$species<-gsub("Capsella bursa -pastoris", "Capsella bursa-pastoris", clean_trait_sp$species)
## possibly remove these as they have no positive species ID
clean_trait_sp$species<-gsub("Arabidopsis sp.", "", clean_trait_sp$species)
clean_trait_sp$species<-gsub(" Myosotis spp.", "", clean_trait_sp$species)

## checked and changed species names clean_trails_sp
clean_trails_sp$species<-gsub("Capsella bursa -pastoris", "Capsella bursa-pastoris", clean_trails_sp$species)
## possibly remove these as they have no positive species ID
clean_trails_sp$species<-gsub("Arabidopsis sp.", "", clean_trails_sp$species)
clean_trails_sp$species<-gsub(" Myosotis spp.", "", clean_trails_sp$species)

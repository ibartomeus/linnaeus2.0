cleanSpecies <- function (species, verbose = TRUE, db = "itis", ask = FALSE, accepted = TRUE, rows = 1, only_match = FALSE) 
{
species <- as.character(species)
species2 <- unique(species)
temp <- gnr_resolve(species2, best_match_only = TRUE, canonical = TRUE, http="post" )
dat <- merge(data.frame(species2), temp[, c("user_supplied_name", 
                                            "matched_name2")], by.x = "species2", by.y = "user_supplied_name", 
             all.x = TRUE)
species3 <- unique(dat$matched_name2)
species3 <- species3[!is.na(species3)]
print("step1 done-----------------------------------------------------------")
if(only_match == TRUE){
  colnames(dat) <- c("species", "matched_names")
  dat
} else {
  temp <- synonyms(species3, db = db, accepted = accepted, ask = ask, rows = 1)
  synonym_ids <- grep(pattern = "acc_name", temp)
  accepted_names <- unlist(lapply(temp[synonym_ids], "[", "acc_name"), 
                           use.names = FALSE)
  synonym_names <- species3
  synonym_names[synonym_ids] <- accepted_names[1]
  key <- data.frame(species3, synonym_names)
  dat <- merge(dat, key, by.x = "matched_name2", by.y = "species3", 
               all.x = TRUE)
  species4 <- unique(dat$synonym_names)
  species4 <- species4[!is.na(species4)]
  print("step2 done-----------------------------------------------------------")
  out2 <- tax_name(species4, get = "species", db = db, 
                   pref = "itis", verbose = verbose, 
                   accepted = accepted, ask = ask, rows = 1)
  #taxize::get_tolid
  #get_tolid(species)
  out2_u <- unique(out2$species)
  final_names <- species4
  final_names[which(!species4 %in% out2_u)] <- NA
  key2 <- data.frame(species4, final_names)
  dat <- merge(dat, key2, by.x = "synonym_names", by.y = "species4", 
               all.x = TRUE)
  dat <- merge(data.frame(species), dat, by.x = "species", 
               by.y = "species2", all.x = TRUE)
  print("step3 done-----------------------------------------------------------")
  colnames(dat)[3] <- "matched_names"
  dat[, c(1, 3, 2, 4)] 
}
}

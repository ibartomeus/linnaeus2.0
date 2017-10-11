rm(list = ls())
setwd("~/Documents/RLinnaeus")

Everything<-read.csv("LEverything.csv",       #the name of your file
                              sep=";",                    	#type of separator between columns in file
                              dec=",",                    	#decimal point or comma?
                              header=TRUE,                	#First row contains column names
                              stringsAsFactors = TRUE)   	#All test occurs as strings

Ordination<-read.csv("LOrdination.csv",     #the file with vegetation data
                     sep=";",            #semicolon or comma as separator between columns
                     dec=",",            #decimal point or comma? 
                     header=T,           #read first row as variable names
                     row.names=1)        #first column in file as rownames (used by vegan as "sites")

OrdinationAdonis<-read.csv("LOrdinationAdonis.csv",     #the file with vegetation data
                           sep=";",            #semicolon or comma as separator between columns
                           dec=",",            #decimal point or comma? 
                           header=T)           #read first row as variable names

# Model the data to see if it's correct, checking Normal Q-Q and the residuals
model1 <- lm(Abundance ~ Urbanization+Trail+Code, data=Everything)
plot(model1)
hist(model1$residuals)

model2 <- lm(Abundance ~ Urbanization+Trail+Family+Genus+Species+Code, data=Everything)
plot(model2)
hist(model2$residuals)

#Install required packages; this you only need to do once on your computer
install.packages(c("vegan","qdap","vegan3d","reshape2","ggplot2"))

#library commands that you need to run every time you start R
library(vegan)     # For ordinations
library(qdap)      # For lookup in the species trait section
library(vegan3d)   # To plot ordinations in three dimensions- BEWARE Apple users.
library(reshape2)  # To rearrange and reshape data  
library(ggplot2)   # A graphical package in R allowing greater control of plots

# DISSIMILARITY MATRIX
Ordination.dist<-vegdist(Ordination,
                         method="bray",
                         binary=FALSE)

# Ordination - Non-Metric Dimensional scaling
# Run ordination
ord1<-metaMDS(Ordination,             #Name of you vegetation data  
              distance="bray", #dissimilarity method
              k=3)             #number of dimensions for ordination. Increasing the 
#number of dimensions decreses stress (ord$stress).

ordiplot(ord1,                #your ordinated data
         display ="sites",    #"sites" or "species", delete for both
         type="text")         #"points" or "text"

# Did also tobasco sometime, but just get error now but haver the image in the result

# Adonis
adonis(Ordination~OrdinationAdonis$Urbanization+OrdinationAdonis$Trail, data=Ordination, permutations=10000)

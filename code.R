# Install Bibliometrix 
library(dev.tools)
devtools::install_github("massimoaria/bibliometrix")

# Import Libraries
library(data.table)
library(bibliometrix)

# Set Working Directory
setwd('C:/Users/Mike/Desktop/KEEN Clinic/Tuesday/Demonstration/Bib')

# ID Bib Files
file.list <- list.files()

# Import Bibtex Files
bib.df <- convert2df(file.list, format='bibtex')

# Analyze Files 
results <- biblioAnalysis(bib.df, sep = ";")

# Summarize Results
summary(object = results, k = 100, pause = FALSE)

# Conceptual Structure
CS <- conceptualStructure(bib.df,field="ID", method="CA", minDegree=4, k.max=8, stemming=FALSE, labelsize=10, documents=10)
CS


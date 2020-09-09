# Instal Dev Tools
install.packages('devtools')
install.packages('data.table')

# Install Bibliometrix 
devtools::install_github("massimoaria/bibliometrix")

# Import Libraries
library(data.table)
library(bibliometrix)

# Download Example Bib Files
download.file("https://s3.wasabisys.com/litbibs/savedrecs.bib", destfile = "s.bib", method="curl")
download.file("https://s3.wasabisys.com/litbibs/savedrecs%20(1).bib", destfile = "s2.bib", method="curl")
download.file("https://s3.wasabisys.com/litbibs/savedrecs%20(2).bib", destfile = "s3.bib", method="curl")
download.file("https://s3.wasabisys.com/litbibs/savedrecs%20(3).bib", destfile = "s4.bib", method="curl")

# ID Bib Files
file.list <- list.files(pattern="*.bib")

# Import Bibtex Files
bib.df <- convert2df(file.list, format='bibtex')

# Analyze Files 
results <- biblioAnalysis(bib.df, sep = ";")

# Summarize Results
summary(object = results, k = 100, pause = FALSE)

# Conceptual Structure
CS <- conceptualStructure(bib.df,field="ID", method="CA", minDegree=4, k.max=8, stemming=FALSE, labelsize=10, documents=10)
CS # Show Conceptual Structure

# About -------------------------------------------------------------------

# I created a two column CSV containing my filenames in column 1 and
# my corpus text in column 2. I need each row to be its own text file.
# This is necessary for the stylo() stylography package.
# The For Loop creates a new text file for each row in the dataframe. 
# It outputs all the files in the "corpus" subdirectory.

# Load Data ---------------------------------------------------------------

# Read in csv. Two columns: Filename and Content
df <- read.csv(file = "data.csv", 
               fileEncoding = "UTF-8-BOM", 
               stringsAsFactors = FALSE)

# Create Corpus -----------------------------------------------------------

# Create new .txt for each row in the dataframe.
for(i in 1:nrow(df)){
  write.table(x = df[i, 2], 
              file = paste0("corpus/", df[i, 1], ".txt"), 
              row.names = FALSE,
              col.names = FALSE,
              quote = FALSE)
}

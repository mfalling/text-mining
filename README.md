# text-mining
Reorganizing repositories -- Scripts related to text mining

## Scripts

### **row-to-txt.R**

This script converts rows in a dataframe to individual text files. 

I use this script to manipulate my data into a format that will allow me to use Principal Component Analysis (PCA). PCA shows potential relationships between data points. This technique clusters data points together based on similar features by reducing the number of variables/dimensions in the dataset. Dimensionality reduction is useful when a dataset has a lot of variables. PCA can be done with both numerical and text data. The built-in prcomp() function in R can create clusters based on numerical data. The stylo package can show the principal components of a text-based dataset by grouping writing samples together by style.

The stylo() function groups writing samples together based on similar characteristics. Grouping text together can show interesting relationships between the samples. In order to work, the the stylo() package requires text to be in a specific format. Each writing sample (corpus text) needs to be in its own text file. These text files need to exist in a dedicated subdirectory called "corpus". The text file names need to be standardized. All file names should start with the class (e.g., the author's name) and be followed by an underscore (e.g., "classA_text1"). If these requirements are not met, the stylo() function will not work.

Helpful resources:
* https://ckhoward.github.io/post/a-guide-to-stylo/
* https://www.clear.rice.edu/comp130/12spring/pca/

### **graph-bigrams.R**

This script creates and visualizes word-pairings.

I use this script to explore how often certain words appear together. In order to explore these relationship, a text file must be broken down into pairs of words. These pairs are called bigrams. Once all the possible combinations of words are identified, a frequency of bigrams can be created to locate the most highly used word-pairings. These bigrams may share a common word with another bigram. A network of associations can be created to explore how the bigrams are connected. 

Helpful resources:
* https://kavita-ganesan.com/what-are-n-grams/
* https://www.tidytextmining.com/ngrams.html
* https://uc-r.github.io/word_relationships

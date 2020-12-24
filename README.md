# text-mining
Reorganizing repositories -- Scripts related to text mining

## Scripts

### **row-to-txt.R**

This script converts rows in a dataframe to individual text files, which I use for Principal Component Analysis (PCA). 

PCA shows potential relationships between data points. This technique clusters data points together based on similar features by reducing the number of variables/dimensions in the dataset. Dimensionality reduction is useful when a dataset has a lot of variables. PCA can be done with both numerical and text data. The built-in prcomp() function in R can create clusters based on numerical data. The stylo package can show the principal components of a text-based dataset by grouping writing samples together by style.

The stylo() function groups writing samples together based on similar characteristics. Grouping text together can show interesting relationships between the samples. In order to work, the the stylo() package requires text to be in a specific format. Each writing sample (corpus text) needs to be in its own text file. These text files need to exist in a dedicated subdirectory called "corpus". The text file names need to be standardized. All file names should start with the class (e.g., the author's name) and be followed by an underscore (e.g., "classA_text1"). If these requirements are not met, the stylo() function will not work.

Helpful resources:
* https://ckhoward.github.io/post/a-guide-to-stylo/
* https://www.clear.rice.edu/comp130/12spring/pca/

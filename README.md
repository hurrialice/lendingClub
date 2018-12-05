# Lending Club Expected return Prediction


### Preprocess ###

- Under folder `Preprocess/`
0. Download data from [here](https://www.lendingclub.com/info/download-data.action) as `.zip` into a local directory called `rawdata`

1. Run cleandata.sh by `bash cleandata.sh`


2. Use `feature_eng.R` to process data-

  * Here we chosed any loans initiated during 2014, 2015, 2016
  * Some columns are removed because we think they are not as important/influential on loan status.
  * Columns with >10% percent missing is removed
  * Only individual applications are considered.
  * For easier manipulation, we randomly selected 30000 rows into `cdf_30000.csv`
  * Rejected data are not used.

3. `Preprocess+LogisticModel.ipynb`:

  * Preliminary feature selection based on correlation matrix of variables.
  * Explored feature selection methods: Recursive Feature Elimination and PCA.
  * Fitted a simple logistic regression model using gridsearchCV.

4. `Models\`

  * Adapting Xiyu and Jinyi's scripts to custom functions.
  * _TODO_ add stacking

5. `Discriminant Analysis`


6. Website
  * check [this](https://jiaxuanzhao.github.io/gpages/) Thanks for Jiaxuan!


### References ###

- Under folder `Reference/`
  * Please update links in a markdown file for online references
 




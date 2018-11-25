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


### EDA ###

- Under folder `EDA`
3. _TODO_ use python for EDA from `cdf_3000.csv`






### References ###

- Under folder `Reference/`
  * Please update links in a markdown file for online references
 




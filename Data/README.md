# what are the data?

All data are from 2016 accepted loans.

1. `cdf_removeCurrent` deletes all "current" rows, so we are not making assumptions about where an undue loan will be paid fully. More columns are added. Balanced sampling from each month and each category. 0-1 encoded.

**Consider using this one?**

2. `cdf_update` encodes current+paid as `1` and the rest `0`. Balanced sampling, columns slightly less than `cdf_removeCurrent`.


3. `cdf_withJoint`: imbalanced sampling that reflects loan status distribution.


4. `if_loan_is_rejected`: contains full rejection data and accepted data from 2016.

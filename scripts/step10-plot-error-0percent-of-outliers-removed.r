## Absolute error vals for the whole range (including outliers)
rf_error_vals = abs(w$Time.s. - w$pred_rfe)
#hist(rf_error_vals, main = "", xlab = "", ylab="")

## Relative error including outliers
rf_rel_ev = sapply(rf_error_vals, function(x) x/253)
#hist(rf_rel_ev, main = "", xlab = "", ylab="")
#rug(rf_rel_ev)

library(dplyr)

## Eliminate outliers
no_outliers_0 = quantile(w$Time.s., probs = c(0.00, 1.0))
no_outliers_df_0 = data.frame(w$Time.s., w$pred_rfe)
dd_0 = no_outliers_df_0 %>% filter(no_outliers_df_0$w.Time.s. >= no_outliers_0[1] & no_outliers_df_0$w.Time.s. <= no_outliers_0[2])
range_no_outliers_0 = max(dd_0$w.Time.s.) - min(dd_0$w.Time.s.)
no_outliers_rf_error_0 = abs(dd_0$w.Time.s. - dd_0$w.pred_rfe)
no_outliers_rf_rel_error_0 = sapply(no_outliers_rf_error_0, function(x) x/range_no_outliers_0)


## Plot the maximum relative error per quantile
cdf_0 = quantile(no_outliers_rf_rel_error_0, seq(0.01,1,0.01))
no_outliers_median_rel_error_0 = sapply(seq(1,100,1), function(x) median(no_outliers_rf_rel_error_0[no_outliers_rf_rel_error_0 < cdf_0[x]]))
lines(cdf_0, lty=5, lwd=3, col="#aa6666")

## Add median error
lines(no_outliers_median_rel_error_0, col="#aa6666", lwd=3, lty=4)

## Add legend
legend("topleft", title="Type of error", c("Maximum error with 10% of outliers removed", 
                                           "Maximum error with 4% of outliers removed", 
                                           "Maximum error with 0% of outliers removed", 
                                           "Median error with 10% of outliers removed", 
                                           "Median error with 4% of outliers removed", 
                                           "Median error with 0% of outliers removed"), 
       col=c("black", "#999999", "#aaaaaa", "black", "#999999", "#aaaaaa"), 
       lwd=c(2,3,3,2,3,3), 
       lty=c(1,2,5,6,3,4))


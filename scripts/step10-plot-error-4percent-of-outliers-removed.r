## Absolute error vals for the whole range (including outliers)
rf_error_vals = abs(w$Time.s. - w$pred_rfe)
#hist(rf_error_vals, main = "", xlab = "", ylab="")

## Relative error including outliers
rf_rel_ev = sapply(rf_error_vals, function(x) x/253)
#hist(rf_rel_ev, main = "", xlab = "", ylab="")
#rug(rf_rel_ev)

library(dplyr)

## Eliminate outliers
no_outliers_2 = quantile(w$Time.s., probs = c(0.02, 0.98))
no_outliers_df_2 = data.frame(w$Time.s., w$pred_rfe)
dd_2 = no_outliers_df_2 %>% filter(no_outliers_df_2$w.Time.s. >= no_outliers_2[1] & no_outliers_df_2$w.Time.s. <= no_outliers_2[2])
range_no_outliers_2 = max(dd_2$w.Time.s.) - min(dd_2$w.Time.s.)
no_outliers_rf_error_2 = abs(dd_2$w.Time.s. - dd_2$w.pred_rfe)
no_outliers_rf_rel_error_2 = sapply(no_outliers_rf_error_2, function(x) x/range_no_outliers_2)


## Plot the maximum relative error per quantile
cdf_2 = quantile(no_outliers_rf_rel_error_2, seq(0.01,1,0.01))
no_outliers_median_rel_error_2 = sapply(seq(1,100,1), function(x) median(no_outliers_rf_rel_error_2[no_outliers_rf_rel_error_2 < cdf_2[x]]))

lines(cdf_2, lty=2, lwd=3, col="#999999")

## Add median error
lines(no_outliers_median_rel_error_2, col="#999999", lwd=3, lty=3)

## Add legend
legend("topleft", title="Type of error", c("Maximum error with 10% of outliers removed",
                                           "Maximum error with 4% of outliers removed", 
                                           "Median error with 10% of outliers removed", 
                                           "Median error with 4% of outliers removed"), 
       col=c("black", "#999999", "black", "#999999"), lwd=c(2,3,2,3), lty=c(1,2,6,3))


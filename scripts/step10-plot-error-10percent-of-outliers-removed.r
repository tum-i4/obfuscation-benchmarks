## Absolute error vals for the whole range (including outliers)
rf_error_vals = abs(w$Time.s. - w$pred_rfe)
hist(rf_error_vals, main = "", xlab = "", ylab="")

## Relative error including outliers
rf_rel_ev = sapply(rf_error_vals, function(x) x/253)
hist(rf_rel_ev, main = "", xlab = "", ylab="")
rug(rf_rel_ev)

library(dplyr)

## Eliminate outliers
no_outliers = quantile(w$Time.s., probs = c(0.05, 0.95))
no_outliers_df = data.frame(w$Time.s., w$pred_rfe)
dd = no_outliers_df %>% filter(no_outliers_df$w.Time.s. >= no_outliers[1] & no_outliers_df$w.Time.s. <= no_outliers[2])
range_no_outliers = max(dd$w.Time.s.) - min(dd$w.Time.s.)
no_outliers_rf_error = abs(dd$w.Time.s. - dd$w.pred_rfe)
no_outliers_rf_rel_error = sapply(no_outliers_rf_error, function(x) x/range_no_outliers)

## Plot the maximum relative error per quantile
cdf = quantile(no_outliers_rf_rel_error, seq(0.01,1,0.01))
no_outliers_median_rel_error = sapply(seq(1,100,1), 
                                      function(x) median(no_outliers_rf_rel_error[no_outliers_rf_rel_error < cdf[x]]))

plot(cdf, type="l", lwd=2, xlim=c(0,100), ylim=c(0.0, 1.0), xaxs="i", yaxs="i", xlab="", ylab="Relative error", axes = F)
title(xlab="Percentage of programs", line=2)
axis(1, at=seq(0,100,5))
axis(2, at=seq(0.0, 2.0, 0.05), las = 2)
## Draw grid with abline because of custom ticks
abline(h=seq(0.0, 2.0, 0.05), col = "#666666", lty=3)
abline(v=seq(0, 100, 5), col = "#666666", lty=3)

#segments(0, 0.3635588566, 95, 0.3635588566, lty=3, col = "black")
#segments(95, 0, 95, 0.3635588566, lty=3)
#segments(0, 0.2516858783, 90, 0.2516858783, lty=3)
#segments(90, 0, 90, 0.2516858783, lty=3)
#abline(v=95, col="red")
#abline(h=0.3635588566, lty=3, col = "black")
#abline(v=90, col = "blue")
#abline(h=0.2516858783, lty=3, col = "black")
#points(95, 0.3635588566, pch=16)
#points(90, 0.2516858783, pch=16)

## Add median error
lines(no_outliers_median_rel_error, col="black", lwd=2, lty=6)
#abline(h=0.05847, lty=3)
#segments(100, 0, 100, 0.05847, lty=3)
#points(100,0.05847, pch=16)
## Add legend
legend("topleft", title="Type of error", c("Maximum error", "Median error"), col=c("black", "black"), lwd=c(1,1), lty=c(1,6))

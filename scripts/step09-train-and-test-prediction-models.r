library(randomForest)
library(dplyr)
library(plyr)
library(rgp)
#library(e1071)

x = dataset2_ucc_satgraf %>% select(Program, Path, Time.s._mean, Math, Trigonometric, Logarithmic, Calculations, Conditionals, Logical, Preprocessor, Assignment, Pointer, L1.Loops, L2.Loops, L3.Loops, Total.CC1., Total.CC2., Total.CC3., Average.CC1., Risk, vars, ol_coms,mincom,meancom,maxcom,sdcom,mininter,maxinter,meaninter,sdinter,minintra,maxintra,meanintra,sdintra,edgeratio,maxedgeratio,minedgeratio,meanedgeratio,sdedgeratio,unique_edges,ol_q,maxvar,meanvar,total_edges,weight,max_community,num_max_community,num_top_10_community,num_top_20_community,max_inter,num_max_inter,num_top_10_inter,num_top_20_inter,max_total,num_max_total,num_top_10_total,num_top_20_total,num_max_total_inter,num_max_total_community,num_max_inter_community,num_max_total_inter_community,num_top_10_total_inter,num_top_10_total_community,num_top_10_inter_community,num_top_10_total_inter_community,num_top_20_total_inter,num_top_20_total_community,num_top_20_inter_community,num_top_20_total_inter_community,total_clauses,var_unique_clauses,max_clause,mean_clause,max_reused,min_reused,mean_reused, Trans)
x = dplyr::rename(x, Time.s.=Time.s._mean)

x2 = simple_hash_func_ucc_satgraf %>% select(Program,Path,Time.s.,Math,Trigonometric,Logarithmic,Calculations,Conditionals,Logical,Preprocessor,Assignment,Pointer,L1.Loops,L2.Loops,L3.Loops,Total.CC1.,Total.CC2.,Total.CC3.,Average.CC1.,Risk,vars,ol_coms,mincom,meancom,maxcom,sdcom,mininter,maxinter,meaninter,sdinter,minintra,maxintra,meanintra,sdintra,edgeratio,maxedgeratio,minedgeratio,meanedgeratio,sdedgeratio,unique_edges,ol_q,maxvar,meanvar,total_edges,weight,max_community,num_max_community,num_top_10_community,num_top_20_community,max_inter,num_max_inter,num_top_10_inter,num_top_20_inter,max_total,num_max_total,num_top_10_total,num_top_20_total,num_max_total_inter,num_max_total_community,num_max_inter_community,num_max_total_inter_community,num_top_10_total_inter,num_top_10_total_community,num_top_10_inter_community,num_top_10_total_inter_community,num_top_20_total_inter,num_top_20_total_community,num_top_20_inter_community,num_top_20_total_inter_community,total_clauses,var_unique_clauses,max_clause,mean_clause,max_reused,min_reused,mean_reused, Trans)

alg_name = "randomForest" ## change this line to use another algorithm
outlier = 0.00
alg = get(alg_name)
folds = 10

model1 = vector("list", folds)
model2 = vector("list", folds)
model3 = vector("list", folds)
model4 = vector("list", folds)

## remove 0 time
x = x %>% filter(Time.s. > 0)
x2 = x2 %>% filter(Time.s. > 0)

## Filter outliers
no_outliers_x = quantile(x$Time.s., probs = c(outlier, 1-outlier))
no_outliers_x2 = quantile(x2$Time.s., probs = c(outlier, 1-outlier))
x = x %>% filter(x$Time.s. >= no_outliers_x[1] & x$Time.s. <= no_outliers_x[2])
x2 = x2 %>% filter(x2$Time.s. >= no_outliers_x2[1] & x2$Time.s. <= no_outliers_x2[2])

pbar <- create_progress_bar('text')
pbar$init(folds*4)

## Training phase
for (fold in seq(0, folds-1)) {
  x$odd = as.integer(rownames(x)) %% folds == fold
  x2$odd = as.integer(rownames(x2)) %% folds == fold
  train = rbind(x[x$odd != TRUE,], x2[x2$odd != TRUE,])
                
  model1[[fold+1]]<-alg(formula=Time.s.~Calculations*Conditionals*Logical*Assignment*L1.Loops*L2.Loops*L3.Loops*Total.CC1.*Total.CC2.*Total.CC3.*Average.CC1.,
                     data=train)
  pbar$step()
  model2[[fold+1]]<-alg(formula=Time.s.~total_edges * weight * ol_q * edgeratio * ol_coms * vars * meancom * maxcom * mean_reused * meanintra * maxinter,
                        data=train)
  pbar$step()
  ## Old mix of metrics sat and UCC
  ## model3[[fold+1]]<-alg(formula=Time.s.~total_edges * weight * ol_q * edgeratio * ol_coms * vars * meancom * maxcom * meanintra * maxinter * Logical * Calculations * Assignment * L1.Loops, 
  ##                      data=train)
  
  ## New person: mean_clause, meanvar, sdedgeratio, meanintra, mean_reused, meancom, unique_edges, vars, sdinter, max_community, ol_coms, maxedgeratio, maxinter, max_total, Trans
  model3[[fold+1]]<-alg(formula=Time.s.~mean_clause * meanvar * sdedgeratio * meanintra * mean_reused * meancom * unique_edges * vars * sdinter * max_community * ol_coms * maxedgeratio * maxinter * max_total,
                      data=train)
  pbar$step()
  ## New RF-RFE: max_clause, num_max_inter, weight, sdinter, meaninter, sdintra, ol_coms, L1.Loops, Risk, sdcom, meancom, sdedgeratio, meanintra, edgeratio, ol_q
  model4[[fold+1]]<-alg(formula=Time.s.~max_clause * num_max_inter * weight * sdinter * meaninter * sdintra * ol_coms * L1.Loops * Risk * sdcom * meancom * sdedgeratio * meanintra * edgeratio,
                        data=train)
  pbar$step()
}

assign(paste0(alg_name, "Model1_", outlier), model1)
assign(paste0(alg_name, "Model2_", outlier), model2)
assign(paste0(alg_name, "Model3_", outlier), model3)
assign(paste0(alg_name, "Model4_", outlier), model3)

v = vector("list", folds)
## Testing phase
for (fold in seq(0, folds-1)) {
  x$odd = as.integer(rownames(x)) %% folds == fold
  x2$odd = as.integer(rownames(x2)) %% folds == fold
  test = rbind(x[x$odd == TRUE,], x2[x2$odd == TRUE,])
  
  test$pred_ucc=predict(model1[[fold+1]], test)

  test$pred_satgraf=predict(model2[[fold+1]], test)

  test$pred_pearson=predict(model3[[fold+1]], test)

  test$pred_rfe=predict(model4[[fold+1]], test)
  
  v[[fold+1]] = test[,c("Path", "Time.s.", "pred_ucc", "pred_satgraf", "pred_pearson", "pref_rfe")]
}

w = bind_rows(v)
w = tbl_df(w)
w = arrange(w, Path)
assign(paste0("pred_results_for_",alg_name, outlier), w)

plot(y = w$Time.s., x = seq_along(w$Path), type="l", col="1")
lines(seq_along(w$Path), w$pred_rfe, col="yellow")
lines(seq_along(w$Path), w$pred_pearson, col="green")
lines(seq_along(w$Path), w$pred_satgraf, col="blue")
lines(seq_along(w$Path), w$pred_ucc, col="red")

assign(paste0("rmse_",alg_name, outlier, "_ucc"), rmse(w$Time.s., w$pred_ucc))
assign(paste0("rmse_",alg_name, outlier, "_satgraf"), rmse(w$Time.s., w$pred_satgraf))
assign(paste0("rmse_",alg_name, outlier, "_pearson"), rmse(w$Time.s., w$pred_pearson))
assign(paste0("rmse_",alg_name, outlier, "_rfe"), rmse(w$Time.s., w$pred_rfe))

assign(paste0("rsquared_",alg_name, outlier, "_ucc"), rsquared(w$Time.s., w$pred_ucc))
assign(paste0("rsquared_",alg_name, outlier, "_satgraf"), rsquared(w$Time.s., w$pred_satgraf))
assign(paste0("rsquared_",alg_name, outlier, "_pearson"), rsquared(w$Time.s., w$pred_pearson))
assign(paste0("rsquared_",alg_name, outlier, "_rfe"), rsquared(w$Time.s., w$pred_rfe))

library(dplyr)
# depth, nrIfs, nrLoops
c1<-c(1,1,0) #"(if (bb %s) (bb %s))"%(code_size, code_size),
c2<-c(1,2,0) #"(if (bb %s))(if (bb %s))"%(code_size, code_size),
c3<-c(1,3,0) #"(if (bb %s))(if (bb %s))(if (bb %s))"%(code_size, code_size, code_size),
c4<-c(2,2,0) #"(if (if (bb %s) (bb %s)) (bb %s))"%(code_size, code_size, code_size),
c5<-c(2,3,0) #"(if (if (bb %s) (bb %s)) (if (bb %s) (bb %s)))"%(code_size, code_size, code_size, code_size),
c6<-c(3,3,0) #"(if (if (if (bb %s) (bb %s)) (bb %s)) (bb %s))"%(code_size, code_size, code_size, code_size),
c7<-c(3,4,0) #"(if (if (if (bb %s) (bb %s)) (if (bb %s) (bb %s))) (bb %s))"%(code_size, code_size, code_size, code_size, code_size),
c8<-c(3,5,0) #"(if (if (if (bb %s) (bb %s)) (if (bb %s) (bb %s))) (if (bb %s) (bb %s)))"%(code_size, code_size, code_size, code_size, code_size, code_size),
c9<-c(1,0,1) #"(for (bb %s))"%code_size,
c10<-c(2,1,1) #"(for (if (bb %s) (bb %s)))"%(code_size, code_size),
c11<-c(1,0,2) #"(for (bb %s))(for (bb %s))"%(code_size, code_size),
c12<-c(2,0,2) #"(for (for (bb %s)))"%code_size,
c13<-c(3,2,1) #"(for (if (if (bb %s) (bb %s)) (bb %s)))"%(code_size, code_size, code_size),
c14<-c(2,2,1) #"(for (if (bb %s) (bb %s))(if (bb %s) (bb %s)))"%(code_size, code_size, code_size, code_size),
c15<-c(3,3,1) #"(for (if (if (bb %s) (bb %s)) (if (bb %s) (bb %s))))"%(code_size, code_size, code_size, code_size),
c16<-c(3,1,2) #"(for (for (if (bb %s) (bb %s))))"%(code_size, code_size)]
ctrl<-rbind(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16)

processStatsOriginal <- function(filename) {
  data<-head(read.delim(filename, header = TRUE, stringsAsFactors = FALSE, sep=""), -2)
  x = strsplit(data$Path, "-")
  x = unlist(x)
  x = matrix(x, ncol=11, byrow=TRUE)
  data$Seed = as.numeric(paste(gsub("Seed", "", x[, 4])))
  data$Type = paste(gsub("Type_", "", x[, 6]))
  data$Depth = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 1]
  data$Ifs = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 2]
  data$Loops = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 3]
  data$BBSize = as.numeric(paste(gsub("BB", "", x[, 8])))
  data$ForBound = paste(gsub("ForBound_", "", x[, 9]))
  data$Operators = paste(gsub("Operators_", "", x[, 10]))
  data$Transforms = "original"
  data$KleeSymArg = as.numeric(gsub("KleeSymArg_", "", x[, 11]))

  data
}

## As opposed to the processStatsOriginal (above), 
## this function does not process files with KleeSymArg_ at the end.
processStatsOriginal2 <- function(data) {#filename) {
  #data<-head(read.delim(filename, header = TRUE, stringsAsFactors = FALSE, sep=""), -2)
  x = strsplit(data$Path, "-")
  x = unlist(x)
  x = matrix(x, ncol=10, byrow=TRUE)
  data$Seed = as.numeric(paste(gsub("Seed", "", x[, 4])))
  data$Type = paste(gsub("Type_", "", x[, 6]))
  data$Depth = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 1]
  data$Ifs = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 2]
  data$Loops = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 3]
  data$BBSize = as.numeric(paste(gsub("BB", "", x[, 8])))
  data$ForBound = paste(gsub("ForBound_", "", x[, 9]))
  data$Operators = paste(gsub("Operators_", "", x[, 10]))
  data$Transforms = "original"
  
  data
}

processStatsObfuscated <- function(data) {#filename) {
  #data<-head(read.delim(filename, header = TRUE, stringsAsFactors = FALSE, sep=""), -2)
  x = strsplit(data$Path, "-")
  x = unlist(x)
  x = matrix(x, ncol=11, byrow=TRUE)
  data$Seed = as.numeric(paste(gsub("Seed", "", x[, 4])))
  data$Type = paste(gsub("Type_", "", x[, 6]))
  data$Depth = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 1]
  data$Ifs = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 2]
  data$Loops = ctrl[as.numeric(gsub("ControlStructures_", "", x[, 7])) + 1, 3]
  data$BBSize = as.numeric(paste(gsub("BB", "", x[, 8])))
  data$ForBound = paste(gsub("ForBound_", "", x[, 9]))
  data$Operators = paste(gsub("Operators_", "", x[, 10]))
  data$Transforms = x[, 11]
  
  data
}

processStats <- function(function_name = processStatsObfuscated, seed = 1) {
  files = dir("./", pattern = paste("klee-stats-obf-RandFunc-seed", seed, sep=""), full.names = TRUE)
  tables = lapply(files, read.delim, header = TRUE, stringsAsFactors = FALSE, sep="")
  tables = lapply(tables, head, -2)
  data = do.call(rbind, tables)
  data$Path = substring(data$Path, regexpr('klee-out-', data$Path))
  data = tbl_df(data)
  data = data %>% group_by(Path) %>% summarise_each(funs(mean, sd))
  data = function_name(data)
  data
}

dataset2_seed1_obf_stats = processStats(processStatsObfuscated, 1)
dataset2_seed2_obf_stats = processStats(processStatsObfuscated, 2)
dataset2_seed4_obf_stats = processStats(processStatsObfuscated, 4)
dataset2_obf_tbl = rbind(dataset2_seed1_obf_stats, dataset2_seed2_obf_stats, dataset2_seed4_obf_stats)
dataset2_obf_tbl$Program = substring(dataset2_obf_tbl$Path, regexpr('empty', dataset2_obf_tbl$Path))

library(readr)
setwd("~/Downloads/lending_club_data-master/")
clean_csv <- read_csv("LoanStats.csv")
# LC_dict <- read_xls("../LCDataDictionary.xlsx")

savefile <- function(){
  filename <- paste0("cdf-",Sys.time(),".csv")
  write_csv(cdf, filename)
}


# clean columns with too much NAs i.g. percent NA > 10%
NA_portion <- apply(clean_csv, 2, function(i){
  mean(is.na(i))
})
df <- clean_csv[,NA_portion<0.1]
rm(clean_csv)


# choose only the 2016 data
chosen_year <- c("2014","2015","2016")
d2014 <- df[grepl(pattern = "2014", df$issue_d),]
d2015 <- df[grepl(pattern = "2015", df$issue_d),]
d2016 <- df[grepl(pattern = "2016", df$issue_d),]
cdf <- rbind(d2014, d2015, d2016)
rm(df, d2014, d2015, d2016)


# remove : funded_amnt_inv, subgrade
cdf$funded_amnt_inv <- NULL
cdf$sub_grade <- NULL
cdf$pymnt_plan <- NULL
cdf$title <- NULL
cdf$inq_last_6mths <- NULL
cdf$open_acc <- NULL
cdf$revol_bal <- NULL
cdf$total_acc <- NULL
cdf$initial_list_status <- NULL
cdf$out_prncp <- NULL
cdf$out_prncp_inv <- NULL
cdf$total_rec_prncp <- NULL
cdf$total_rec_int <- NULL
cdf$total_rec_late_fee <- NULL
cdf$recoveries <- NULL
cdf$collection_recovery_fee <- NULL
cdf$collections_12_mths_ex_med <- NULL # mostly zero
cdf$policy_code <- NULL # all 1
cdf$disbursement_method <- NULL # does not matter

# term 36/60 months
cdf$term <- gsub(" months", "", cdf$term)
cdf$int_rate <- gsub("%","", cdf$int_rate)
cdf$revol_util <- gsub("%","", cdf$revol_util)

# as numereic
cdf$term <- as.numeric(cdf$term)
cdf$int_rate <- as.numeric(cdf$int_rate)
cdf$revol_util <- 0.01*as.numeric(cdf$revol_util)
cdf$tot_cur_bal <- as.numeric(cdf$tot_cur_bal)

# text: to lowercase
cdf$emp_title <- tolower(cdf$emp_title)


# temp length - delete "year", remove na
cdf$emp_length[cdf$emp_length == "n/a"] <- NA
cdf$emp_length <- gsub(" years", "", cdf$emp_length)

# home ownership
cdf$home_ownership[cdf$home_ownership == "ANY"] <- NA

# source verification
cdf$verification_status <- ifelse(grepl("Not", cdf$verification_status), 0, 1)


# remove any rows with NA
apply(cdf, 1, function(i) sum(is.na(i))) -> tt
cdf <- cdf[tt ==0, ]

# delete all joint applications
cdf$application_type[cdf$application_type == "Joint App"] <- NA


# homogenous columns
## chargeoff_within, deling_amnt


NA_portion <- apply(cdf, 1, function(i){
  sum(is.na(i))
})
cdf <- cdf[NA_portion==0,]

savefile()

# build a small demo dataset for easier coding
cdf_temp <- cdf[sample(seq(nrow(cdf)), size = 30000),]
write_csv(cdf_temp, "cdf_30000.csv")



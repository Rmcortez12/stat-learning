
setwd("d:/UTSA/Fall2020/DataMining/Project/stat-learning") # set working directory
df = read.csv('FinalDF.csv') # read in raw csv data


df$Age14_19 = as.factor(df$Age14_19)
df$Age20_24 = as.factor(df$Age20_24)
df$Age25_29 = as.factor(df$Age25_29)
df$Age30_34 = as.factor(df$Age30_34)
df$Age35_39 = as.factor(df$Age35_39)
df$Age40_44 = as.factor(df$Age40_44)
df$Age45_49 = as.factor(df$Age45_49)
df$Age50_54 = as.factor(df$Age50_54)
df$Age55_59 = as.factor(df$Age55_59)
df$Age60_64 = as.factor(df$Age60_64)

df$Australia = as.factor(df$Australia)
df$Belarus = as.factor(df$Belarus)
df$Belgium = as.factor(df$Belgium)
df$Canada = as.factor(df$Canada)
df$Denmark = as.factor(df$Denmark)
df$Finland = as.factor(df$Finland)
df$France = as.factor(df$France)
df$Germany = as.factor(df$Germany)
df$India = as.factor(df$India)
df$Ireland = as.factor(df$Ireland)
df$Japan = as.factor(df$Japan)
df$Mexico = as.factor(df$Mexico)
df$NZ = as.factor(df$NZ)
df$Russia = as.factor(df$Russia)
df$Singapore = as.factor(df$Singapore)
df$Spain = as.factor(df$Spain)
df$Sweden = as.factor(df$Sweden)
df$Switzerland = as.factor(df$Switzerland)
df$Ukraine = as.factor(df$Ukraine)
df$UK= as.factor(df$UK)
df$US= as.factor(df$US)

#full model 
fit.lm = lm(Yards ~ .- Runner-Max-Min-Avg-Team-Age ,data = df)
summary(fit.lm)

sapply(df,class)

pairs(df[,grepl("avg_rate",names(df))])
pairs(df[,grepl("median_rate.",names(df))])
pairs(df[,grepl("rate_sd.",names(df))])

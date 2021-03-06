
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

#update belarus temps
df$difference[163] = 10 
df$difference[177] = 10 
df$difference[224] = 10 
df$difference[255] = 10 
df$difference[266] = 10


#full model 
fit.lm = lm(Yards ~ .- Runner-Max-Min-Avg-Team-Age ,data = df)
summary(fit.lm)

sapply(df,class)

pairs(df[,grepl("avg_rate",names(df))])
pairs(df[,grepl("median_rate.",names(df))])
pairs(df[,grepl("rate_sd.",names(df))])

exclude_vars <- names(df) %in% c("Runner" ,"Max", "Min", "Avg" ,"Age", "Team", "Gen", "X")
df.filtered <-df[,!exclude_vars]

df.filtered$logYards = log(df.filtered$Yards)

fit.lm.1 = lm(Yards ~ rate_sd1+rate_sd2+rate_sd_diff_4_1+
                avg_rate_q2+avg_rate_q3+avg_rate_q4+
                median_rate_q1+median_rate_q2+median_rate_q3+median_rate_q4+
                Finland:difference+
                Canada:difference+
                Ukraine:difference+
                Switzerland:difference+
                Denmark:difference+
                Belgium:difference+
                Ireland:difference+
                UK:difference+
                Germany:difference+
                France:difference+
                NZ:difference+
                US:difference+
                Japan:difference+
                Spain:difference+
                Australia:difference+
                Mexico:difference+
                India:difference+
                Singapore:difference+
                Russia:difference+
                Belarus:difference+
                Belarus:difference
                , data = df.filtered)

anova(fit.lm.1)

summary(fit.lm.1)

par(mfrow=c(2,2))
plot(fit.lm.1)
cor(df.filtered[,1:13])



fit.lm.2 = lm(logYards ~ rate_sd1+rate_sd2+rate_sd_diff_4_1+
                avg_rate_q2+avg_rate_q3+avg_rate_q4+
                median_rate_q1+median_rate_q2+median_rate_q3+median_rate_q4+
                Finland:difference+
                Canada:difference+
                Ukraine:difference+
                Switzerland:difference+
                Denmark:difference+
                Belgium:difference+
                Ireland:difference+
                UK:difference+
                Germany:difference+
                France:difference+
                NZ:difference+
                US:difference+
                Japan:difference+
                Spain:difference+
                Australia:difference+
                Mexico:difference+
                India:difference+
                Singapore:difference+
                Russia:difference+
                Belarus:difference+
                Belarus:difference
              , data = df.filtered)


summary(fit.lm.2)
par(mfrow=c(2,2))
plot(fit.lm.2)


plot(logYards ~ rate_sd1+rate_sd2+rate_sd_diff_4_1+
                avg_rate_q2+avg_rate_q3+avg_rate_q4+
                median_rate_q1+median_rate_q2+median_rate_q3+median_rate_q4+
                Finland:difference+
                Canada:difference+
                Ukraine:difference+
                Switzerland:difference+
                Denmark:difference+
                Belgium:difference+
                Ireland:difference+
                UK:difference+
                Germany:difference+
                France:difference+
                NZ:difference+
                US:difference+
                Japan:difference+
                Spain:difference+
                Australia:difference+
                Mexico:difference+
                India:difference+
                Singapore:difference+
                Russia:difference+
                Belarus:difference+
                Belarus:difference
              , data = df.filtered)


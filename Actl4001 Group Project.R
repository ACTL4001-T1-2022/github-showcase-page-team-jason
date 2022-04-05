library("readxl")
set.seed(36)
tournament <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-tournament-player-data.xlsx', sheet = "Tournament 2021")
tournament <- tournament[-c(1:4), ]
names(tournament) <- tournament[1,]
tournament <- tournament[-1,]
names(tournament) <- make.names(names(tournament), unique=TRUE)
tournament <- tournament[, -c(19,20)] #remove tournament and year
tournament$Pos <- as.factor(tournament$Pos)
tournament$Nation <- as.factor(tournament$Nation)


library(dplyr)
library(finalfit)
tournament %>%
  missing_plot()
tournament <- tournament %>%
  mutate_at(vars(Tournament.Place, Age, Born, X90s, Gls, Standard.Sh, Standard.SoT, Standard.SoT., Standard.Sh.90, Standard.SoT.90, Standard.G.Sh,
                 Standard.G.SoT, Standard.Dist, Performance.PK, Performance.PKatt, Standard.FK, Expected.xG, Expected.npxG, Expected.npxG.Sh, 
                 Expected.G.xG, Expected.np.G.xG, Total.Cmp, Total.Att, Total.Cmp., Total.TotDist, Total.PrgDist, Short.Cmp, Short.Att, Short.Cmp.,
                 Medium.Cmp, Medium.Att, Medium.Cmp., Long.Cmp, Long.Att, Long.Cmp., Ast, xA, A.xA, KP, X1.3, PPA, CrsPA, Prog, Tackles.Tkl,
                 Tackles.TklW, Tackles.Def.3rd, Tackles.Mid.3rd, Tackles.Att.3rd, Vs.Dribbles.Tkl, Vs.Dribbles.Att, Vs.Dribbles.Tkl., 
                 Vs.Dribbles.Past, Pressures.Press, Pressures.Succ, Pressures.., Pressures.Def.3rd, Pressures.Mid.3rd, Pressures.Att.3rd,
                 Blocks.Blocks, Blocks.Sh, Blocks.ShSv, Blocks.Pass, Int, Tkl.Int, Clr,Err), as.numeric)

#write.csv(tournament, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/imputed_tournament_data.csv")

tournament[is.na(tournament)] <- 0

clean <- tournament[, -c(2,3,6)]


FW <- subset(clean, Pos %in% c('DFFW', 'FW', 'FWDF', 'FWMF', 'MFFW'))
Mids <- subset(clean, Pos %in% c('DFMF', 'FWMF', 'MF', 'MFDF', 'MFFW'))
Def <- subset(clean, Pos %in% c('DF', 'DFFW', 'DFMF', 'FWDF', 'MFDF'))

library(randomForest)

#Test/Train FW
FW <- FW[, -c(2,4)] # remove Pos and x90s
FW_sample <- sample(nrow(FW), 0.2*nrow(FW))
FW_test <- FW[FW_sample, ]
FW_train <- FW[-FW_sample, ]

#Optimal mtry for FW

err_FW <- c()
for (i in 1:64){
  rf_FW <- randomForest(Tournament.Place~., data = FW_train, mtry = i, importance = TRUE)
  yhat.rf <- predict(rf_FW, newdata = FW_test[,-1])
  err_FW[i] <- colMeans((yhat.rf - FW_test[,1])^2)
}
which.min(err_FW)


#Optimal mtry is 34 for FW

#Random Forests FW

rf_FW <- randomForest(Tournament.Place~., data=FW, importance = TRUE, mtry = 34)
importance(rf_FW)
varImpPlot(rf_FW, n.var = 8)
######################################################

#Test/Train Mids
Mids <- Mids[, -c(2,4)] # remove Pos and x90s
Mids_sample <- sample(nrow(Mids), 0.2*nrow(Mids))
Mids_test <- Mids[Mids_sample, ]
Mids_train <- Mids[-Mids_sample, ]


#Optimal mtry for Mids


err_Mids <- c()
for (i in 1:65){
  rf_Mids <- randomForest(Tournament.Place~., data = Mids_train, mtry = i, importance = TRUE)
  yhat.rf <- predict(rf_Mids, newdata = Mids_test[,-1])
  err_Mids[i] <- colMeans((yhat.rf - Mids_test[,1])^2)
}
which.min(err_Mids)
#Optimal mtry is 49 for Mids

#Random Forests Mids

rf_Mids <- randomForest(Tournament.Place~., data=Mids, importance = TRUE, mtry = 49)
importance(rf_Mids)
varImpPlot(rf_Mids, n.var = 8)
######################################################

#Test/Train Def
Def <- Def[, -c(2,4)] # remove Pos and x90s
Def_sample <- sample(nrow(Def), 0.2*nrow(Def))
Def_test <- Def[Def_sample, ]
Def_train <- Def[-Def_sample, ]


#Optimal mtry for Def

err_Def <- c()
for (i in 1:65){
  rf_Def <- randomForest(Tournament.Place~., data = Def_train, mtry = i, importance = TRUE)
  yhat.rf <- predict(rf_Def, newdata = Def_test[,-1])
  err_Def[i] <- colMeans((yhat.rf - Def_test[,1])^2)
}
which.min(err_Def)
#Optimal mtry is 55 for Def

#Random Forests Def

rf_Def <- randomForest(Tournament.Place~., data=Def, importance = TRUE, mtry = 55)
importance(rf_Def)
varImpPlot(rf_Def, n.var = 8)
######################################################

#Add missing GK data
GK_md <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-tournament-player-data.xlsx', sheet = "Tournament Goalkeeping")
GK_md <- GK_md[-c(1:4), ]
names(GK_md) <- GK_md[1,]
GK_md <- GK_md[-1,]
names(GK_md) <- make.names(names(GK_md), unique=TRUE)
GK_md$Pos <- as.factor(GK_md$Pos)
GK_md$Nation <- as.factor(GK_md$Nation)
GK_md <- GK_md %>%
  mutate_at(vars(Age, Born, Playing.Time.MP, Playing.Time.Starts, Playing.Time.Min, Playing.Time.90s, Performance.GA, Performance.GA90, Performance.SoTA, 
                 Performance.Saves, Performance.Save., W, D, L, Performance.CS, Performance.CS., Performance.PKatt, Penalty.Kicks.PKA, Penalty.Kicks.PKsv,
                 Penalty.Kicks.PKm, Penalty.Kicks.Save.), as.numeric)
GK <- subset(clean, Pos %in% c('GK'))
#Cleaning Data
GK_md <- GK_md[, -c(1:3, 5, 25:26)]
GK_md <- GK_md[-c(1:104), ]
GK_combined <- cbind(GK, GK_md)
GK_combined <- GK_combined[, -c(2, 4:21, 44:71)]
GK_combined[is.na(GK_combined)] <- 0


#Test/Train GK
GK_sample <- sample(nrow(GK_combined), 0.2*nrow(GK_combined))
GK_test <- GK_combined[GK_sample, ]
GK_train <- GK_combined[-GK_sample, ]


#Optimal mtry for GK

err_GK <- c()
for (i in 1:39){
  rf_GK <- randomForest(Tournament.Place~., data = GK_train, mtry = i, importance = TRUE)
  yhat.rf <- predict(rf_GK, newdata = GK_test[,-1])
  err_GK[i] <- mean((yhat.rf - GK_test[,1])^2)
}
which.min(err_GK)

#Optimal mtry is 33 for GK

#Random Forests GK

rf_GK <- randomForest(Tournament.Place~., data=GK_combined, importance = TRUE, mtry = 33)
importance(rf_GK)
varImpPlot(rf_GK, n.var = 8)

#Plotting Partial Plots FW
FW <-as.data.frame(FW)
FWimp <- importance(rf_FW)
FWimpvar <- rownames(FWimp)[order(FWimp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 4))
for (i in 1:8) {
  partialPlot(rf_FW, FW, FWimpvar[i], xlab=FWimpvar[i],
              main=paste("FW", FWimpvar[i]))
}
par(op)


#Plotting Partial Plots Mids

Mids <- as.data.frame(Mids)
Midsimp <- importance(rf_Mids)
Midsimpvar <- rownames(Midsimp)[order(Midsimp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 4))
for (i in 1:8) {
  partialPlot(rf_Mids, Mids, Midsimpvar[i], xlab=Midsimpvar[i],
              main=paste("Mids", Midsimpvar[i]))
}
par(op)

#Plotting Partial Plots Def
Def <- as.data.frame(Def)
Defimp <- importance(rf_Def)
Defimpvar <- rownames(Defimp)[order(Defimp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 4))
for (i in 1:8) {
  partialPlot(rf_Def, Def, Defimpvar[i], xlab=Defimpvar[i],
              main=paste("Def", Defimpvar[i]))
}
par(op)

#Plotting Partial Plots GK

GK_combined <- as.data.frame(GK_combined)
GKimp <- importance(rf_GK)
GKimpvar <- rownames(GKimp)[order(GKimp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 4))
for (i in 1:8) {
  partialPlot(rf_GK, GK_combined, GKimpvar[i], xlab=GKimpvar[i],
              main=paste("GK", GKimpvar[i]))
}
par(op)

#League Data
league <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-player-data.xlsx', sheet = "League Data")
league <- league[-c(1:4), -1]
names(league) <- league[1,]
league <- league[-1,]
names(league) <- make.names(names(league), unique = TRUE)

league %>%
  missing_plot()
league$Player <- as.factor(league$Player) 
league$Pos <- as.factor(league$Pos)
league$Nation <- as.factor(league$Nation)
league$Squad <- as.factor(league$Squad)
league$League <- as.factor(league$League)
league$Year <- as.factor(league$Year)

league <- league %>%
  mutate_at(vars(Age, Born, X90s, Gls, Standard.Sh, Standard.SoT, Standard.SoT., Standard.Sh.90, Standard.SoT.90, Standard.G.Sh,
                 Standard.G.SoT, Standard.Dist, Performance.PK, Performance.PKatt, Standard.FK, Expected.xG, Expected.npxG, Expected.npxG.Sh, 
                 Expected.G.xG, Expected.np.G.xG, Total.Cmp, Total.Att, Total.Cmp., Total.TotDist, Total.PrgDist, Short.Cmp, Short.Att, Short.Cmp.,
                 Medium.Cmp, Medium.Att, Medium.Cmp., Long.Cmp, Long.Att, Long.Cmp., Ast, xA, A.xA, KP, X1.3, PPA, CrsPA, Prog, Tackles.Tkl,
                 Tackles.TklW, Tackles.Def.3rd, Tackles.Mid.3rd, Tackles.Att.3rd, Vs.Dribbles.Tkl, Vs.Dribbles.Att, Vs.Dribbles.Tkl., 
                 Vs.Dribbles.Past, Pressures.Press, Pressures.Succ, Pressures.., Pressures.Def.3rd, Pressures.Mid.3rd, Pressures.Att.3rd,
                 Blocks.Blocks, Blocks.Sh, Blocks.ShSv, Blocks.Pass, Int, Tkl.Int, Clr,Err), as.numeric)


#Impute league data
league[is.na(league)] <- 0

#Splitting data into positions

#league FW
leagueFW <- subset(league, Pos %in% c('DFFW', 'FW', 'FWDF', 'FWMF', 'MFFW'))

#league Mids
leagueMids <- subset(league, Pos %in% c('DFMF', 'FWMF', 'GKMF', 'MF', 'MFDF', 'MFFW'))

#league Def
leagueDef <- subset(league, Pos %in% c('DF', 'DFFW', 'DFMF', 'FWDF', 'MFDF'))

#league GK
leagueGK <- subset(league, Pos %in% c('GK', 'GKMF'))

# combining data GK
leagueGKmd <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-player-data.xlsx', sheet = "GK")
leagueGKmd <- leagueGKmd[-c(1:4),]
leagueGKmd <- leagueGKmd[, c(73:91)]
names(leagueGKmd) <- leagueGKmd[1,]
leagueGKmd <- leagueGKmd[-1,]
names(leagueGKmd) <- make.names(names(leagueGKmd), unique = TRUE)
leagueGKmd <- leagueGKmd %>%
  mutate_at(vars(Playing.Time.MP, Playing.Time.Starts, Playing.Time.Min, Playing.Time.90s, Performance.GA, Performance.GA90, Performance.SoTA, 
                 Performance.Saves, Performance.Save., W, D, L, Performance.CS, Performance.CS., Performance.PKatt, Penalty.Kicks.PKA, Penalty.Kicks.PKsv,
                 Penalty.Kicks.PKm, Penalty.Kicks.Save.), as.numeric)
leagueGKcombined <- cbind(leagueGK,leagueGKmd)
names(leagueGKcombined) <- make.names(names(leagueGKcombined), unique = TRUE)


#predict for League FWs

FWPred <- predict(rf_FW, newdata = leagueFW)
FWScore <- cbind(leagueFW, FWPred)
FWScore <- FWScore[, c(1:5,25:26,72)]
FWRank <- FWScore[order(FWPred),]
#write.csv(FWRank, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/FW_Rank.csv")

#predict for League Mids
MidsPred <- predict(rf_Mids, newdata = leagueMids)
MidsScore <- cbind(leagueMids, MidsPred)
MidsScore <- MidsScore[, c(1:5,25:26,72)]
MidsRank <- MidsScore[order(MidsPred),]
#write.csv(MidsRank, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/Mids_Rank.csv")


#predict for League Def
DefPred <- predict(rf_Def, newdata = leagueDef)
DefScore <-cbind(leagueDef, DefPred)
DefScore <- DefScore[, c(1:5,25:26,72)]
DefRank <- DefScore[order(DefPred),]
#write.csv(DefRank, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/Def_Rank.csv")

GKPred <- predict(rf_GK, newdata = leagueGKcombined)
GKScore <- cbind(leagueGKcombined, GKPred)
GKScore <- GKScore[,c(1:5,25:26,91)]
GKRank <-GKScore[order(GKPred), ]

#write.csv(GKRank, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/GK_Rank.csv")

#Team SUccess
names(tournament)
FW_a <- subset(tournament, Pos %in% c('DFFW', 'FW', 'FWDF', 'FWMF', 'MFFW'))
FW_b <- FW_a[, c(1,3,31,32,10)]
FW_c <- aggregate(.~Nation, data = FW_b, FUN = mean)
Mids_a <- subset(tournament, Pos %in% c('DFMF', 'FWMF', 'GKMF', 'MF', 'MFDF', 'MFFW'))
Mids_b <- Mids_a[, c(1,3,32,8,51)]
Mids_c <- aggregate(.~Nation, data = Mids_b, FUN = mean)
Def_a <- subset(tournament, Pos %in% c('DF', 'DFFW', 'DFMF', 'FWDF', 'MFDF'))
Def_b <- Def_a[, c(1,3,59,25,27)]
Def_c <- aggregate(.~Nation, data = Def_b, FUN = mean)
GK_a <- subset(tournament, Pos %in% c('GK'))
GK_b <- cbind(GK_a, GK_md)
GK_c <- GK_b[, c(1,3,82,75,76)]
GK_d <- aggregate(.~Nation, data = GK_c, FUN = mean)
GK_e <- c("Dosqaly", 9, 0, 0, 0)
GK_f <- rbind(GK_d,GK_e)
GK_f <- GK_f[c(1:3, 24, 4:23),]
tourn_av <- cbind(FW_c, Mids_c, Def_c, GK_f)
names(tourn_av)
tourn_av <- tourn_av[, c(2:5, 8:10, 13:15,18:20)]

success <- randomForest(Tournament.Place~., data=tourn_av, importance = TRUE, mtry = 6)
chosen <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-player-data.xlsx', sheet = "Chosen Team")
chosen <- chosen[-c(1:4), ]
names(chosen) <- chosen[1,]
chosen <- chosen[-1,]
names(chosen) <- make.names(names(chosen), unique=TRUE)
chosen$Pos <- as.factor(chosen$Pos)
chosen$Nation <- as.factor(chosen$Nation)
chosen <- chosen %>%
  mutate_at(vars(Age, Born, X90s, Gls, Standard.Sh, Standard.SoT, Standard.SoT., Standard.Sh.90, Standard.SoT.90, Standard.G.Sh,
                 Standard.G.SoT, Standard.Dist, Performance.PK, Performance.PKatt, Standard.FK, Expected.xG, Expected.npxG, Expected.npxG.Sh, 
                 Expected.G.xG, Expected.np.G.xG, Total.Cmp, Total.Att, Total.Cmp., Total.TotDist, Total.PrgDist, Short.Cmp, Short.Att, Short.Cmp.,
                 Medium.Cmp, Medium.Att, Medium.Cmp., Long.Cmp, Long.Att, Long.Cmp., Ast, xA, A.xA, KP, X1.3, PPA, CrsPA, Prog, Tackles.Tkl,
                 Tackles.TklW, Tackles.Def.3rd, Tackles.Mid.3rd, Tackles.Att.3rd, Vs.Dribbles.Tkl, Vs.Dribbles.Att, Vs.Dribbles.Tkl., 
                 Vs.Dribbles.Past, Pressures.Press, Pressures.Succ, Pressures.., Pressures.Def.3rd, Pressures.Mid.3rd, Pressures.Att.3rd,
                 Blocks.Blocks, Blocks.Sh, Blocks.ShSv, Blocks.Pass, Int, Tkl.Int, Clr,Err), as.numeric)
FW_ca <- subset(chosen, Pos %in% c('FW'))
FW_cb <- FW_ca[, c(34, 35, 11)]
FW_cc <- colMeans(FW_cb)
Mids_ca <- subset(chosen, Pos %in% c('MF'))
Mids_cb <- Mids_ca[, c(9,35,54)]
Mids_cc <- colMeans(Mids_cb)
Def_ca <- subset(chosen, Pos %in% c('DF'))
Def_cb <- Def_ca[,c(62,30,28)]
Def_cc <- colMeans(Def_cb)
chosen_Gk <- read_excel('C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/2022-student-research-case-study-player-data.xlsx', sheet = "Chosen Goalkeeper")
chosen_Gk <- chosen_Gk[-c(1:4), ]
names(chosen_Gk) <- chosen_Gk[1,]
chosen_Gk <- chosen_Gk[-1,]
names(chosen_Gk) <- make.names(names(chosen_Gk), unique=TRUE)
chosen_Gk <- chosen_Gk %>%
  mutate_at(vars(Playing.Time.MP, Playing.Time.Starts, Playing.Time.Min, Playing.Time.90s, Performance.GA, Performance.GA90, Performance.SoTA, 
                 Performance.Saves, Performance.Save., W, D, L, Performance.CS, Performance.CS., Performance.PKatt, Penalty.Kicks.PKA, Penalty.Kicks.PKsv,
                 Penalty.Kicks.PKm, Penalty.Kicks.Save.), as.numeric)

Gk_ca <- chosen_Gk[, c(19, 12, 13)]
Gk_cb <- colMeans(Gk_ca)

chose_team <- c(0,FW_cc, Mids_cc, Def_cc, Gk_cb)
names(chose_team) <- make.names(names(tourn_av[-1]))
chose_team

test <- rbind(tourn_av, chose_team)
place <- predict(success, newdata = test[25,])


kms <- predict(success, newdata = test[25,], predict.all = TRUE)
kms1 <- data.frame(matrix(unlist(kms$individual), nrow=length(kms$individual), byrow=TRUE))
write.csv(kms1, file = "C:/Users/jason/Documents/2022/Trimester 1/Actl4001/Group Project/prediction.csv")

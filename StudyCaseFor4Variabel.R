#Import library openxlsx to read file .xlsx
#[1]
library(openxlsx)

#Read data on sheet "csdata" in file "https://storage.googleapis.com/dqlab-dataset/dqlab_pcadata.xlsx" and save the name file with "csdat_raw"
#[2]
csdat_raw <- read.xlsx("https://storage.googleapis.com/dqlab-dataset/dqlab_pcadata.xlsx", sheet = "csdata")

#Show structure data using str()
#[3]
str(csdat_raw)

#Show multiple observations row with head() function
#[4A]
head(csdat_raw)

#Show descriptive statistic for all variable in data
#[4B]
summary(csdat_raw)

#Describe the distribution of Income by Dependents
library(ggplot2)
ggplot(csdat_raw, aes(as.factor(dependents), income)) + 
  geom_boxplot() + xlab("Dependents") + ggtitle("Boxplot Income Berdasarkan Dependents")

#Split data for train set and testing set for each risk rating
#Record index / line number for each risk rating
#[5]
index1 <- which(csdat_raw$riskrating == 1)
index2 <- which(csdat_raw$riskrating == 2)

#Record the index for the next risk rating
#[6]
index3 <- which(csdat_raw$riskrating == 3)
index4 <- which(csdat_raw$riskrating == 4)
index5 <- which(csdat_raw$riskrating == 5)

#80% data will using as a train set.
#[7]
ntrain1 <- round(0.8 * length(index1))
ntrain2 <- round(0.8 * length(index2))
ntrain3 <- round(0.8 * length(index3))
ntrain4 <- round(0.8 * length(index4))
ntrain5 <- round(0.8 * length(index5))

#set seeds set in 100 so that this sampling can be reproduced
set.seed(100)

#Sampling data in each rating for train set 
#[8]
train1_index <- sample(index1, ntrain1)
train2_index <- sample(index2, ntrain2)
train3_index <- sample(index3, ntrain3)
train4_index <- sample(index4, ntrain4)
train5_index <- sample(index5, ntrain5)

#Save data into testing set
#[9]
test1_index <- setdiff(index1, train1_index)
test2_index <- setdiff(index2, train2_index)
test3_index <- setdiff(index3, train3_index)
test4_index <- setdiff(index4, train4_index)
test5_index <- setdiff(index5, train5_index)

#Combining the sampling results of each risk rating into a training set
csdattrain <- do.call("rbind", list(csdat_raw[train1_index,],
                                    csdat_raw[train2_index,], csdat_raw[train3_index,],
                                    csdat_raw[train4_index,], csdat_raw[train5_index,]))
cstrain <- subset(csdattrain, select =
                    -c(contractcode,riskrating))

#Combining the sampling results of each risk rating into a testing set
csdattest <- do.call("rbind", list(csdat_raw[test1_index,],
                                   csdat_raw[test2_index,], csdat_raw[test3_index,],
                                   csdat_raw[test4_index,], csdat_raw[test5_index,])) #[10]
cstest <- subset(csdattest, 
                 select = -c(contractcode,riskrating)) #[11]

#Count correlation between variable 
cor(cstrain)

#Do analysis PCA with prcomp() function and save output into object with names pr.out
#[12]
pr.out <- prcomp(cstrain, scale = TRUE, center = TRUE)

#Show output PCA with call object pr.out 
#[13]
pr.out

#Show summary from output PCA
#[14]
summary(pr.out)

#Visualizationscree plot using screeplot() function 
#[15]
screeplot(pr.out, type = "line", ylim = c(0,2))

#Add horizontal line as a command to using Kaiser criteria 
abline(h = 1, lty = 3, col = "red")

#Visualization biplot using biplot() function 
#[16]
biplot(pr.out, scale = 0) #draw first 2 principal components
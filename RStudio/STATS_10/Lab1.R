##### Section 1 #####
#1. Vectors
pinky <- c(2, 1.8, 2.2)
pinky

cities <- c("LA", "Rowland Heights", "Diamond Bar")
cities

cbind(pinky, cities)
class(cbind(pinky, cities))
 

# 2. - Downloading Data
# 2a.
NCbirths <- read.csv(file = "births2022.csv")

## or 
NCbirths <- read.csv(file.choose())
# confirm the import was successful
head(NCbirths)
# return the first 6 rows of the data set


# 3. - Load the maps package
# 1. built in functions (print/ c/ head)
# 2. functions in specific packages (need to install first)
# a.
install.packages("maps")
find.package("maps")

# b. 
library(maps)
map("state")


# 4. – Perform vector operations
# a. dollar sign extracts a certain variable from data set
weights <- NCbirths$weight

#b. What units do you think the weights are in?
# ounces

#  c. 
weights_in_pounds <- weights/16

#d. 
weights_in_pounds[1:10]
1:10 # 1 2 3 4 5 6 7 8 9 10


##### Section 2 #####

# 1.
mean(NCbirths$Fage)
sd(NCbirths$Fage)

# 2.
install.packages("mosaic")
library(mosaic)
tally(NCbirths$Habit, format = "count")
tally(NCbirths$Habit, format = "percent")

# 3. 
17 - 9.340944

# or 
habit_tally <- tally(NCbirths$Habit, format = "percent")
17 - habit_tally[2]

# backup plan if mosaic package doesnt work
# table(NCbirths$Habit)


#### Section 3 - Visualizing Data (one quantitative variable) ####
# 1. 
dotPlot(weights_in_pounds, pch = 2) # pch changes the size of the dots
# talk about modes symmetry skewness outliers

# 2. 
histogram(weights_in_pounds, nint = 5)
histogram(weights_in_pounds, nint = 20)
histogram(weights_in_pounds, nint = 100)
# Best visualization: A histogram with more bins gives a more detailed graph
# But if a simple graph with little detail is needed fewer bins 

# 3. 
boxplot(NCbirths$Mage, NCbirths$Fage)

# 4. 
histogram(~ weight | Habit, data = NCbirths, layout = c(1, 2))

#### Section 4 - Visualizing Data (2 categorical) ####
# 1.
tally_condition <- tally(~Habit | MomPriorCond, data = NCbirths, 
                         format = "proportion") # mothers prior condition
tally_condition

# 2. 
tally_condition_new <- tally(~Habit | Gender, data = NCbirths, 
                         format = "proportion") # gender of baby
tally_condition_new
barplot(tally_condition_new)


#### Section 5 - Visualizing Data (2 quantitative) ####
plot(NCbirths$weight ~ NCbirths$Gained)

plot(NCbirths$weight ~ NCbirths$Gained, col = "green", cex = 1.5, pch = 2, xlab = "Weight gained during pregnancy", ylab = "Baby weight (oz.)",
     main = "Baby weight vs. pregnancy weight gain")

# 1.
plot(NCbirths$weight ~ NCbirths$Mage, col = "green", cex = 1.5, pch = 4, xlab = "Mother's Age during Pregnancy", ylab = "Baby weight (oz.)",
     main = "Baby Weight vs. Mother's Age")

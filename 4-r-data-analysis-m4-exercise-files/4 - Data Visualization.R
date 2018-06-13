# Set working directory
setwd("E://R/Data Analysis/4-r-data-analysis-m4-exercise-files")

# Load CSV data
movies <- read.csv("Movies.csv", quote = "\"")

genres <- read.csv("Genres.csv", quote = "\"")

# Peek at the data
head(movies)

head(genres)

# Univariate visualizations for a qualitiative variable
# MEASURES OF CENTRAL TENDENCY: SINGLE NUMERIC VARIABLE
mean(movies$Runtime)
median(movies$Runtime)
max(movies$Runtime)

MEASURES OF DISPERSION (SPREAD) SINGLE NUMERIC VARIABLE
min(movies$Runtime)
max(movies$Runtime)
range(movies$Runtime) # Get both values (min and max) as a vector
diff(range(movies$Runtime)) # Get the difference of the min and max values
quantile(movies$Runtime)
quantile(movies$Runtime, 0.25) # Get the first quartile
quantile(movies$Runtime, 0.90) # Get the 90th percentile
IQR(movies$Runtime) # Get the interquartile range (3rd quartile - 1st quartile)
var(movies$Runtime) # Get the variance (measured in minutes squared)
sd(movies$Runtime) # Get the standard deviation (measured in minutes)

# USE THE "moments" PACKAGE FOR SKEWNESS AND KURTOSIS
# Download the package: moments
install.packages("moments")

# Load the package
lbrary(moments)

#Set the working directory
setwd("E://R/Data Analysis/5-r-data-analysis-m5-exercise-files")

# Measure the skewness of the data
skewness(movies$Runtime)

# Look at the kurtosis of the data
kurtosis(movies$Runtime)

# Create a bar graph of rating observations
plot(movies$Rating)

# Summarize 1 Quantitative Variable
summary(movies$Rating)

# Create a pie chart of rating observations
pie(table(movies$Rating))

# Univariate visualizations of
# a quantitiative variable

# Create a dot plot of runtime
plot(
  x = movies$Runtime, 
  y = rep(0, nrow(movies)), 
  ylab = "", 
  yaxt = "n")

# Create a boxplot of runtime
boxplot(
  x = movies$Runtime, 
  xlab = "Runtime (minutes)", 
  horizontal = TRUE)

# Create a histogram of runtime
hist(movies$Runtime)

# Create a more course-grain histogram
hist(
  x = movies$Runtime,
  breaks = 10)

# Create a more fine-grain histogram
hist(
  x = movies$Runtime,
  breaks = 30)

# Create a density plot of runtime
plot(density(movies$Runtime))

# Add dot plot to base of density plot
points(
  x = movies$Runtime, 
  y = rep(-0.0005, nrow(movies)))

# ANALYSIS OF BIVARIATE VARIABLES: 2 QUALITATIVE VARIABLES

# Build a contingency table
table(genres$Genre, genres$Rating)

# Bivariate visualizations for two qualitiative variables

# Determine the covariance of 2 Numeric Variables: Critic's Score and Box Office
cov(movies$Critic.Score, movies$Box.Office)

# The correlation coefficient allows us to compare the covariance of 2 numeric variables on the same scale
cor(movies$Runtime, movies$Box.Office)
cor(movies$Critic.Score, movies$Box.Office)

# BIVARIATE ANALYSIS OF A QUALITATIVE AND A QUANTITATIVE VARIABLE
#We want to determine the average box office revenue across each rating category.
tapply(movies$Box.Office, movies$Rating, mean)
tapply(genres$Genre, genres$Genre, mean)

# Summarize the data
summary(movies)
summary(genres)

# VISUALIZING DATA: 1 CATEGORICAL VARIABLE

# BAR GRAPH: 1 CATEGORICAL VARIABLE
plot(movies$Rating)

# PIE CHART: 1 CATEGORICAL VARIABLE AS PART OF THE WHOLE
pie(table(movies$Rating))

# VISUALIZING DATA: 1 NUMERICAL VARIABLE

# DOT PLOT: 1 NUMERIC VARIABLE
plot(x=movies$Runtime, y=rep(0, nrow(movies)), ylab="", yaxt="n")

# BOX PLOT: 1 NUMERIC VARIABLE
boxplot(x=movies$Runtime, xlab="Runtime (mins)", horizontal=TRUE)

# HISTOGRAM: 1 NUMERIC VARIABLE
hist(movies$Runtime) # Number of bins=20 by default
hist(movies$Runtime, breaks=10) # Number of bins=10
hist(movies$Runtime, breaks=30) # Number of bins=30

# DENSITY PLOT: 1 NUMERIC VARIABLE
plot(density(movies$Runtime))
 
#ADDED DOT PLOT AT BASE OF DENSITY PLOT
points(x=movies$Runtime, y=rep(-0.0005, nrow(movies)))

# VISUALIZATION OF 2 CATEGORICAL VARIABLES

# SPINE PLOT: 2 CATEGORICAL VARIABLES (genre and rating)
spineplot(
  x = genres$Genre, 
  y = genres$Rating)

# # MOSAIC PLOT: 2 CATEGORICAL VARIABLES(genre and rating)
mosaicplot(
  x = table(
    genres$Genre, 
    genres$Rating),
  las = 3)

# VISUALIZATION OF 2 NUMERIC VARIABLES

# SCATTERPLOT: 2 NUMERIC VARIABLES (runtime and box office)
plot(
  x = movies$Runtime, 
  y = movies$Box.Office)

# SCATTERPLOT: 2 NUMERIC VARIABLES (critic score and box office)
plot(
  x = movies$Critic.Score, 
  y = movies$Box.Office)

# LINE PLOT: 2 NUMERIC VARIABLES (count of movies by year)
plot(
  x = table(movies$Year),
  type = "l")

# Bivariate visualizations for both a 
# qualitiative and quantitiative variable

# BAR GRAPH: 1 CATEGORIC + 1 NUMERIC VARIABLES (average box office by rating)
barplot(tapply(movies$Box.Office, movies$Rating, mean))

#BAR GRAPH: 1 CATEGORIC + 1 NUMERIC VARIABLE (average box office by genre)
barplot(
  height = tapply(genres$Box.Office, genres$Genre, mean),
  las = 3)

# BOX PLOT: 1 CATEGORICAL + 1 NUMERIC VARIABLE (box office by rating)
plot(
  x = movies$Rating, 
  y = movies$Box.Office)

# Summarizing an entire table

# SCATTERPLOT MATRIX
plot(movies)

# Cleaning up data visualizations

# Create a bar chart with defaults
plot(movies$Rating)

# Clean up the bar chart
plot(
  x = movies$Rating,
  main = "Count of Movies by Rating",
  xlab = "Rating Category",
  ylab = "Count of Movies",
  col = "#b3cde3")

# View help for plots and parameters
?plot
?par


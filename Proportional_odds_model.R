data <- read.csv("E:\\4th year 1st sem\\ST 4052 Stat Learning\\project1-Air quality\\pre_processed.csv")
head(data)

str(data)
# convert discipline to ordered factor
data$ AQI.Category<- ordered(data$ AQI.Category, 
                             levels = c('Good', 'Moderate', 'Unhealthy'))

# check conversion
str(data)

# apply as.factor to four columns
cats <- c( "Country", "City", "Continent")
data[ ,cats] <- lapply(data[ ,cats], as.factor)

# check again
str(data)

# Assuming you have a data frame named 'data'
column_names <- colnames(data)
# Print the column names
print(column_names)


# run proportional odds model
library(MASS)
model <- polr(
  formula = AQI.Category ~.,
  data = data
)


# get summary
summary(model)
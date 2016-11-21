# GGPlot - Grammar of Graphics - Developed by Hadley Wickham

# Data, Aesthetics, Geometries - Layers of visualization

# Library Required.
library(ggplot2)

# Built-in Date Details (mtcars)
# The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 
# 10 aspects of design and performance for 32 cars (1973-74 models).
head(mtcars)
tail(mtcars)
summary(mtcars)
colnames(mtcars)

str(mtcars)
print(mtcars)

## Adding Class to show better plots below
mtcars["class"] <- c("Medium","Medium","Luxury","Medium","Luxury","Medium","Luxury","Economy","Economy","Medium","Medium","Luxury", 
                     "Medium","Luxury","Medium","Luxury","Luxury","Economy","Economy","Economy","Luxury","Luxury","Economy","Economy",
                    "Medium","Economy","Economy","Medium", "Luxury","Medium","Medium","Economy")

## Adding drive to show better plots below
mtcars["drive"] <- c("FW","AW","RW","RW","FW","AW","FW","AW","AW","RW","RW","AW","FW","RW","RW","FW","RW","AW","AW","FW","AW","RW","RW","RW","AW","RW","RW","FW","FW","RW","AW","RW")

pl <- ggplot(data=mtcars, aes(x=mpg, y=hp))

# We need to use geometries
pl + geom_point()

# Facets, Statistics, Coordinates
plot <- ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()  # separated by cylinder
print(plot)

plot <- ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + facet_grid(cyl ~.)  # separated by cylinder
print(plot)

# Add smooth line
plot <- ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + facet_grid(cyl ~.) + stat_smooth() 
print(plot)

plot2 = plot + coord_cartesian(xlim=c(15,25))  # X-Axis limited to 15-25
print(plot2)

plot3 = plot + coord_cartesian(ylim=c(150,250))  # Y-Axis limited to 150-250
print(plot3)

# Theme
theme0 = plot2 + theme_bw()         # Lookup Theme to change the background.
print(theme0)


# Histogram Graph - Single variable

# continuous data
hist1 <- ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
print(hist1)

# discrete data
hist2 <- ggplot(data=mtcars, aes(x=cyl)) + geom_histogram()
print(hist2)

hist2 <- ggplot(data=mtcars, aes(x=cyl)) + geom_histogram()
hist2 + geom_histogram(binwidth = .25, color='blue')   # outlines the bar with blue color.
hist2 + geom_histogram(binwidth = .25, color='blue', fill='blue')


hist2 + geom_histogram(binwidth = .25, color='blue', fill='blue')

## Add Title, lables
hist3 <- hist2 + geom_histogram(binwidth = .25, color='blue', fill='blue')

hist3 + xlab('Cylinder') + ylab('Number of Cars') 

hist3 + ggtitle('Comparison of Cylinders in Car')


# Scatter plots 
# two variables and continuous
Splot1 = ggplot(data=mtcars, aes(x=wt, y=mpg))
Splot1 + geom_point()


Splot1 + geom_point(size=4)
Splot1 + geom_point(size=4, alpha=.5)

# Something like Bubble Graph 
Splot1 + geom_point(aes(size=hp))

# cyl are treated as continuous
Splot1 + geom_point(aes(size=cyl))

# treat cyl as categorical, 
Splot1 + geom_point(aes(size=factor(cyl)))   

# Make it with color.
Splot1 + geom_point(aes(size=factor(cyl), color=factor(cyl)) )  

# Keep different shape for each cylinder category
Splot1 + geom_point(aes(shape=factor(cyl)), size=6)   

# Now color by cylinder - Useful for segmentation
Splot1 + geom_point(aes(shape=factor(cyl), size=6, color=factor(cyl)))

# Use hex color code -- www.color-hex.com
  
# Bar plot
# Mainly used to display Counts with Categorical data. (histogram - Continuous and discrete numbers)
# data frame assignment
df <- mtcars #mpg  
head(df)
tail(df)
str(df)

barplot1 <- ggplot(df, aes(x=class))
barplot1 + geom_bar()

# Color the bars
barplot1 + geom_bar(color='blue')
barplot1 + geom_bar(fill='blue')

# drv - drive category (group by & show with different color) - 4 - 4 Wheel 
barplot1 + geom_bar(aes(fill=drive))

# Use Position to display side by side comparison.- multi-stack
barplot1 + geom_bar(aes(fill=drive), position='dodge')

# you can use it as 100% also - You won't get count.
barplot1 + geom_bar(aes(fill=drive), position='fill')  

# To flip 
barplot1 <- ggplot(df, aes(x=class)) + coord_flip()
barplot1 + geom_bar()


# Box Plot
# Mainly used to display distribution of Numerical variables.

boxplot1 <- ggplot(mtcars, aes(x=cyl, y=mpg))

# box plot should have categorical variables on X axis and not continuous variable. so let us factor the cyl.
boxplot1 <- ggplot(mtcars, aes(x=factor(cyl), y=mpg))
print(boxplot1 + geom_boxplot())

# Bottom - 1st Q-tile, Top - 3rd Q-tile, Median.
# Cylinder 8 has points outside (Outliers)

# We can flip the coordinates.
print(boxplot1 + geom_boxplot() + coord_flip())

# We can add color
print(boxplot1 + geom_boxplot(aes(fill=factor(cyl))))

## Plotly Library - To make ggplot interactive
Library(plotly)

## ********************************************************************
## Further Info: Plotly is the modern platform for agile business intelligence and data science.
## Website: https://plot.ly/ & https://plot.ly/r/getting-started/
## ********************************************************************

library(plotly)

pl <- ggplot(data=mtcars, aes(x=mpg, y=hp))
# We need to use geometries
pl <- pl + geom_point()

## Spread in ggplotly
print(ggplotly(pl))

## Histogram in ggplotly
hist1 <- ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
print(hist1)
print(ggplotly(hist1))

 
Splot1 = ggplot(data=mtcars, aes(x=wt, y=mpg))
Splot1 + geom_point()
## Now with Plotly
Splot1 <- Splot1 + geom_point()

barplot1 <- ggplot(df, aes(x=class))
barplot1 + geom_bar()
## Now with plotly
barplot1 <- barplot1 + geom_bar()
print(ggplotly(barplot1 ))

## Now Nicer Plots with plotly (With plot.ly website)
#library(plotly)
p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
p

#library(plotly)
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = ~carat, y = ~price, color = ~carat,
        size = ~carat, text = ~paste("Clarity: ", clarity))


p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity))) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

ggplotly(p)


# library(plotly)
plot_ly(z = volcano, type = "heatmap")

## Many More....on the website.
 
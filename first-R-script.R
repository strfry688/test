# We precede comments with a pound sign.
# We can do basic arithmetic in R, and store variables using <-.
1+6
a <- 2
b <- 3
a+b

#Vectors are a crucial part of R. 
#We create them with c(), and can perform arithmetic without for loops.
v <- c(3,5,10,40)
v
v[2]
v^2
3*v
v>8
v[v>8]
w <- seq(1,30,4)
w
w[c(1,2,3)]
w[w>10 & w<20]

# R comes preloaded with several data sets. 
#We'll use the mtcars data set for the rest of this task.
data()

?mtcars
mtcars
head(mtcars)
head(mtcars,8)
View(mtcars)

mtcars$mpg
mean(mtcars$mpg)
median(mtcars$mpg)
hist(mtcars$mpg)
boxplot(mtcars$mpg)
boxplot(mtcars)
summary(mtcars)

x <- mtcars$wt
y <- mtcars$mpg
plot(x,y)
plot(x, y,
     xlab = "Weight (1000lbs)",
     ylab = "Miles per gallon",
     main = "Weight vs miles per gallon")

#To learn more about the any function, precede it with a question mark.  
#We'll be using more developed plotting packages than base R's plot function. 
#Don't worry about mastering all of base R's notation below. 
?plot

mtcars$mpg>30
mtcars[mtcars$mpg>30,]
mtcars[mtcars$mpg>30,c(1,2)]

#Let's focus on the cars whose mpg>20. 
#This is an example of basic wrangling.
wrangled_data <- mtcars[mtcars$mpg>20,c(1,6,9)]
wrangled_data

x <- wrangled_data$wt
y <- wrangled_data$mpg
plot(x, y,
     xlab = "Weight (1000lbs)",
     ylab = "Miles per gallon",
     main = "Weight vs miles per gallon if mgp>24")


#The code below comes from the help file for mtcars.
?mtcars
require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
## possibly more meaningful, e.g., for summary() or bivariate plots:
mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})
summary(mtcars2)


#Here we use our wrangled data set to compare mpg to wt with am as a factor.
coplot(mpg ~ wt | as.factor(am), data = wrangled_data,
       panel = panel.smooth, rows = 1)

# Which of the variables are the biggest contributing factors to a lower mpg (better gas efficiency)?


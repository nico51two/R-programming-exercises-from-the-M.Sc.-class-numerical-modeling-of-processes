# Tasks for R-commands

# 1.create a vector containing the names of 5 tree species

v_1 <- c("Robinia", "Ulmus", "Castanea", "Picea", "Tilia")

# 2.create  a vector containing the integers between 2 and 6 by two different
# R-ways

v_2 <- c(2:6)
v_2 <- seq(2,6,1)

# 3.create a vector containing 5 uniformly distributed random numbers

set.seed(42)

v_4 <- runif(5)

# 4.create a vector containing 5 randomly chosen  values between 35 and  77
# (uniformly distributed), e.g. the tree diameter in breast height

bhd <- runif(5, 35, 77)

# 5.create a vector containing 5 randomly chosen  values with arithmetic
# average of 50 and standard deviation of 15

v_5 <- sample(rnorm(mean=50,
                    sd=15,
                    n=(9999)),
                    5)

# or?

v_5 <- rnorm(mean=50, sd=15, n=5)

# or?

library(distr)

g <- Norm(mean=50 ,sd=15)

# these are now distr::sd() and distr::(mean) 
sd(g)
mean(g)

h <- r(g)(5)

detach("package:distr", unload = TRUE)

# base sd() and mean()
sd(h)
mean(h)

# Meh.

# 6.create a vector with 6 integer numbers

v_6 <- sample(6)


# 7.remove the 6th entry of the vector

v_6 <- v_6[-6]

# 8.put together the vectors 1, 2, and 5 into a data frame with meaningful
# column names

my_df <- data.frame(species=v_1,bhd=v_5,id=v_2)

# 9.put together the vectors 1,2, and 5 into a list

my_list <- list(species=v_1,bhd=v_5,id=v_2)

# 10.explore differences between 8. and 10.

class(my_df)
length(my_df)

class(my_list)
length(my_list)

my_list == my_df

# 11.access the diameter of tree 3 in the data frame by two different R-ways

dt3 <- my_df[3,"bhd"]

dt3 <- my_df[3,2]

# 12.access the dbh vector of the list

my_list[2]
my_list["bhd"]



# 13.access the diameter of the third tree in the list using different R-ways

my_list[[2]][3]
my_list[["bhd"]][3]

# 14.multiply all diameters of trees with 1.2, when the diameter is larger
# than 50 cm by using the ifelse() function


bhd_2 <- ifelse(bhd>50, yes=bhd*1.2, no=bhd)

bhd_2/bhd

# 15.do the same process by using a for-loop and  if â else branching

bhd_3 <- bhd

for (i in c(1:length(bhd_3))) {
  if (bhd_3[i] > 50) {
    bhd_3[i] <- bhd_3[i]*1.2
    
  }
  
}

bhd_3/bhd
bhd_3==bhd_2


# 16.program a simple example for a while-loop

ctr <- 0

while (ctr < 42) {
  print(ctr)
  ctr <- ctr+1
  
}

# a for-loop

meh <- numeric()

for (i in c(1:ctr)) {
  if (c(1:ctr)[i]%%2==0) {
    print(i)
    meh[i] <- i
    
  } else {
    print("Meh.")
  }
  
}

# a repeat-loop and try the break command

x <- 1

repeat {
  print(x)
  x = x+1
  if (x == 42){
    break
  }
}

# 17.add a row with  a 6th tree species to your data frame

v_7 <- c("Cocos", runif(1, 20,25), 7)
  
my_df <- rbind(my_df, v_7)

my_df <- rbind(my_df, c("Cocos", runif(1, min=min(bhd), max=max(bhd), id=7)))

# 18.create a matrix with random integers between 0 and 1000  with 3 colums and
# 6 rows

my_mt <- matrix(ncol = 3, nrow = 6, data = c(sample(0:1000), 18))

#Manual Debugging

#Select the first and third argument in a vector of integers.
c(1:4)[-c(2,4)]
c(1:4)[c(1,3)]

#I want to add two numerics - whats wrong?
1.3+3.7

#c() combines single values to a vector. 
c(3,2,6,8.3,0,3) + c(1,1,2,2,5,5)

#rep() allows to repeat e.g. a vector of characters (a,b,c) 
rep(c("a", "b", "c"), 2)

#The result must be 300
sum(((1*2*3)+(1*3*2))*(2 + 3)*5)

###unexpected ',' # MOVE first c into the bracket to the right
sum((c(1,2,3)+c(1,3,2))*(2 + 3)*5)


###could not find function error

#a
set <- mtcars
set[,3]

#b  # not sure what this one is about
sun <- seq(50)

#c
dplyr::lead(seq(10))

### unexpected '='
if(10 == 10){print('the statement is true')}

a = 11
if(a >= 10){print('the statement is true')}

###subscript out of bounds
mat <- matrix(ncol = 5, nrow = 4)
mat[,5]

###non-numeric argument to binary operator
# not sure about this one
c(LETTERS[1:10], seq(10))

###warning message - number of rows of result is not a multiple of vector length
cbind(mtcars[,1], seq(15))
rbind(mtcars[1,], seq(15))
cbind(mtcars[1,], seq(11))

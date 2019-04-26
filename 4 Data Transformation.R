# #Data transformation
# that you get the data in exactly the right form you need. 
# Often you’ll need to create some new variables or summaries,
# you just want to rename the variables or reorder the observations in order to make the data a 
# little easier to work with
# you how to transform your data using the dplyr package 
# and a new dataset on flights departing New York City in 2013

# dplyr package is member of tidyverse
library(nycflights13)
library(tidyverse)
nycflights13::flights 
flights
View(flights)

# dplyr functions that allow you to solve the vast majority of your data manipulation challenges:
# •Pick observations by their values ( filter() ).
# •Reorder the rows ( arrange() ).
# •Pick variables by their names ( select() ).
# •Create new variables with functions of existing variables ( mutate() ).
# •Collapse many values down to a single summary ( summarise() ).

# used in conjunction with  group_by()  which changes the scope of each function 
# from operating on the entire dataset to operating on it group-by-group

# filter()  allows you to subset observations based on their values. 
# The first argument is the name of the data frame. 
# The second and subsequent arguments are the expressions that filter the data frame
filter(flights,month==1,day==1)

# dplyr executes the filtering operation and returns a new data frame. 
# dplyr functions never modify their inputs, so if you want to save the result, 
# you’ll need to use the assignment operator,  <- :
jan1 = filter(flights,month==1,day==1)
jan1
#to view in table
View(jan1)

#if you want to print and save the result, wrap assignment in parentheses
(dec25 = filter(flights, month == 12, day == 25))

# for filter use   > ,  >= ,  < ,  <= ,  !=  (not equal), and  ==  (equal)

# Logical operators :  &  is “and”,  |  is “or”, and  !  is “not”
filter(flights, month == 11 | month == 12)

# flights that weren’t delayed (on arrival or departure) by more than two hours
# # De Morgan's law  !(x & y)  is the same as  !x | !y , 
# and  !(x | y)  is the same as  !x & !y 
filter(flights, !(arr_delay <= 120 | dep_delay <= 120))


# arrange () Reorder the rows , it works similarly to  filter()  except that instead of selecting rows, 
# it changes their order
arrange(flights, year, month, day)
# desc()  to re-order by a column in descending order
arrange(flights,desc(year))


# •Pick variables/columns by their names select()
select(flights, year, month, day)

# Select all columns between year and day (inclusive)
select(flights, year:day)  
# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))


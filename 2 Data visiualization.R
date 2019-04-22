# select block of code to commnet and Press - Ctrl+Shift+C
# 1 Downloading/importing data in R
# 2 Data visualisation, ggplot2 etc
# 3 Data transformation
# 4 Exploratory analysis

#check wd			
getwd()

#working directory set path			
path ="D:/Office/R"	
setwd(path)


#check installed package			
installed.packages()

#install package - read.csv
install.packages("tidyverse")

#load datasets - train, test			
train = read.csv("Train_UWu5bXk.csv")		
#check dim			dim(train)		
#check if data has missing values			
table(is.na(train))		
#find columns having missing val			
colSums(is.na(train))		




#load tidyverse, ggplot2 lib eveytime R studio session has started
library(tidyverse)

#Graphical Representation of Variables
library(ggplot2)

ggplot2::ggplot() 


#ggplot () function 		this creates empty graph
ggplot2::mpg 
mpg

ggplot(data = mgp)
# # geom 	geometric object 		like points, smooth line, bar etc		
# geom_point	function 	creates a scatterplot, add layers of points to graph like x and y axis							
# geom function in ggplot2 takes a  mapping  argument
# mapping  argument is always paired with  aes() 						
# geom_point(mapping= aex(x=displ , y = hwy))

# graph template			the bracketed sections in the code below with a dataset, 
# a geom function, or a collection of mappings						
# "ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))"						

ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy))      

# aesthetic			add a third variable, like  class , to a two dimensional scatterplot by mapping it to an 			
# scaling		ggplot2 will automatically assign a unique level of the aesthetic (here a unique color) to each unique value of the variable, a process known as 			
# shape aesthetic		mapped  class  to the shape aesthetic			


ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class))

# color outside aes		this will give desired color to scatterpoints			
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy), color = "blue")

# facets	 facet_wrap() 	 facet_grid()  	subplots that each display one subset of the data
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class)) + facet_wrap(~class,nrow = 2)
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class)) + facet_grid(class~cyl)
  

# geometrical object 
# geom_point
# geom_smooth
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy))       
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), show.legend = FALSE)

ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x=displ, y = hwy))
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point() + geom_smooth()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point(mapping = aes(color = class)) + geom_smooth()



ggplot(data = filter(mpg, class == "compact"), mapping = aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point(mapping = aes(color = class)) + geom_smooth(se = FALSE)

# Statistical transformations			stat	algorithm used to calculate new values for a graph is called a stat, 
# short for statistical transformation
# geom_bar() 			 stat_count() 
# override the default 			count (the default) to identity
# bar chart of proportion
# stat_summary

# Position adjustments			 colour  aesthetic or   fill 
# layered grammar of graphics			"ggplot(data = <DATA>) + 
# <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>),stat = <STAT>, position = <POSITION>) +<COORDINATE_FUNCTION> +<FACET_FUNCTION>"



diamonds
ggplot(data = diamonds) + geom_bar(mapping = aes(cut))
ggplot(data = diamonds) + stat_count(mapping = aes(cut))

stat_bin()
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, y = carat), stat = "identity")
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, y = ..prop.., group = 1))
ggplot(data = diamonds) + stat_summary (mapping = aes(x= cut, y = carat))

ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, color = cut))
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, fill = cut))

ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, fill = clarity))










# select block of code to commnet and Press - Ctrl+Shift+C
# 1 Downloading/importing data in R
# 2 Data visualisation, ggplot2 etc
# 3 Data transformation
# 4 Exploratory analysis

#check wd			
getwd()

#working directory set path			
path ="D:/Office/R/Rstudioproject"	
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
# To facet your plot on the combination of two variables, add  facet_grid()
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class)) + facet_grid(class~cyl)
  

# geometrical object 
# geom_point
# geom_smooth
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy))       
# you could set the linetype of a line.  geom_smooth()  will draw a different line, with a different linetype, for each unique value of the variable that you map to linetype.
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), show.legend = FALSE)

# ggplot2 will automatically group the data for these geoms whenever you map an aesthetic to a discrete variable (as in the  linetype  example
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) 
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),show.legend = FALSE)

# smooth and point geom
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
# The algorithm used to calculate new values for a graph is called a stat, short for statistical transformation
# geom_bar  shows that the default value for  stat  is “count”, which means that  geom_bar()  uses  stat_count() 
ggplot(data = diamonds) + stat_count(mapping = aes(cut))

stat_bin()
# override the default stat. In the code below, I change the stat of  geom_bar()  from count (the default) to identity.
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, y = carat), stat = "identity")
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, y = ..prop.., group = 2))
ggplot(data = diamonds) + stat_summary (mapping = aes(x= cut, y = carat))


# Position adjustments
# You can colour a bar chart using either the  colour  aesthetic, or, more usefully,  fill :
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, color = cut))
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, fill = cut))

# fill aesthetic to another variable, like  clarity : the bars are automatically stacked. 
# Each colored rectangle represents a combination of  cut  and  clarity .
ggplot(data = diamonds) + geom_bar (mapping = aes(x= cut, fill = clarity))


# stacking is performed automatically by the position adjustment specified by the  position  argument. 
# If you don’t want a stacked bar chart, 
# you can use one of three other options:  "identity" ,  "dodge"  or  "fill" .

# position = "identity"  will place each object exactly where it falls in the context of the graph. 
# This is not very useful for bars, because it overlaps them
# overlapping we either need to make the bars slightly transparent by setting  alpha  to a small value
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + geom_bar(alpha = 1/5, position = "identity")

# completely transparent by setting  fill = NA
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +   geom_bar(fill = NA, position = "identity")


# position = "fill"  works like stacking, but makes each set of stacked bars the same height. 
# This makes it easier to compare proportions across groups.
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# position = "dodge"  places overlapping objects directly beside one another. 
# This makes it easier to compare individual values.
ggplot(data = diamonds) +   geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")


# Coordinate systems
# The default coordinate system is the Cartesian coordinate system where 
# the x and y positions act independently to determine the location of each point
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +   geom_boxplot()

# coord_flip()  switches the x and y axes.if you want horizontal boxplots. 
# It’s also useful for long labels: it’s hard to get them to fit without overlapping on the x-axis
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +   geom_boxplot() +  coord_flip()

# coord_quickmap()  sets the aspect ratio correctly for maps. 
# This is very important if you’re plotting spatial data with ggplot2 
nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +  geom_polygon(fill = "white", colour = "black") +  coord_quickmap()

# coord_polar()  uses polar coordinates. 
# Polar coordinates reveal an interesting connection between a bar chart and a Coxcomb chart
#store value of ggplot graph in bar variable
bar =ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1) + theme(aspect.ratio = 1) + labs(x = NULL, y = NULL)
#represent bar variable
bar
#bar with coord_flip() and coord_polar()
bar + coord_flip()
bar + coord_polar()


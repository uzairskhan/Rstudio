library(ggplot2)
library(tidyverse)
ggplot2::ggplot() 
ggplot2::mpg 
mpg

ggplot(data = mgp)
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy))       
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class))
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class)) + facet_wrap(~class,nrow = 2)
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y = hwy, shape = class)) + facet_grid(class~cyl)

ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy))       
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), show.legend = FALSE)

ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x=displ, y = hwy))
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point() + geom_smooth()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point(mapping = aes(color = class)) + geom_smooth()

ggplot(data = filter(mpg, class == "compact"), mapping = aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+ geom_point(mapping = aes(color = class)) + geom_smooth(se = FALSE)

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










cafe = list(espresso = c(4,5,3,6,5,4,7),
       americano = c(63,68,64,68,72,89,94),
	 latte = c(61,70,59,71,71,92,88),
	 price = c(2.0, 2.5, 3,0),
	 menu = c('espresso','americano','latte'))ca
	


cafe = data.frame(espresso = c(4,5,3,6,5,4,7),
       americano = c(63,68,64,68,72,89,94),
	 latte = c(61,70,59,71,71,92,88),
	 price = c(2.0, 2.5, 3,0),
	 menu = c('espresso','americano','latte'))
	 cafe

str(cafe)
summary(cafe)

cafe$menu = factor(cafe$menu)
names(cafe$price) = cafe$menu
cafe$price

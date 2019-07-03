library(tidyverse)

indiv <- 100
mov <- round(rnorm(indiv, 10, 2)) %>% abs()
rsc <- 10
locx <-  rnorm(indiv, 0, 10) %>% round()
locy <-  rnorm(indiv, 0, 10) %>% round()

indivs <- tibble(id=1:indiv, mov, rsc, locx, locy)

beans <- tibble(x=-20:20, y=-20:20) %>% complete(x,y) %>% 
	mutate(eggsnum=0)

foreach(i=1:indiv) %do% {
	indiv <- indivs %>% slice(i)
	locs <- indiv %>% select(locx, locy)
	beans <- foreach(j=1:indiv %>% pull(rsc)) %do% {
		beans %>% mutate(eggsum=if_else(indiv %>% pull(locx)))
	}
		
}


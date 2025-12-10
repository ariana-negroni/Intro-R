

# 16 de septiembre --------------------------------------------------------


install.packages("dplyr")
library(dplyr)

data("starwars")
head(starwars,3)

str(starwars)

starwars %>%
  filter (species == "Droid")

subset(starwars, species == "Droid")

starwars %>% 
  filter(skin_color=="light", eye_color=="brown" & hair_color=="black")

starwars %>% 
  arrange(height, mass)

starwars %>% 
  arrange(desc(height))

starwars %>% 
  slice(5:10)

starwars %>% 
  slice_head(n=8)


# Select ------------------------------------------------------------------


starwars %>% 
  select(name, hair_color, skin_color, eye_color)

starwars %>% 
  select(name, hair_color, skin_color, eye_color) %>% 
  filter(skin_color=="white")

starwars %>% 
  select(!films & !starships)

starwars %>% 
  select(!films:starships)

starwars %>% 
  rename(Character = name)

starwars %>% 
  select(-name, -skin_color)

starwars %>% 
  select(contains("y"))

# 18 de septiembre --------------------------------------------------------


library(ggplot2)


# mutate ------------------------------------------------------------------
#nueva columna
newstarwars <- starwars %>% 
  mutate(newcol = height / 100) %>% 
  select(newcol, height, everything())

newstarwars_new <- starwars %>% 
  mutate(new_col= height/100,
         .keep="none")
newstarwars_new


# ifelse ------------------------------------------------------------------

starwars %>% 
  mutate(height_cat=ifelse(height>100, "tall", 'small')) %>% 
    select(height, height_cat, everything())

# Plot --------------------------------------------------------------------

starwars %>% 
  mutate(height_cat=ifelse(height>100, "tall", 'small')) %>% 
  ggplot(aes(x=height, fill=height_cat)) +
  geom_histogram() +
  labs(x="algo", y="otro")


# Summarise ---------------------------------------------------------------

starwars %>% 
  summarise(mean=mean(height, na.rm=T),
            min= min(height, na.rm=T),
            max= max(height, na.rm=T),
            sd= sd(height, na.rm=T)
            )

starwars %>% 
  group_by(species) %>% 
  summarise(
    mean= mean(mass, na.rm=T),
    sd= sd(mass, na.rm=T)
  )


starwars %>% 
  group_by(species) %>% 
  count(homeworld, sort = T)

starwars %>% 
  sample_n(10)









# Plots -------------------------------------------------------------------

#ctrl + shift + R (heading)

data(DNase)
head(DNase)
library(ggplot2)
?barplot

mean_density <- aggregate(density ~ conc, data = DNase, FUN = mean)
mean_density
barplot(
  height = mean_density$density,
  names.arg = mean_density$conc,
  col = "lightblue",
  border = "gray30",
  main = "Mean DNase I Activity by Concentration",
  xlab = "Concentration (mg/ml)",
  ylab = "Mean Optical Density",
  las = 2,
  cex.names = 0.8,
  horiz = TRUE
)




# ggplot graphing aesthetic -----------------------------------------------

library(ggplot2)
library(patchwork)
library(readxl)
library(dplyr)

tvshows <- read.csv("rtutorials/tvshows.csv")
head(tvshows)


# create aes graphs -------------------------------------------------------


p <- ggplot(data = tvshows, 
            mapping = aes(x = log(GRP), y = log(PE)))
p + geom_point() + geom_smooth(method = lm)


# stadistics --------------------------------------------------------------


mod <- summary(lm(log(PE)~log(GRP), data = tvshows))

resid <- resid(mod)
shapiro.test(resid)


# save plot ---------------------------------------------------------------

p
ggsave(filename = "plot",
       plot = p,
       width = 8, height = 6, dpi = 300)

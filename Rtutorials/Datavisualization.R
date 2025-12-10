library(dplyr)
library(ggplot2)
library(ggpubr)
library(readxl)
library(ggpmisc)
library(ggbeeswarm)
library(broom)
library(ggstatsplot)
theme_set(theme_bw(16))

msleep <- read.csv("msleep.csv")
my.formula <- y ~ x
ggplot(msleep,
       aes(x=log(bodywt),
           y=sleep_total, 
           color=vore)) +
  geom_point() +
  geom_smooth(method="lm", se=F) +
  stat_poly_eq(formula = my.formula,
               parse = TRUE,
               label.y="top",
               label.x = "left",
               use_label(c("eq","R2", "p"))) + 
  facet_wrap(. ~ vore,
             ncol = 2,
             scales = "free")

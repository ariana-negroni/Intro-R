library(readxl)
coronary <- read_excel("Rtutorials/coronary.xlsx")
head(coronary)

plot(
  coronary$dbp ~ coronary$chol,
  type = "p",
  col = "darkred",
  lwd = 4,
  xlab = "Total Cholesterol (mmol/L)",
  ylab = "Diastolic Blood Pressure (mmHg)" , 
  main = "Relationship between Cholesterol and Diastolic BP",
  pch = 1
)

abline(lm(dbp ~ chol, data = coronary), col = 'red', lwd = 2, lty = 2)
spearman_result <- cor.test(
  coronary$chol,
  coronary$dbp,
  method = "spearman",
  exact = FALSE
)
spearman_result

shapiro.test(coronary$chol)

coronary <- coronary[order(coronary$age), ]
plot(coronary$age, coronary$chol,
     type = "l",
     col = "blue",
     lwd = 2,
     xlab = "Age (years)",
     ylab = "Cholesterol (mmol/L)",
     main = "Cholesterol vs Age")

hist(coronary$chol,
     main = "Distribution of Cholesterol",
     xlab = "Cholesterol (mmol/L)",
     col = "lightblue",
     border = "white",
     )


boxplot(coronary$chol,
        main = "Cholesterol Levels",
        ylab = "Cholesterol (mmol/L)",
        col = "lightgreen",
        border = 'darkgreen'
        )


boxplot(sbp ~ gender,
        data = coronary,
        main = "Systolic Blood Pressure by Age Group",
        xlab = "Age Group (years)",
        ylab = "systolic BP (mmHG)",
        col = "lightblue",
        border = "darkblue"
        )

anova_model <- aov(sbp ~ gender, data = coronary)
summary(anova_model)

shapiro.test(residuals(anova_model))


bartlett.test(sbp ~ gender, data = coronary)

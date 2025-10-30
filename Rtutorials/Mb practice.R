library(readxl)
mb <- read_excel("Rtutorials/Mb_1_9.xlsx", sheet="MbpH8_1_9")


  
plot(
  mb$MbpH8_1_9 ~ mb$Wavelength, 
     type = "l",
     col = "blue",
     lwd = 2,
     xlab = "Wavelength",
     ylab = "Abs",
  xlim = c(390, 650),   # X-axis range (for example, visible spectrum)
  ylim = c(0, 1.0),      # Y-axis range (for example, absorbance range)
     main = "Myoglobin reactions at pH 5"
     )

lines(mb$Wavelength, mb$ph5, col = "red", lwd = 2)
lines(mb$Wavelength, mb$Storage172229, col = "orange", lwd = 2)
lines(mb$Wavelength, mb$Storage174017, col = "yellow", lwd = 2)
lines(mb$Wavelength, mb$Storage184753, col = "black", lwd = 2)
lines(mb$Wavelength, mb$Storage185450, col = "green", lwd = 2)
lines(mb$Wavelength, mb$Storage185725, col = "pink", lwd = 2)


rect(500, 0, 650, 1, border = "gray50", lty = 2)

# Add the inset plot
par(fig = c(0.5, 0.9, 0.5, 0.9), new = TRUE)  # inset position (adjust if needed)

plot(
  mb$Wavelength, mb$MbpH8_1_9,
  type = "l",
  col = "blue",
  lwd = 2,
  xlab = "",
  ylab = "",
  xlim = c(500, 650),   # zoomed wavelength range
  ylim = c(0, 0.15),     # adjust depending on what part you want to focus on
  axes = FALSE,
  main = ""
)
lines(mb$Wavelength, mb$ph5, col = "red", lwd = 2)
lines(mb$Wavelength, mb$Storage172229, col = "orange", lwd = 2)
lines(mb$Wavelength, mb$Storage174017, col = "yellow", lwd = 2)
lines(mb$Wavelength, mb$Storage184753, col = "black", lwd = 2)
lines(mb$Wavelength, mb$Storage185450, col = "green", lwd = 2)
lines(mb$Wavelength, mb$Storage185725, col = "pink", lwd = 2)
# Add box and axes for the inset
box()
axis(1, cex.axis = 0.7)
axis(2, cex.axis = 0.7)

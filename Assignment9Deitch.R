data("airquality", package = "datasets")
head(airquality)
airquality_clean <- na.omit(airquality)

plot(airquality_clean$Temp, airquality_clean$Ozone,
     main = "Ozone vs. Temperature",
     xlab = "Temperature (F)",
     ylab = "Ozone (ppb)",
     pch = 19,
     col = "steelblue")


hist(airquality_clean$Wind,
     main = "Distribution of Wind Speed",
     xlab = "Wind Speed (mph)",
     col = "lightblue",
     border = "white")

library(lattice)


xyplot(Ozone ~ Temp | factor(Month),
       data = airquality_clean,
       main = "Ozone vs. Temperature by Month",
       xlab = "Temperature (F)",
       ylab = "Ozone (ppb)",
       pch = 19,
       col = "steelblue")


bwplot(Wind ~ factor(Month),
       data = airquality_clean,
       main = "Wind Speed by Month",
       xlab = "Month (5 = May, 9 = September)",
       ylab = "Wind Speed (mph)",
       col = "lightblue")

library(ggplot2)


ggplot(airquality_clean,
       aes(x = Temp, y = Ozone, color = factor(Month))) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Ozone vs. Temperature",
       x = "Temperature (F)",
       y = "Ozone (ppb)",
       color = "Month") +
  theme_minimal()


ggplot(airquality_clean, aes(x = Wind, fill = factor(Month))) +
  geom_histogram(binwidth = 1,
                 color = "white",
                 alpha = 0.8) +
  facet_wrap(~ Month) +
  labs(title = "Wind Speed Distribution by Month",
       x = "Wind Speed (mph)",
       y = "Number of Days") +
  theme_minimal() +
  theme(legend.position = "none")
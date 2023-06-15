library(MASS)
?ships
barplot(table(ships$type), 
        main = "Number of Accidents by Ship Type",
        xlab = "Ship Type",
        ylab = "Number of Accidents",
        col = "lightblue",
        ylim = c(0, max(table(ships$type)) + 1),
        legend = FALSE)

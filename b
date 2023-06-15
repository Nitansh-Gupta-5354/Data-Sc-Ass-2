install.packages("imager")
library(imager)

flip <- function(image) {
  width <- dim(image)[2]
  
  flipped_image <- imager(image, dim(image))
  
  for (x in 1:width) {
    flipped_x <- width - x + 1
    
    flipped_image[, flipped_x, ] <- image[, x, ]
  }
 
  return(flipped_image)
}

# Example usage:
image <- load.image("path_to_your_image.jpg")

flipped_image <- flip(image)

par(mfrow = c(1, 2))
plot(image, main = "Original Image")
plot(flipped_image, main = "Flipped Image")

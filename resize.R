## REsize image to thumbnail.

library(magick)
library(here)

resize_image <- function(image) {
  im_file <- image_read(here(paste0("_gallery/img/", image)))
  im_file_resised <- image_resize(im_file, "10%")
  image_write(im_file_resised, here(paste0("_gallery/img/thumb-", image)))
}
list_png <- list.files("_gallery/img/")
lapply(list_png, resize_image)


library(htmltools)

make_gallery <- function() {
  images <- list.files("_gallery/img")
  ## get the name of full size images
  images_full_size <- grep("thumb", images, value = TRUE, invert = TRUE)
  images_thumb <- grep("thumb", images, value = TRUE)

  ## Create a dataframe where each row is one image
  images_df <- data.frame(images_thumb = images_thumb,
                          images_full_size = images_full_size)
  ## Create HTML structure
  tagList(apply(images_df, 1, function(x) {
    tags$a(
      href = paste0("_gallery/img/", x[["images_full_size"]]),
      tags$img(src = paste0("_gallery/img/", x[["images_thumb"]]))
    )
  }))

}

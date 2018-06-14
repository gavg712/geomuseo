# Display photos on gallery
photoGallery <- function(img, path = path, ncol = ncol){
  div(class = paste0("col-md-", 12/ncol),
      a(href = file.path(path, basename(img)),
        title = readLines(str_replace(img, pattern = "jpg$",
                                      replacement = "txt"),
                          1,
                          encoding = "UTF-8"),
        `data-lightbox-gallery` = "gallery1",
        `data-lightbox-hidpi` = file.path(path, "1@2x.png"),
        img(src = file.path(path, basename(img)),
            class = "img-responsive",
            alt = "img")
      )
  )
}

rowGallery <- function(ls, nc = 4) {
  l <- list()
  brks <- seq(1, length(ls), by = nc)
  for(i in brks){
    l[[which(brks == i)]] <- tagAppendChildren(div(class="row gallery-item"), 
                                               list = tagList(ls[i:(i+nc-1)]))
  }
  l
}


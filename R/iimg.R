#' Insert Image (markdown)
#' @description This function will copy a specified image (file) and write predefined text in markdown-style.
#'
#' @param caption Character. Write a caption (optional).
#' @param path2image Character. Specify filepath. Opens a window to choose a file per default.
#' @param assets_dir Character. Specify name for a target directory to copy the image.
#' @param html Logical. Choose between html or markdown notation.
#'
#' @author Frederik Sachser
#' @export
iimg <- function(caption = "Enter caption here.", path2image = file.choose(), assets_dir = "_assets", html = TRUE) {
  # prerequisites
  dir_dest <- file.path(getwd(), assets_dir)
  dir_dest <- file.path(substr(dir_dest, nchar(getwd())+1+nchar(.Platform$file.sep), nchar(dir_dest)))
  img_name <- basename(path2image)
  img_name_tpe <- txt_pre_ext(filename = img_name, txt_pre_ext = now()) # add timestamp

  # copy file to destination
  dir.create(dir_dest, showWarnings = FALSE)
  img_dest <- file.path(dir_dest, img_name)
  if (file.exists(img_dest)) {
    img_dest <- file.path(dir_dest, img_name_tpe)
  }
  if (file.exists(img_dest)) stop("filename exists in target. quitting")
  file.copy(from = path2image, to = img_dest)
  # write predefined text for convenience
  if (html == TRUE) {
    mytext <- paste0("<figure>\n <img src='", img_dest, "' width='80%'>\n <figcaption>\n ", caption, "\n </figcaption>\n</figure>")
  } else {
    mytext <- paste0("![", caption, "](", img_dest, ")\n\n")
  }
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(location = c(c(rstudioapi::getSourceEditorContext()$selection[[1]]$range)$end) + c(1, 0),
                           text = mytext,
                           id = rstudioapi::getSourceEditorContext()$id)
  } else {
    message(mytext)
  }
}

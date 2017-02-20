#' @title Allow Access to the Dlib C++ Library
#' @description 'Dlib' <http://dlib.net> is a 'C++' toolkit containing machine learning algorithms and computer vision tools. 
#' It is used in a wide range of domains including robotics, embedded devices, mobile phones, and large high performance computing environments. This package allows R users to use 'dlib' through 'Rcpp'.
#' @name dlib-package
#' @aliases dlib-package
#' @docType package
#' @importFrom Rcpp evalCpp
#' @seealso \code{\link{inlineCxxPlugin}}
#' @useDynLib dlib
#' @examples 
#' \dontrun{
#' library(Rcpp)
#' library(inline)
#' library(dlib)
#' 
#' ##
#' ## Example adapted from http://dlib.net/surf_ex.cpp.html
#' ## Find the SURF (https://en.wikipedia.org/wiki/Speeded_up_robust_features) 
#' ##   features of an image
#' 
#' ## 
#' ## Step 1: 
#' ## Register a function called dlib_surf to read and extract the FHOG features 
#' ## have a look at the file for how it is structured
#' f <- system.file("extdata", "rcpp_surf.cpp", package = "dlib")
#' cat(readLines(f), sep = "\n")
#' sourceCpp(f)
#' 
#' ## 
#' ## Step 2: 
#' ## Convert image from jpeg to BMP3 format as ine dlib_surf function, 
#' ##   we assume the file is in BMP3 format 
#' library(magick)
#' f <- system.file("extdata", "cruise_boat.jpeg", package = "dlib")
#' img <- image_read(path = f)
#' img 
#' f_bmp <- tempfile(fileext = ".bmp")
#' image_write(img, path = f_bmp, format = "BMP3")
#' 
#' ## 
#' ## Step 3: 
#' ## Apply the function Rcpp function dlib_surf on the image
#' dlib_surf(f_bmp)
#' }
NULL



#' @title Rcpp plugin for dlib
#' @description Rcpp plugin for dlib
#' @return a list 
#' @examples 
#' library(Rcpp)
#' library(inline)
#' library(dlib)
#' getPlugin("dlib")
inlineCxxPlugin <- function() {
  pl <- list()
  pl$env = list(PKG_LIBS = "")
  pl$includes = "\n#include <Rcpp.h>\n// [[Rcpp::depends(dlib)]]\n// [[Rcpp::plugins(cpp11)]]\n\n\n#ifndef BEGIN_RCPP\n#define BEGIN_RCPP\n#endif\n\n#ifndef END_RCPP\n#define END_RCPP\n#endif\n\nusing namespace Rcpp;\n"
  pl$LinkingTo = c("Rcpp", "dlib")
  pl$Depends = c("Rcpp")
  pl
}





  


#' @title Allow Access to the Dlib C++ Library
#' @description 'Dlib' <http://dlib.net> is a 'C++' toolkit containing machine learning algorithms and computer vision tools. 
#' It is used in a wide range of domains including robotics, embedded devices, mobile phones, and large high performance computing environments. This package allows R users to use 'dlib' through 'Rcpp'.
#' @name dlib-package
#' @aliases dlib-package
#' @docType package
#' @importFrom Rcpp evalCpp
#' @useDynLib dlib, .registration=TRUE
NULL

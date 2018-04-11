# dlib: allowing R users to work with dlib through Rcpp

[Dlib](http://dlib.net) is a C++ toolkit containing machine learning algorithms and computer vision tools. It is used in a wide range of domains including robotics, embedded devices, mobile phones, and large high performance computing environments. This package allows R users to use dlib through the Rcpp package.

The version of dlib which is included is version 19.10. This version is put into the inst/include folder with the following changes which are made for CRAN R CMD check compliance

- Manually commented out some pragma statements in the dlib code for CRAN compliance  (namely -Wmaybe-uninitialized -Warray-bounds -Wmisleading-indentation as in `#pragma GCC diagnostic ignored "-Wmisleading-indentation"`)
- Removed the dlib/test, dlib/java, dlib/external folder

## Include dlib inside an Rcpp package

An example of using dlib can be found at the **image.dlib** R package where dlib is used for image recognition. More information: https://github.com/bnosac/image/image.dlib.

## Support in machine learning, robotics or image recognition

Need support in machine learning, robotics or image recognition?
Contact BNOSAC: http://www.bnosac.be

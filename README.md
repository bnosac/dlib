# dlib: allowing R users to work with dlib through Rcpp

[Dlib](http://dlib.net) is a C++ toolkit containing machine learning algorithms and computer vision tools. It is used in a wide range of domains including robotics, embedded devices, mobile phones, and large high performance computing environments. This package allows R users to use dlib through the Rcpp package.

The version of dlib which is included is version 19.2

## Installation

Install from CRAN
```
install.packages("dlib")
```

Install this development version from github.
```
install.packages("devtools")
devtools::install_github("bnosac/dlib")
```

## Example

An example of the usage of the package is included regarding identifying SURF descriptors in an image.

```
## See an example of the usage 
help("dlib-package")
```

## Include dlib inside an Rcpp package

The following shows how to include dlib inside an R package which uses Rcpp. Examples on using Rcpp in that way can be found at the [Rcpp gallery](http://gallery.rcpp.org), e.g. http://gallery.rcpp.org/articles/using-boost-with-bh.

```
#include <Rcpp.h>
using namespace Rcpp;
// [[Rcpp::plugins(cpp11)]]
// [[Rcpp::depends(dlib)]]
#include <dlib/algs.h>
#include <dlib/image_processing/frontal_face_detector.h>
```

An example of this can be found at the **image.dlib** R package where it is used for image recognition. More information: https://github.com/bnosac/image.dlib.


## Support in machine learning, robotics or image recognition

Need support in machine learning, robotics or image recognition?
Contact BNOSAC: http://www.bnosac.be



    

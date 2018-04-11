#undef Realloc
#undef Free
#undef ERROR
#include <dlib/pixel.h>
#include <dlib/array2d.h>
#include <dlib/image_transforms/assign_image.h>
#include <dlib/image_loader/image_loader_abstract.h>
#include <dlib/image_loader/image_loader.h>
#include <dlib/image_keypoint.h>
#undef Realloc
#undef Free
#undef ERROR

#include <Rcpp.h>

using namespace std;
using namespace dlib;

//' @title Example of using dlib to extract SURF points
//' @description Example of using dlib to extract SURF points
//' @param file_name path to a bmp image
//' @return a list with the number of surf points found in the image
//' @export
// [[Rcpp::export]]
Rcpp::List surf_descriptor(const std::string file_name) {
  array2d<rgb_pixel> img;
  load_bmp(img, file_name.c_str());
  std::vector<surf_point> sp = get_surf_points(img);
  // A surf_point object contains a lot of information describing each point.
  // The most important fields are shown below:
  std::cout << "number of SURF points found: "<< sp.size() << endl;
  std::cout << "center of first SURF point: "<< sp[0].p.center << endl;
  std::cout << "pyramid scale:     " << sp[0].p.scale << endl;
  std::cout << "SURF descriptor: \n" << sp[0].des << endl;
  return Rcpp::List::create(Rcpp::Named("surf_points") = sp.size());
}




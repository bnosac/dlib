#include <Rcpp.h>
using namespace Rcpp;
// [[Rcpp::plugins(cpp11)]]
// [[Rcpp::depends(dlib)]]

#include <dlib/pixel.h>
#include <dlib/array2d.h>
#include <dlib/image_transforms/assign_image.h>
#include <dlib/image_loader/image_loader_abstract.h>
#include <dlib/image_loader/image_loader.h>
#include <dlib/image_keypoint.h>
using namespace std;
using namespace dlib;

// [[Rcpp::export]]
List dlib_surf(const std::string file_name) {
  array2d<rgb_pixel> img;
  load_bmp(img, file_name.c_str());
  std::vector<surf_point> sp = get_surf_points(img);
  // A surf_point object contains a lot of information describing each point.
  // The most important fields are shown below:
  cout << "number of SURF points found: "<< sp.size() << endl;
  cout << "center of first SURF point: "<< sp[0].p.center << endl;
  cout << "pyramid scale:     " << sp[0].p.scale << endl;
  cout << "SURF descriptor: \n" << sp[0].des << endl;
  return List::create(_["surf_points"] = sp.size());
}


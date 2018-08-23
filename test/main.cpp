#include <opencv2/highgui.hpp>
#include <iostream>
#include <string>

using namespace std;
using namespace cv;

Mat get_image(int n){

  string index = to_string(n);
  string angle = to_string(((float)n)*1.2);
  angle=angle.substr(0, angle.size()-5);  // remove last 5 zeros as float gives 1.200000
  string base = "../data/InclusionImages/j/";
  string extension = ".tif";
  string filename=base+index+"_"+angle+extension;

  //cout << ("filename %s ",filename) << endl ;
  Mat image;
  image = imread(filename);	
  return image;
}

int main( int argc, char** argv ) {
  
  Mat image;
  for(int i=1;i<301;i++){
  	  image=get_image(i);
  
  if(! image.data ) {
      cout <<  "Could not open or find the image" << endl ;
      return -1;
    }
  

  namedWindow( "Display window",WINDOW_AUTOSIZE );
  imshow( "Display window", image );
  
  waitKey(1);
  }

  return 0;
}


/*main.cpp
//#include <opencv2/core/core.hpp>
//#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <string>
#include <iostream>
//#include <experimental/filesystem>



int main(int argc, char const *argv[])
{
	

  	//cv::Mat image = cv::imread(filename.c_str(), CV_LOAD_IMAGE_COLOR);

	std::cout << ("done\n");
	//std::string filename="..data/InclusionImages/j/";
	//cv::Mat image = cv::imread(filename.c_str(), CV_LOAD_IMAGE_COLOR);
  	//if (image.empty()) {
    //std::cerr << "Couldn't open file: " << filename << std::endl;
    //exit(1);
  //}

	return 0;
}
*/

//main.cpp
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <string>
#include <iostream>
#include <experimental/filesystem>

namespace fs = std::filesystem;

void get_image()

int main(int argc, char const *argv[])
{
	

  	//cv::Mat image = cv::imread(filename.c_str(), CV_LOAD_IMAGE_COLOR);

	//std::cout << ("done\n");
	std::string filename="..data/InclusionImages/j/";
	cv::Mat image = cv::imread(filename.c_str(), CV_LOAD_IMAGE_COLOR);
  	if (image.empty()) {
    std::cerr << "Couldn't open file: " << filename << std::endl;
    exit(1);
  }

	return 0;
}

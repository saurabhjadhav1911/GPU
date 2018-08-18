NVCC=nvcc
CPP=g++ -std=c++11
CC=gcc



BUILD_PATH=build
###################################
# These are the default install   #
# locations on most linux distros #
###################################

OPENCV_LIBPATH=/usr/lib
OPENCV_INCLUDEPATH='pkg-config --cflags --libs opencv'

###################################################
# On Macs the default install locations are below #
###################################################

#OPENCV_LIBPATH=/usr/local/lib
#OPENCV_INCLUDEPATH=/usr/local/include

OPENCV_LIBS=-lopencv_core -lopencv_imgproc -lopencv_highgui
CUDA_INCLUDEPATH=/usr/local/cuda-9.0/include

######################################################
# On Macs the default install locations are below    #
# ####################################################

#CUDA_INCLUDEPATH=/usr/local/cuda/include
#CUDA_LIBPATH=/usr/local/cuda/lib

NVCC_FLAGS=-O3 -arch=sm_20 -Xcompiler -Wall -Xcompiler -Wextra -m64

CPP_FLAGS=-O3 -Wall -Wextra -m64


####################################
# list all source code files below #
####################################

CUDA_SRC=code.cu

CPP_SRC=main.cpp

C_SRC=NULL

APP=app

#student: main.o student_func.o compare.o reference_calc.o Makefile
#	$(NVCC) -o HW2 main.o student_func.o compare.o reference_calc.o -L $(OPENCV_LIBPATH) $(OPENCV_LIBS) $(NVCC_OPTS)

#main.o: main.cpp timer.h utils.h HW2.cpp
#	g++ -c main.cpp $(GCC_OPTS) -I $(OPENCV_INCLUDEPATH) -I $(CUDA_INCLUDEPATH)

#student_func.o: student_func.cu reference_calc.cpp utils.h
#	nvcc -c student_func.cu $(NVCC_OPTS)

$(APP):main.o
	$(CPP) main.o -o $(APP)

main.o:$(CPP_SRC)
	$(CPP) -c $(CPP_SRC)
# -I $(OPENCV_INCLUDEPATH) -I $(CUDA_INCLUDEPATH)

clean:
	rm -f output

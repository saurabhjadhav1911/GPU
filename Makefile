
NVCC=nvcc
CPP=g++
CC=gcc


BUILD_PATH=build
###################################
# These are the default install   #
# locations on most linux distros #
###################################

OPENCV_LIBPATH=/usr/lib
OPENCV_INCLUDEPATH=/usr/include

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

CUDA_SRC=$(wildcard cuda/*.cu)

CPP_SRC=$(wildcard src/*.cpp)

C_SRC=NULL

APP=app

all:$(BUILD_PATH)/main.o
	$(CPP) $(BUILD_PATH)/main.o -o $(APP)

$(BUILD_PATH)/main.o:$(CPP_SRC)
	$(CPP) -c $(CPP_SRC)
# -I $(OPENCV_INCLUDEPATH) -I $(CUDA_INCLUDEPATH)

clean:
	rm -f build/*

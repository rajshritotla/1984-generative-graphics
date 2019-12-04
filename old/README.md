# About Directory

This directory have the previous approach of developing the project. We were working with [openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) (to get actor's coordinates) and [openframeowrks](https://openframeworks.cc/about/) (to develop application).

Due to complexity and hardware requirements of these technologies we decided to develop the project using ["Processing"](https://processing.org/overview/), recently we found this technology. Processing could help us achieve the goal quicker and in cleaner way.

# Technologies Used

## openpose

[GitHub Source](https://github.com/CMU-Perceptual-Computing-Lab/openpose)

openpose is used in the project to determine the human being coordinates. Currently we are using it with webcam to successfully generate coordinates of using COCO model, which is a trained model available in repository.

Note: Though the links are directly sourced from openpose official repository, its suggestable to confirm the link again from openpose docs

#### Get coordinates using openpose

Assumption : openpose and dependencies successfully installed

To get coordinates using openpose:

Through command line interface run the application with flags set as:


```

../OpenPoseDemo.exe --model_pose COCO -write_json output/ --disable_blending

```

OpenPoseDemo.exe : The application which generates the coordinates

--model_pose COCO : Speicifies to run COCO model

Note: This is not a mandatory flag, but due to GPU and drivers constraints this flag was required. One could try without this flag if it doesn't run then they can use this flag. To know more about this read the documentation on openpose github link.

-write_json output/ : It will write the coordinates in JSON format in a folder name as "output". Folder name could be any name, not required specifically to be "output". There is one JSON file generated for every frame.

#### openpose installtions Prerequisite

[Openpose prequisite documentation](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/prerequisites.md)


#### openpose Installation Requirement and Procedure (Windows OS)

For whole procedure and other OS visit their github documentation:

[Openpose installation instructions](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md)

Windows OS users can directly download the binary files from "Release" section and try running the OpenPoseDemo.exe. They can also generate their own binary files using CMake.

Installations done by us for Windows:

NVIDIA driver updates

Cuda Driver

cuDNN

CMAke

Visual Studio 2017


#### OpenPose Binary File Generation Overview (Windows OS)

Assuming the required drivers are installed and CUDA/cuDNN driver files are manually placed at correct location as specified in openpose docs; CMake and VS2017 are installed.

In CMake Gui:

1. Where is the source code : Points to the openpose folder cloned by github:

```
git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
```


2. Where to build the binaries : Points to a folder specified by you, in my case I named it as "build"

3. Click Configure

Note: Configuring done should be shown in last else there is some issue

Note: Platform selected by me : x64

4. Click Generate

5. OpenProject

Assuming it opens in VS 2017, choose "Release" [instead Debug on top bar (where there are options for run)] and hit green button.



## C++

Primary language used to develop this project is C++. 	

As most of the frameworks used in project are devleoped in C++, compatibility issues could be avoided by using C++.


#### C++ compiler

For this project using the compiler from

[MingW-W64-builds](http://mingw-w64.org/doku.php/download/mingw-builds)


Note: 


1. Install compiler at a location where path does not have any spaces 

E.g. "c comp" is incorrect, "ccomp" is correct


2. Install the version as per your machine. Few options to take care are choosing options having x86_6, win32,seh-rt as they are using Win32 threads and SEH exception handling


3. Do add compiler's bin path to environment


#### IDE 

Visual Studio Code


#### Configure VS Code and mingw compiler

To run C++ scipts, every project we need to do configuration. 

Link for same is: [click here](https://code.visualstudio.com/docs/cpp/config-mingw)



## Additional Header Files for C++

## JSON

Openpose output coordinates are in JSON format, to read we need JSON support.


STEPS:
1. Add additional files to C++ compiler at location: ..\cppcompiler\mingw64\include\

2. Create directory with name "nlohmann"

3. Download the files from GitHub to this directory. Currently it have contents ( detail, thirdparty, adl_serializer.hpp, json.hpp, json_fwd.hpp)


Directory "json" with required header files could be downloaded from:

[https://github.com/nlohmann/json/tree/develop/include/](https://github.com/nlohmann/json/tree/develop/include/)

Note: Though this repository says only to include one header file but you may need to include whole directory contents.


To learn more about JSON visit : [http://json.org/](http://json.org/)


## filesystem (Alternative)

C++ have an experimental header file to handle files known as "filesystem". Some issues were encountered using this so we used an alternate library which could be downloaded from following github repository:

[https://github.com/gulrak/filesystem/](https://github.com/gulrak/filesystem/)


STEPS:
Add additional directory "ghc" downloaded from to C++ compiler at location: ..\cppcompiler\mingw64\include\



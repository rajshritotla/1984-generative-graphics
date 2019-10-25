# MOVEMENT ESTIMATION
Main code for project. Written in C++ using OpenPose
## Source code 
* [GeeksforGeeks](https://www.geeksforgeeks.org/system-call-in-c/) - used this to get more information about the system method in C++ in which is used to invoke an operating system command from a C/C++ program.
* [StackExchange](https://stackoverflow.com/a/47284656) - I used this answer to help parse through JSON data
* [Openpose Documentation](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/quick_start.md#quick-start) I used this to get the shell commands needed to run the webcam instance and output json data
* [JSON for Modern C++](https://github.com/nlohmann/json) - a library for C++ to parse/generate JSON. I used this to parse through the outputted JSON keypoint files

## Dependencies
* OpenPose/PyOpenPose - [repository](https://github.com/CMU-Perceptual-Computing-Lab/openpose)
* jsoncpp - [repository](https://github.com/open-source-parsers/jsoncpp)

## How to Run
1. Install openpose. The instructions are in this [link](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md)
2. Install jsoncpp. To do that, type ```brew install jsoncpp```
3. cd into main and change directory in the code to be the directory where openpose is installed on your thing.
4. Run with ```g++ -std=c++11 main.cpp ```

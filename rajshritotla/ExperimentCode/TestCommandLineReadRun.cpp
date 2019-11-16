#include <iostream>
#include <conio.h>

using namespace std;


// CHANGE THE PATH AND COMMAND AS PER APPLCATION LOCATION AND OPERATING SYSTEM

// This is for windows and the location is tempoarary adjusted as per contributor local machine

// https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/output.md
void callCamera()
{
    cout<<"";
    // SET LOCATION OR PATH
    system("cd.. && cd.. && cd.. &&  cd openpose &&  OpenPoseDemo.exe --model_pose COCO -write_json output");
}

int main()
{
    // calling the webcam instance
    // callCamera(); 
    
    system("dir || ls");
    return 0; 
}
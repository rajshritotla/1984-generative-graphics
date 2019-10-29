#include <iostream>
#include <conio.h>

using namespace std;


// CHANGE THE PATH AND COMMAND AS PER APPLCATION LOCATION AND OPERATING SYSTEM

// This is for windows and the location is tempoarary adjusted as per contributor local machine
void callCamera()
{
    cout<<"";
    system("cd.. && cd.. && cd.. &&  cd openpose &&  OpenPoseDemo.exe --model_pose COCO -write_json output");
    
}

int main()
{
    //calling the webcam instance
    callCamera(); 
    getch();
    return 0; 
}
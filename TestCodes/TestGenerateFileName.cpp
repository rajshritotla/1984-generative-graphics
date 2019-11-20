#include <iostream>
#include <conio.h>
#include <math.h>
#include <string.h>

using namespace std;


/**  
    Change variable "generateThisTimes" for the number of generated file counts
*/ 

void generateFileName(){

    /* FILENAME FORMAT VARIABLES */ 
    long appendZeroLeft = 11;           // left digits count initially, 11 because 12th position is occupied already with 0 and will update 1,2...
    long frameNumber = 0;               // number updating with every frame change
    string str = "_keypoints.json";     // fixed string
    
    string filename;                    // file name that will be generated by application

    int generateThisTimes = 110;        // for testing purprose how many filenames required to be print
    
    while ( frameNumber < generateThisTimes ) {
        filename = string( appendZeroLeft, '0').append(to_string(frameNumber)+str);
        cout << filename << endl;

        frameNumber++;  // incrementing with frames
        // Source: https://www.geeksforgeeks.org/program-count-digits-integer-3-different-methods/
        // floor(log10(frameNumber) + 1) -> Counts the number of digits in frame number
        appendZeroLeft = 12 - floor(log10(frameNumber) + 1);
    }
}



int main () {
    generateFileName();    
    return 0;
}
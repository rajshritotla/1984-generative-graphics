#include <iostream>
#include <conio.h>
#include <math.h>
#include <string.h>
#include <unistd.h>     // for sleep()

// remove threads folders 3  chrono timercpp

using namespace std;

/*
        file name format
        zero - represents '0' count to append in left
        Total 12 digits could be there in i.e 000000000000, 000000000001.. and so on
*/

int main () {

    int frameTime = 1; //sec [...SET THIS...]

    int left = 11;  // left digits count initially, 11 because 12th position is occupied already with 0 and will update 1,2...
    int right = 1;  // digits on right after '0'
    long num = 0;   // number updating with every frame change
    string str = "_keypoints.json"; // fixed string

    int time = 50;
    
    // file name genertaed by application
    string filename;// = string( left, '0').append(to_string(num)+str);

    while(num<time){
        filename = string( left, '0').append(to_string(num)+str);
        cout << filename <<endl;
        
        // update as per time interval
        sleep(frameTime);
        num++;
        if (remainder (num, pow(10,right) ) == 9 ){
            left--;
            right++;
        }
    }

  

    getch();

    return 0;
}
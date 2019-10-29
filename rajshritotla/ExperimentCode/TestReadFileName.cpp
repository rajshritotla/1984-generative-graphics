#include <iostream>
#include <conio.h>
#include <math.h>
#include <string.h>

using namespace std;

int main () {

    /*
        file name format
        zero - represents '0' count to append in left
        Total 12 digits could be there in i.e 000000000000, 000000000001.. and so on
    
    */ 
    
    string zero = "00000000000"; // 
    int left = 11;  // left digits count initially, 11 because 12th position is occupied already with 0 and will update 1,2...
    int right = 1;  // digits on right after '0'
    long num = 0;   // number updating with every frame change
    string str = "_keypoints.json"; // fixed string

    int time = 10;
    
    // file name genertaed by application
    string filename = string( left, '0').append(to_string(num)+str);

    while(num<time){
        cout << filename <<endl;
        
        num++;      // incrementing with frames

        filename = string( left, '0').append(to_string(num)+str);

        if (remainder (num, pow(10,right) ) == 9 ){
            left--;
            right++;
        }
            

    }

    getch();

    return 0;
}
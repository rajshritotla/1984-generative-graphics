#include <iostream>
#include <conio.h>

using namespace std;

/* FIXING | NOT WORKING AS REQUIRED */

void getOSName()
{
    system("systeminfo");
    //system("systeminfo | findstr 'OS Name'");
    //system("systeminfo | findstr /B /C:'OS Name'");
}

int main()
{
    getOSName();
    getch();
    return 0; 
}
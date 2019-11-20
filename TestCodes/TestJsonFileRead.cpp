#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

using namespace std;

// SOURCE: https://github.com/nlohmann/json
// SOURCE: https://nlohmann.github.io/json/

void parseJSON(string fileName);

using json = nlohmann::json;

void parseJSON(string fileName) {
   
    // read file
    ifstream i(fileName);
    json j;
    i >> j;
    // print JSON output
    cout << j;
}

int main()
{
    // specify the filename to be read
    string fileName = "000000000000_keypoints.json";
    parseJSON(fileName);  
    return 0; 
}
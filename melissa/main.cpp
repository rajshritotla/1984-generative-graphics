#include <iostream>
#include <json/json.h>
#include <json/reader.h>
#include <json/value.h>
#include <json/writer.h>
using namespace std;
void callcam()
{
     system("cd ~/openpose && ./build/examples/openpose/openpose.bin --write_json output_folder_path/ ");
}

void parseJSON()
{
    Json::Reader reader;
    Json::Value root;
    string text ="{ \"people\": [{\"id\": 1, \"name\":\"MIKE\",\"surname\":\"TAYLOR\"}, {\"id\": 2, \"name\":\"TOM\",\"surname\":\"JERRY\"} ]}";
    bool parsingSuccessful = reader.parse(text, root);
    if ( !parsingSuccessful )
    {
        cout << "Error parsing file" << endl;
    }

    const Json::Value keypoints = root["keypoints"];

    for ( int index = 0; index < keypoints.size(); ++index )
    {
        cout << keypoints[index] << endl;
    }
}
int main()
{
    //calling the webcam instance
    callcam(); 
    parseJSON();  

    return 0; 
}
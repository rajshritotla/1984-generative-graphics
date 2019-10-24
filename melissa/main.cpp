#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

using namespace std;
using json = nlohmann::json;
void callcam()
{
     system("cd ~/openpose && ./build/examples/openpose/openpose.bin --write_json output_folder_path/ ");
}

void parseJSON()
{
    ifstream i("/Users/momol/1984-generative-graphics/output/COCO_val2014_000000000192_keypoints.json");
    json j;
    i >> j;
    cout << j.dump(4) <<endl;

}
int main()
{
    //calling the webcam instance
    callcam();
    parseJSON();  

    return 0; 
}
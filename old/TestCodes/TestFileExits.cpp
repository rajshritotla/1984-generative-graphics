/** SOURCE: https://github.com/gulrak/filesystem/ */
#include <iostream>
#include <ghc/filesystem.hpp>
namespace fs = ghc::filesystem;
using namespace std;


int main () {

    cout << fs::exists("hello.txt");
    cout<<endl;
    cout << fs::exists("000000000003_keypoints.json");
    return 0;
}
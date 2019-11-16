#include <iostream>
#include <fstream>
#include <string.h>
#include "json/json.h"

using namespace std;

/* FIXING ISSUES not working currently */

// SOURCE: https://danielaparker.github.io/jsoncons/#A2


void parseJSON()
{
    std::string strJson = "{\"mykey\" : \"myvalue\"}"; // need escape the quotes

    Json::Value *root ();   
    Json::CharReaderBuilder *reader ();
    bool parsingSuccessful = reader->parse( strJson.c_str(), root );     //parse process
    if ( !parsingSuccessful )
    {
        std::cout  << "Failed to parse";
               //<< reader.getFormattedErrorMessages();
        
    }
    std::cout << root.get("mykey", "A Default Value if not exists" ).asString() << std::endl;
    



    //ifstream in("000000000000_keypoints.json");
    //Json::Value coordinates_json ();
    /*
    std::ifstream file_input("000000000000_keypoints.json");
    
    //Json::CharReaderBuilder reader ();



    Json::CharReaderBuilder builder;
    Json::CharReader *reader = builder.newCharReader();
    
    Json::Value root ();
    std::string errors;
    reader->parse(file_input.getline(0,200),file_input.getline(200,300),root,errors);
    */



   
    //in >> book_json;
    //Json::CharReader j();



/*
    std::ifstream file_input("000000000000_keypoints.json");
    Json::CharReaderBuilder reader;
    Json::Value root;
    reader.parse(file_input, root);
    cout << root;
  
*/



 /*
Json::Value people;
 std::ifstream people_file("000000000000_keypoints.json", std::ifstream::binary);
people_file >> people;

cout<<people;  

   */ 
}

int main()
{
    parseJSON();
    //getc();
    return 0; 
}
// SOURCE: https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/output.md#reading-saved-results

#include <openpose/pose/poseParameters.hpp>

//const auto& poseBodyPartMappingCoco = getPoseBodyPartMapping(PoseModel::COCO_18);


// start open pose application
void startOpenPoseApplication(string openPoseAppLocation){
    string appLocation = "cd "+openPoseAppLocation+" && ";
    string openPoseCmd = "OpenPoseDemo.exe --model_pose COCO -write_json output/ --disable_blending";
    string runCmd = appLocation+openPoseCmd;
    cout << "OpenPose App Path"<< runCmd;
    system(runCmd.c_str()); 
    //** c_str() - system arg are *char type, Source: http://www.cplusplus.com/reference/string/string/c_str/
}


int main(){
    string openPoseAppLocation = "E:/Practice Projects/openpose";
    string outputFolderLocation ="E:/Practice Projects/openpose/output";
    int frameTimeInterval = 0;    // value in microseconds
    startOpenPoseApplication(openPoseAppLocation);
    //cout<< poseKeypoints[{person, part, 0}];
    
    const auto& posePartPairsCoco = getPosePartPairs(PoseModel::COCO_18);
}






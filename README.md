# 1984-generative-graphics
This project involves combining conventional projection mapping technology in combination with generative-computer graphics and computational vision, in order to create a completely fluid and projected environment for actors in plays. Student teams will work to develop a desktop application for the streamlining of generative graphics creation -- essentially a User Interface tool that will be used to extend an extant Unity project which currently uses a Microsoft Kinect sensor to track actor movements on stage and generate graphics to augment the scene or actually create entirely new interactive environments. A primary goal for this novel software tool is that it allows for the quick alteration of perimeters in generative algorithms, enabling theatrical scenic designers to edit and design in real time during rehearsal, thus creating the conditions for a more fully integrated and collaborative design process with the director, actors, and other designers. 


# Technologies Used

## openpose

Source: https://github.com/CMU-Perceptual-Computing-Lab/openpose

openpose is used in the project to determine the human being coordinates. Currently we are using it with webcam to successfully generate coordinates of using COCO model, which is a trained model available in repository.

Note: Though the links are directly sourced from openpose official repository, its suggestable to confirm the link again from openpose docs

#### Get coordinates using openpose

Assumption : openpose and dependencies successfully installed

To get coordinates using openpose:

Through command line interface run the application with flags set as:


```
../OpenPoseDemo.exe --model_pose COCO -write_json output/
```

OpenPoseDemo.exe : The application which generates the coordinates

--model_pose COCO : Speicifies to run COCO model

Note: This is not a mandatory flag, but due to GPU and drivers constraints this flag was required. One could try without this flag if it doesn't run then they can use this flag. To know more about this read the documentation on openpose github link.

-write_json output/ : It will write the coordinates in JSON format in a folder name as "output". Folder name could be any name, not required specifically to be "output". There is one JSON file generated for every frame.

#### openpose installtions Prerequisite

```
https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/prerequisites.md
```


#### openpose Installation Requirement and Procedure (Windows OS)

For whole procedure and other OS visit their github documentation:

https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md

Windows OS users can directly download the binary files from "Release" section and try running the OpenPoseDemo.exe. They can also generate their own binary files using CMake.

Installations done by us for Windows:

NVIDIA driver updates

Cuda Driver

cuDNN

CMAke

Visual Studio 2017


#### OpenPose Binary File Generation Overview (Windows OS)

Assuming the required drivers are installed and CUDA/cuDNN driver files are manually placed at correct location as specified in openpose docs; CMake and VS2017 are installed.

In CMake Gui:

1. Where is the source code : Points to the openpose folder cloned by github:

```
git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
```


2. Where to build the binaries : Points to a folder specified by you, in my case I named it as "build"

3. Click Configure

Note: Configuring done should be shown in last else there is some issue

Note: Platform selected by me : x64

4. Click Generate

5. OpenProject

Assuming it opens in VS 2017, choose "Release" [instead Debug on top bar (where there are options for run)] and hit green button.


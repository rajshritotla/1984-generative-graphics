We are trying to create a 3D rain environment for the play, in which actors could be detected and there for now we are planning to stop rain. Later we will improvise it to detect umbrella and stop rain.

## Main Code
In Directory - RainSceneWithHumanDetection

Currently the code have UI component commented and human detection and 3D rain code running. Later we plan to create a separate output window. There may exits 3 windows:
* Input window
* UI window
* Output window

#### To run
Code can be run like a normal .pde files assuming Processing application exits.

## Other Code
* DetectAndStartCamera - Code written using classes following OOPS approach to detect camera
* detector - Code made in attempt to integrate UI and 3D rain, ERROR code as UI is 2D and rain code is 3D
* RainScene3D - Code to generate 3D rain sourced from [here](https://discourse.processing.org/t/simple-3d-rain-simulation/10834)

## Class Structure 


* Rain Scene (Directory - RainScene3D)

[RainScene3D](RainScene3D/RainScene3DUML.jpeg "RainScene3D")


* Rain Scene With Human Detection (Directory - RainSceneWithHumanDetection)

[RainScene3D](RainSceneWithHumanDetection/RainSceneWithHumanDetectionUML.jpeg "RainSceneWithHumanDetection")
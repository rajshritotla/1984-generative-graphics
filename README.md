# 1984-generative-graphics
This project involves combining conventional projection mapping technology in combination with generative-computer graphics and computational vision, in order to create a completely fluid and projected environment for actors in plays. This is a desktop application for the streamlining of generative graphics creation essentially a User Interface tool that will be used to track actor movements on stage and generate graphics to augment the scene or actually create entirely new interactive environments. A primary goal for this novel software tool is that it allows for the quick alteration of perimeters in generative algorithms, enabling theatrical scenic designers to edit and design in real time during rehearsal, thus creating the conditions for a more fully integrated and collaborative design process with the director, actors, and other designers. 


# Technologies Used
The application is developed using [Processing](https://processing.org/) software.

* [Download Processing](https://processing.org/download/)


#### Why Processing? (source from website https://processing.org)

Processing is a flexible software sketchbook and language for learning how to code within the context of the visual arts. Since 2001, Processing has promoted software literacy within the visual arts and visual literacy in technology. It is widely used for learning and prototyping.

* Free to download and open source.
* Interactive programs with 2D, 3D, PDF, or SVG output.
* OpenGL integration for accelerated 2D and 3D.
* For GNU/Linux, Mac OS X, Windows, Android, and ARM.
* Over 100 libraries that extend the core software.
* Well documented, with many books available.


#### Why we switched techology from openframeworks and openpose to Processing?

* Earlier approach had lot of dependencies and thus a lot of additional installations required.
* High hardware requirements.
* Complex to use and learn as compared to Processing.
* Compatability issue between openpose and openframeworks.
* Processing is ready to use, one just needs to download the application.


#### Technologies Used in Old Code
* [openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)
* C++
* [openframeworks](https://openframeworks.cc/about/)

Code and documentation available on "oldcode" branch in "old" directory


# Libraries Used
* OpenCV for processing: [github repository](https://github.com/atduskgreg/opencv-processing) [documentation](http://atduskgreg.github.io/opencv-processing/reference/)
* PShape: [documentation](https://processing.github.io/processing-javadocs/core/processing/core/PShape.html)
* Video for processing: [github repository](https://github.com/processing/processing-video)


# To run

1. [Download](https://processing.org/download/) Processing.

2. Install the above listed libraries.

    To install library, in IDE go to: 
    Sketch -> Import Libarary -> Add Library
    
    If any supporting library for the application is missing, errors could be seen in the IDE console. In that case install those libraries as well.

3. Copy "fist.xml" file to:

    ..\Processing\libraries\opencv_processing\library\cascade-files\

    File could be found in "main_window" directory. This file is to detect actor's fist.

4. Double click on the file "**main_window.pde**" in the directory "**main_window**" and run using play(green) button in IDE. 

5. Applictaion should start with a gui with different sliding bars to customize the graphic and a startup window will appear with selections that the user can choose from, such as shapes, template, and which movement to detect. After the user has chosen the necessary information, the graphics window will appear along with a window displaying the camera and what it is detecting.

Note: Currently you need to re-run the application everytime to generate the different graphic

    Happy playing!!


# Source Code

* On the OpenCV for processing github repository, they included many examples for users to test the libraries. One of the main examples that we used and took code from is this [example](https://github.com/atduskgreg/opencv-processing/tree/master/examples/LiveCamTest).
* To create the shapes, images, and custom shapes feature, we referenced to the code in the PShape documentaton found [here](https://processing.org/tutorials/pshape/).
* To create the GUI, we referenced the code from [here](https://www.kasperkamperman.com/blog/processing-code/controlp5-library-example1/).
* To create the Menu Bar, we referenced code from a forum page found [here](https://forum.processing.org/two/discussion/12202/is-there-a-way-to-associate-a-menu-bar-with-the-sketch-frame).
* To create the 3D Rain Scene, we referenced the code from [here](https://discourse.processing.org/t/simple-3d-rain-simulation/10834)
* To create the 3D shapes {BOX, SPHERE}, we referenced code from [here](https://processing.org/examples/primitives3d.html)


# Issues

* There is a major issue with the Video library is using a Mac with Catalina installed. Because of the new install, all 32 bit applications are deprecation, one of which is the Video Library. A work around this is to manually clone the beta version of the library (found [here](https://github.com/processing/processing-video/releases/tag/r6-v2.0-beta4))
and manually install it (in the Mac, directly install it in /Documents/Processing/Libraries). 

* Body detection may not work using normal webcam


**Warning:** In using MacOSX, There is a lot of external libraries in this library that cannot be detected by Mac so it could be annoying and give you a warning saying that this library cannot be used as Apple cannot verify the library. A way around this is to open every single file, and then manually allow them to open. However, there are almost 300 files so this might take some time


# Project UML

This is a high level UML to get a quick insight of the project.

![1984GenerativeGrpahicsProjectUML](main_windowUML.png "main_windowUML")

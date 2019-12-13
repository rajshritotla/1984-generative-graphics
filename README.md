# 1984-generative-graphics
This project aims to allow non-technical theatre director to generate computer graphics environment in a theatrical production. 

# Solution
This desktop application provides a user interface with the ability to track actor movements on stage and generate graphics that the actors can interact with. A primary goal for this tool is the ability for the quick alteration of variables in generative algorithms, enabling theatrical designers to edit and design in real time during rehearsal, thus creating the conditions for a more fully integrated and collaborative design process with the director, actors, and other designers. 


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
* Video for processing: [github repository](https://github.com/processing/processing-video). In order for the program to work, use [Video Library Version 2.0-beta4](https://github.com/processing/processing-video/releases)
* ControlP5: [documentation](http://www.sojamo.de/libraries/controlP5/

##### Libraries Installed in Processing Library Manager

* OpenCV for processing
* Video
* Control P5


# To run

1. [Download](https://processing.org/download/) Processing.

2. Install the OpenCV, Video, and ControlP5 libraries.

    To install library, in IDE go to: 
    Sketch -> Import Libarary -> <Library Name> -> Install (on the lower right corner)
* For Video, it is the Video library by the Processing Foundation
* For OpenCV, it is the OpenCV Library by Greg Borenstein
* For ControlP5 libraries, it is the ControlP5 libray by Andreas Schlegl <br/>

To check if Library was correctly installed, go to Sketch -> Import Library. If the library was installed, in should be listed when Import Library was selected.
     ![1984GenerativeGrpahicsProjectUML](importedlibraries.png "main_windowUML")
If any supporting library for the application is missing, errors could be seen in the IDE console. In that case install those libraries as well.<br/>

**WARNING**: For the access on the webcamera to work, you MUST allow camera access for Processing.
* On Macs, go to security and privacy, then under the selection bar on the left panel, select camera. Check the box for Processing and the application should have access to the camera now. 
    * if you have Catalina, there might be some problems with the Video library. A workaround it is listed below under ISSUES.
* On Windows, go to Start, Settings, Privacy, and Camera, then check off the box for Processing to allow camera usage of the application.

3. Copy "fist.xml" file to:

    ..\Processing\libraries\opencv_processing\library\cascade-files\

    File could be found in "main_window" directory. This file is to detect actor's fist.

4. Double click on the file "**main_window.pde**" in the directory "**main_window**" and run using play(green) button in IDE. 

5. Application should start with a gui with different sliding bars to customize the graphic and a startup window will appear with selections that the user can choose from, such as shapes, template, and which movement to detect. After the user has chosen the necessary information, the graphics window will appear along with a window displaying the camera and what it is detecting.

Note: Currently you need to re-run the application everytime to generate the different graphic

Happy playing!!


# Reference Code

* On the OpenCV for processing github repository, they included many examples for users to test the libraries. One of the main examples that we used and took code from is this [example](https://github.com/atduskgreg/opencv-processing/tree/master/examples/LiveCamTest).
* To create the shapes, images, and custom shapes feature, we referenced to the code in the PShape documentaton found [here](https://processing.org/tutorials/pshape/).
* To create the GUI, we referenced the code from [here](https://www.kasperkamperman.com/blog/processing-code/controlp5-library-example1/).
* To create the Menu Bar, we referenced code from a forum page found [here](https://forum.processing.org/two/discussion/12202/is-there-a-way-to-associate-a-menu-bar-with-the-sketch-frame).
* To create the 3D Rain Scene, we referenced the code from [here](https://discourse.processing.org/t/simple-3d-rain-simulation/10834)
* To create the 3D shapes {BOX, SPHERE}, we referenced code from [here](https://processing.org/examples/primitives3d.html)
* To create the message box dialogue, we referenced code from [here](https://forum.processing.org/two/discussion/4764/how-to-make-a-popup-window)
* To import an image, we referenced code from [here](https://stackoverflow.com/questions/16302332/how-could-i-choose-one-particular-file-to-load-with-loadstrings)
* To use image, we reference code from [here](https://processing.org/reference/PImage.html)


# Issues

* There is a major issue with the Video library is using a Mac with Catalina installed. Because of the new install, all 32 bit applications are deprecated, one of which is the Video Library. A work around this is to manually clone the beta version of the library (found [here](https://github.com/processing/processing-video/releases/tag/r6-v2.0-beta4))
and manually install it (in the Mac, directly install it in /Documents/Processing/Libraries). 
* On the menu part, the selections on the top of the screens are not working except Exit. We put this there so that the next user will know what features should be included and give them an easier in implementing these features
* Exiting the applications is sometimes glitchy, as the application may throw some "Thread Death" error.<br/> 
 **Warning:** In using MacOSX, There is a lot of external libraries in this library that cannot be detected by Mac so it could be annoying and give you a warning saying that this library cannot be used as Apple cannot verify the library. A way around this is to open every single file, and then manually allow them to open. However, there are almost 300 files so this might take some time.

* Body/Fist detection may not work using normal webcam, due to the sizing of the webcam being very limited
* Facial detection does not work properly when there are more than one face on the camera
* You have to get really close to the camera for it to work properly. For testing, we usually are sitting down in a chair with our laptop on a desk, and the camera works properly in this way.
* A major difficulty using this application on a VM is the access webcam, as VM's may not be allowed for access to the webcam.


# Project UML

This is a high level UML to get a quick insight of the project.

![1984GenerativeGrpahicsProjectUML](main_windowUML.png "main_windowUML")

* **Button**: This is the file in which the button will be generated from.
* **main_window**: This file contains the main window of the project, which includes the canvas and which the graphic is being created on as well as the initial starting window that includes the place where the user will choose their preference
* **detector_window** This file contains the window in which the camera will be rendered on. It uses the OpenCV library to detect the face, fist, and fullbody of the user. 
* **graphics** This file contains the class of the graphics being generated, such as 2d graphics, 3d graphics, as well as the Rain feature that we implemented.
* **image** This file contains the class of the image graphic being generated, the graphic coming from an imported image
* **menu_window** This file contains the window in which the menu window is rendered on. It contains the ControlP5 controllers in which allows the user for more customization of the graphics as well as exiting/saving the graphics
* **rain** This is the file in which the rain sequence will be generated. 
* **text** This is the file in which the text box will be generated

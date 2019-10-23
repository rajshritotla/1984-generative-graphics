# MOVEMENT ESTIMATION
Experimental code that uses OpenPose Python API to get back estimatated position data from webcam movements in a JSON file. 
## Source code 
* [OpenPose_PythonOpenCV](https://github.com/nishagandhi/OpenPose_PythonOpenCV) - a simple code demonstrating real time position estimation (but uses methods from OpenPose that have been deprecated)
  * Medium article about this code is linked [here](https://medium.com/pixel-wise/real-time-pose-estimation-in-webcam-using-openpose-python-2-3-opencv-91af0372c31c)
* [OpenPose Python API Examples](https://github.com/CMU-Perceptual-Computing-Lab/openpose/tree/master/examples/tutorial_api_python) - examples using the OpenPose Python API (I mostly referenced [this file](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/examples/tutorial_api_python/01_body_from_image.py))
* [StackExchange](https://stackoverflow.com/a/46604754) - I used this answer to convert an image into a numpy array

## Dependencies
* OpenPose/PyOpenPose - [repository](https://github.com/CMU-Perceptual-Computing-Lab/openpose)
* Matplotlib - can install via ```python -m pip install -U matplotlib```
* OpenCV - can install via ```python -m pip install -U opencv-python```

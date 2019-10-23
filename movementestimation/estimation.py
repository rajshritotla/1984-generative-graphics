# From Python
# It requires OpenCV installed for Python
import sys
import cv2
import os
from matplotlib.image import imread
from sys import platform
import argparse
import time
try:
    # Import Openpose (Windows/Ubuntu/OSX)
    dir_path = os.path.dirname(os.path.realpath(__file__))
    try:
        # Windows Import
        if platform == "win32":
            # Change these variables to point to the correct folder (Release/x64 etc.)
            sys.path.append(dir_path + '/../../python/openpose/Release');
            os.environ['PATH']  = os.environ['PATH'] + ';' + dir_path + '/../../x64/Release;' +  dir_path + '/../../bin;'
            import pyopenpose as op
        else:
            # Change these variables to point to the correct folder (Release/x64 etc.)
            sys.path.append('../../python');
            # If you run `make install` (default path is `/usr/local/python` for Ubuntu), you can also access the OpenPose/python module from there. This will install OpenPose and the python library at your desired installation path. Ensure that this is in your python path in order to use it.
            # sys.path.append('/usr/local/python')
            from openpose import pyopenpose as op
    except ImportError as e:
        print('Error: OpenPose library could not be found. Did you enable `BUILD_PYTHON` in CMake and have this Python script in the right folder?')
        raise e

    # Custom Params (refer to include/openpose/flags.hpp for more parameters)
    params = dict()
    params["logging_level"] = 3
    params["output_resolution"] = "-1x-1"
    params["net_resolution"] = "-1x368"
    params["model_pose"] = "BODY_25"
    params["alpha_pose"] = 0.6
    params["scale_gap"] = 0.3
    params["scale_number"] = 1
    params["render_threshold"] = 0.05
        # If GPU version is built, and multiple GPUs are available, set the ID here
    params["num_gpu_start"] = 0
    params["disable_blending"] = False
        # Ensure you point to the correct path where models are located
    params["model_folder"] = "/Users/momol/openpose/models/"

    #Starting openpose
    opWrapper = op.WrapperPython()
    opWrapper.configure(params)
    opWrapper.start()

    #starting webcam instance
    stream = cv2.VideoCapture(0)
    font = cv2.FONT_HERSHEY_SIMPLEX
    
    #loop to parse through each frame of live camera
    while True:
        #processing data
        datum = op.Datum()
        #getting a frame every .5 of a second
        stream.set(cv2.CAP_PROP_POS_MSEC,0.5*1000)
        #reading the frame
        ret,img = stream.read()
        #creating an image for each frame
        if ret:
            cv2.imwrite("image.jpg", img)
        #parsing the location of the image
        parser = argparse.ArgumentParser()
        parser.add_argument("--image_path", default="/Users/momol/1984-generative-graphics/movementestimation/image.jpg", help="Process an image. Read all standard formats (jpg, png, bmp, etc.).")
        args = parser.parse_known_args()
        imageToProcess = imread(args[0].image_path)
        datum.cvInputData = imageToProcess
        opWrapper.emplaceAndPop([datum])

        print(type(datum.poseKeypoints))
        # Display Image
        print("Body keypoints: \n" + str(datum.poseKeypoints))
        cv2.imshow("output data", datum.cvOutputData)

        if cv2.waitKey(1) == 27: 
            break  # esc to quit
    stream.release()
    cv2.destroyAllWindows()
except Exception as e:
    print(e)
    sys.exit(-1)

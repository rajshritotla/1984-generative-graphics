# From Python
# It requires OpenCV installed for Python
import sys
import cv2
import os
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

    # Flags
    parser = argparse.ArgumentParser()
    parser.add_argument("--image_path", default="../../../examples/media/COCO_val2014_000000000241.jpg", help="Process an image. Read all standard formats (jpg, png, bmp, etc.).")
    args = parser.parse_known_args()

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
    params["model_folder"] = dir_path + "/../../../models/"

    # Add others in path?
    for i in range(0, len(args[1])):
        curr_item = args[1][i]
        if i != len(args[1])-1: next_item = args[1][i+1]
        else: next_item = "1"
        if "--" in curr_item and "--" in next_item:
            key = curr_item.replace('-','')
            if key not in params:  params[key] = "1"
        elif "--" in curr_item and "--" not in next_item:
            key = curr_item.replace('-','')
            if key not in params: params[key] = next_item

    # Construct it from system arguments
    # op.init_argv(args[1])
    # oppython = op.OpenposePython()

    # Starting OpenPose
    opWrapper = op.WrapperPython()
    opWrapper.configure(params)
    opWrapper.start()

    # Read image and face rectangle locations
#     imageToProcess = cv2.imread(args[0].image_path)
#     faceRectangles = [
#         op.Rectangle(330.119385, 277.532715, 48.717274, 48.717274),
#         op.Rectangle(24.036991, 267.918793, 65.175171, 65.175171),
#         op.Rectangle(151.803436, 32.477852, 108.295761, 108.295761),
#     ]

#     # Create new datum
#     datum = op.Datum()
#     datum.cvInputData = imageToProcess
#     datum.faceRectangles = faceRectangles

#     # Process and display image
#     opWrapper.emplaceAndPop([datum])
#     print("Face keypoints: \n" + str(datum.faceKeypoints))
#     cv2.imshow("OpenPose 1.5.1 - Tutorial Python API", datum.cvOutputData)
#     cv2.waitKey(0)
# except Exception as e:
#     print(e)
#     sys.exit(-1)
    stream = cv2.VideoCapture(0)
    font = cv2.FONT_HERSHEY_SIMPLEX
    while True:
        ret,img = stream.read()
        datum = op.Datum()
        # im = cv2.imread('img', mode='RGB')
        imageToProcess = cv2.imshow('',img)
        datum.cvInputData = img
        opWrapper.emplaceAndPop([datum])
        print("Body keypoints: \n" + str(datum.poseKeypoints))
        print(len(datum.poseKeypoints[0]))
        cv2.imshow("OpenPose 1.5.1 - Tutorial Python API", datum.cvOutputData)
        cv2.waitKey(0)
        
        # # Output keypoints and the image with the human skeleton blended on it
        # keypoints, output_image = op.forward(img, True)
        # # Print the human pose keypoints, i.e., a [#people x #keypoints x 3]-dimensional numpy object with the keypoints of all the people on that image
        # if len(keypoints)>0:
        #     print('Human(s) Pose Estimated!')
        #     print(keypoints)
        # else:
        #     print('No humans detected!')
        #     # Display the stream
        #     cv2.putText(output_image,'OpenPose using Python-OpenCV',(20,30), font, 1,(255,255,255),1,cv2.LINE_AA)
        #     cv2.imshow('Human Pose Estimation',output_image)
        #     key = cv2.waitKey(1)
        #     if key==ord('q'):
        #         break

        stream.release()
        cv2.destroyAllWindows()
except Exception as e:
    print(e)
    sys.exit(-1)

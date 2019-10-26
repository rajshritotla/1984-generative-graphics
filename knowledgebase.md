Here, we will be posting the problems and the solutions we had during different phrases of the project.
Also some notes which could be helpful to resolve the issues that arise while working with this project/application.

### Issues faced (Windows)

1. During openpose installation, in GENERATE step, windows or .dll files missing. 

Solution: Copy all binary files or .dll files in the directory where OpnePoseDemo.exe file exists.

2. On running OpnePoseDemo.exe error: some model missing or model folder missing/not found

Solution: Due to some technical glitch not all models are generated when generating or downloading binaries. In that case explicitly copy the model folder and put it in directory where OpnePoseDemo.exe file exists.

3. On running OpnePoseDemo.exe error: GPU 0 starting, cuda Success == failure, etc errors

Solution: Assuming that the system is unable to allocate required memory or drivers issue, running this with COCO model flag it should work. So the command will be 

```
OpenPoseDemo.exe --model_pose COCO 
```


Running YoloV7-tiny with TensorRT Engine on Jetson Xavier AGX 4.6 
==========

requirement
=============
```
appdirs==1.4.4
certifi==2023.7.22
chardet==5.0.0
cycler==0.11.0
dataclasses==0.8
decorator==5.1.1
idna==3.4
importlib-resources==5.4.0
imutils==0.5.4
kiwisolver==1.3.1
Mako==1.1.6
MarkupSafe==2.0.1
matplotlib==3.3.4
numpy==1.19.4
pandas==1.1.5
Pillow==8.4.0
platformdirs==2.4.0
protobuf==3.19.6
psutil==5.9.5
pycuda==2020.1
pyparsing==3.1.1
python-dateutil==2.8.2
pytools==2022.1.12
pytz==2023.3
PyYAML==3.12
requests==2.31.0
scipy==1.5.4
seaborn==0.11.2
six==1.16.0
tensorrt==8.0.1.6
torch @ file:///home/joe/JetsonYoloV7-TensorRT/torch-1.10.0-cp36-cp36m-linux_aarch64.whl
torchvision==0.11.0a0+fa347eb
tqdm==4.64.1
typing_extensions==4.1.1
urllib3==1.26.16
zipp==3.6.0

```

------------------------------------------------------------------------------------------

Generate wts file from pt file
=============
Yolov7-tiny.pt is already provided in the repo. But if you want you can download any other version of the yolov7 model. Then run below command to convert .pt file into .wts file 

	$ python3 gen_wts.py -w yolov7-tiny.pt -o yolov7-tiny.wts
	
Make

=============
remember to revise yolov7/include config.h

const static int kNumClass = 5; (change to your own numbers of class)
=============
Create a build directory inside yolov7. Copy and paste generated wts file into build directory and run below commands. If using custom model, make sure to update kNumClas in yolov7/include/config.h

	$ cd yolov7/
	$ mkdir build
	$ cd build
	$ cp ../../yolov7-tiny.wts .
	$ cmake ..
	$ make 
	
Build Engine file 
=============

    $ sudo ./yolov7 -s yolov7-tiny.wts  yolov7-tiny.engine t
	

Testing Engine file 
=============

	$ sudo ./yolov7 -d yolov7-tiny.engine ../images
	
This will do inferencing over images and output will be saved in build directory.

-----------------------------------------------------------------------------------------

Python Object Detection
=============
./lauch_tensorrt.sh
```
"Hello, choose the mode you want it~"
------ Tensorrt Demo ------
[0]: otocam  yolov7-tiny
----------------
[1]: video  yolov7-tiny
----------------
[2]: app  yolov7-tiny
----------------
"Press enter to start it:"
```

If you have custom model, make sure to update categories as per your classes in `yolovDet.py` .

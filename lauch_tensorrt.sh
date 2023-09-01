#!/bin/sh
echo ""
echo "Hello, choose the mode you want it~"
echo ------ Tensorrt Demo ------
echo [0]: otocam  yolov7-tiny
echo ----------------
echo [1]: video  yolov7-tiny
echo ----------------
echo [2]: app  yolov7-tiny
echo ----------------
echo [3]: yolov7_trt  yolov7-tiny
echo ----------------
echo -n "Press enter to start it:"

read MY_mode

# [./darknet] --> [./home/lab716/Desktop/Rain/darknet/darknet]
#============================================================================ 

if [ $MY_mode -eq 0 ] ; then
    echo ============
    echo 「otocam tensorrt demo yolov7-tiny」
    echo ============

    python3 trt_yolo.py --gstr 1 --save_img ./save_img/save_img \
    --save_record ./save_img/save_record \
    -t 0.95
    
fi

#============================================================================ 
if [ $MY_mode -eq 1 ] ; then
    echo ============
    echo 「video tensorrt demo yolov7-tiny」
    echo ============

    python3 trt_yolo.py --video ./videos/testvideo.mp4 --save_img ./save_img/save_img \
    --save_record ./save_img/save_record \
    -t 0.98
fi

#============================================================================ 
if [ $MY_mode -eq 2 ] ; then
    echo ============
    echo 「app tensorrt demo yolov7-tiny」
    echo ============

    python3 app.py
fi


#============================================================================ 
if [ $MY_mode -eq 3 ] ; then
    echo ============
    echo 「yolov7_trt tensorrt demo yolov7-tiny」
    echo ============

    python3 yolov7_trt.py
fi

#============================================================================ End
echo [===YOLO===] ok!



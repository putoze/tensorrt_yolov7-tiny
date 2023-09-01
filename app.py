import sys
import cv2 
import imutils
from yoloDet import YoloTRT

# use path for library and engine file
model = YoloTRT(library="yolov7/build/libmyplugins.so", engine="yolov7/build/yolov7-tiny-20230831-five-direct.engine", conf=0.9, yolo_ver="v7")

#cap = cv2.VideoCapture("/home/joe/Desktop/Camera_oToCAM250/2023_0816_otocam_datavideo/output0.avi")
cap = cv2.VideoCapture('v4l2src device=/dev/video1 ! video/x-raw, width=1280, height=722, format=GRAY16_LE ! autovideoconvert ! appsink')

while True:
    ret, img = cap.read()
    if len(img.shape) < 3:
        img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
    if img is None:
        break
    img = imutils.resize(img, width=600)
    detections, t = model.Inference(img)
    # for obj in detections:
    #    print(obj['class'], obj['conf'], obj['box'])
    # print("FPS: {} sec".format(1/t))
    cv2.imshow("Output", img)
    key = cv2.waitKey(1)
    if key == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()

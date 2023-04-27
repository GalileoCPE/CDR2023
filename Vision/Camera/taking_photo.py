import cv2
import time
# open the camera
cap = cv2.VideoCapture(0)

# set the camera resolution
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

# capture 20 images for calibration
n_frames = 15
for i in range(n_frames):
    ret, frame = cap.read()

    # save the image to disk
    filename = f'calibration_image_{i}.png'
    cv2.imwrite(filename, frame)
    time.sleep(5)

# release the camera
cap.release()
import numpy as np
import cv2
import sys
import time

#Initialization of Aruco type for robotic french cup is the Aruco 4*4
ARUCO_DICT = {
	"DICT_4X4_50": cv2.aruco.DICT_4X4_50,
	"DICT_4X4_100": cv2.aruco.DICT_4X4_100,
	"DICT_4X4_250": cv2.aruco.DICT_4X4_250,
	"DICT_4X4_1000": cv2.aruco.DICT_4X4_1000,
	"DICT_5X5_50": cv2.aruco.DICT_5X5_50,
	"DICT_5X5_100": cv2.aruco.DICT_5X5_100,
	"DICT_5X5_250": cv2.aruco.DICT_5X5_250,
	"DICT_5X5_1000": cv2.aruco.DICT_5X5_1000,
	"DICT_6X6_50": cv2.aruco.DICT_6X6_50,
	"DICT_6X6_100": cv2.aruco.DICT_6X6_100,
	"DICT_6X6_250": cv2.aruco.DICT_6X6_250,
	"DICT_6X6_1000": cv2.aruco.DICT_6X6_1000,
	"DICT_7X7_50": cv2.aruco.DICT_7X7_50,
	"DICT_7X7_100": cv2.aruco.DICT_7X7_100,
	"DICT_7X7_250": cv2.aruco.DICT_7X7_250,
	"DICT_7X7_1000": cv2.aruco.DICT_7X7_1000,
	"DICT_ARUCO_ORIGINAL": cv2.aruco.DICT_ARUCO_ORIGINAL,
	"DICT_APRILTAG_16h5": cv2.aruco.DICT_APRILTAG_16h5,
	"DICT_APRILTAG_25h9": cv2.aruco.DICT_APRILTAG_25h9,
	"DICT_APRILTAG_36h10": cv2.aruco.DICT_APRILTAG_36h10,
	"DICT_APRILTAG_36h11": cv2.aruco.DICT_APRILTAG_36h11
}

def aruco_display(corners, ids, rejected, image):
    
    #if an aruco 4*4 tag is detected
	if len(corners) > 0:
		
		ids = ids.flatten()
		
		for (markerCorner, markerID) in zip(corners, ids):
			
			corners = markerCorner.reshape((4, 2))
			(topLeft, topRight, bottomRight, bottomLeft) = corners
			
			topRight = (int(topRight[0]), int(topRight[1]))
			bottomRight = (int(bottomRight[0]), int(bottomRight[1]))
			bottomLeft = (int(bottomLeft[0]), int(bottomLeft[1]))
			topLeft = (int(topLeft[0]), int(topLeft[1]))

			cv2.line(image, topLeft, topRight, (0, 255, 0), 2)
			cv2.line(image, topRight, bottomRight, (0, 255, 0), 2)
			cv2.line(image, bottomRight, bottomLeft, (0, 255, 0), 2)
			cv2.line(image, bottomLeft, topLeft, (0, 255, 0), 2)
			
			cX = int((topLeft[0] + bottomRight[0]) / 2.0)
			cY = int((topLeft[1] + bottomRight[1]) / 2.0)
			cv2.circle(image, (cX, cY), 4, (0, 0, 255), -1)
			
			cv2.putText(image, str(markerID),(topLeft[0], topLeft[1] - 10), cv2.FONT_HERSHEY_SIMPLEX,
				0.5, (0, 255, 0), 2)
			print("[Inference] ArUco marker ID: {}".format(markerID))
			
	return image



def pose_estimation(frame, aruco_dict_type, matrix_coefficients, distortion_coefficients):

    #transform the image into a grayscale image
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    #Getting the fictionaris corresponding of our aruco markers
    cv2.aruco_dict = cv2.aruco.Dictionary_get(aruco_dict_type)

    #create a set of parameters for a good estimation if you don't specify parameters
    #it takes the default ones that remain good for common use
    parameters = cv2.aruco.DetectorParameters_create()

    #Function that detects the Markers
    corners, ids, rejected_img_points = cv2.aruco.detectMarkers(gray, cv2.aruco_dict,parameters=parameters,
        cameraMatrix=matrix_coefficients,
        distCoeff=distortion_coefficients)

    R_list=[]
    #if the detection detects at least one marker then we go into the if
    if len(corners) > 0:
        for i in range(0, len(ids)):
           
            '''rvec: A 3D rotation vector that describes the rotation between the marker and the camera.
            tvec: A 3D translation vector that describes the position of the marker relative to the camera.'''
            rvec, tvec, markerPoints = cv2.aruco.estimatePoseSingleMarkers(corners[i], 0.03, matrix_coefficients,
                                                                       distortion_coefficients)

            # Camera position relative to marker [x,y,z]
            print("distance from the aruco marker", tvec[0][0])

            #Euclidian distance
            distance = np.linalg.norm(tvec)

            #Convertion Rotation vector to a rotation matrix
            R, _ = cv2.Rodrigues(rvec)

            #Inversion of the matrix for having the camera position and rotation relative to marker
            R_inv = np.linalg.inv(R)

            #print("rotation vector", np.degrees(rvec))
            t_cam_marker = np.dot(-R_inv, np.transpose(tvec[0][0]))

            print("Camera position relative to marker: ", t_cam_marker)
            print("Camera orientation relative to marker (in degrees): ", np.degrees(cv2.Rodrigues(R_inv)[0]))


            #Display onto the frame all the information that we know
            cv2.putText(frame,f"Distance: {t_cam_marker:.2f} meters",(10, frame.shape[0]-20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1, cv2.LINE_AA)

            cv2.putText(frame,f"rotation: {np.degrees(cv2.Rodrigues(R_inv)[0]):.2f} degree",(10, frame.shape[0]-40), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1, cv2.LINE_AA)

            cv2.aruco.drawDetectedMarkers(frame, corners) 

            cv2.aruco.drawAxis(frame, matrix_coefficients, distortion_coefficients, rvec, tvec, 0.01)  

    return frame


# def Frame_display(Id):
      
#       print(0)

    
#Define the Aruco type we want to detect
aruco_type = "DICT_4X4_100"

#Get that Aruco in the dictionary of the Aruco
arucoDict = cv2.aruco.Dictionary_get(ARUCO_DICT[aruco_type])

arucoParams = cv2.aruco.DetectorParameters_create()

#Settings the intrinsic parameter of the camera that we got with the calibration algortihm (chessboard)
intrinsic_camera = np.array(((951.19442957, 0, 655.18037018),(0,951.21008316, 381.97715139),(0,0,1)))
distortion = np.array((8.88842561e-04 , 3.25521835e-01  ,1.37760593e-02  ,1.45864253e-03,-2.15412814e+00))

#Opening the socket for the camera if it's not 2 try like 0 or 1 
cap = cv2.VideoCapture(1)

#Setting up the width and height for the camera frame
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

#log out "begin.."
print("[INFO] begining video capture...")
print("[INFO] press 'q' to quit")

# while the stream is one
while cap.isOpened():
    
    print("[INFO] begining video capture...")

    #ret is for checking if the reading have succeed and image is the actual frame
    ret, img = cap.read()
    
    output = pose_estimation(img, ARUCO_DICT[aruco_type], intrinsic_camera, distortion)

    cv2.imshow('Estimated Pose', output)

    key = cv2.waitKey(1) & 0xFF
    if key == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
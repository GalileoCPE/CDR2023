from math import sin, cos, tan, pi, radians
import numpy as np

FOV_DEG = 60#degrees
FOV_RAD = radians(FOV_DEG)
NB_TOF = 6
NB_ZONES_PER_LINE = 8 
HORIZON_DISTANCE = 2200
UPDATE_INTERVAL_MS = 50

PERIMETRE_CERCLE = 1200
R_PADDING = 20 # distance d'incrustation de l'hexagone dans le cercle 
TOF_ANGLE_SHIFT_DEG = 3 # angle de decalage du ToF par rapport au cote observe
TOF_ANGLE_SHIFT_RAD = radians(TOF_ANGLE_SHIFT_DEG)
TOF_OFFSET = 5 # distance du capteur ToF dépassant de la fente

def getX_tof(values):
    step = FOV_DEG / NB_ZONES_PER_LINE
    angles = np.arange(-FOV_DEG/2+step/2, FOV_DEG/2, step).tolist()
    return [values[0][i] * tan(radians(angles[i])) for i in range(NB_ZONES_PER_LINE)]

def translateVector2D(vector=(0,0), translation=(1,1)):
    return (vector[0]+translation[0],vector[1]+translation[1])

def rotateVector2D_rad(vector=(1,1), theta = 0):
    return (vector[0]*cos(theta)-vector[1]*sin(theta), vector[0]*sin(theta)+vector[1]*cos(theta))

def transformVector2D(vector, angle, translation):
    return translateVector2D(rotateVector2D_rad(vector, angle), translation)

def posReferentielRobot(data0=[],data1=[],data2=[],data3=[],data4=[],data5=[]): # data = listes des points des ToF
    data = [data0,data1,data2,data3,data4,data5]
    r = PERIMETRE_CERCLE/(2*pi) # rayon du cercle
    d = r - R_PADDING + TOF_OFFSET
    dPosCapteur = {}
    for i in range(NB_TOF):
        dPosCapteur[i] = rotateVector2D_rad((-d,0),i*FOV_RAD)
    dDirCapteur = {}
    for i in range(NB_TOF):
        dDirCapteur[i] = -(i*FOV_RAD-TOF_ANGLE_SHIFT_RAD)

    values = [[],[]]
    for i in range(NB_TOF):
        tof = data[i]
        x = tof[0]
        y = tof[1]
        for j in range(len(x)):
            p = transformVector2D((x[j],y[j]), dDirCapteur[i], (dPosCapteur[i], dPosCapteur[i]))
            values.append(p)
    return values

def removeUnusableData(points, status):
    usableStatus=[0,5,6,9]
    i = 0
    for s in status:
        if s not in usableStatus:
            points[0].pop(i)
            points[1].pop(i)
        else:
            i+=1
    if len(points[0]) == 0:
        points = [[0,0],[0,0]]
    elif len(points[0]) == 1:
        points[0].append(points[0][0])
        points[1].append(points[1][0])
    return points
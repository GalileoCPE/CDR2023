from serial import Serial
from time import sleep
import numpy as np
from matplotlib import animation as animation, pyplot as plt, cm
from PyQt5 import QtWidgets, QtCore
from pyqtgraph import PlotWidget, plot
import pyqtgraph as pg
import sys  # We need sys so that we can pass argv to QApplication
from math import pi, sin, cos, tan, radians
from tof import getX_tof, removeUnusableData, FOV_RAD, HORIZON_DISTANCE, NB_ZONES_PER_LINE

DEFAULT_COLOR = "\x1b[0m"
GREEN_COLOR = "\x1b[38;5;10m"
RED_COLOR = "\x1b[38;5;9m"

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

def printValues(table):
    for i in range(len(table[0])):
        print(GREEN_COLOR,table[0][i],RED_COLOR,table[1][i],DEFAULT_COLOR,table[2][i])

''' converts "120 0 4| 450 0 6| 500 0 5| ..."
    to [ [120,450,500, ... ],[0,0,0, ... ],[4,6,5, ... ] ]
       [      [distance],       [status],    [signal]    ] '''
def convertLineToValues(line=""):
    l = line.replace("\\n","")
    zonesString = l[2:-1].split("|")
    values = [[],[],[]]
    for zoneStr in zonesString :
        for j,data in enumerate(zoneStr.split()):
            if data == "X" :
                data = -1
            else:
                data = int(data)
            values[j].append(data)
    return values

class MainWindow(QtWidgets.QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.graphWidget = pg.PlotWidget()
        self.setCentralWidget(self.graphWidget)

        self.x = list(range(NB_ZONES_PER_LINE))  # 8 time points
        self.y = list(range(NB_ZONES_PER_LINE))  # 8 data points

        self.graphWidget.setBackground('w')
        xRange = HORIZON_DISTANCE/tan(FOV_RAD)
        self.graphWidget.setXRange(-xRange,xRange)
        self.graphWidget.setYRange(0,HORIZON_DISTANCE)
        
        # les points mesurés
        pen1 = pg.mkPen(color=(0, 255, 0), width=5)
        self.data_line =  self.graphWidget.plot(self.x, self.y, pen=pen1, symbol='o')

        # lignes delimitant le FoV 60°
        pen2 = pg.mkPen(color=(255, 0, 0), width=5)
        self.l1 = self.graphWidget.plot([0,xRange], [0,HORIZON_DISTANCE], pen=pen2)
        self.l2 = self.graphWidget.plot([0,-xRange], [0,HORIZON_DISTANCE], pen=pen2)

        self.timer = QtCore.QTimer()
        self.timer.setInterval(UPDATE_INTERVAL_MS)
        self.timer.timeout.connect(self.update_plot_data)
        self.timer.start()

    def update_plot_data(self):
        # recuperation des donnees
        line = str(ser.readline())
        values = convertLineToValues(line)

        # affichage console des donnees
        printValues(values)
        print("========")

        # calcul des coordonnees des points mesurees dans le repere du ToF
        pointsToF = [getX_tof(values),values[0]]
        pointsToF = removeUnusableData(pointsToF,values[1])
        self.x = pointsToF[0]
        self.y = pointsToF[1]


        self.data_line.setData(self.x, self.y)  # Update the data.


def update_matplotlib(i,zones,values):
    ax.clear()

    line = str(ser.readline())
    values = convertLineToValues(line)

    printValues(values)
    print("========")

    ax.bar(zones, values[0], facecolor='green', alpha=0.75)
    plt.ylim((0,4000))

ser = Serial()
ser.baudrate = 460800 # standard Baudrate for STM32F4 devices
ser.port = 'COM3'
ser.bytesize=8
ser.parity='N'
ser.stopbits=1
ser.timeout=None
ser.xonxoff=0
ser.rtscts=0
# x = ser.read()          # read one byte
# s = ser.read(10)        # read up to ten bytes (timeout)
ser.open()
print(ser,"\n")

fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
zones = list(range(NB_ZONES_PER_LINE))
values = []

if ser.isOpen() :
    # Matplotlib
    # ani = animation.FuncAnimation(fig, update_matplotlib, fargs=(zones,values), interval=10)
    # plt.show() Graph
    
    # PyQt
    app = QtWidgets.QApplication(sys.argv)
    w = MainWindow()
    w.show()
    sys.exit(app.exec_())


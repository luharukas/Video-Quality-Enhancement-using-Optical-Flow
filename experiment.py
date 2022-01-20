import cv2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import cv2 as cv

img2_file=open(r".\temp_files\myimage2",'r')
img3_file=open(r".\temp_files\myimage3",'r')
data1=img2_file.readlines()
data2=img3_file.readlines()

no_of_nodes_img1=data1[4]
no_of_nodes_img2=data2[4]
data1=data1[5:5+int(no_of_nodes_img1)]
data2=data2[5:5+int(no_of_nodes_img2)]

array1=[]
array2=[]
def preprocess(string,array):
    string=str(string).split(" ")[:-1]
    array.append([int(string[0]),float(string[1]),float(string[2])])
for i in data1:
    array1.append(preprocess(i,array1))
for i in data2:
    array2.append(preprocess(i,array2))
    
array1=[x for x in array1 if x!=None]
array2=[x for x in array2 if x!=None]

dataframe1=pd.DataFrame(array1)
dataframe2=pd.DataFrame(array2)

dataframe1=dataframe1.apply(np.ceil)
dataframe2=dataframe2.apply(np.ceil)
dataframe1=dataframe1.astype('int')
dataframe2=dataframe2.astype('int')


lk_params = dict(winSize = (15,15), maxLevel = 2, criteria = (cv.TERM_CRITERIA_EPS | cv.TERM_CRITERIA_COUNT, 10, 0.03))

img1=cv2.imread(r".\media\myimage2.jpg")
img2=cv2.imread(r".\media\myimage3.jpg")
img1_gray=cv.cvtColor(img1,cv.COLOR_BGR2GRAY)

points=np.array(dataframe1.iloc[:,1:3],dtype='float32')
points=points[:,np.newaxis,:]
points.shape

mask = np.zeros_like(img1)

img2_gray=cv.cvtColor(img2,cv.COLOR_BGR2GRAY)
img2_gray.shape

next, status, error = cv.calcOpticalFlowPyrLK(img1_gray,img2_gray ,points, None, **lk_params)


good_old=points[status==1]
good_new=next[status==1]

for i, (new, old) in enumerate(zip(good_new, good_old)):
    a, b = new.ravel()
    c, d = old.ravel()

    mask = cv.line(mask, (int(a), int(b)), (int(c),int(d)),(0,0,255), 1)
    #img2 = cv.circle(img2, (int(a),int(b)), 3, (0,255,0), -1)


#output = cv.add(img2, mask)

cv.imshow("sparse optical flow", mask)
cv.waitKey(50000)

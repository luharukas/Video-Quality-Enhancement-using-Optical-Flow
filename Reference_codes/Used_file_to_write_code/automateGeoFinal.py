import cv2
import gmsh
import datetime
from nodeCordinates import getCoordinates


# Read files
node=None
cg="cg.geo"
vid = cv2.VideoCapture(r'TinyVIRAT\TinyVIRAT\videos\train\VIRAT_S_000000\5570.mp4')
if (vid.isOpened()== False): 
  print("Error occured while opening the video")
i=0  
start_time = datetime.datetime.now() 
while(vid.isOpened()):
  f, frame = vid.read()
  if f == True:
    cv2.imwrite("temp.jpg",frame)
    gmsh.initialize()
    gmsh.clear()
    gmsh.merge(cg)
    gmsh.model.geo.synchronize()
    gmsh.model.mesh.generate(2)
    gmsh.model.mesh.setOrder(3)
    node=getCoordinates()
    print(node)
    gmsh.finalize()
    i+=1
  else: 
    break

vid.release()

end_time = datetime.datetime.now()
time_taken = end_time - start_time
print("---] Time taken :=> {}".format(time_taken))
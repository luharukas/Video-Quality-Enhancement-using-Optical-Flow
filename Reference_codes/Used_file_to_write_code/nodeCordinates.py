# import important library and modules
import gmsh
import pandas as pd
from math import floor

# function to get higher order nodes
def getCoordinates():
   
    nodeTags=[]
    coordinates=[]
    b=[]
    t=[]
    entities = gmsh.model.getEntities()
    for e in entities:
        allInfo=gmsh.model.mesh.getNodes(e[0],e[1])
        nodeTags.extend(allInfo[0])
        coordinates.extend(allInfo[1])

    nC=dict()    
    step=0
    for i in range(len(nodeTags)):
      nC[nodeTags[i]]=[coordinates[i+step],coordinates[i+step+1]]
      step+=2
  
    faces=gmsh.model.mesh.get_element_face_nodes(gmsh.model.mesh.getElementTypes(e[0],e[1])[0],3)
    x6s=[]
    x24s=[]
    y6s=[]
    y24s=[]
    for i in range(0,len(faces),10):
      b.extend([faces[i],faces[i+1],faces[i+3],faces[i+4]])
      t.append([faces[i],faces[i+1],faces[i+2],faces[i+3],faces[i+4],faces[i+5],faces[i+6],faces[i+7],faces[i+8],faces[i+9]])
      x6s.append(((nC[faces[i+3]][0]) - (1/3)*(nC[faces[i]][0]-nC[faces[i+1]][0])))
      y6s.append(((nC[faces[i+3]][1]) - (1/3)*(nC[faces[i]][1]-nC[faces[i+1]][1])))
      x24s.append((1/12)*(nC[faces[i]][0]+nC[faces[i+1]][0]+4*nC[faces[i+2]][0]+3*nC[faces[i+3]][0]+3*x6s[-1]))
      y24s.append((1/12)*(nC[faces[i]][1]+nC[faces[i+1]][1]+4*nC[faces[i+2]][1]+3*nC[faces[i+3]][1]+3*y6s[-1]))
  
      nC[faces[i+4]][0]=x6s[-1]
      nC[faces[i+9]][0]=x24s[-1]
      nC[faces[i+4]][1]=y6s[-1]
      nC[faces[i+9]][1]=y24s[-1]
    
    #change this value if the image size changes (it is valid for square shape image n*n )
    n=112

    nodes=[]

    for m in nC.values():
      # function to convert spatial image cordinate to pixel coordinate system
      i=(n-1)-floor(m[1])
      j=floor(m[0])

      #remove duplicates
      if [[i,j]] not in nodes:
        nodes.append([[i,j]]) 
    
    return nodes

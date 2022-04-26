# import important libraries 
import gmsh
import datetime
import numpy as np
import cv2 as cv
from nodeCordinates import getCoordinates


# Main function of this program
if __name__ == "__main__":

    #fixing and configure window size 
    cv.namedWindow("sparse optical flow",cv.WINDOW_NORMAL)
    cv.resizeWindow("sparse optical flow",750,520)
    
    # Parameters for Lucas-Kanade optical flow
    lk_params = dict(winSize = (15,15), maxLevel = 2, criteria = (cv.TERM_CRITERIA_EPS | cv.TERM_CRITERIA_COUNT, 10, 0.03))
    
    # take video input
    video = cv.VideoCapture(r'TinyVIRAT\TinyVIRAT\videos\train\VIRAT_S_000000\5570.mp4')

    #start the timer
    start_time = datetime.datetime.now()

    #if video is not available in the respective directory then it will retirn error
    if (video.isOpened()== False): 
        print("Error occured while opening the video")


    #read the first frame
    ret, first_frame = video.read()

    #convert color image into grayscale image
    prev_gray = cv.cvtColor(first_frame, cv.COLOR_BGR2GRAY)

    #save image as temp.jpg which is used by  
    cv.imwrite("temp.jpg",prev_gray)

    #gmsh initialization
    gmsh.initialize()
    #clear all the previous build parameters
    gmsh.clear()
    #merge the supporting file 
    gmsh.merge("cg.geo")
    gmsh.model.geo.synchronize()
    #mesh generation over 2D plane
    gmsh.model.mesh.generate(2)
    #mesh generation of higher order 3
    gmsh.model.mesh.setOrder(3)

    # get the pixel coordinates number which is trasformed from spatial image coordinate 
    prev=np.array(getCoordinates(),dtype='float32')

    #create a mask whose shape is same as the first_frame of video
    mask = np.zeros_like(first_frame)

    # while video not finish it will run
    while(video.isOpened()):
        # read the frame one by one
        f,frame=video.read()

    
        try:
            #convert the frame into gray scale
            gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)

            # Calculates sparse optical flow by Lucas-Kanade method
            next, status, error = cv.calcOpticalFlowPyrLK(prev_gray, gray, prev, None, **lk_params)
            # Selects good feature points for previous position
            good_old = prev[status == 1]
            # Selects good feature points for next position
            good_new = next[status == 1]

            # Draws the optical flow tracks
            for i, (new, old) in enumerate(zip(good_new, good_old)):

                # Returns a contiguous flattened array as (x, y) coordinates for new point
                a, b = new.ravel()

                # Returns a contiguous flattened array as (x, y) coordinates for old point
                c, d = old.ravel()

                # Draws line between new and old position with green color and 2 thickness
                mask = cv.line(mask, (int(a), int(b)), (int(c),int(d)),(0,0,255), 2)

                # Draws filled circle (thickness of -1) at new position with green color and radius of 3
                frame = cv.circle(frame, (int(a),int(b)), 3, (0,255,0), -1)
    
            # Overlays the optical flow tracks on the original frame
            output = cv.add(frame, mask)

            # Updates previous frame
            prev_gray = gray.copy()

            # Updates previous good feature points
            prev = good_new.reshape(-1, 1, 2)

            # Opens a new window and displays the output frame
            cv.imshow("sparse optical flow", output)

            # Frames are read by intervals of 10 milliseconds and terminates when 'q' is pressed
            if cv.waitKey(10) & 0xFF == ord('q'):
                break
        except:
            break


    # end of timer 
    end_time = datetime.datetime.now()
    #final time
    time_taken = end_time - start_time
    #print the total time taken
    print("---] Time taken :=> {}".format(time_taken))

    # relese video in video frames
    video.release()
    cv.destroyAllWindows()


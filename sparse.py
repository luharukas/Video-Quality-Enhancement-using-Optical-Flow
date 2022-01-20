import cv2 as cv
import numpy as np

# Resizing Window
cv.namedWindow("sparse optical flow",cv.WINDOW_NORMAL)
cv.resizeWindow("sparse optical flow",750,520)

# Parameters for Shi-Tomasi corner detection
feature_params = dict(maxCorners = 300, qualityLevel = 0.2, minDistance = 2, blockSize = 7)

# Parameters for Lucas-Kanade optical flow
lk_params = dict(winSize = (15,15), maxLevel = 2, criteria = (cv.TERM_CRITERIA_EPS | cv.TERM_CRITERIA_COUNT, 10, 0.03))

# Video Capturing Start
cap = cv.VideoCapture(r".\Media\video2.mp4")

# ret = a boolean return value from getting the frame, first_frame = the first frame in the entire video sequence
ret, first_frame = cap.read()


# Converts frame to grayscale because we only need the luminance channel for detecting edges - less computationally expensive
prev_gray = cv.cvtColor(first_frame, cv.COLOR_BGR2GRAY)

# Finds the strongest corners in the first frame by Shi-Tomasi method - we will track the optical flow for these corners
prev = cv.goodFeaturesToTrack(prev_gray, mask = None, **feature_params)

# Creates an image filled with zero intensities with the same dimensions as the frame - for later drawing purposes
mask = np.zeros_like(first_frame)

while(cap.isOpened()):
    # ret = a boolean return value from getting the frame, frame = the current frame being projected in the video
    ret, frame = cap.read()

    # Converts each frame to grayscale - we previously only converted the first frame to grayscale
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


#  frees up resources and closes all windows
cap.release()
cv.destroyAllWindows()
from __future__ import print_function
from scipy import signal
import numpy as np
import sys

# from the original get_path.py
def visit(unvisited, point, buffer):
    x, y = point[0], point[1]
    for r in range(x - buffer, x + buffer + 1):
        for c in range(y - buffer, y + buffer + 1):
            if r >= 0 and r < len(unvisited) and c >= 0 and c < len(unvisited[0]):
                unvisited[r][c] = 0
    return unvisited

def find_next_unvisited(unvisited, start_r):
    for r in range(start_r, len(unvisited)):
        for c in range(len(unvisited[0])):
            if unvisited[r][c] != 0:
                # return (r, c)
                return [r, c]
    return None

# Given image in the form of a boolean 2D array, return an ordered list coordinates to visit and poke
def img_to_path(img, img_buffer=10):
    path = []
    unvisited = np.copy(img)
    start_r = 0

    while True:
        nxt = find_next_unvisited(unvisited, start_r)
        if not nxt:
            break
        unvisited = visit(unvisited, nxt, img_buffer)
        path.append(nxt)
        start_r, _ = nxt

    # TODO: sort by column within each line?
    return path

def print_img(img, path = []):
    original_stdout = sys.stdout
    with open('printed_path.txt', 'w') as f:
        sys.stdout = f

        for r in range(len(img)):
            line = ''
            for c in range(len(img[r])):
                px = img[r][c]
                if (r, c) in path:
                    line += "*"
                elif px == 0:
                    line += " "
                else:
                    line += "-"
            print(line + "\n")

        sys.stdout = original_stdout

# from the original process_img.py
def make_binary(img):
    cp = [[1 for i in range(len(r))] for r in img]
    for r in range(len(img)):
        for c in range(len(img[r])):
            px = img[r][c]
            if sum(px) != 0 and not is_corner_color(px):
                cp[r][c] = 1
            else:
                cp[r][c] = 0
    return cp

def sharpen(img):
    kernel = np.ndarray([[0, -1, 0],
                        [-1, 5, -1],
                        [0, -1, 0]])
    sharp = signal.convolve2d(np.array(img), kernel)
    return sharp

def blur(img):
    kernel = (1/9) * np.ones((3, 3))
    # print("img shape", np.array(img).shape)
    # print("kernel shape:", kernel.shape)
    blur = signal.convolve2d(np.array(img), kernel)
    return blur

def edge_detection(img):
    kernel = np.ndarray([[1, 0, -1],
                        [0, 0, 0],
                        [-1, 0, 1]])
    edge = signal.convolve2d(np.array(img), kernel)
    return edge
    
def crop_corners(img):
    corners = []
    rows, cols = len(img), len(img[0])
    for r in range(rows):
        for c in range(cols):
            px = img[r][c]
            if is_corner_color(px):
                corners.append([r, c])
    corners = np.array(corners)
    if len(corners) != 2:
        # top_left_blob = corners[corners[:, 1] < rows / 2]
        # top_left_blob = top_left_blob[top_left_blob[:, 0] < cols / 2]
        # bottom_right_blob = corners[corners[:, 1] > rows / 2]
        # bottom_right_blob = bottom_right_blob[bottom_right_blob[:, 0] > cols / 2]
        # corners = [top_left_blob[0], bottom_right_blob[-1]]
        # corners = [top_left_blob.mean(axis=0).astype('int'),
        #             bottom_right_blob.mean(axis=0).astype('int')]
        corners = [corners[0], corners[-1]]
    top_left, bottom_right = corners[0], corners[1]
    img = np.array(img)
    print("CORNERS ARE HERE: ", corners)
    return img[top_left[0]:bottom_right[0], top_left[1]:bottom_right[1]]

def is_corner_color(px):
    return is_red(px)

def is_red(px):
    return px[2] > px[1] and px[2] > px[0] and px[2] > 30

def is_blue(px):
    return px[0] > px[1] and px[0] > px[2] and px[0] > 30

def process(img, img_buffer=10):
    # img = blur(img)
    img = crop_corners(img)
    print('line 120 process_img.py not happening')
    # import pdb;pdb.set_trace()
    bin_img = make_binary(img)
    if len(bin_img) < 1 or len(bin_img[0]) < 1:
        import pdb;pdb.set_trace()
    return bin_img, img_to_path(bin_img, img_buffer)

# testing
if __name__ == '__main__':
    sample_img = [
                  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
                  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
                  [[255, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [255, 255, 255], [255, 255, 255], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [0, 0, 0], [0, 0, 0], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [0, 0, 0], [0, 0, 0], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [0, 0, 0], [0, 0, 0], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [0, 0, 0], [0, 0, 0], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [255, 255, 255], [255, 255, 255], [255, 255, 255], [255, 255, 255], [0, 0, 0]],
                  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [255, 0, 0]],
                  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
                  [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
                ]
    print("shape before cropping:", np.array(sample_img).shape)
    cropped = crop_corners(sample_img)

    print("shape after cropping:", np.array(cropped).shape)
    bin_img = make_binary(cropped)
    print_img(bin_img)
    print("shape after making binary:", np.array(bin_img).shape)
    path = img_to_path(bin_img, 0)
    print_img(bin_img, path)

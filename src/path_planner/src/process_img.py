from __future__ import print_function
from scipy import signal
import numpy as np

# from the original get_path.py
def visit(unvisited, point, buffer):
    x, y = point
    for r in range(x - buffer, x + buffer + 1):
        for c in range(y - buffer, y + buffer + 1):
            if r >= 0 and r < len(unvisited) and c >= 0 and c < len(unvisited[0]):
                unvisited[r][c] = 0
    return unvisited

def find_next_unvisited(unvisited, start_r):
    for r in range(start_r, len(unvisited)):
        for c in range(len(unvisited[0])):
            if unvisited[r][c] != 0:
                return (r, c)
    return None

# Given image in the form of a boolean 2D array, return an ordered list coordinates to visit and poke
def img_to_path(img, img_buffer = 10):
    path = []
    unvisited = img
    start_r = 0

    while True:
        nxt = find_next_unvisited(unvisited, start_r)
        if not nxt:
            break
        unvisited = visit(unvisited, nxt, img_buffer)
        path.append(nxt)
        start_r, _ = nxt
    return path

def print_img(img, path = []):
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

# from the original process_img.py
def make_binary(img):
    cp = [[1 for i in range(len(r))] for r in img]
    for r in range(len(img)):
        for c in range(len(img[r])):
            px = img[r][c]
            if sum(px) != 0 and not is_red(px):
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
    for r in range(len(img)):
        for c in range(len(img[r])):
            px = img[r][c]
            if is_red(px):
                corners.append([r, c])
    if len(corners) != 2:
        corners = [corners[0], corners[-1]]
    top_left, bottom_right = corners[0], corners[1]
    img = np.array(img)
    print(corners)
    return img[top_left[0]:bottom_right[0], top_left[1]:bottom_right[1]]

def is_red(px):
    if px[2] > px[1] and px[2] > px[0]:
        return True
    return False

def process(img, img_buffer = 10):
    # img = blur(img)
    img = crop_corners(img)
    bin_img = make_binary(img)
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

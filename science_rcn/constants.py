MAIN_PATH = "/Users/qliu/Documents/science_rcn"

import os
import matplotlib.pyplot as plt

def save_plot(full_path, image_2D):
    if not os.path.exists(full_path):
        fig, ax = plt.subplots()
        plt.imshow(image_2D)
        plt.colorbar()
        plt.savefig(full_path, bbox_inches='tight')
        plt.close(fig)


# coding: utf-8

# In[1]:


import numpy as np
from PIL import Image

try:
    import argparse
except:
    print('\nPlease install argparse, using `pip install argparse` or `conda install -c anaconda argparse`\n')


parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('dir', help = '''diretorio onde estão as imagens, formato:
                                                 \n1. Apenas nome do arquivo (deverá estar no diretório de trabalho)
                                                 \n2. Arquivo com caminho completo''')
args = parser.parse_args()

# In[2]:


with open(str(args.dir)+'files.txt') as files:
    lines = files.readlines()


# In[3]:


files = []
labels = []

for line in range(len(lines)):
    files.append(lines[line].split()[0])
    labels.append(lines[line].split()[1])


# In[4]:


data_dict = {'image': [], 'label': []}

for i in range(len(files)):
    img = Image.open(str(args.dir)+files[i])
    img_array = np.array(img, dtype = 'int')
#     img_array = img_array.reshape((1, img_array.shape[0] * img_array.shape[1]))
    img_array = img_array.reshape(1,-1)
    data_dict['image'].append(img_array)
    data_dict['label'].append(int(labels[i]))


# In[5]:


biggest_image = []
for i in range(len(data_dict['image'])):
    biggest_image.append(len(data_dict['image'][i][0]))


# In[8]:


max_biggest_image = max(biggest_image)

with open(str(args.dir)+'saida.csv', 'w') as f:
    f.write('label')
    f.write(',')
    for pixel_title in range(max_biggest_image):
        f.write('pixel_'+str(pixel_title))
        f.write(',')
    for line in range(len(data_dict['label'])):
        f.write(str(data_dict['label'][line]))
        f.write(',')
        for pixel in range(len(data_dict['image'][line][0])):
            f.write(str(data_dict['image'][line][0][pixel]))
            f.write(',')
        for more_pixels in range(max_biggest_image - len(data_dict['image'][line][0])):
            f.write(str(0))
            f.write(',')
        f.write('\n')
    f.close()
print('Done!')

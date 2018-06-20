
# coding: utf-8

# In[1]:


try:
    import argparse
except:
    print('\nPlease install argparse, using `pip install argparse` or `conda install -c anaconda argparse`\n')
    
try:
    import pandas as pd
except:
    print('\nPlease install pandas, using `pip install pandas` or `conda install -c anaconda pandas`\n')


# In[2]:


parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('first_input_csv', help = '''arquivo input, formato nome_do_input.csv, como especificá-lo:
                                                 \n1. Apenas nome do arquivo (deverá estar no diretório de trabalho)
                                                 \n2. Arquivo com caminho completo''')
parser.add_argument('second_input_csv', help = '''arquivo output, formato nome_do_output.csv, como especificá-lo:
                                                  \n1. Apenas nome do arquivo (será salvo no diretório de trabalho)
                                                  \n2. Arquivo com caminho completo''')
parser.add_argument('output_csv', help = '''arquivo output, formato nome_do_output.csv, como especificá-lo:
                                            \n1. Apenas nome do arquivo (será salvo no diretório de trabalho)
                                            \n2. Arquivo com caminho completo''')
args = parser.parse_args()


# In[3]:


files = [str(args.first_input_csv), str(args.second_input_csv)]
wines = pd.DataFrame()

try:
    for file in files:
        tmp = pd.read_csv(file, sep = ';')
        tmp['wine_type'] = file[:-4]
        wines = pd.concat((wines, tmp))
except:
    print('\nPlease provide the input file extensions as filename.csv\n')

try:
    wines.to_csv(args.output_csv, index = False)
except:
    print('\nPlease provide the output file extension as filename.csv\n')

print('''
rótulo: valor médio da qualidade

{}: {}
{}: {}
ambas: {}
'''.format(files[0][:-4],
           round(wines[wines['wine_type'] == files[0][:-4]]['quality'].mean(), 2),
           files[1][:-4],
           round(wines[wines['wine_type'] == files[1][:-4]]['quality'].mean(), 2),
           round(wines['quality'].mean(), 2))
     )


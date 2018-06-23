
# coding: utf-8

# In[1]:


import sys
print(sys.version)
print('')

import time
import itertools
from multiprocessing import Process, cpu_count, current_process, Pipe

PROCS = cpu_count()
print('Number of cores: {}\n'.format(PROCS))

def pi(start, end, step, conn):
    print('Start: {}'.format(start))
    print('End: {}'.format(end))
    sum = 0.0
    for i in range(start, end):
        x = (i + 0.5) * step
        sum = sum + 4.0 / (1.0 + x * x)
    conn.send(sum)
    conn.close()    
    
if __name__ == '__main__':    
    num_steps = 100000
    sum = 0.0
    step = 1.0/num_steps
    proc_size = num_steps/PROCS
    
    
    pi_resultado = []
    tic = time.time()
    workers = []
    for i in range(PROCS):
        a, b = Pipe()
        worker = Process(target = pi, args = (i * proc_size, int((i + 1) * proc_size - 1), step, b))
        workers.append(worker)
        workers[i].start()
        pi_resultado.append(a.recv()/num_steps)
        workers[i].join
    
    toc = time.time()
    
    pi_total = 0.0
    for i in range(len(pi_resultado)):
        pi_total = pi_total + pi_resultado[i]
    
    print('')
    print('It took: {} seconds!'.format(round(toc - tic, 8)))
    print('Pi: {}'.format(pi_total))


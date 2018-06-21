
# coding: utf-8

# In[1]:


import sys
print(sys.version)
print('')

import time
import itertools
from multiprocessing import Process, cpu_count, current_process, Queue

PROCS = cpu_count()
RESULT = Queue()

def pi(start, end, step, result):
    print('Start: {}'.format(start))
    print('End: {}'.format(end))
    sum = 0.0
    for i in range(start, end):
        x = (i + 0.5) * step
        sum = sum + 4.0 / (1.0 + x * x)
    result.put(sum/num_steps)
    
if __name__ == '__main__':    
    num_steps = 1000000
    sum = 0.0
    step = 1.0/num_steps
    proc_size = num_steps/PROCS
    
    tic = time.time()
    workers = []
    for i in range(PROCS):
        worker = Process(target = pi, args = (i * proc_size, int((i + 1) * proc_size - 1), step, RESULT))
        workers.append(worker)
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    toc = time.time()
    
    pi = 0.0
    for i in range(PROCS):
        pi = pi + RESULT.get(i)
    
    print('')
    print('It took: {} seconds!'.format(round(toc - tic, 8)))
    print('Pi: {}'.format(pi))



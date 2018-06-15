
# coding: utf-8

# In[87]:


import sys
print(sys.version)
print('')

import time
from multiprocessing import Process, Manager, cpu_count

procs = cpu_count()

def pi(start, end, step, procnum, return_dict):
    print('Process number: {}'.format(procnum))
    print('Start: {}'.format(start))
    print('End: {}'.format(end))
    sum = 0.0
    for i in range(start, end):
        x = (i + 0.5) * step
        sum = sum + 4.0 / (1.0 + x * x)
    return_dict[procnum] = sum / num_steps
    
if __name__ == '__main__':
    
    manager = Manager()
    return_dict = manager.dict()
    
    num_steps = 10000000
    sums = 0.0
    step = 1.0/num_steps
    proc_size = num_steps/procs
    
    tic = time.time()
    workers = []
    for i in range(procs):
        worker = Process(target = pi, args = (i * proc_size, int((i + 1) * proc_size - 1), step, i, return_dict, ))
        workers.append(worker)
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    toc = time.time()
    
    print('')
    print('It took: {} seconds!'.format(round(toc - tic, 8)))
    print('Pi: {}'.format(sum(return_dict.values())))


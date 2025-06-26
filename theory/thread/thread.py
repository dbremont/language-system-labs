import threading
import time

def worker(n):
    print(f"Thread {n} starting")
    time.sleep(2)
    print(f"Thread {n} done")

threads = []
for i in range(5):
    t = threading.Thread(target=worker, args=(i,))
    t.start()
    threads.append(t)

for t in threads:
    t.join()

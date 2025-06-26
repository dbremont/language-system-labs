from concurrent.futures import ThreadPoolExecutor

def compute():
    return 42

with ThreadPoolExecutor() as executor:
    future = executor.submit(compute)
    result = future.result()  # blocks until done
    print(result)  # prints 42
import dis

def gen():
    yield 1
    yield 2

dis.dis(gen)
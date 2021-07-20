
def decorator(func):
    def decoratied():
        print('함수 시작')
        func()
        print('함수 끝')
    return decoratied

@decorator
def hello_world():
    print('Hello World!')

hello_world()

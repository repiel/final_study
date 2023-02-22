def solution(my_string, n):
    a=[]
    for i in my_string:
        a.append(i * n)
    return ''.join(a)
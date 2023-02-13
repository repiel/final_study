def solution(a, b):
    l = [i * j for i, j in zip(a, b)]
    return sum(l)
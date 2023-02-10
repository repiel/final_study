def solution(num):
    answer=0
    while num >= 2:
        if num % 2 == 0:
            answer = answer + 1
            num //= 2
        else :
            answer = answer + 1
            num = num * 3 + 1
        if (answer == 500) & (num != 1):
            return -1
    return answer
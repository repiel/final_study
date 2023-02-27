def solution(money):
    if 0 < money <= 1000000:
        return [money//5500,money%5500]

def solution(price, money, count):
    an = price
    for i in range(2, count+1):
         an += (i * price)
    return an-money if an-money >= 0 else 0
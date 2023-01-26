# 정수를 입력받아 각 자리수의 합을 계산하여 출력하는 프로그램을 구현하시오
# 132 => 1 + 3 + 2 = 6 or 4289 = 4 + 2 + 8 + 9 = 23
# 나누기 연산자를 이용하지 말고 list를 이용하여 구현할 것
# a = int(input('정수:'))
# string = a
# b = a.findall('b',string)
# print(a)

def sumOfDigit(num):
    tot = 0
    for i in list(str(num)):
        tot += int(i)

        return tot


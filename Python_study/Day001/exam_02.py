# 정수를 입력받아 합을 계산하는 프로그램을 구현하시오.
# 단, 입력받은 수가 음수이면 입력을 종료하고 합을 출력하도록 구현할 것.

tot = 0

while True:
    a= int(input('숫자 1 :'))
    b = int(input('숫자 2 :'))
    tot = a + b
    if a < 0:
        break
    elif b < 0:
        break
    else: print(a+b)

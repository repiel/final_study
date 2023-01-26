# 진법변환 하는 프로그램을 구현하시오.
# 변환할 십진수와 변환한 진법을 입력받아 처리하는 프로그램을 구현하시오
# 예시 13, 2 => 1101

num = int(input('숫자: '))
bin = int(input('변환할 진수: '))
result = []

while True:
    num, nmg = divmod(num, bin)
    result.insert(0, nmg)
    if num == 0:
        break
print(result)
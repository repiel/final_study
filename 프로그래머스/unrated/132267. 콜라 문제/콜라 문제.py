def solution(a, b, n):
    answer = 0
    while n >= a:
        answer += (n // a) * b
        n = (n // a) * b + (n % a)
        # n에 넣어 내가 받는 콜라의 수 재설정
    return answer
    
# 20/2=10
# 10/2=5
# 5/2=2.5
# 3/2=1.5
# 2/2=0
# 10+5+4=19

def solution(x):
    answer = True
    if x >= 1 and x <= 10000:
        p = 0
        for i in range(len(str(x))):
            p += int(str(x)[i])
        if x % p != 0:
            answer = False
        return answer
            
#         a=(x%((x//10)+(x%10)))
#         print(a)
        
#         if x %((x//10)+(x%10))==0:
#             return True
#         else:
#             return False
#         if a % 2 == 0:
#             return True
#         else:
#             return False
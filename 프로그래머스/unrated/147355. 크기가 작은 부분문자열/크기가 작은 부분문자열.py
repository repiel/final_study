def solution(t, p):
    answer = 0
    for i in range(0, len(t) - len(p) + 1):
        # t를 알맞게 잘라내기
        st = str(t[i:i+len(p)])
        if int(st) <= int(p):
            answer += 1
    return answer
        
    
#     result = [t[i:i+len(p)] for i in range(0, len(t), 1)]
    
#     for j in result:
#         if int(j) >= int(p):
#             answer += 1
#     return answer

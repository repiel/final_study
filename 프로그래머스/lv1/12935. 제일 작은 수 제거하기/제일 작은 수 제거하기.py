def solution(arr):
    answer=[]
    mini= arr[0]
    if len(arr) == 1:
        answer.append(-1)
    else:
        for i in arr:
            if mini >i:
                mini = i
        for a in arr:
            if a > mini:
                answer.append(a)
    return answer

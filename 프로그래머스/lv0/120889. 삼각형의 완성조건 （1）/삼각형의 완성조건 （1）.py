def solution(sides):
    answer = []
    for i in sides:
        answer.append(i)
    if sum(answer) - max(answer) > max(answer):
        return 1
    else:
        return 2

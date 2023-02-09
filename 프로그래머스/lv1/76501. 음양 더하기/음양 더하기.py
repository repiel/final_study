def solution(absolutes, signs):
    result = []
    for a, s in zip(absolutes, signs):
        if s == False:
            result.append(-a)
        else:
            result.append(a)
    return sum(result)
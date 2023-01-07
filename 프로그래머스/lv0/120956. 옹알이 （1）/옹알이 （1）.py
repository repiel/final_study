def solution(babbling):
    answer = 0
    for i in babbling:
        for a in ['aya', 'ye', 'woo', 'ma']:
            if a * 2 not in i:
                i = i.replace(a, ' ')
        if len(i.strip()) == 0:
            answer += 1
    return answer
        
       
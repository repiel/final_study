def solution(number):
    answer = 0
    samchong = 0
    for i in range(len(number)):
        num = number.copy()
        n1 = num.pop(i)
        for j in range(len(num)):
            num_2 = num.copy()
            n2 = num_2.pop(j)
            for k in range(len(num_2)):
                num_3 = num_2.copy()
                n3 = num_3.pop(k)
                check = n1 + n2 + n3
                if check == 0:
                    samchong += 1
    answer = samchong//6
    return answer
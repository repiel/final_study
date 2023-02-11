def solution(arr):
    ans= [-1]
    for i in range(len(arr)):
        if ans[-1] != arr[i]:
            ans.append(arr[i])
    ans.pop(0)
    return ans
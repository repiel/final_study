# 주어진 단어가 회문(앞 뒤가 똑같은 것. 토마토 등)인지 판단하는 프로그램 구현.
# anna, level
# 회문을 판단하는 로직은 함수를 이용하여 구현할 것.

rotate('anna') #True
rotate('banana') #False
rotate('level') #True
rotate('KkAKk') #True

def rotate(data):
    data = data.lower() # 글자를 모두 소문자로 변환하기
    data = data.replace(' ', '') # 글자 사이에 공백이 있다면 공백을 처리
    return data[:] == data[::-1]

print(rotate('anna')) #True
print(rotate('banana')) #False
print(rotate('level')) #True
print(rotate('KkAKk')) #True


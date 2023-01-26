# # 공의 높이를 계산하는 프로그램을 구현하시오
# 100cm  높이에서 공을 떨어뜨리는데 이 공은 땅에 닿을 때마다 원래 높이의 3/5만큼 튀어
# 오른다. 공이 10번 튀는 동안 그때마다 공의 높이를 계산하여 출력하는 프로그램을 구현하시오.

height = 100
bounce = 3/5

i = 1

while i <= 10:
    height = height * bounce
    print(i,round(height, 2))
    i += 1


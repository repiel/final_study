
# 커피 자동 판매기 프로그램을 구현하시오.
# 커피 판매기에는 커피종류별 재료가 아래와 같이 셋팅되어있다.
# 커피 3, 물 3, 설탕 3, 프림 3, 컵 3
# 블랙커피 = 커피1 + 물1 + 컵1
# 설탕커피 = 커피1 + 물1 + 설탕1 + 컵1
# 프림커피 = 커피1 + 물1 + 프림1 + 컵1
# 밀크커피 = 커피1 + 물1 + 설탕1 + 프림1 + 컵1
# 만약 재료가 소진되면 해당 커피의 제조가 불가하여 판매가 불가능하다.
# 각 재료의 보충시 모든 재료가 3으로 셋팅되거나, 필요한 재료만 3으로 셋팅할 수 있다.
# 각 재료의 최대 셋팅 개수는 3이다.
# 커피가격은 블랙커피(1000), 설탕커피(1000), 프림커피(1500), 밀크커피(2000)

class Coffee:

    def __init__(self, black, suger, prim, milk):
        self.name = name
        self.pay = pay

    def getName(self):
        return self.name

    def setName(self, name):
        self.name = name

    def getPay(self):
        return self.pay

    def setPay(self, pay):
        self.pay = pay

    def disp(self):
        return "{0} : {1}".format(self.getName(), self.getPay())
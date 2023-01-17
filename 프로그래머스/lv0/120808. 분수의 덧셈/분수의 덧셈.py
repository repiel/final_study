
import fractions
def solution(denom1, num1, denom2, num2):
    answer = []
    nd = 0
    n = fractions.Fraction(denom1, num1) 
    d = fractions.Fraction(denom2, num2)
    nd = n + d
    answer.append(nd.numerator)
    answer.append(nd.denominator)
    return answer
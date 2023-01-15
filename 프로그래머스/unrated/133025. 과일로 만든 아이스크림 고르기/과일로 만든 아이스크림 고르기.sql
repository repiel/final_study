-- 코드를 입력하세요
select fir.flavor
from first_half as fir
join icecream_info as info
on fir.flavor = info.flavor
where total_order > 3000 and ingredient_type = "fruit_based"
order by total_order desc


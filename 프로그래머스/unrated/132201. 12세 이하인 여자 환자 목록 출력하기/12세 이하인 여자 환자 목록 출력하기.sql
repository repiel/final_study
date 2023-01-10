-- 코드를 입력하세요
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO,'NONE') as TLNO
From PATIENT
Where GEND_cd = 'W' and age <= 12
order by AGE DESC, PT_NAME ASC;
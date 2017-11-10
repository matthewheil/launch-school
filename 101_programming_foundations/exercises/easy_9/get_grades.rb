def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3) / 3
  case
  when avg >= 90 then 'A'
  when avg >= 80 then 'B'
  when avg >= 70 then 'C'
  when avg >= 60 then 'D'
  else 'F'
  end
end  

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

def staggered_case(string)
  count = 0
  chars = string.chars
  loop do
    case count.even?
    when true then chars[count].upcase! if chars[count] =~ /[a-z]/i
    when false then chars[count].downcase! if chars[count] =~ /[a-z]/i
    end
    break if count >= chars.size
    count += 1
  end
  chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

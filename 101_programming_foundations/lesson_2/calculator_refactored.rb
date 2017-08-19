def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number != 0
end

def operator_to_message(operator)
  case operator
  when 'a' then 'Adding'
  when 's' then 'Subtracting'
  when 'm' then 'Multiplying'
  when 'd' then 'Dividing'
  end
end

prompt('Welcome to calculator. Enter your name:')
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('Please enter a valid name.')
  else
    break
  end
end

prompt("Hello #{name}!")

loop do
  num1 = 0
  num2 = 0

  loop do
    prompt("Please enter a number other than 0.")
    num1 = Kernel.gets().chomp().to_i()
    if valid_number?(num1)
      break
    else
      prompt('You did not enter a valid number.')
    end
  end

  loop do
    prompt("Please enter another number other than 0.")
    num2 = Kernel.gets().chomp().to_i()
    if valid_number?(num2)
      break
    else
      prompt('You did not enter a valid number.')
    end
  end

  operator_prompt = <<-MSG
    What type of operation would you like to perform?
    a) add
    s) subtract
    m) multiply
    d) divide
  MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(a s m d).include?(operator)
      break
    else
      prompt('Please enter a valid operation: a, s, m, d')
    end
  end

  prompt("#{operator_to_message(operator)} the two numbers...")

  result =  case operator
            when 'a' then num1 + num2
            when 's' then num1 - num2
            when 'm' then num1 * num2
            when 'd' then num1.to_f / num2.to_f
            end

  prompt("The result is #{result}")

  prompt('Would you like to do another calculation? (Y to go again)')
  answer = Kernel.gets().chomp().downcase()
  break unless answer == 'y'
end

prompt("Thank you for using the calculator #{name}!")

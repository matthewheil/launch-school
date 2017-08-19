require 'yaml'
MESSAGES = YAML.load_file(File.join(__dir__, 'calc_messages.yml'))

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  if num.empty?
  else
    num.to_i.to_s == num
  end
end

def float?(num)
  if num.empty?
  else
    num.to_f.to_s == num
  end
end

def number?(num)
  float?(num) || integer?(num)
end

# return two numbers from user input
def user_num
  loop do
    prompt(MESSAGES['number_request'])
    num1 = Kernel.gets().chomp()
    num2 = Kernel.gets().chomp()
    if number?(num1) && number?(num2)
      return num1, num2
    else
      prompt(MESSAGES['invalid_numbers'])
    end
  end
end

def convert(num)
  if float?(num)
    num.to_f
  else
    num.to_i
  end
end

def operator_to_message(operator)
  case operator
  when 'a' then 'Adding'
  when 's' then 'Subtracting'
  when 'm' then 'Multiplying'
  when 'd' then 'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt(MESSAGES['greet_name'] + "#{name}!")

loop do
  num1, num2 = user_num
  num1 = convert(num1)
  num2 = convert(num2)

  operator_prompt = <<-MSG
    What type of operation would you like to perform?
    a) add
    s) subtract
    m) multiply
    d) divide
  MSG

  divided_by_zero = <<-MSG
    You cannot divide something by 0.
    Please enter a different operation.
    MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(a s m d).include?(operator)
      if operator == 'd' && num2 == 0
        prompt(divided_by_zero)
      else
        break
      end
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  prompt(operator_to_message(operator).to_s + MESSAGES['perform_operation'])

  result =  case operator
            when 'a' then num1 + num2
            when 's' then num1 - num2
            when 'm' then num1 * num2
            when 'd' then num1.to_f / num2.to_f
            end

  prompt(MESSAGES['result'] + result.to_s)

  prompt(MESSAGES['another?'])
  answer = Kernel.gets().chomp().downcase()
  break unless answer == 'y'
end

prompt(MESSAGES['thanks'] + name.to_s + "!")

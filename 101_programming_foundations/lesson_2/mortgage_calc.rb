require 'yaml'
MESSAGES = YAML.load_file(File.join(__dir__, 'mort_calc_messages.yml'))

def prompt(message)
  puts "=> " + message.to_s
end

def valid_input?(num)
  /^\d*.?\d{2}$/.match(num) && num.to_i > 0
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

prompt(MESSAGES['welcome'])
name = gets.chomp

loop do
  loan_amount = 0

  loop do
    prompt(MESSAGES['enter_loan'])
    loan_amount = gets.chomp
    if valid_input?(loan_amount)
      loan_amount = if integer?(loan_amount)
                      loan_amount.to_i
                    else
                      loan_amount.to_f
                    end
      break
    else
      prompt(MESSAGES['valid_loan'])
    end
  end

  apr = 0

  loop do
    prompt(MESSAGES['enter_apr'])
    apr = gets.chomp
    if valid_input?(apr)
      apr = apr.to_f
      break
    else
      prompt(MESSAGES['valid_apr'])
    end
  end

  loan_years = 0

  loop do
    prompt(MESSAGES['enter_years'])
    loan_years = gets.chomp
    if integer?(loan_years) && loan_years.to_i > 0
      loan_years = loan_years.to_i
      break
    else
      prompt(MESSAGES['valid_years'])
    end
  end

  monthly_int_rate = apr / 12
  loan_months = loan_years * 12
  monthly_payment = loan_amount * (monthly_int_rate /
                    (1 - (1 + monthly_int_rate)**-loan_months))

  prompt(MESSAGES['monthly_payment'] + monthly_payment.round(2).to_s)

  prompt(MESSAGES['another?'])
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

prompt(MESSAGES['thanks'] + "#{name}!")

def PUSH(register, stack)
  stack << register
end

def ADD(register, stack)
  register += stack.pop
end

def SUB(register, stack)
  register -= stack.pop
end

def MULT(register, stack)
  register *= stack.pop
end

def DIV(register, stack)
  register /= stack.pop
end

def MOD(register, stack)
  register %= stack.pop
end

def POP(register, stack)
  register = stack.pop
end

def PRINT(register)
  puts "#{register}"
end

def minilang(commands)
  register = 0
  stack = []
  commands.split.each do |command|
    begin
      case command
      when 'PUSH' then PUSH(register, stack)
      when 'ADD' then register = ADD(register, stack)
      when 'SUB' then register = SUB(register, stack)
      when 'MULT' then register = MULT(register, stack)
      when 'DIV' then register = DIV(register, stack)
      when 'MOD' then register = MOD(register, stack)
      when 'POP' then register = POP(register, stack)
      when 'PRINT' then PRINT(register)
      else 
        raise StandardError, "Invalid Command" unless /^-?\d+$/.match(command)
        register = command.to_i
      end
    rescue TypeError
      puts "Empty Stack"
      break
    rescue StandardError => e
      puts e.message
      break
    end
  end
  unless commands.split.include?('PRINT')
    puts "(nothing printed; no PRINT commands)"
  end
end

p minilang('PRINT')
# 0

p minilang('5 PUSH 3 MULT PRINT')
# 15

p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

p minilang('5 PUSH POP PRINT')
# 5

p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

p minilang('-3 PUSH 5 SUB PRINT')
# 8

p minilang('6 PUSH')
# (nothing printed; no PRINT commands)

p minilang('4 PUSH PUSH 7 MOD LILU MULTI PASS PRINT ')
# invalid command

p minilang('7 MOD MULT PRINT ')
# empty stack

p minilang('PUSH PUSH 7 MOD MULT PRINT ')
# div by 0
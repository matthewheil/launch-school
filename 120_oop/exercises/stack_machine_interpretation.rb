class InvalidCommandError < StandardError; end
class EmptyStackError < TypeError; end

class Stack
  attr_accessor :values

  def initialize
    @values = []
  end
end

class Register
  attr_accessor :value

  def initialize
    @value = 0
  end

  def to_s
    @value.to_s
  end
end

class Minilang
  def initialize(commands)
    @register = Register.new
    @stack = Stack.new
    @commands = commands
  end

  def push
    @stack.values << @register.value
  end

  def add
    @register.value += @stack.values.pop
  end

  def sub
    @register.value -= @stack.values.pop
  end

  def mult
    @register.value *= @stack.values.pop
  end

  def div
    @register.value /= @stack.values.pop
  end

  def mod
    @register.value %= @stack.values.pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.values.empty?
    @register.value = @stack.values.pop
  end

  def print
    puts @register
  end

  def eval
    @commands.split.each do |command|
      begin
        case command
        when 'PUSH' then push
        when 'ADD' then add
        when 'SUB' then sub
        when 'MULT' then mult
        when 'DIV' then div
        when 'MOD' then mod
        when 'POP' then pop
        when 'PRINT' then print
        else
          raise InvalidCommandError, "Invalid command: #{command}" unless /^-?\d+$/.match(command)
          @register.value = command.to_i
        end

      rescue StandardError => exception
        puts exception.message
        break
      end
    end

    unless @commands.split.include?('PRINT')
      puts "(nothing printed; no PRINT commands)"
    end
  end
end

Minilang.new('PRINT').eval
Minilang.new('5 PUSH 3 MULT PRINT').eval
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
Minilang.new('5 PUSH POP POP PRINT').eval
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
Minilang.new('-3 PUSH 5 SUB PRINT').eval
Minilang.new('6 PUSH').eval

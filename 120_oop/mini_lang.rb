class MiniLangError < RuntimeError; end
class InvalidCommand < MiniLangError; end
class EmptyStack < MiniLangError; end

class Minilang
  VALID_COMMANDS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT]

  def initialize(program)
    @commands = program.split
    @register = 0
    @stack = Array.new
  end

  def eval
    commands.each do |command|
      eval_command(command)
    end
  rescue MiniLangError => error
    puts error.message
  end

  private

  attr_reader :commands
  attr_accessor :stack, :register

  def eval_command(command)
    if VALID_COMMANDS.include?(command)
      send(command.downcase)
    elsif command.to_i != 0 # passing 0 will raise invalid command. Change to regex to fix.
      self.register = command.to_i
    else
      raise InvalidCommand, "Invalid Command: #{command}."
    end
  end

  def print
    puts register
  end

  def pop
    raise EmptyStack, "The stack is empty!" if stack.empty?
    stack.pop
  end

  def push
    stack.push(register)
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

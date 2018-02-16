class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def switch_state
    switch
  end

  private
  
  attr_accessor :switch

  def initialize
    @switch = :off
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

four_wheeler = Machine.new
puts four_wheeler.switch_state # off
four_wheeler.start
puts four_wheeler.switch_state # on
four_wheeler.stop
puts four_wheeler.switch_state # off
puts four_wheeler.switch # private method error

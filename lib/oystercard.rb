class Oystercard 

  MAX_CAPACITY = 90

  attr_accessor :balance 
  attr_accessor :capacity

  def initialize 
    @balance = 0
    @capacity = MAX_CAPACITY
  end 

  def top_up(money)
  fail "The maximum limit is £90" if @balance > MAX_CAPACITY
    @balance += money

  end 
  
  
end  


#fail if ... 
#constant = maximum balance 

class Oystercard 

  MAX_CAPACITY = 90
  MINIMUM_CAPACITY = 0

  attr_reader :balance 
  

  def initialize 
    @balance = 0
  end 

  def top_up(money)
  fail "Maximum balance of #{MAX_CAPACITY} exceeded" if money + balance > MAX_CAPACITY
    @balance += money
  end 

  def deduct(money)
    @balance -= money
  end 
  
  
end  


#fail if ... 
#constant = maximum balance 

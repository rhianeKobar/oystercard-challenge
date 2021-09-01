class Oystercard 

  MAX_CAPACITY = 90
  MIN_CAPACITY = 0

  attr_reader :balance 

  def initialize 
    @balance = 0
  end 

  def top_up(money)
    fail "Maximum balance of #{MAX_CAPACITY} exceeded" if balance + money > MAX_CAPACITY
    @balance += money
  end 

  def deduct(money)
    fail "Minimum balance of #{MIN_CAPACITY} exceeded" if balance - money < MIN_CAPACITY
    @balance -= money
  end 

  def journey?
    false
  end 

  def touch_in 
  end 

  
end  


#fail if ... 
#constant = maximum balance 

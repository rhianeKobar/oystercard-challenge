class Oystercard 

  MAX_CAPACITY = 90
  MIN_CAPACITY = 0

  attr_reader :balance 
  attr_accessor :in_use
  
 

  def initialize 
    @balance = 0
    @in_use = false
  end 

  def top_up(money)
    fail "Maximum balance of #{MAX_CAPACITY} exceeded" if balance + money > MAX_CAPACITY
    @balance += money
  end 

  def deduct(money)
    fail "Minimum balance of #{MIN_CAPACITY} exceeded" if balance - money < MIN_CAPACITY
    @balance -= money
  end 

  def in_journey?
    if @in_use == false 
      return false 
    else 
      return true 
    end 
  end 

  def touch_in 
    @in_use = true
  end 

  def touch_out
    @in_use = false
  end 

  
end  


#fail if ... 
#constant = maximum balance 

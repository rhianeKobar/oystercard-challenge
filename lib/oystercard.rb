class Oystercard 

  attr_reader :balance 

  def initialize 
    @balance = 0
  end 

  def top_up(money)
  fail "The maximum limit is £90" if #...
    @balance += money

  end 
  
  
end  


#fail if ... 
#constant = maximum balance 

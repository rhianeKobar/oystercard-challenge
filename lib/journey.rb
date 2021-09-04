class Journey

	MAX_CAPACITY = 90
  MIN_FARE = 1

  attr_reader :balance 
  attr_accessor :in_use
  attr_reader :entry_station
	attr_reader :exit_station
	attr_reader :journeys

  def initialize 
    @balance = 0
		@journeys = {}
  end 
	
	def deduct(money)
    @balance -= money
  end 

  def in_journey?
    if @entry_station 
      return true
    else 
      return false 
    end 
  end 

  def touch_in(station) 
    fail "balance is below #{MIN_FARE}" if @balance < MIN_FARE
		@entry_station = station
		@journeys.store(:entry, @entry_station)
  end 

  def touch_out(station)
		deduct(MIN_FARE)
		@entry_station = nil
		@exit_station = station
		@journeys.store(:exit, @exit_station)
  end 

  private :deduct

end
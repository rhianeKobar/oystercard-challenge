require './lib/oystercard.rb'

describe Oystercard do 
  
	let (:entry_station){ double :station}
	let (:exit_station){ double :station}
	let (:journey){{entry: entry_station, exit: exit_station}}

  it 'should respond to #balance' do 
    oyster = Oystercard.new 
    expect(oyster).to respond_to(:balance)
  end 

	it 'has an initial balance of 0' do 
		oyster = Oystercard.new
		expect(oyster.balance).to eq(0)
	end
	
	it 'should respond to #top_up' do 
		oyster = Oystercard.new 
		expect(oyster).to respond_to(:top_up).with(1).argument
	end 

	it 'should #top_up the balance' do 
		oyster = Oystercard.new
		oyster.top_up(10)
		expect(oyster.balance).to eq(10)
	end 

	it 'raises an error if the maximum balance is exceeded' do 
		max_capacity = Oystercard::MAX_CAPACITY #what does line 27 mean or do? 
		subject.top_up(max_capacity)
		expect{ subject.top_up(1) }.to raise_error("Maximum balance of #{max_capacity} exceeded")
	end 

	it 'should change the value of @entry_station to true' do 
		subject.top_up(20)
		subject.touch_in(entry_station) 
		expect(subject.entry_station).to eq entry_station
	end 
	
	it 'should change the value of @entry_station to false' do 
		subject.top_up(20)
		subject.touch_in(entry_station) 
		subject.touch_out(exit_station)
		expect(subject.entry_station).to eq nil
	end 
	
	it 'should tell us if the oystercard is in use' do
		subject.top_up(20)
		subject.touch_in(entry_station)
		expect(subject.in_journey?).to eq(true)
	end 
	
	it 'should tell us if the oystercard is NOT in use' do 
		subject.touch_out(exit_station) 
		expect(subject.in_journey?).to eq(false)
	end
	
	it 'should throw an error when balance is less than 1' do 
		expect{subject.touch_in(entry_station)}.to raise_error("balance is below #{Oystercard::MIN_FARE}")
	end
	
	it 'Should deduct the fare from the card' do
		subject.top_up(10)
		subject.touch_in(entry_station)
		expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MIN_FARE)
	end
	
	it 'Should remember the entry station' do
		subject.top_up(10)
		subject.touch_in(entry_station)
		expect(subject.entry_station).to eq entry_station
	end
	
	it 'Should forget the entry station' do
		subject.top_up(10)
		subject.touch_in(entry_station)
		subject.touch_out(exit_station)
		expect(subject.entry_station).to eq nil
	end
	
	it 'Should add journey stations to a hash' do
		subject.top_up(10)
		subject.touch_in(entry_station)
		subject.touch_out(exit_station)
		expect(subject.journeys).to include journey
	end
	
	it 'Journey should have an empty list by default' do
		expect(subject.journeys).to be_empty
	end

end 
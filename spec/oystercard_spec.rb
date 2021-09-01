require './lib/oystercard.rb'

describe Oystercard do 
  
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

  it 'should respond to #deduct' do 
    oyster = Oystercard.new 
    expect(oyster).to respond_to(:deduct).with(1).argument 
  end 

  it 'should #deduct from the balance' do 
    oyster = Oystercard.new
    oyster.top_up(30)
    oyster.deduct(20)
    expect(oyster.balance).to eq(10)
  end 

  it 'raises an error if overdrawn' do 
    min_capacity = Oystercard::MIN_CAPACITY #ask for help with this?
    expect{ subject.deduct(1) }.to raise_error("Minimum balance of #{min_capacity} exceeded")
  end 

  it 'should not initally be in journey' do
  oyster = Oystercard.new 
  expect(oyster.journey?).to eq(false)
  end   

  it 'can #touch_in' do 
  oyster = Oystercard.new 
  expect(oyster).to respond_to(:touch_in)
end 

end 

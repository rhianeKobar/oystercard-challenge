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
    max_capacity = Oystercard::MAX_CAPACITY
    subject.top_up(max_capacity)
    expect{ subject.top_up(1) }.to raise_error('Maximum balance exceeded')
  end 

  


 

end 

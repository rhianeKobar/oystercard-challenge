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
  expect(oyster).to respond_to(:top_up)
  end 

 

end 

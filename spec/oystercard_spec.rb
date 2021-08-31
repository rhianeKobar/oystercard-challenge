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

  it 'should have a maximum limit' do 
    oyster = Oystercard.new
    oyster.top_up(100)
    expect { subject }.to raise_error('The maximum limit is £90')
  end 

  


 

end 

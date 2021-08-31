require './lib/oystercard.rb'

describe Oystercard do 
  it 'should respond to #balance' do 
  oyster = Oystercard.new 
  expect(oyster).to respond_to(:balance)
end 
end 

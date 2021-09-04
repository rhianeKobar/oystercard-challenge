require './lib/station'

describe "Station" do
	it "Should initialise a station with a name and zone" do
		station = Station.new("Cross", 2)
		expect(station).to have_attributes(:name => "Cross", :zone => 2)
	end
end
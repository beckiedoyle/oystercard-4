require 'station'

describe Station do
  it "shows name of station" do 
    station = Station.new("Streatham", 4)
    expect(station.name).to eq("Streatham")
  end

  it "shows what zone the station is within" do
    station = Station.new("Streatham", 4)
    expect(station.zone).to eq(4)
  end
end
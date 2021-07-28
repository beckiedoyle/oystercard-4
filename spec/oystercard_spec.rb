require 'oystercard'

describe Oystercard do
  let(:station){ double :station }

  it 'should have a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end

  it "should top up oystercard" do
    expect {subject.top_up(5)}.to change { subject.balance }.by(5)
  end

  it "should throw error if =>£90" do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect{ subject.top_up 1 }.to raise_error "Reached max limit of £90"
  end

  it 'is in journey' do
    expect(subject).not_to be_in_journey
  end 

  it 'can touch in' do
    subject.top_up(30)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up(30)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'raises an error when user balance is under minimum fare' do
    card = Oystercard.new
    expect{card.touch_in(station)}.to raise_error("You need at least #{card.MINIMUM_FARE} to touch in")
  end

  it 'deducts minimum fare from balance when touching out' do
    subject.top_up(30)
    subject.touch_in(station)
    expect{subject.touch_out}.to change{subject.balance}.by(-subject.MINIMUM_FARE)
  end

  it 'stores the entry station' do
    subject.top_up(40)
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station)
  end
end

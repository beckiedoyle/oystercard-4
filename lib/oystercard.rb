require_relative 'station.rb'
require_relative 'journey.rb'

class Oystercard
attr_reader :balance, :MINIMUM_FARE, :entry_station, :exit_station, :journey, :journeys

MAX_LIMIT = 90

  def initialize(balance=0, minimum_fare=1, journey = Journey.new)
    @balance = balance
    @MINIMUM_FARE = minimum_fare
    @entry_station
    @exit_station
    @journey = journey
    @journeys = []
  end

  def top_up(amount)
    fail "Reached max limit of £90" if full?
    @balance += amount
  end

  def touch_in(station)
    raise ("You need at least #{@MINIMUM_FARE} to touch in") if under_fare?
    journey.start_journey(station)
  end

  def touch_out(station)
    self.deduct(@MINIMUM_FARE)
    @journeys.push(journey.finish_journey(station))
  end

  private
  def deduct(value)
    @balance -= value
  end

  def full?
    @balance >= MAX_LIMIT
  end

  def under_fare?
    @balance < @MINIMUM_FARE
  end
end

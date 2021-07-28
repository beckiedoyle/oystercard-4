class Oystercard
attr_reader :balance, :MINIMUM_FARE, :entry_station

MAX_LIMIT = 90

  def initialize(balance=0, minimum_fare=1)
    @balance = balance
    @MINIMUM_FARE = minimum_fare
    @entry_station
  end

  def top_up(amount)
    fail "Reached max limit of £90" if full?
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise ("You need at least #{@MINIMUM_FARE} to touch in") if under_fare?
    @entry_station = station
  end

  def touch_out
    self.deduct(@MINIMUM_FARE)
    @entry_station = nil
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

class Journey

  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @journey 
    @journeys = []
    @complete = false
  end

  def finish_journey(exit_station = nil)
    @exit_station = exit_station
    @journeys.push([ @entry_station, @exit_station ])
    self
  end

  def complete?
    if @entry_station == nil || @exit_station == nil
      @complete = false
    else
      @complete = true
    end
    @complete
  end

  def fare
    if @complete == true 
      return MINIMUM_FARE 
    elsif @complete == false
      return PENALTY_FARE
    end
  end

end
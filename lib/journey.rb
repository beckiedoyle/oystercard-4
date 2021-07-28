require 'oystercard'

class Journey
  def initialize
    @entry_station
    @exit_station
    @journey 
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @journey = { @entry_station => @exit_station }
    @journey
  end

  def fare
    
  end

  def journey_complete?
    
  end
end
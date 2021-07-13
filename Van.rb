require './Vehicle.rb'

class Van < Vehicle
  def initialize
    @cost_per_100km = rand(5.0..8.3) * 5.6 
    @current_weight = 0
    @list_of_parcels = Array.new(16) {Array.new}
  end

  def total_capacity
    3000
  end

  def start_up_cost
    200
  end

  def cost_per_100km
    @cost_per_100km
  end
end
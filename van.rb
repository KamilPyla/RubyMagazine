require './vehicle'

class Van < Vehicle
  def initialize
    @combusion = rand(5.0..8.3)
    @current_weight = 0
    @list_of_parcels = Array.new(16) { [] }
  end

  def self.max_capacity
    3_000
  end

  def total_capacity
    3_000
  end

  def start_up_cost
    200
  end

  def cost_per_100km
    @combusion * 5.6
  end
end

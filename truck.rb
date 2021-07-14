require './vehicle'

class Truck < Vehicle
  def self.max_capacity
    2 * 12_000
  end

  def initialize(number_of_semitrailer)
    @semitailer = number_of_semitrailer
    @semitailer = 2 if number_of_semitrailer >= 2
    @current_weight = 0
    @list_of_parcels = Array.new(16) { [] }
  end

  def total_capacity
    12_000 * @semitailer
  end

  def start_up_cost
    1_000 + @semitailer * 200
  end

  def cost_per_100km
    25.3 * 5.6
  end
end

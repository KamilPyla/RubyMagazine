require './Vehicle'

class Truck < Vehicle
  def initialize (number_of_semitrailer)
    @semitailer = number_of_semitrailer
    @semitailer = 2 if number_of_semitrailer >= 2
    @current_weight = 0
    @list_of_parcels = Array.new(16) {Array.new}
  end

  def total_capacity
    1200 * @semitailer
  end

  def start_up_cost
    1000 + @semitailer * 200
  end

  def cost_per_100km
    25.3 * 5.6
  end
end
# frozen_string_literal: true

require './vehicle'

# Class describing train
class Train < Vehicle
  def initialize(number_of_carriage)
    super()
    @carriage = number_of_carriage
    @carriage = 10 if number_of_carriage >= 10
  end

  def self.max_capacity
    15_000 * 10
  end

  def self.carriage_capaticy
    15_000
  end

  def total_capacity
    15_000 * @carriage
  end

  def start_up_cost
    2_000 + @carriage * 100
  end

  def cost_per_100km
    @carriage > 6 ? 80 : 100
  end
end

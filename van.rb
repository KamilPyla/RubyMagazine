# frozen_string_literal: true

require './vehicle'

# Class describing van
class Van < Vehicle
  def initialize
    super()
    @combusion = rand(5.0..8.3)
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

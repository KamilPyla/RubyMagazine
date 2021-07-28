# frozen_string_literal: true

require './vehicle'

# Class describing truck
class Truck < Vehicle
  def self.max_capacity
    2 * 12_000
  end
  # initializer to powinna być pierwsza metoda jaka masz w klasie.
  def initialize(number_of_semitrailer)
    super()
    @semitailer = number_of_semitrailer
    @semitailer = 2 if number_of_semitrailer >= 2
  end

  # 1. Zakres widocznosći zmiennej - do przemyślenia.
  # 2. Stałe wartości powinny być zadeklarowane jako stałe i z potraktowane metodą freeze.
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

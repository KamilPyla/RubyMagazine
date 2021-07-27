# frozen_string_literal: true

# Class describing parcels, it has value of parcels, destination, weight and special id
class Parcel
  attr_reader :value, :destination, :weight, :id

  # Dobrze jest w initializerach stosować wymuszenie nazw zmiennych tzw Keyword arguments
  # https://www.rubyguides.com/2018/06/rubys-method-arguments/
  def initialize(weight, value, destination, id)
    @weight = weight
    @value = value
    @destination = destination
    @id = id
  end
end

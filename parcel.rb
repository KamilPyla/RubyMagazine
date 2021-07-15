# frozen_string_literal: true

# Class describing parcels, it has value of parcels, destination, weight and special id
class Parcel
  attr_reader :value, :destination, :weight, :id

  def initialize(weight, value, destination, id)
    @weight = weight
    @value = value
    @destination = destination
    @id = id
  end
end

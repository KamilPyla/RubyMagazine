class Parcel
  attr_reader :value, :destination, :weight, :id

  def initialize(weight, value, destination)
    @weight = weight
    @value = value
    @destination = destination
    @id = @@id
    @@id += 1
  end

  @@id = 0
end

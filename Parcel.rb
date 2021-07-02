class Parcel
	attr_reader :value, :destination, :weight, :id

	def initialize(weight, value, destination)
		@weight, @value, @destination, @id = weight, value, destination, @@id
		@@id += 1
	end

	private
	@@id = 0
end
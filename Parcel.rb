class Parcel #Box / package
	attr_reader :value, :destination, :weight, :id

	def initialize(weight, value, destination)
		@weight, @value = weight, value
		@destination, @id = destination, @@id
		@@id += 1
	end

	private
	@@id = 0
end


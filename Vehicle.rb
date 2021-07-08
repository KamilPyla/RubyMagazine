require_relative 'Parcel'

class Truck
	CAPACITY = 12000
	START_UP_COST = 1000
	COMBUSTION = 25.3

	def initialize (number_of_semitrailer)
		@semitailer = 2 if number_of_semitrailer >= 2
		@semitailer = number_of_semitrailer
		@current_weight = 0
		@list_of_parcels = []
		@cost_per_100km = COMBUSTION * 5.6
	end
	
	def add_parcel(parcel)
		if @current_weight <= CAPACITY*@semitailer - parcel.weight
			@current_weight += parcel.weight
			@list_of_parcels << parcel
		else
			puts 'Truck is full!'
		end
	end
	
	def cost (distance)
		START_UP_COST + @semitailer * 200  + (distance.to_f / 100) * @cost_per_100km
	end
end

class Train
	CAPACITY = 15000
	START_UP_COST = 2000

	def initialize (number_of_carriage)
		@carriage = 10 if number_of_carriage >= 10
		@carriage = number_of_carriage
		@current_weight = 0
		number_of_carriage > 6 ? @cost_per_100km = 80 : @cost_per_100km = 100
		@list_of_parcels = []
	end

	def cost (distance) 
		START_UP_COST + @carriage * 100 + distance.to_f/100 * @cost_per_100km
	end

	def add_parcel(parcel)
		if @current_weight <= CAPACITY*@carriage - parcel.weight
			@current_weight += parcel.weight
			@list_of_parcels << parcel
		else
			puts 'Train is full!'
		end
	end
end

class Van
	CAPACITY = 3000
	START_UP_COST = 200

	def initialize
		@current_weight = 0
		@list_of_parcels = []
	end

	def add_parcel(parcel)
		if @current_weight <= CAPACITY - parcel.weight.to_i
			@current_weight += parcel.weight
			@list_of_parcels << parcel
		else
			puts 'Van is full!'
		end
	end

	def cost (distance)
		sum = START_UP_COST
		for i in (1..distance/100)
			sum += cost_per_100km
		end
		sum += cost_per_100km * (distance % 100)/100
	end

	private
	def cost_per_100km
		rand(5.0..8.3) * 5.6 
	end
end

tr = Truck.new(2031)
tr = Van.new
train = Train.new(8)
tr = Truck.new(2)
parcel = Parcel.new(4,200,5)

while (tr.add_parcel ( Parcel.new(rand(1..10),rand(20..500),rand(1..16)) ))
end


# 	for i in (1..10000)
# 	tr.add_parcel(  )
# end
class Truck
	CAPACITY = 12000
	START_UP_COST = 1000
	COMBUSTION = 25.3

	def initialize (number_of_semitrailer)
		@semitailer = number_of_semitrailer
		@current_weight = 0
	end
	
	def add_parcel (weight)
		@current_weight += weight if @current_weight <= CAPACITY*@semitailer - weight
	end
	
	def cost (distance)
		START_UP_COST + @semitailer * 200  + (distance.to_f / 100) * COMBUSTION * 5.6
	end
end

class Train
	CAPACITY = 15000
	START_UP_COST = 2000

	def initialize (number_of_carriage)
		@carriage = number_of_carriage
		@current_weight = 0
		number_of_carriage > 6 ? @combustion_per_100km = 80 : @combustion_per_100km = 100
	end
	def cost (distance) 
		START_UP_COST + @carriage * 100 + distance.to_f/100 * @combustion_per_100km
	end

	def add_parcel(weight)
		@current_weight += weight if @current_weight <= CAPACITY*@semitailer - weight
	end
end

class Van
	CAPACITY = 3000
	START_UP_COST = 200

	def initialize
		@current_weight = 0
	end

	def add_parcel(weight)
		@current_weight += weight if @current_weight <= CAPACITY - weight
	end

	def cost (distance)
		sum = START_UP_COST
		for i in (1..distance/100)
			sum += combustion_per_100km * 5.6
		end
		sum += combustion_per_100km * (distance % 100)/100 * 5.6
	end

	private
	def combustion_per_100km
		rand(5.0..8.3) 
	end
end
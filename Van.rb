require './Vehicle.rb'

class Van < Vehicle
	def initialize
		@current_weight = 0
		@list_of_parcels = []
		@cost_per_100km = rand(5.0..8.3) * 5.6 
	end

	def total_capacity
		3000
	end

	def start_up_cost
		200
	end

	def cost_per_100km
		@cost_per_100km
	end
end
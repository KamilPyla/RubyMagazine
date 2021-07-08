require './Vehicle.rb'

class Train < Vehicle
	def initialize (number_of_carriage)
		@carriage = 10 if number_of_carriage >= 10
		@carriage = number_of_carriage
		@current_weight = 0
		@list_of_parcels = []
	end

	def total_capacity
		15000 * @carriage
	end
	
	def start_up_cost
		2000 + @carriage * 100
	end

	def cost_per_100km
		@carriage > 6 ? 80 : 100
	end 
end
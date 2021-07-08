# jedna klasa na plik!!!
# plik nazywa się tak jak klasa
# klasy 100 - 200 linii
# rubocop

require_relative 'Parcel' # nie potrzebne 

class Vehicle
	attr_accessor :current_weight, :list_of_parcels
	def total_capacity
		raise 'Not implement method!'
	end
	
	def start_up_cost
		raise 'Not implement method!'
	end

	def cost_per_100km
		raise 'Not implement method!'
	end 

	def add_parcel(parcel)
		if @current_weight <= total_capacity - parcel.weight
			self.current_weight += parcel.weight
			self.list_of_parcels << parcel
		else
			puts 'Vehicle is full!'
		end
	end

	def cost (distance)
		start_up_cost + distance/100.0 * cost_per_100km
	end
end
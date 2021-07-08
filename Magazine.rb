require './Graph.rb'

class Magazine < Graph
	attr_reader :localization
	def initialize(localization)
		@localization = localization
		@list_of_parcels = Array(16) {Array.new}
	end

	def add_parcel (parcel)
		@list_of_parcels[parcel.destination] << parcel
	end

	def caltulate_income
		
	end
end
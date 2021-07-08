class Magazine
	@@distacne [[0,313,0,0,0,0,0,0,0,0,194, 213, 0,0,0,0 ],
							[313,0,148, ]]
	def initialize(localization)
		@localization = localization
		@list_of_parcels = Array(16) {Array.new}
	end

	# sortuje paczki względem województw 
	def add_parcel (parcel)
		@list_of_parcels[parcel.destination] << parcel
	end



end
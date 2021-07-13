require './Train.rb'
require './Truck.rb'
require './Van.rb'
require './Parcel.rb'
require './Magazine.rb'

class Deliver 
	def initialize(number_of_magazines, init_magazine)
		@magazines = []
		@delivered = Array.new(number_of_magazines,false)
		number_of_magazines.times { |i| @magazines << Magazine.new(i) }
		@init = init_magazine
	end

	def add_parcels(number_of_parcels)
		number_of_parcels.times do 
			@magazines[@init].add_parcel Parcel.new(rand(1..10),rand(20..500), rand(0..15))
		end
	end

	def calculate_income
		return 0 if @magazines[@init].list_of_parcels.empty?
		s = 0
		@magazines[@init].list_of_parcels.map do |m|
			m.map {|p| p.value}.sum
		end.sum
	end

	def order
		p "INIT #{@init}"
		@magazines[@init].find_path
	end

	def calculate_distance
		path = self.order 
		(1...path.size).map do |i| 
			@magazines[@init].distance[path[i-1]][path[i]]
		end.sum

	end
		
end

# del = Deliver.new(16, 1)
# p del.calculate_income
# del.add_parcels(10000)
# p del.calculate_income
16.times do |i|
	p i
	deli = Deliver.new(16, i)
	p deli.order
	p deli.calculate_distance
end
require './Train.rb'
require './Truck.rb'
require './Van.rb'
require './Parcel.rb'
require './Magazine.rb'
require './Deliver.rb'

def initialize_trip
	init = rand(0..15)
	magazines = []
	16.times do |localization|
		magazines << Magazine.new(localization)
	end
	10.times{ magazines[init].add_parcel Parcel.new(rand(1..10),rand(20..500), rand(0..15))}
	return magazines
end

truck1 = Truck.new(2)
truck2 = Truck.new(2)
truck3 = Truck.new(2)

van1 = Van.new
van2 = Van.new
van3 = Van.new
van4 = Van.new
van5 = Van.new

magazines = initialize_trip
index = 0
magazines.each do |m|
	index = magazines.index(m) if m.list_of_parcels.empty? 
	p m.list_of_parcels
end
p index
magazine = magazines[index]

p magazine.list_of_parcels

min = Float::INFINITY
index = 0
(0..15).each do |i|
	dist = magazine.shortest_distance_wg(i)
	p dist
	p magazine.find_path
	(0..15).each do |j|
		path = magazine.find_shortest_path(i,j)
		p path
	end
	if dist.sum < min
		min = dist.sum
		index = i
	end
end
p min
p index

		

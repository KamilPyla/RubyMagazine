require './Train.rb'
require './Truck.rb'
require './Van.rb'
require './Parcel.rb'

tr = Truck.new(2031)
tr = Van.new
train = Train.new(8)
tr = Truck.new(2)
parcel = Parcel.new(4,200,5)

while (tr.add_parcel ( Parcel.new(rand(1..10),rand(20..500),rand(1..16)) ))
end

tr.list_of_parcels.each {|par|
	p par.weight
}



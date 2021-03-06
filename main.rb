#! /usr/bin/env ruby

# frozen_string_literal: true

require './train'
require './truck'
require './van'
require './parcel'
require './magazine'
require './deliver'

del = Deliver.new(16, rand(0..15))
del.add_parcels(10_000)
puts "Total weight:#{del.calculate_weight}"
del.calculate_profit
del.start_trip!

# 16.times do |i|
#   m = Magazine.new(i)
#   p m.shortest_distance(i)[0]
#   16.times do |j|
#     p m.find_shortest_path(i, j)
#   end
# end

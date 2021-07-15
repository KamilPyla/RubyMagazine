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
p del.calculate_weight
del.calculate_profit
del.start_trip!

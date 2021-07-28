# frozen_string_literal: true

require './graph'
require './tsp'

# Class describing magazine
class Magazine < Graph
  attr_reader :localization, :list_of_parcels

  def initialize(localization)
    @list_of_parcels = Array.new(16) { [] }
    super localization
  end

  def add_parcel(parcel)
    @list_of_parcels[parcel.destination] << parcel
  end

  def find_path
    tsp(edges, distance, @localization) # WTF is tsp, probprobably YATLA
  end
end

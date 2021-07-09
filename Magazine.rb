require './Graph'

class Magazine < Graph
  attr_reader :localization, :list_of_parcels

  def initialize(localization)
    @localization = localization
    @list_of_parcels = Array.new(16) []
  end

  def add_parcel(parcel)
    @list_of_parcels[parcel.destination] << parcel
  end

  def caltulate_income
  end
end

# frozen_string_literal: true

# Class describing vehicle
class Vehicle
  attr_accessor :current_weight, :list_of_parcels

  def initialize
    @current_weight = 0
    @list_of_parcels = Array.new(16) { [] }
  end

  def total_capacity
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def start_up_cost
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def cost_per_100km
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def add_parcel(parcel)
    if @current_weight <= total_capacity - parcel.weight
      @current_weight += parcel.weight
      @list_of_parcels[parcel.destination] << parcel
    else
      puts 'Vehicle is full!'
    end
  end

  def cost(distance)
    start_up_cost + distance / 100.0 * cost_per_100km
  end

  def deliver!(magazine)
    @list_of_parcels[magazine.localization].size.times do
      @current_weight -= @list_of_parcels[magazine.localization].last.weight
      magazine.add_parcel @list_of_parcels[magazine.localization].pop
    end
    puts "Parcels have been delivered to magazine munber #{magazine.localization}"
  end
end

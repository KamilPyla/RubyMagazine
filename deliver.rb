require './train'
require './truck'
require './van'
require './parcel'
require './magazine'

class Deliver
  def initialize(number_of_magazines, init_magazine)
    @magazines = []
    @delivered = Array.new(number_of_magazines, false)
    number_of_magazines.times { |i| @magazines << Magazine.new(i) }
    @init = init_magazine
    @order = []
  end

  def add_parcels(number_of_parcels)
    number_of_parcels.times do
      @magazines[@init].add_parcel Parcel.new(rand(1..10), rand(20..500), rand(0..15))
    end
  end

  def calculate_income
    return 0 if @magazines[@init].list_of_parcels.empty?

    @magazines[@init].list_of_parcels.map do |m|
      m.map(&:value).sum
    end.sum
  end

  def order
    @order = @magazines[@init].find_path if @order.empty?
    @order
  end

  def calculate_distance
    path = order
    (1...path.size).map do |i|
      @magazines[@init].distance[path[i - 1]][path[i]]
    end.sum
  end

  def calculate_weight
    @magazines[@init].list_of_parcels.map do |m|
      m.map { |par| par.destination == @init ? 0 : par.weight }.sum
    end.sum
  end

  def choose_vehicle
    total_weight = calculate_weight
    if total_weight > 2 * Truck.max_capacity
      Train.new((total_weight.to_f / Train.carriage_capaticy).ceil)
    end
  end

  def calculate_cost
    choose_vehicle.cost(calculate_distance)
  end

  def calculate_profit
    puts "Income: #{calculate_income}"
    puts "Costs: #{calculate_cost}"
    puts "Profit: #{calculate_income - calculate_cost}"
  end

  def add_to_vehicles
    vehicle = choose_vehicle
    @magazines[@init].list_of_parcels.each_with_index do |m, i|
      m.size.times { vehicle.add_parcel m.pop } if i != @init
    end
    vehicle
  end

  def start_trip!
    vehicle = add_to_vehicles
    order.each do |loc|
      vehicle.deliver! @magazines[loc]
    end
    check
  end

  def check
    puts "Check correctness"
    @magazines.each_with_index do |m, i|
      puts "Magazine number #{i}"
      puts "List of parcels index #{i} is empty? #{m.list_of_parcels[i].empty?}"
    end
  end
end

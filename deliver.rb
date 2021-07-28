# frozen_string_literal: true

require './train'
require './truck'
require './van'
require './parcel'
require './magazine'

# Class handles parcel delivery
class Deliver
  # Tutaj by Ci się przydał attr_accessor (https://www.rubyguides.com/2018/11/attr_accessor/)

  # Dobrz ejest w initializerach stosować wymuszenie nazw zmiennych tzw Keyword arguments
  # https://www.rubyguides.com/2018/06/rubys-method-arguments/
  def initialize(number_of_magazines, init_magazine)
    @magazines = []
    @delivered = Array.new(number_of_magazines, false)
    number_of_magazines.times { |i| @magazines << Magazine.new(i) }
    @init = init_magazine
    @order = []
  end


  # Zasiegi metod (public private protected). Dobrą praktyką jest eksponowanie tylko
  # tego czego chcesz uzywasz z zewnątrz. Reszta metod i zmiennych powinna być ukryta.
  # poczytaj: https://www.rubyguides.com/2018/10/method-visibility/
  #
  # W main.rb uywasz tylko takich metod
  #
  # del.add_parcels(10_000)
  # p del.calculate_weight
  # del.calculate_profit
  # del.start_trip!
  #
  # reszta powinna być private.

  def add_parcels(number_of_parcels)
    number_of_parcels.times do |i|
      @magazines[@init].add_parcel Parcel.new(rand(1..10), rand(20..500), rand(0..15), i)
    end
  end

  def calculate_income
    # Wyjasnij mi proszę, dlaczego dałeś tutaj taki warunek?
    # Magazine.new.list_of_parcels zawsze jest arrayem, tak?
    # 'map' na pustej tablicy nie wykona bloku. Ale zawsze zwróci tablice
    # Jak dasz sum na pustej tablicy i tak wyjdzie Ci 0
    # [1] pry(main)> [].map { |x| x * 2 }.sum
    #  => 0
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
    # puts "Number of carraige: #{(total_weight.to_f / Train.carriage_capaticy).ceil}"
    Train.new((total_weight.to_f / Train.carriage_capaticy).ceil)
  end

  def calculate_cost
    # do tefaktury lub memoryzacji.
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
    puts 'Check correctness'
    @magazines.each_with_index do |m, i|
      puts "Magazine number #{i}"
      puts "List of parcels index #{i} is empty? #{m.list_of_parcels[i].empty?}"
    end
  end
end

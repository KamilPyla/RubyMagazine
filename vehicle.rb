class Vehicle
  attr_accessor :current_weight, :list_of_parcels

  def initialize
    raise 'Abstract class!'
  end

  def total_capacity
    raise 'Not implement method!'
  end

  def start_up_cost
    raise 'Not implement method!'
  end

  def cost_per_100km
    raise 'Not implement method!'
  end

  def add_parcel(parcel)
    if @current_weight <= total_capacity - parcel.weight
      self.current_weight += parcel.weight
      self.list_of_parcels[parcel.destination] << parcel
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


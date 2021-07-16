# frozen_string_literal: true

# Class implements basic graph features like Dijkstra's alghoritm
class Graph
  # rubocop:disable all
  def initialize(localization)
    @localization = localization
  end

  def edges
    [[false, true, false, false, false, false, false, false, false, false, true, true, true, false, false, false], 
    [true, false, true, false, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, true, false, true, false, false, false, false, false, false, false, false, true, true, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, false, false, true, false, false, false, false, false, false, false, true, true, false], 
    [false, false, false, false, true, false, true, false, false, false, false, false, false, false, true, false],
    [false, false, false, false, false, true, false, true, false, false, false, false, false, false, true, false],
    [false, false, false, false, false, false, true, false, true, false, false, false, false, false, true, true], 
    [false, false, false, false, false, false, false, true, false, true, false, true, false, false, false, true], 
    [false, false, false, false, false, false, false, false, true, false, true, true, false, false, false, false], 
    [true, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false], 
    [true, false, false, false, false, false, false, false, true, true, true, false, true, false, false, true],
    [true, true, true, false, false, false, false, false, false, false, false, true, false, true, false, true], 
    [false, false, true, true, true, false, false, false, false, false, false, false, true, false, true, true], 
    [false, false, false, false, true, true, true, true, false, false, false, false, false, true, false, true], 
    [false, false, false, false, false, false, false, true, true, false, false, true, true, true, true, false]] 
  end

  def distance
    [[  0,	313,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	194,	213,	298,	  0,	  0,	  0],
      [313,	  0,	148,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,  162,	  0,	  0,	  0],
      [  0,	148,	  0,	209,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	164,	192,	  0,	  0],
      [  0,	  0,	209,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	192,	  0,	  0],
      [  0,	  0,	  0,	  0,  	0,	152,	  0,	  0,  	0,  	0,  	0,  	0,  	0,  167,	155,  	0],
      [  0,	  0,	  0,	  0,	152,  	0,	160,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	146,	  0],
      [  0,	  0,	  0,	  0,	  0,	160,	  0,	 75,	  0,	  0,	  0,  	0,	  0,	  0,	111,	  0],
      [  0,	  0,	  0,	  0,	  0,	  0,	 75,	  0,	 98,   	0,  	0,  	0,  	0,  	0,	145,	184],
      [  0,	  0,	  0,	  0,  	0,  	0,  	0,	 98,	  0,	 86,  	0,	223,	  0,	  0,	  0,	176],
      [  0,	  0,	  0,	  0,  	0,  	0,  	0,  	0,	 86,	  0,	153,	158,  	0,  	0,  	0,	  0],
      [194,  	0,  	0,  	0,  	0,  	0,  	0,  	0,  	0,	153,  	0,	120,  	0,	  0,  	0,  	0],
      [213,  	0,	  0,	  0,  	0,	  0,  	0,  	0,	223,	158,	120,  	0,	143,  	0,  	0,	204],
      [298,	162,	164,  	0,	  0,  	0,  	0,	  0,	  0,  	0,  	0,	143,  	0,	201,  	0,	165],
      [  0,  	0,	192,	192,	167,  	0,  	0,  	0,	  0,  	0,  	0,  	0,	201,  	0,	168,	129],
      [  0,  	0,	  0,	  0,	155,	146,	111,	145,  	0,  	0,  	0,  	0,  	0,	168,  	0,	140],
      [  0,  	0,	  0,	  0,	  0,	  0,  	0,	184,	176,	  0,	  0,	204,	165,	129,	140,	  0]]
  end
  # rubocop:enable all

  def shortest_distance(init, matrix = distance)
    dist = Array.new(matrix.size, Float::INFINITY)
    prev = Array.new(matrix.size, -1)

    dist[init] = 0

    3.times { dist, prev = search_distance(dist, prev, matrix) }
    [dist, prev]
  end

  def search_distance(dist, prev, matrix)
    vertex = Array(0...matrix.size)
    until vertex.empty?
      u = vertex.shift
      matrix[u].each_with_index do |val, i|
        next if val.zero?

        alt = dist[u] + val
        if alt < dist[i]
          dist[i] = alt
          prev[i] = u
        end
      end
    end
    [dist, prev]
  end

  def find_shortest_path(beg, last)
    return -1 if beg == last

    path = shortest_distance(beg)[1]
    prev = last
    route = [last]
    while prev != beg
      route << path[prev]
      prev = path[prev]
    end
    route.reverse!
  end
end

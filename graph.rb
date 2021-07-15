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
    [
      [  0,	313,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	  0,	194,	213,	298,	  0,	  0,	  0],
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
      [  0,  	0,	  0,	  0,	  0,	  0,  	0,	184,	176,	  0,	  0,	204,	165,	129,	140,	  0]
    ]
  end
  # rubocop:enable all

  def shortest_distance_weight(init = 0, path = false, matrix = distance)
    vertex = []
    v = matrix[0].length
    dist = []
    prev = []

    v.times do
      dist << Float::INFINITY
      prev << -1
    end

    dist[init] = 0

    3.times do
      v.times do |i|
        vertex << i
      end
      while vertex.!empty?
        u = vertex.shift
        matrix[u].each_with_index do |val, i|
          next if i.zero?

          alt = dist[u] + val
          if alt < dist[i]
            dist[i] = alt
            prev[i] = u
          end
        end
      end
    end

    if path
      prev
    else
      dist
    end
  end

  def find_shortest_path(beg, end_)
    return -1 if beg == end_

    path = shortest_distance_wg(beg, true)
    prev = end_
    route = [end_]
    while prev != beg
      route << path[prev]
      prev = path[prev]
    end
    route.reverse!
  end
end

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

  def shortest_distance(init, neighborhood_matrix = distance)
    distance_matrix = Array.new(neighborhood_matrix.size, Float::INFINITY)
    prev_vertex_array = Array.new(neighborhood_matrix.size, -1)

    distance_matrix[init] = 0

    3.times do
      distance_matrix, prev_vertex_array = search_distance(
        distance_matrix,
        prev_vertex_array,
        neighborhood_matrix)
    end
    
    [distance_matrix, prev_vertex_array]
  end

  def search_distance(distance_matrix, prev_vertex_array, neighborhood_matrix)
    unvisited_vertices = Array(0...neighborhood_matrix.size)

    while unvisited_vertices.present?
      vertex_index = unvisited_vertices.shift

      neighborhood_matrix[vertex_index].each_with_index do |distance, i|
        next if distance.zero?

        alt_distance = distance_matrix[vertex_index] + distance
        if distance_matrix[i] > alt_distance
          distance_matrix[i] = alt_distance
          prev_vertex_array[i] = vertex_index
        end
      end
    end

    [distance_matrix, prev_vertex_array]
  end

  def find_shortest_path(beg, last)
    return -1 if beg == last

    path = shortest_distance(beg)[1]
    prev_vertex_array = last
    route = [last]
    while prev_vertex_array != beg
      route << path[prev_vertex_array]
      prev_vertex_array = path[prev_vertex_array]
    end
    route.reverse!
  end
end

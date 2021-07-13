class Graph

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
  
  def shortest_distance_wg( init = 0,path = false, matrix = distance )
		
    vertex = []
    v = matrix[0].length
    dist = []
    prev = []
    
    v.times do |i|
      dist << Float::INFINITY
      prev << -1
    end

    dist[init] = 0

		3.times do |k|
			v.times do |i|
				vertex << i
			end
    	while vertex.length > 0
      	u = vertex.shift
      	matrix[u].each_with_index do |i,j|
      	  next if i == 0
      	  alt =  dist[u] + i
      	  if alt < dist[j]
      	    dist[j] = alt
      	    prev[j]  = u
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

	def find_shortest_path(beg, en)
		return -1 if beg == en
		path = self.shortest_distance_wg(beg, true)
		prev = en
		route = [en]
		while prev != beg
			route << path[prev]
			prev = path[prev]
		end
		route.reverse! 
	end
end
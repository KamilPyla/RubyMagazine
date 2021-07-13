def tsp(neighbours, values, v0)
  visited = Array.new(16, false)
  path = Array.new(16)
  path_temp = Array.new(16)
  shptr = 0
  dist = Float::INFINITY
  dist_temp = 0
  n = neighbours.size
  
  def tsp_rec(neighbours, values, v0, v, visited, path, path_temp, shptr, dist, dist_temp, n)
    path_temp[shptr] = v
    shptr += 1
    if shptr < n
      visited[v] = true

      (0...n).each do |u|
        next if !neighbours[v][u] || visited[u]

        dist_temp += values[v][u]
        tsp_rec(neighbours, values, v0, u, visited, path, path_temp, shptr, dist, dist_temp, n)
        dist_temp -= values[v][u]
      end

      visited[v] = false

    elsif neighbours[v0][v]
      dist_temp += values[v][v0]

      if dist_temp < dist
        dist = dist_temp
        (0...shptr).each { |i| path[i] = path_temp[i] }
      end
      dist_temp -= values[v][v0]
    end

    shptr -= 1
    path
  end
  tsp_rec(neighbours, values, v0, v0, visited, path, path_temp, shptr, dist, dist_temp, n)
end

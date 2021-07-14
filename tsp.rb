def tsp(neigh, val, v0)
  @visited = Array.new(val.size, false)
  @path = Array.new(val.size)
  @path_temp = Array.new(val.size)
  @dist = Float::INFINITY
  @shptr = 0
  @dist_temp = 0
  @n = neigh.size
  @v0 = v0
  
  def tsp_rec(neigh, val, v)
    @path_temp[@shptr] = v
    @shptr += 1
    if @shptr < @n
      @visited[v] = true

      (0...@n).each do |u|
        next if !neigh[v][u] || @visited[u]

        @dist_temp += val[v][u]
        tsp_rec(neigh, val, u)
        @dist_temp -= val[v][u]
      end

      @visited[v] = false

    elsif neigh[@v0][v]
      @dist_temp += val[v][@v0]

      if @dist_temp < @dist
        @dist = @dist_temp
        (0...@shptr).each { |i| @path[i] = @path_temp[i] }
      end
      @dist_temp -= val[v][@v0]
    end

    @shptr -= 1
    @path
  end
  tsp_rec(neigh, val, @v0)
end

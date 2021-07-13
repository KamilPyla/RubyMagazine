def tsp(neighbours, values, v0)
  @visited = Array.new(values.size, false)
  @path = Array.new(values.size)
  @path_temp = Array.new(values.size)
  @dist = Float::INFINITY
  @shptr = 0
  @dist_temp = 0
  @n = neighbours.size
  @v0 = v0
  
  def tsp_rec(neighbours, values, v)
    @path_temp[@shptr] = v
    @shptr += 1
    if @shptr < @n
      @visited[v] = true

      (0...@n).each do |u|
        next if !neighbours[v][u] || @visited[u]

        @dist_temp += values[v][u]
        tsp_rec(neighbours, values, u)
        @dist_temp -= values[v][u]
      end

      @visited[v] = false

    elsif neighbours[@v0][v]
      @dist_temp += values[v][@v0]

      if @dist_temp < @dist
        @dist = @dist_temp
        (0...@shptr).each { |i| @path[i] = @path_temp[i] }
      end
      @dist_temp -= values[v][@v0]
    end

    @shptr -= 1
    @path
  end
  tsp_rec(neighbours, values, @v0)
  @path
end

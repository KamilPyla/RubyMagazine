# frozen_string_literal: true

# 1. Metody powinna być w jakiejś klasie. Pojedyńcza metoda w pliku traci kontekst.
# 2. Nazwa zmiennej powinna mówić odrazu co ona przetrymuje. Jedno lub dwu literowe skróty są nieczytelne.

def tsp(neigh, val, first_edg)
  @visited = Array.new(val.size, false)
  @path = Array.new(val.size)
  @path_temp = Array.new(val.size)
  @dist = Float::INFINITY
  @shptr = 0
  @dist_temp = 0
  @n = neigh.size
  @v0 = first_edg
  tsp_rec(neigh, val, @v0)
end

def tsp_rec(neigh, val, edge)
  @path_temp[@shptr] = edge
  @shptr += 1
  if @shptr < @n
    @visited[edge] = true

    (0...@n).each do |u|
      next if !neigh[edge][u] || @visited[u]

      @dist_temp += val[edge][u]
      tsp_rec(neigh, val, u)
      @dist_temp -= val[edge][u]
    end

    @visited[edge] = false

  elsif neigh[@v0][edge]
    @dist_temp += val[edge][@v0]

    if @dist_temp < @dist
      @dist = @dist_temp
      (0...@shptr).each { |i| @path[i] = @path_temp[i] }
    end
    @dist_temp -= val[edge][@v0]
  end

  @shptr -= 1
  @path
end

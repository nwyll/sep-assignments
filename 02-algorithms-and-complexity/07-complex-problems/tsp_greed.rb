require_relative 'city.rb'

class TravelingSalesman
  attr_accessor :path

  def initialize
    @visited_cities = []
    @path = []
  end

  #Returns the nearest neigboring city for a given city
  def nearest_neighbor(current_city)
    neighbor_cities = current_city.neighbor_hash
    shortest_dist = neighbor_cities.values.max
    next_city = current_city

    neighbor_cities.each do |city, dist|
      next if @visited_cities.include?(city.name)
      if dist <= shortest_dist
        shortest_dist = dist
        next_city = city
      end
    end
    #return the next city to construct travel path
    next_city
  end

  #Return the path travering all cities until you get back to starting city
  def travel_path(start_city, path=[])
    if @visited_cities.include?(start_city.name)
      return path
    else
      @visited_cities << start_city.name
      path << start_city.name
      next_city = nearest_neighbor(start_city)
      travel_path(next_city, path)
    end
  end
end

class City
  attr_accessor :name, :neighbor_hash

  def initialize(name)
    @name = name
    @neighbor_hash = Hash.new()
  end
end

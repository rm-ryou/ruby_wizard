module Wizard::Edge
  def initialize
    super
    @edge_living = { west: "door", upstairs: "ladder" }
    @edge_garden = { east: "door" }
    @edge_attic  = { downstairs: "ladder" }
  end

  def describe_edge(place)
    msg = []
    get_instance_val("edge", place).each do |key, val|
      msg << "there is a " + val + " going " + key.to_s + " from here."
    end
    msg
  end

  def get_edge(place)
    get_instance_val("edge", place).keys
  end
end

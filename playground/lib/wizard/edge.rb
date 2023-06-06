module Wizard::Edge
  def initialize
    super
    @edge_living = { west: "door", upstairs: "ladder" }
    @edge_garden = { east: "door" }
    @edge_attic  = { downstairs: "ladder" }
  end

  def describe_edge(place)
    eval <<-END_OF_DEF
      msg = []
      @edge_#{place}.each do |key, val|
        msg << "there is a " + val + " going " + key.to_s + " from here."
      end
      msg
    END_OF_DEF
  end
end

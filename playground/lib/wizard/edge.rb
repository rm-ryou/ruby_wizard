module Wizard::Edge
  def initialize
    @living = { west: "door", upstairs: "ladder" }
    @garden = { east: "door" }
    @attic  = { downstairs: "ladder" }
  end

  def describe_edge(directioin, object)
    "there is a #{object} going #{directioin} from here."
  end
end

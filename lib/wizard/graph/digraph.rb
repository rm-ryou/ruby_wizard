module Wizard::Map
  class DiGraph < Wizard::Map::Graph

    def graph_png
      dot_png("digraph", :graph_dot)
    end

    def edges_dot
      ary = []
      @@edges.each do |key, connections|
        connections.each do |connection|
          ary << "#{dot_name(key.to_s)}->#{dot_name(connection[0])}[label=\"#{dot_label(connection[1..2])}\"];"
        end
      end
      ary
    end
  end
end


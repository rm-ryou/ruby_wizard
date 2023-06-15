module Wizard::Map
  class UndirectedGraph < Graph

    def graph_png
      dot_png("graph", :graph_dot)
    end

    def edges_dot
      ary = []
      @@edges.delete(:living_room)
      @@edges.each do |key, connections|
        connections.each do |connection|
          ary << "#{dot_name(key.to_s)}--#{dot_name(connection[0])}[label=\"#{dot_label(connection[1..2])}\"];"
        end
      end
      ary
    end
  end
end

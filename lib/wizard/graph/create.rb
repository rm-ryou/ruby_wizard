module Wizard
  module Graph
    class Create
      MAX_LABEL_LENGTH = 30

      def initialize
        # TODO moduleから持ってきてそれを使う
        @nodes = { living_room: "you are in the living-room.\na wizard is snoring loudly on the couch.",
                   garden:      "you are in a beautiful garden.\nthere is a well in front of you.",
                   attic:       "you are in the attic.\nthere is a giang welding torch in the corner." }
        @edges = { living_room: [%w(garden west door), %w(attic upstairs ladder)],
                   garden:      [%w(living-room east door)],
                   attic:       [%w(living-room downstairs ladder)] }
        # p nodes_dot
        # edges_dot.each do |val|
        #   puts val
        # end
      end

      # 無向グラフ
      def ugraph_png
        dot_png("ugraph", :ugraph_dot)
      end

      # 有向グラフ
      def graph_png
        dot_png("graph", :graph_dot)
      end

      def dot_png(fname, thunk)
        File.open(fname, "w") do |f|
          f.write self.send thunk
        end
        `neato -Tpng -O #{fname} && rm #{fname}`
      end

      def dot_label(exp)
        if exp[1].size > MAX_LABEL_LENGTH
          exp.join(' (').upcase.slice(/\A.{,#{MAX_LABEL_LENGTH - 3}}/m) + "..."
        else
          "(#{exp.join(' ').upcase})"
        end
      end

      def dot_name(exp)
        exp.gsub(/[^\w\s]/, '_').upcase
      end

      def nodes_dot
        @nodes.map { |key, val| "#{dot_name(key.to_s)}[label=\"#{dot_label([key.to_s, val])}\"];" }
      end

      def edges_dot
        ary = []
        @edges.each do |key, connections|
          connections.each do |connection|
            ary << "#{dot_name(key.to_s)}->#{dot_name(connection[0])}[label=\"#{dot_label(connection[1..2])}\"];"
          end
        end
        ary
      end

      def graph_dot
        return <<~EOF
          digraph {
            #{nodes_dot.join("\n")}
            #{edges_dot.join("\n")}
          }
        EOF
      end

      def uedges_dot
        ary = []
        @edges.delete(:living_room)
        @edges.each do |key, connections|
          connections.each do |connection|
            ary << "#{dot_name(key.to_s)}--#{dot_name(connection[0])}[label=\"#{dot_label(connection[1..2])}\"];"
          end
        end
        ary
      end

      def ugraph_dot
        return <<~EOF
          graph{
            #{nodes_dot.join("\n")}
            #{uedges_dot.join("\n")}
          }
        EOF
      end
        

      # private

      # def set_nodes
      #   @nodes ||= {}
      #   instance_variables.each do |val|
      #     if val.match(/location_/)
      #       @nodes[val.to_s.gsub("@location_", '')] = instance_variable_get(val)
      #     end
      #   end
      # end

      # def set_edges
      #   @edges ||= {}
      #   instance_variables.each do |val|
      #     if val.match(/edge_/)
      #       @edges[val.to_s.gsub("@edge_", '')] = instance_variable_get(val)
      #     end
      #   end
      # end

    end
  end
end

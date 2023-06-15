module Wizard
  module Map
    class Graph
      MAX_LABEL_LENGTH = 30

      def initialize
        # TODO moduleから持ってきてそれを使う
        @@nodes = { living_room: "you are in the living-room.\na wizard is snoring loudly on the couch.",
                    garden:      "you are in a beautiful garden.\nthere is a well in front of you.",
                    attic:       "you are in the attic.\nthere is a giang welding torch in the corner." }
        @@edges = { living_room: [%w(garden west door), %w(attic upstairs ladder)],
                    garden:      [%w(living-room east door)],
                    attic:       [%w(living-room downstairs ladder)] }
      end

      private

      def dot_png(fname, thunk)
        File.open(fname, "w") do |f|
          f.write self.send thunk, fname
        end
        `dot -Tpng -O #{fname} && rm #{fname}`
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
        @@nodes.map { |key, val| "#{dot_name(key.to_s)}[label=\"#{dot_label([key.to_s, val])}\"];" }
      end

      def graph_dot(graph_type)
        return <<~EOF
          #{graph_type} {
            #{nodes_dot.join("\n")}
            #{edges_dot.join("\n")}
          }
        EOF
      end
    end
  end
end


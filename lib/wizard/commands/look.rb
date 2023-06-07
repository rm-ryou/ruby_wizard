module Wizard::Commands
  class Look < Wizard::Commands::Command
    attr_accessor :option

    def initialize
      super
    end

    def exec
      return "No option are included in this command." if !!@option
      msg = []
      msg << describe_location(@@cur_location) <<
        describe_object(@@cur_location) <<
        describe_edge(@@cur_location)
      msg.join("\n")
    end
  end
end

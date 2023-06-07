module Wizard::Commands
  class Inventory < Wizard::Commands::Command
    attr_accessor :option

    def initialize
      super
    end

    def exec
      return "No option are included in this command." if !!@option
      "items: #{@@items}"
    end
  end
end

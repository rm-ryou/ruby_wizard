module Wizard::Commands
  class Command
    include Wizard::Location
    include Wizard::Object
    include Wizard::Edge
    include Wizard::ConnectPlace

    attr_accessor :cur_location
    @@cur_location = :living
    @@items = []

    def initialize
      super
    end

  end
end


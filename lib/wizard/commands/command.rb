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

    def get_instance_val(name, place)
      instance_variable_get("@#{name}_#{place}")
    end
  end
end


module Wizard::Object
  def initialize
    @living = %w(whiskey bucket)
    @garden = %w(chain frog)
  end

  def describe_object(object)
    "you see a #{object} on the floor."
  end
end

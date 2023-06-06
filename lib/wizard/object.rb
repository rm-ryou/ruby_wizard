module Wizard::Object
  def initialize
    super
    @object_living = %w(whiskey bucket)
    @object_garden = %w(chain frog)
  end

  def describe_object(place)
    eval <<-END_OF_DEF
      msg = []
      return msg if !@object_#{place}
      @object_#{place}.each do |val|
        msg << "you see a " + val + " on the floor."
      end
      msg
    END_OF_DEF
  end

  def get_objects(place)
    eval <<-END_OF_DEF
      return @object_#{place} || []
    END_OF_DEF
  end
end

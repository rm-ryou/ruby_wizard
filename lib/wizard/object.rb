module Wizard::Object
  def initialize
    super
    @object_living = %w(whiskey bucket)
    @object_garden = %w(chain frog)
  end

  def describe_object(place)
    objects = get_instance_val("object", place)
    msg = []
    return msg unless objects
    objects.each do |object|
      msg << "you see a " + object + " on the floor."
    end
    msg
  end

  def get_objects(place)
    get_instance_val("object", place) || []
  end
end

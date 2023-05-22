class Player
  attr_reader :items
  attr_accessor :current_place

  def initialize
    @current_place = 'living'
    @items = []
  end

  def get_items
    @items
  end

  def set_items(value)
    @items.push(value)
  end

  def has_item?
    return true if @items.size > 0
  end
end

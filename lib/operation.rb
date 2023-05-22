class Operation

  def initialize(scene_file, object_file, edge_file, help_file)
    @scenery = data_loader.get_content(scene_file)
    @objects = data_loader.get_content(object_file)
    @edge = data_loader.get_content(edge_file)
    @help = data_loader.get_content(help_file)
    help(nil)
  end

  private

  def player
    @player ||= Player.new
  end

  def data_loader
    @data_loader ||= DataLoader.new
  end

  def look(option)
    if option
      return puts "invalid option."
    end
    puts @scenery[player.current_place].upcase
    @objects[player.current_place]&.each do |obj|
      puts "YOU SEE A #{obj} ON THE FLLOR"
    end
    direction, obj = get_path
    direction.size.times do |i|
      puts "THERE IS A #{obj[i]} GOING #{direction[i]} FROM HERE."
    end
  end

  def walk(option)
    puts @edge[player.current_place]
    puts option
  end

  def get_path
    direction, obj = [], []
    @edge[player.current_place].each do |str|
      tmp_direction, tmp_obj = str.chomp.split(' ').map(&:to_s)
      direction.push(tmp_direction)
      obj.push(tmp_obj)
    end
    return direction, obj
  end

  def pickup(option)
    puts @objects[player.current_place]
    puts option
  end

  def inventory(option)
    if option
      return puts "invalid option"
    end
    if player.has_item?
      puts player.get_items
    else
      puts "No items."
    end
  end

  def help(option)
    if option
      return puts "invalid option"
    end
    puts @help
  end
end


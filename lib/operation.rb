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
    puts @scenery[player.current_place].upcase
  end

  def walk(option)
    puts option
  end

  def pickup(option)
    puts option
  end

  def inventory(option)
    if player.has_item?
      puts player.get_items
    else
      puts "No items."
    end
  end

  def help(option)
    puts @help
  end
end

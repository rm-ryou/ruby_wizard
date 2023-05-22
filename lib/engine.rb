class Engine
  # attr_reader :help

  def initialize(scene_file, object_file, edge_file, help_file)
    @operator = Operation.new(scene_file, object_file, edge_file, help_file)
    # @scenery = data_loader.get_content(scene_file)
    # @objects = data_loader.get_content(object_file)
    # @edge = data_loader.get_content(edge_file)
    # @help = data_loader.get_content(help_file)
  end

  def exec_operation(command, option)
    if command && @operator.respond_to?(command, true)
      @operator.send command, option
    elsif command == 'quit'
      exit
    else
      puts "invalid command"
    end
  end
end

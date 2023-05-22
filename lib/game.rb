class Game
  def game
    loop do
      line = get_input
      puts line
    end
  end

  private

  def get_input
    stty_save = `stty -g`.chomp
    begin
      Readline.readline("> ", true)
    rescue Interrupt
      system("sttry", stty_save)
      exit
    end
  end
end

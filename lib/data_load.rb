class DataLoad

  def load(file)
    File.open("#{file}", 'r') do |f|
      puts f.read
    end
  end
end

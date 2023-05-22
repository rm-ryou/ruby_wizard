require 'json'

class DataLoader
  def get_content(file)
    DataLoader.send "get_info_#{get_ext(file)}", read_file(file)
  end

  private

  class << self
    def get_info_json(contents)
      JSON.load(contents)
    end

    def get_info_txt(contents)
      contents
    end
  end

  def get_ext(file)
    File.extname("#{file}").delete!('.')
  end

  def get_file_prefix(file)
    File.basename("#{file}", ".*")
  end

  def read_file(file)
    str = ''
    File.open("#{file}", 'r') do |f|
      str += f.read
    end
  end
end

require 'test/unit'

class TestDataLoad < Test::Unit::TestCase
  def test_check_ext
    assert_equal 'json', check_ext('hoge.json')
  end
end

require 'readline'

$LOAD_PATH.unshift File.join(__dir__, 'lib')
$LOAD_PATH.unshift File.join(__dir__, 'data')

require 'game'
require 'validation'
require 'engine'
require 'data_loader'
require 'player'
require 'operation'

PREFIX = '/Users/ryo.moriya/dev/languages/ruby_wizard/data/'

engine = Engine.new("#{PREFIX}scene.json", "#{PREFIX}object.json", "#{PREFIX}edge.json", "#{PREFIX}help.txt")
game = Game.new(engine)
game.start


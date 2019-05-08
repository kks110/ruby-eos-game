
# Set the APP_ROOT var to equal to the dir of this file.
# This means we can use this to get absolute routes for files we require.

APP_ROOT = File.dirname(__FILE__)

# Adding folders to the $: array.
$LOAD_PATH.unshift(File.join(APP_ROOT, 'lib'))
$LOAD_PATH.unshift(File.join(APP_ROOT, 'lib', 'levels'))
$LOAD_PATH.unshift(File.join(APP_ROOT, 'save_games'))

require 'game_runner'

# Start the game.
GameRunner.run!

puts 'end'

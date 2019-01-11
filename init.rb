
# Set the APP_ROOT var to equal to the dir of this file. This means we can use this to get absolute routes for files we require.
APP_ROOT = File.dirname(__FILE__)

# $: is a ruby var that contains an array of folders that ruby will look in when requiring.
# .unshift will add to the array, then we add the path of the folder.
$:.unshift( File.join(APP_ROOT, 'lib') )
$:.unshift( File.join(APP_ROOT, 'lib', 'levels') )
require 'character'
require 'forest'


player = Character.new

Forest.wakeup(player.name)
forest_decision = Forest.decision

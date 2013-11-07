require 'minitest/autorun'
require 'minitest/colorize'
require 'minitest/spec'

# Always use local CodeFellowsBot first
this_dir = File.join(File.dirname(__FILE__), "..")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "codefellowsbot"

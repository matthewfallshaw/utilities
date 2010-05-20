#!/usr/bin/env ruby
require 'optparse'

options = {}
OptionParser.new do |options|
  options.banner = "Usage: #{File.basename($0)} [options] ARGS"

  options.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  options.on('-h', "this help text") { puts options; exit }
end.parse!

if ARGV.empty?; puts options; exit; end

p options
p ARGV

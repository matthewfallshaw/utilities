#!/usr/bin/env ruby
require 'optparse'

file = __FILE__
file = File.expand_path(File.readlink(file), File.dirname(file)) while File.symlink?(file)
require File.join(File.dirname(file), 'lib/merger')

opts = OptionParser.new do |o|
  o.banner = "Usage: #{File.basename($0)} OUTPUTFILE INPUTFILE...\n" +
    "Concatenate (join) several mp3 INPUTFILEs into one OUTPUTFILE."
  o.on('-h', "this help text") { puts o; exit }
  o.parse!
end

if ARGV.empty?
  puts opts
  exit
end

m = Merger.new(ARGV.first, ARGV[1..-1])
m.merge

#!/usr/bin/env ruby

file = __FILE__
file = File.expand_path(File.readlink(file), File.dirname(file)) while File.symlink?(file)
require File.join(File.dirname(file), 'lib/merger')

m = Merger.new(ARGV.first, ARGV[1..-1])
m.merge

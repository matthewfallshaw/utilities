#!/usr/bin/env ruby

require 'fileutils'

source_file = ARGV[0]
dest_file = ARGV[1]

dest_dir = File.dirname(dest_file)
Dir.chdir(dest_dir)
dest_dir_parts = dest_dir.split('/')
source_dir_parts = File.dirname(source_file).split('/')

while source_dir_parts.first == dest_dir_parts.first do
  source_dir_parts.shift
  dest_dir_parts.shift
end

relative_path = File.join('../' * dest_dir_parts.size, source_dir_parts, File.basename(source_file))
FileUtils.ln_s(relative_path, dest_file)

#!/usr/bin/env ruby

require 'fileutils'
Dir.chdir File.dirname(__FILE__) do
  actions_dir = File.expand_path('~') + "/Library/Application\ Support/Quicksilver/Actions/"
  FileUtils.mkdir_p(actions_dir)
  FileUtils.cp Dir['*.scpt'], actions_dir
end

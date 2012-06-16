#!/usr/bin/env ruby
begin
  require_relative 'lib/diskmonitor'
rescue
  file = __FILE__
  file = File.expand_path(File.readlink(file), File.dirname(file)) while File.symlink?(file)
  require File.join(File.dirname(file), "lib", "diskmonitor")
end

require 'optparse'

if File.basename($0).match(/^reportproblematicdrives/)
  action = :mail_problematic_drives
else
  action = nil
end

opts = OptionParser.new do |opts|

  opts.banner = "Usage: #$0 [OPTION]... report"
  opts.separator "Monitor and report disk problems before they occur."
  opts.separator ""
  opts.separator "Specific options:"
  opts.on("-e", "--email", String, "Mail report to who (default to the user running the command).") do |e|
    DiskMonitor.email_address = e
  end
  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

  begin
    opts.parse!(ARGV)

    ARGV.each do |action|
      case action
      when "report"
        action = :mail_problematic_drives
      else
        STDERR.puts "Unknown action: #{action}"
        STDERR.puts
        STDERR.puts opts
        exit 1
      end
    end

    case action
    when :mail_problematic_drives
      puts "Checking drives..."
      DiskMonitor.mail_problematic_drives
    else
      puts opts
      exit 0
    end

  rescue OptionParser::InvalidOption => e
    $stderr.puts e.message
    $stderr.puts
    $stderr.puts opts
    exit
  end
end

#!/usr/bin/env ruby

file = __FILE__
file = File.expand_path(File.readlink(file), File.dirname(file)) while File.symlink?(file)
require File.join(File.dirname(file), "lib", "diskmonitor")

require 'optparse'

if File.basename($0).match(/^reportproblematicdrives/)
  action = :email
else  # default action
  action = :email
end

opts = OptionParser.new do |opts|

  opts.banner = "Report on disk problems."
  opts.separator "Usage: #$0 [options...] [ACTION]"
  opts.separator "  ACTION: currently only 'email' (default: email)"
  opts.on("-e", "--email", String, "Mail report here, rather than the user running the command.") do |e|
    DiskMonitor.email_address = e
  end
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end

  begin
    opts.parse!(ARGV)

    ARGV.each do |arg|
      case arg
      when "email", "report"  # 'report' for backwards compatibility
        action = :email
      else
        STDERR.puts "#$0: unknown ACTION -- #{arg}"
        STDERR.puts opts
        exit false
      end
    end

    case action
    when :email
      puts "Checking drives..."
      DiskMonitor.mail_problematic_drives
    else
      STDERR.puts "#$0: missing ACTION"
      STDERR.puts opts
      exit false
    end

  rescue OptionParser::InvalidOption => e
    $stderr.puts e.message
    $stderr.puts opts
    exit false
  end
end

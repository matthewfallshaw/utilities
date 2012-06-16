#!/usr/bin/env ruby
begin
  require_relative 'lib/diskmonitor'
rescue
  require File.join(File.dirname(__FILE__), "lib", "diskmonitor")
end

DiskMonitor.mail_problematic_drives

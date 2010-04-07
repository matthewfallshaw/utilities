#!/usr/bin/env ruby
require 'fileutils'
log_files = `ssh backup.trike.com.au 'ls /srv/backup/systems/**/srv/www/**/shared/log/*.log*'`.split
systems_with_logs = log_files.collect {|f| f[%r#/srv/backup/systems/([^/]+)#, 1] }.uniq
systems_with_logs.each do |system|
  system_path = File.expand_path("~/log/systems/#{system}")
  FileUtils.mkdir_p(system_path)
  `rsync backup.trike.com.au:/srv/backup/systems/#{system}/srv/www/**/shared/log/* #{system_path}/ 2> /dev/null`
end

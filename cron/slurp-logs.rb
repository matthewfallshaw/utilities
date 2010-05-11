#!/usr/bin/env ruby
require 'fileutils'
log_files = `ssh hq.trike.com.au ssh backup.trike.com.au 'ls /srv/backup/systems/**/srv/www/**/shared/log/*.log*'`.split
systems_with_logs = log_files.collect {|f| f[%r#/srv/backup/systems/([^/]+)#, 1] }.uniq
results = systems_with_logs.collect do |system|
  system_path = File.expand_path("~/log/systems/#{system}")
  FileUtils.mkdir_p(system_path)
  `rsync -e "ssh hq.trike.com.au ssh" backup.trike.com.au:/srv/backup/systems/#{system}/srv/www/**/shared/log/*.log* #{system_path}/ 2>&1`
end
results = results.reject {|r| r.empty? }
if results.empty?
  return 0
else
  abort "Erm… #{results.inspect}"
end

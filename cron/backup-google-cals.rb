#!/usr/bin/env ruby
require 'yaml'

cals = YAML.load(File.open(File.expand_path("~/.dotfiles_secrets")))["calendars"]

Dir.chdir(File.expand_path("~/GDrive Personal/archive/calendars/"))

# Backup
threads = []
cals.each do |file, addr|
  threads << Thread.new(file, addr) do |f, a|
    `/usr/local/bin/wget --quiet http://www.google.com/calendar/ical/#{a} -O #{f}.ics`
  end
end
threads.each { |t| t.join }

def weekday?
  not %w[Sat Sun].include?(Time.now.strftime("%a"))
end
def old?(file)
  (Time.now - file.mtime) > (3 * 24 * 60 * 60)
end

# Check that the check is happening
require 'pathname'
checkfile = Pathname.new("ics-checked")
if not(checkfile.exist?) || (weekday? && old?(checkfile))
  if checkfile.exist?
    warn "Problem: Calendar backup script ran okay, but the script that checks that this script is running hasn't run for #{((Time.now - checkfile.mtime) / (60*60*24)).round(0)} days."
  else
    warn "Problem: Calendar backup script ran okay, but I can't find the file that should be left by the script that checks that this script is running, which may indicate that the check script isn't running"
  end
else
  system 'curl -d "m=ran without issues at $(date)" https://nosnch.in/d7533ba1ca &> /dev/null'
end

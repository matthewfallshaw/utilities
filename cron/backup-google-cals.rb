#!/usr/bin/env ruby
require 'yaml'

cals = YAML.load(File.open(File.expand_path("~/.dotfiles_secrets")))["calendars"]

Dir.chdir(File.expand_path("~/Dropbox/Archive/calendars"))

# Backup
threads = []
cals.each do |file, addr|
  threads << Thread.new(file, addr) do |file, addr|
    `wget --quiet http://www.google.com/calendar/ical/#{addr} -O #{file}.ics`
  end
end
threads.each { |t| t.join }

# Check that the check is happening

def weekday?
  %w[Sat Sun].include?(Time.now.strftime("%a"))
end
def old?(file)
  (Time.now - file.mtime) > (2 * 24 * 60 * 60)
end

require 'pathname'
checkfile = Pathname.new("ics-checked")
if not(checkfile.exist?) || (weekday? && old?(checkfile))
  require 'rubygems'; require 'action_view'; include ActionView::Helpers::DateHelper
  if checkfile.exist?
    warn "Problem: iCal backup script ran okay, but the script that checks that this script is running hasn't run for #{distance_of_time_in_words_to_now(checkfile.mtime)}"
  else
    warn "Problem: iCal backup script ran okay, but I can't find the file that should be left by the script that checks that this script is running, which may indicate that the check script isn't running"
  end
end

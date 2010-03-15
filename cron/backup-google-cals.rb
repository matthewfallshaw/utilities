#!/usr/bin/env ruby
Dir.chdir("/Users/matt/Dropbox/Archive")

# Backup
threads = []
[
%w[matthewfallshaw matthew.fallshaw%40gmail.com/private-498f1b544e3bc3cef0b79fd518788d65/basic.ics],
%w[investling      gvjvijca7f17u6gooad1880940%40group.calendar.google.com/private-427ab63f74e186d04db3b6549e4f7231/basic.ics],
%w[trikeit         5o40b9riv84niiuii69hh893t8%40group.calendar.google.com/private-63ea807d17fafff496d48d927ea268a4/basic.ics],
%w[trikeitshared   dnv17juvgme52i520fj9pahf6g%40group.calendar.google.com/private-5ecb23fc0789d0990e701d8692927f36/basic.ics],
%w[trikemtgrm      fjch0inl5i4uqjs8t1kvqaoduk%40group.calendar.google.com/private-f716d7754e07965b8fe68912ba7a9917/basic.ics],
].each do |file, addr|
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

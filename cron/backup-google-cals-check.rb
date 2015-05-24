#!/usr/bin/env ruby
require 'yaml'

cals = YAML.load(File.open(File.expand_path("~/.dotfiles_secrets")))["calendars"].collect {|c| c.first }

Dir.chdir("/Users/matt/Dropbox/Archive/calendars")

def weekday?
  not %w[Sat Sun].include?(Time.now.strftime("%a"))
end
def old?(file)
  (Time.now - File.mtime(file)) > (3 * 24 * 60 * 60)
end

`date > ics-checked`
cals.collect {|f| "#{f}.ics"}.each do |file|
  if weekday? && old?(file)
    abort "Problem: the Calendar backup script hasn't updated #{file} for #{((Time.now - File.mtime(file)) / (60*60*24)).round(0)} days."
  end
end

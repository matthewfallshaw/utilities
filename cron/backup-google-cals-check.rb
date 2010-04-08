#!/usr/bin/env ruby
Dir.chdir("/Users/matt/Dropbox/Archive/calendars")

def weekday?
  not %w[Sat Sun].include?(Time.now.strftime("%a"))
end
def old?(file)
  (Time.now - File.mtime(file)) > (2 * 24 * 60 * 60)
end

`date > ics-checked`
%w[matthewfallshaw investling trikeit trikeitshared trikemtgrm].collect {|f| "#{f}.ics"}.each do |file|
  if weekday? && old?(file)
    require 'rubygems'; require 'action_view'; include ActionView::Helpers::DateHelper
    abort "Problem: the iCal backup script hasn't updated #{file} for #{distance_of_time_in_words_to_now(File.mtime(file))}"
  end
end

#!/usr/bin/env ruby
Dir.chdir("/Users/matt/Dropbox/Archive")

`touch ics-checked`
%w[matthewfallshaw investling trikeit trikeitshared trikemtgrm].collect {|f| "#{f}.ics"}.each do |file|
  if (Time.now - File.mtime(file)) > (2 * 24 * 60 * 60)
    require 'rubygems'; require 'action_view'; include ActionView::Helpers::DateHelper
    abort "Problem: the iCal backup script hasn't updated #{file} for #{distance_of_time_in_words_to_now(File.mtime(file))}"
  end
end

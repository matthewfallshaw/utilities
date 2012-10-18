#!/usr/bin/env ruby

threads = []
Dir["*.mp3"].each do |sound|
  threads << Thread.new(sound) do |asound|
    sleep(rand * 3)
    system("afplay '#{asound}'")
  end
end

threads.each {|t| t.join }

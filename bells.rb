#!/usr/bin/env ruby

def bells
  %w[*.mp3 ~/Sounds/*Bell*.mp3].each do |g|
    if not(Dir[File.expand_path(g)].empty?)
      return Dir[File.expand_path(g)]
    end
  end
  raise "Can't find any bells to ring."
end

current_vol = `osascript -e 'get output volume of (get volume settings)'`.chomp.to_i
begin
  system('osascript -e "set volume output volume 20"')
  threads = []
  bells.each do |sound|
    threads << Thread.new(sound) do |asound|
      sleep(rand * 3)
      system("afplay '#{asound}'")
    end
  end

  threads.each {|t| t.join }
ensure
  system("osascript -e 'set volume output volume #{current_vol}'")
end

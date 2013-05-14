#!/usr/bin/env ruby

VOLUME = 15

current_vol = `osascript -e 'get output volume of (get volume settings)'`.chomp.to_i
begin
  system("osascript -e 'set volume output volume #{VOLUME}'")
  system("say #{ARGV.join(" ")}")
ensure
  system("osascript -e 'set volume output volume #{current_vol}'")
end


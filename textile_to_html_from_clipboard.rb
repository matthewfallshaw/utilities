#!/usr/bin/env ruby

# Convert the contents of the clipboard to html (with
# RedCloth[http://whytheluckystiff.net/ruby/redcloth/], so assuming it's
# Textile or Markdown) and send it to STDOUT (I use this from an AppleScript
# TextExpander[http://smileonmymac.com/TextExpander/] snippet).

%w[rubygems redcloth].each {|l| require l }

clipboard = `pbpaste`.strip
textiled = RedCloth.new(clipboard).to_html
textiled = textiled[3..-1] if textiled[0..2] == "<p>"
textiled = textiled[0..-5] if textiled[-4..-1] == "</p>"
puts textiled

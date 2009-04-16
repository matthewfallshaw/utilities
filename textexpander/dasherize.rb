#!/usr/bin/env ruby
# Dasherize the clipboard on osx - I trigger this from http://www.smileonmymac.com/TextExpander/

clipboard = `pbpaste`  # OSX dependency

print clipboard.gsub(/\W/,'-').gsub(/-+/,'-')


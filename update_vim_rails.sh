#!/usr/bin/env ruby -w
PRJDIR = File.expand_path("~/utils/vim-rails")

if File.exist?(PRJDIR) 
  puts `cd #{PRJDIR}; git pull`
else
  puts `git clone git://git.tpope.net/vim-rails.git #{PRJDIR}`
end
puts "exporting autoload/rails.vim: " + `cp -r #{PRJDIR}/autoload/rails.vim ~/.vim/autoload/`
puts "exporting plugin/rails.vim: " + `cp -r #{PRJDIR}/plugin/rails.vim ~/.vim/plugin/`
puts "exporting doc/rails.txt: " + `cp -r #{PRJDIR}/doc/rails.txt ~/.vim/doc/`

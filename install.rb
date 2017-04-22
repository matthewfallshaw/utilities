#!/usr/bin/env ruby

require 'rake'
app = Rake.application
app.init
app.load_rakefile
app['default'].invoke

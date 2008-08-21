#!/usr/bin/env ruby -w
# == Synopsis
#
# Runs a user-defined command when files are modified.
#
# Like autotest, but more customizable. This is useful when you want to do
# something other than run tests. For example, generate a PDF book, run
# a single test, or run a legacy Test::Unit suite in an app that also
# has an rSpec suite.
#
# Can use Ruby's Dir[] to get file glob. Quote your args to take advantage of this.
#
# == Usage
# 
#   rstakeout command file [...]
#
# command::
#   command to run when files change
#
# file::
#   file or file glob to watch
#
# == Examples
#
#  rstakeout 'rake test:recent' **/*.rb
#  => Only watches Ruby files one directory down (no quotes)
#
#  rstakeout 'rake test:recent' '**/*.rb'
#  => Watches all Ruby files in all directories and subdirectories
#
# == Authors
#
# Originally by Mike Clark.
# From http://www.pragmaticautomation.com/cgi-bin/pragauto.cgi/Monitor/StakingOutFileChanges.rdoc
#
# Modified (with permission) by Geoffrey Grosenbach to call growlnotify for
# rspec and Test::Unit output.
#
# Modified (without permission, but with much rrrrespect) by Matthew Fallshaw,
# just to, you know, touch it, and get to know it, and make it spit a usage string.
#
# == See also
#
# See the PeepCode screencast on rSpec or other blog articles for instructions on
# setting up growlnotify.

class Peeper

  def growl(title, msg, img, pri=0, sticky="")
    system "growlnotify -n autotest --image ~/.autotest_images/#{img} -p #{pri} -m #{msg.inspect} #{title} #{sticky}"
  end

  def growl_fail(output)
    growl "FAIL", "#{output}", "fail.png", 2
  end

  def growl_pass(output)
    # You don't want to be interrupted by a pass. These aren't the droids you're looking for.
    # growl "Pass", "#{output}", "pass.png"
  end

  def initialize(command, list_of_targets)
    @command, @targets = nil, {}
    self.command = command
    self.targets = list_of_targets
  end

  attr_accessor :command

  attr_reader :targets
  def targets=(list)
    if list.is_a?(Hash)
      @targets = list
    elsif list.is_a?(Array)
      list.each do |item|
        Dir[item].each { |file|
          @targets[file] = File.mtime(file)
        }
      end
    else
      raise ArgumentError, "Expecting an Array or a Hash"
    end
  end

  def watch
    puts "Watching #{targets.keys.join(', ')}\n\nFiles: #{targets.keys.length}"

    add_sigint_handler

    loop do
      sleep 1

      changed_file, last_changed = targets.find do |file, last_changed|
        File.mtime(file) > last_changed
      end

      if changed_file || interrupted
        self.interrupted = false
        results = run_command(changed_file || :interrupted)
        whine(results)
        puts "=> done"
      end
    end

    puts "\nQuitting..."
  end

  attr_accessor :interrupted
  def add_sigint_handler
    trap('INT') do
      if interrupted then
        puts "\nQuitting..."
        exit
      else
        puts "Interrupt a second time to quit"
        self.interrupted = true
        Kernel.sleep 1.5
      end

    end
  end

  def run_command(changed_file)
    if changed_file == :interrupted
      puts "=> you poked me, running #{command}"
    else
      targets[changed_file] = File.mtime(changed_file)
      puts "=> #{changed_file} changed, running #{command}"
    end
    results = `#{command}`
    puts results
    results
  end

  def whine(results)
    if results.include? 'tests'
      output = results.slice(/(\d+)\s+tests?,\s*(\d+)\s+assertions?,\s*(\d+)\s+failures?(,\s*(\d+)\s+errors)?/)
      if output
        $~[3].to_i + $~[5].to_i > 0 ? growl_fail(output) : growl_pass(output)
      end
    else
      output = results.slice(/(\d+)\s+examples?,\s*(\d+)\s+failures?(,\s*(\d+)\s+not implemented)?/)
      if output
        $~[2].to_i > 0 ? growl_fail(output) : growl_pass(output)
      end
    end
    # TODO Generic growl notification for other actions
  end
end

require 'optparse'
require 'rdoc/usage'

opts = OptionParser.new
opts.on("-h", "--help") { RDoc::usage('Usage') }
opts.parse(ARGV) rescue RDoc::usage('Usage')

peeper = Peeper.new(ARGV.first, ARGV[1..-1])
peeper.watch

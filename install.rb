#!/usr/bin/env ruby

# (originally) from http://errtheblog.com/posts/89-huba-huba
# (I took this from git://github.com/mislav/dotfiles.git)
# modified to support secrets appended after install
#   secrets in ~/.dotfiles_secrets like
#   gitconfig:
#     "search_term": replace_term
#     "other_search_term": other_replace_term

%w[shellwords rubygems rake yaml].each {|l| require l }

BINDIR = File.expand_path(File.join(ENV["HOME"], "bin"))
SOURCEDIR = File.expand_path(File.join(File.dirname(__FILE__)))
SECRETS = File.expand_path('~/.dotfiles_secrets')

def bin_file(file)
  File.join(BINDIR, File.basename(file))
end
def source_file(file)
  File.join(SOURCEDIR, File.basename(file))
end

def replace_file(file)
  system %Q[rm "#{bin_file}"] if File.exist?(bin_file(file))
  link_file(file)
end
 
def link_file(file)
  system %Q{ln -s "#{source_file(file)}" "#{bin_file(file)}"}
  puts "#{bin_file(file)}: linked"
end

def copy_and_replace_secrets(file)
  system %[cp "#{source_file(file)}" "#{bin_file(file)}"]
  secrets[file].each do |search_term, replace_term|
    system %[ruby -pi -e 'gsub(/#{search_term.shellescape}/, "#{replace_term.shellescape}")' "#{bin_file(file)}"]
  end
  puts "#{bin_file(file)}: copied and updated with secrets"
end

def secrets
  @secrets ||= YAML.load(open(SECRETS))
end

def file_exists_as_source(file)
  File.exist?(source_file(file))
end
def file_is_symlink_pointing_here(file)
  File.symlink?(bin_file(file)) &&
    File.dirname(File.expand_path(File.readlink(bin_file(file)))) == SOURCEDIR &&
    file_exists_as_source(file)
end
def file_should_be_replaced(file)
  secrets[file] &&
    File.exist?(source_file(file)) &&
    File.exist?(bin_file(file))
end

def process(file)
  if secrets[file]
    copy_and_replace_secrets(file)
  elsif File.symlink?(bin_file(file)) && (File.readlink(bin_file(file)) == source_file(file))
    puts "#{bin_file(file)}: already correctly linked"
  elsif replace_all
    replace_file(file)
  elsif File.exist?(bin_file(file))
    print "overwrite #{bin_file(file)}? [ynaq] "
    case $stdin.gets.chomp
    when 'a'
      replace_all = true
      replace_file(file)
    when 'y'
      replace_file(file)
    when 'q'
      exit
    else
      puts "#{bin_file(file)}: skipped"
    end
  else
    link_file(file)
  end
end

replace_all = false
did_something = false
if ARGV.empty?
  Dir.chdir(File.dirname(__FILE__)) do
    Dir[File.join(BINDIR,'/*')].each do |file|
      file = File.basename(file)
      next unless (file_is_symlink_pointing_here(file) || file_should_be_replaced(file))

      did_something = true
      process(file)
    end
  end
  puts "I couldn't find anything to do." unless did_something
else
  ARGV.each do |file|
    file = File.basename(file)
    next unless file_exists_as_source(file)

    did_something = true
    process(file)
  end
end

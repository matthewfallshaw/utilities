#!/usr/bin/env ruby

# (originally) from http://errtheblog.com/posts/89-huba-huba
# (I took this from git://github.com/mislav/dotfiles.git)
# modified to support secrets appended after install
#   secrets in ~/.dotfiles_secrets like
#   filename:
#     "search_term": replace_term
#     "other_search_term": other_replace_term

%w[shellwords fileutils rubygems yaml].each {|l| require l }

IGNORE_LIST = %w[install.rb Rakefile README.textile vendor lib bin]
DESTDIR = File.expand_path("/Library/Scripts/Folder Action Scripts")
SOURCEDIR = File.dirname(__FILE__)
SECRETS = File.expand_path('~/.dotfiles_secrets')

def destfile(file)
  File.join(DESTDIR, file)
end
def sourcefile(file)
  File.join(SOURCEDIR, file)
end

def replace_file(file)
  FileUtils.rm(destfile(file)) if File.exist?(destfile(file))
  link_file(file)
end
 
def link_file(file)
  FileUtils.ln_s(sourcefile(file), destfile(file))
  puts "#{destfile(file)}: linked"
end

def copy_and_replace_secrets(file)
  FileUtils.rm(destfile(file)) if File.exist?(destfile(file))
  FileUtils.cp(sourcefile(file), destfile(file))
  secrets[file].each do |search_term, replace_term|
    system %[ruby -pi -e 'gsub(/#{search_term.shellescape}/, "#{replace_term.shellescape}")' "#{destfile(file)}"]
  end
  puts "#{destfile(file)}: copied and updated with secrets"
end

def secrets
  @secrets ||= begin
                 if File.exist?(SECRETS)
                   YAML.load(open(SECRETS))
                 else
                   warn <<-WARN
I can't find a ~/.dotfiles_secrets file... unless you're sure you don't have any secrets
  (and who can be sure of that?), this probably isn't going to work.
WARN
                   {}
                 end
               end
end

def file_is_symlink_pointing_here?(file)
  File.symlink?(destfile(file)) &&
    ( File.expand_path(File.readlink(destfile(file))) == File.expand_path(file) )
end

def process(file)
  if secrets[file]
    copy_and_replace_secrets(file)
  elsif file_is_symlink_pointing_here?(file)
    puts "#{destfile(file)}: already correctly linked"
  elsif @replace_all
    replace_file(file)
  elsif File.exist?(destfile(file))
    print "overwrite #{destfile(file)}? [ynaq] "
    case $stdin.gets.chomp
    when 'a'
      @replace_all = true
      replace_file(file)
    when 'y'
      replace_file(file)
    when 'q'
      exit
    else
      puts "#{destfile(file)}: skipped"
    end
  else
    link_file(file)
  end
end

@replace_all = false
if ARGV.empty?
  Dir.chdir(SOURCEDIR) do
    Dir['*'].each do |file|
      next if IGNORE_LIST.include?(file)

      process(file)
    end
  end
else
  ARGV.each do |file|
    if File.exist?(file)
      process(file)
    else
      puts "What is this #{file} of which you speak? I see it not."
    end
  end
end

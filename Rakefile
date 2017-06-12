%w[rubygems rake yaml].each {|l| require l }
 
BINDIR = File.expand_path("~/bin")
SOURCEDIR = File.expand_path(File.dirname(__FILE__))
SECRETS = File.expand_path('~/.dotfiles_secrets')

UTILS = Dir["shell/*"] + %w[
  audiobook-merge/audiobook-merge.rb
  ~/source/cronic/cronic
  ~/code/cronify/cronify
  diskmonitor/diskmonitor.rb
  ~/code/skype-pounce/skype_pounce.rb
].select {|f| File.exist?(f) }

def secrets
  @secrets ||= begin
                 path = File.expand_path('~/.dotfiles_secrets')
                 if File.exist?(path)
                   YAML.load(open(path))
                 else
                   {}
                 end
               end
end

task :default => :install

desc "Install utility scripts to #{BINDIR}
  secrets in ~/.dotfiles_secrets like
  filename:
    'search_term': replace_term
    'other_search_term': other_replace_term"
task :install

UTILS.each do |script|
  scriptfile_base = File.basename(script, ".*")
  scriptfile = File.expand_path(script)
  binfile = File.join(BINDIR, scriptfile_base)

  task install: scriptfile_base

  desc "file #{binfile} => #{script}"
  task scriptfile_base => binfile

  file binfile => scriptfile do
    puts "## #{script}"
    mkdir_p BINDIR
    rm binfile if File.exist?(binfile) || File.symlink?(binfile)
    if secrets[scriptfile_base]
      cp scriptfile, binfile
      system %Q{chmod u+x "#{binfile}"}
      secrets[scriptfile_base].each do |search_term, replace_term|
        system %[ruby -pi -e 'gsub(/#{Shellwords.escape(search_term)}/, "#{Shellwords.escape(replace_term)}")' "#{binfile}"]
      end
      puts "… and secrets replaced in #{script}"
    else
      ln_s scriptfile, binfile
      system %Q{chmod u+x "#{scriptfile}"}
    end
    puts
  end
end

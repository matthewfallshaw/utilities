require 'shellwords'
require 'pathname'

OUTPUTEXT = "m4a"

class Merger
  
  def initialize(name, *files)
    self.name = name
    self.files = files
    self
  end
  
  def name=(n)
    @name = n.sub(/\.(mp3|m4a|m4b)$/,'')
  end
  attr_reader :name
  
  def files=(list)
    @files = list.flatten.collect {|f| Pathname.new(f) }
    files_okay?
  end
  attr_reader :files
  
  def merge
    begin
      n = wrap(files)
      n = copy_tags(n)
      n = convert(n)
      rename_m4a_m4b(n)
    ensure
      cleanup
    end
  end
  
  def wrap(files)
    command("mp3wrap #{tempfile_path} '#{files.join("' '")}'")
    "#{tempfile_path.sub(/\.mp3$/,'')}_MP3WRAP.mp3"
  end
  
  def copy_tags(file)
    command("id3cp '#{files.first}' #{file}")
    file
  end
  
  def convert(file)
    command("ffmpeg -i #{file} '#{name}.#{OUTPUTEXT}'")
    "#{name}.#{OUTPUTEXT}"
  end

  def rename_m4a_m4b(file)
    command("mv '#{file}' '#{name}.m4b'")
    "#{name}.m4b"
  end
  
  def cleanup
    [tempfile_path, "#{tempfile_path.sub(/\.mp3$/,'')}_MP3WRAP.mp3"].each do |f|
      FileUtils.rm(f) if File.exist?(f)
      uf = unescape_filename(f)
      FileUtils.rm(uf) if File.exist?(uf)
    end
  end
  
  protected
  
  def command(cmd)
    puts cmd
    system cmd
  end
  
  def files_okay?
    missing_files = files.reject do |file|
      file.exist? && file.directory? == false && file.extname == ".mp3"
    end
    unless missing_files.empty?
      raise(ArgumentError, "Missing files: #{missing_files.inspect}")
    else
      true
    end
  end
  
  def safe_files
    files.collect { |f| escape_filename(f) }
  end
  
  def tempfile_path(ext = ".mp3")
    require 'tempfile'
    ext.sub!(/^\.?/,'.')
    @tempfile_path ||= escape_filename(Tempfile.new(["audiobookmerge", ext]).path)
  end

  def escape_filename(filename)
    filename.gsub(/(\W)/,'\\\\\1')
  end
  def unescape_filename(filename)
    filename.gsub(/\\/,'')
  end
end

class Merger
  
  def initialize(name, *files)
    self.name = name
    self.files = files.flatten
    self
  end
  
  def name=(n)
    @name = n.sub(/\.mp3$/,'')
  end
  attr_reader :name
  
  def files=(list)
    @files = list
    files_okay?
  end
  attr_reader :files
  
  def merge
    begin
      wrap
      convert
      copy_tags
    ensure
      cleanup
    end
  end
  
  def wrap
    command("mp3wrap #{tempfile_path} '#{files.join("' '")}'")
  end
  
  def convert
    command("ffmpeg -i #{tempfile_path}_MP3WRAP.mp3 -acodec copy '#{name}.mp3'")
  end
  
  def copy_tags
    command("id3cp '#{files.first}' '#{name}.mp3'")
  end
  
  def cleanup
    [tempfile_path, "#{tempfile_path}_MP3WRAP.mp3"].each do |f|
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
      File.exist?(file) && File.directory?(file) == false && File.extname(file) == ".mp3"
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
  
  def tempfile_path(ext = "mp3")
    require 'tempfile'
    @tempfile_path ||= escape_filename(Tempfile.new("#{object_id}_#{ext}").path)
  end

  def escape_filename(filename)
    filename.gsub(/(\W)/,'\\\\\1')
  end
  def unescape_filename(filename)
    filename.gsub(/\\/,'')
  end
end

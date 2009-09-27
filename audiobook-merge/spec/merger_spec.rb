require File.dirname(__FILE__) + '/spec_helper'

describe Merger do
  describe "on initialize" do
    it "should raise without real files" do
      lambda { Merger.new("name", "non", "existent", "files") }.should raise_error(ArgumentError)
    end
    it "should raise without mp3 files" do
      lambda { Merger.new("name", Dir["spec/fixture/*"]) }.should raise_error(ArgumentError)
    end
    it "should succeed with real files with mp3 extensions" do
      lambda { Merger.new("name", Dir["spec/fixture/*.mp3"]) }.should_not raise_error()
    end
  end
  
  it "should wrap files to a Tempfile" do
    m = Merger.new("name", Dir["spec/fixture/*.mp3"])
    m.should_receive(:system).with(
      "mp3wrap #{m.send(:tempfile_path)} 'spec/fixture/a.mp3' 'spec/fixture/b.mp3'").and_return(nil)
    
    m.wrap
  end

  it "should convert files through ffmpeg" do
    m = Merger.new("name", Dir["spec/fixture/*.mp3"])
    m.should_receive(:system).with(instance_of(String),
      "ffmpeg -i #{m.send(:tempfile_path)} -acodec copy 'name.mp3'").and_return(nil, nil)
    
    m.wrap
  end
end

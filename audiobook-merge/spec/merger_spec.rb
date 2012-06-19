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
end

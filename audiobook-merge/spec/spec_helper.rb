%w[rubygems rspec].each { |l| require l }
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*')].each { |l| require l }

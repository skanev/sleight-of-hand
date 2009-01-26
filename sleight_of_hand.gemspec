require 'rubygems'
SPEC = Gem::Specification.new do |s| 
  s.name = "sleight_of_hand"
  s.version = "0.0.1"
  s.author = "Stefan Kanev"
  s.email = "stefan.kanev@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "A handful of IRB tricks"
  s.files = Dir.glob("**/*")
  s.require_path = "lib"
end 

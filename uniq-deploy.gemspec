# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
  
Gem::Specification.new do |s|
  s.name        = "uniq-deploy"
  s.version     = "1.0.0" # see http://semver.org/
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ivan Kasatenko"]
  s.email       = ["sky@uniqsystems.ru"]
  s.homepage    = "http://github.com/SkyWriter/uniq-deploy"
  s.summary     = "Common part of the UNIQ Systems deploment process"
  s.description = s.summary
 
  s.required_rubygems_version = ">= 1.3.6"
  
  s.files        = Dir.glob("{bin,lib}/**/*")
  s.require_path = 'lib'
end

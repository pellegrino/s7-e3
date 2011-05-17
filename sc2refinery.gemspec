# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sc2refinery/version"

Gem::Specification.new do |s|
  s.name        = "sc2refinery"
  s.version     = Sc2refinery::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vitor Pellegrino"]
  s.email       = ["vitorp@gmail.com"] 
  s.homepage    = ""
  s.summary     = %q{Extracts information from sc2replays}
  s.description = %q{Extracts information from sc2replays}

  s.rubyforge_project = "sc2refinery"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

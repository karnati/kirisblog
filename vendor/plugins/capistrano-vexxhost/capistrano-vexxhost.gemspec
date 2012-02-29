# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano-vexxhost/version"

Gem::Specification.new do |s|
  s.name        = "capistrano-vexxhost"
  s.version     = Capistrano::Vexxhost::VERSION
  s.authors     = ["Mohammed Naser"]
  s.email       = ["mnaser@vexxhost.com"]
  s.homepage    = ""
  s.summary     = %q{Capistrano extension allowing deployment Rails applications on VEXXHOST}
  s.description = %q{Capistrano extension allowing deployment Rails applications on VEXXHOST}

  s.rubyforge_project = "capistrano-vexxhost"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "capistrano"
  s.add_runtime_dependency "json"
end

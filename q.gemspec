# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "q/version"

Gem::Specification.new do |s|
  s.name        = "q"
  s.version     = Q::VERSION
  s.authors     = ["Jacob Morris"]
  s.email       = ["jacob.s.morris@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Q - He's the guy with all the gadgets}
  s.description = %q{Supplies you with stuff you need, exactly when you need it.}

  s.rubyforge_project = "q"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

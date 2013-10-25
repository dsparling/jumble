# -*- encoding: utf-8 -*-
#
require File.expand_path("../lib/jumble/version", __FILE__)

excluded_dirs = ['pkg'].freeze

Gem::Specification.new do |s|
  s.name        = "jumble"
  s.version     = Jumble::VERSION.dup
  s.summary     = "Create and solve Jumble word puzzles."
  s.authors     = ["Doug Sparling"]
  s.email       = ["doug.sparling@gmail.com"]
  s.homepage    = "https://github.com/dsparling/jumble"
  s.description = "Create and solve Jumble word puzzles."

  files = `git ls-files`.split "\n"
  excluded_dirs.each{ |d| files = files.find_all{ |f| !f.start_with? d } }

  s.files         = files
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec')
  s.add_development_dependency('simplecov')
end
